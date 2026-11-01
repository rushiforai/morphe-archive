#!/usr/bin/env node
/**
 * Cordly server layout importer — Node 22+, no npm dependencies.
 * Uses a BOT token only; never accepts account/self-bot tokens.
 * Preview is the default. --apply is required to make any Discord changes.
 * Only run on servers you administer. Messages/members/integrations are excluded.
 */
import {readFile} from 'node:fs/promises';

const argv = process.argv.slice(2);
const flags = new Set(argv.filter(v => v.startsWith('--')));
const args = argv.filter(v => !v.startsWith('--'));
if (args.length !== 2 || flags.has('--help')) {
  console.log(`Usage: DISCORD_BOT_TOKEN=... node tools/cordly-server-import.mjs <blueprint.json> <target-server-id> [--apply] [--allow-existing] [--allow-admin] [--overwrite-everyone] [--copy-assets]\n
Default: prints a preview; does NOT change Discord.
--apply: execute using an authorized bot already added to the target guild.
--allow-existing: allow adding roles/channels to a nonempty server (duplicates possible).
--allow-admin: allow exporting the ADMINISTRATOR role permission into new roles.
--overwrite-everyone: change the target @everyone role permissions (may lock members out).
--copy-assets: fetch the icon/banner from Discord CDN and attempt to upload them; boost-level restrictions apply.
Never share your bot token. Never use a user account token.`);
  process.exit(args.length === 2 ? 0 : 2);
}
const [file,targetId] = args;
const snowflake = /^\d{17,20}$/;
if (!snowflake.test(targetId)) throw Error('Target server ID must be a Discord snowflake');
const blueprint = JSON.parse(await readFile(file,'utf8'));
if (blueprint?.format !== 'cordly-server-blueprint' || blueprint?.version !== 1 ||
    !blueprint.guild || !Array.isArray(blueprint.roles) || !Array.isArray(blueprint.channels))
  throw Error('Not a Cordly v1 server blueprint');
if (blueprint.sourceGuildId === targetId) throw Error('Source and target guild ID match. Refusing to import onto the source');
if (!blueprint.roles.length || !blueprint.channels.length || blueprint.roles.length > 250 || blueprint.channels.length > 500)
  throw Error('Missing layout or unsupported role/channel count');
const roles = blueprint.roles;
const channels = blueprint.channels;
for (const role of roles) {
  if (!snowflake.test(String(role.id)) || typeof role.name !== 'string' || role.name.length > 100)
    throw Error('Malformed role entry');
}
for (const channel of channels) {
  if (!snowflake.test(String(channel.id)) || typeof channel.name !== 'string' || channel.name.length > 100 ||
      ![0,2,4,5,13,15,16].includes(channel.type)) throw Error('Malformed channel entry');
}
const sourceIds = new Set(roles.map(r=>String(r.id)));
const idSeen = new Set();
for (const channel of channels) {
  if (idSeen.has(channel.id)) throw Error('Duplicate source channel ID');
  idSeen.add(channel.id);
}
const allowAdmin = flags.has('--allow-admin');
const permission = p => {
  const raw = typeof p === 'string' && /^\d{1,22}$/.test(p) ? BigInt(p) : 0n;
  return String(allowAdmin ? raw : raw & ~8n);  // avoid privilege escalation by default
};
const sortedRoles = roles.filter(r=>!r.everyone && r.id!==blueprint.sourceGuildId && !r.managed)
  .sort((a,b)=>a.position-b.position);
const categories = channels.filter(c=>c.type===4).sort((a,b)=>a.position-b.position);
const children = channels.filter(c=>c.type!==4).sort((a,b)=>a.position-b.position);
const unsupportedMemberOverrides = channels.reduce((n,c)=>n+(c.permissionOverwrites||[]).filter(o=>o.type===1).length,0);
console.log(`Cordly clone preview\nSource: ${blueprint.guild.name} (${blueprint.sourceGuildId})\nTarget: ${targetId}\nRoles to create: ${sortedRoles.length}\nCategories to create: ${categories.length}\nOther channels to create: ${children.length}\nMember-specific overwrites omitted: ${unsupportedMemberOverrides}\nPermissions: ${allowAdmin?'ADMINISTRATOR allowed':'ADMINISTRATOR removed from new roles'}\nAssets: ${flags.has('--copy-assets')?'requested where supported':'not copied'}\n@everyone permissions: ${flags.has('--overwrite-everyone')?'will be updated':'left unchanged'}\nOther exclusions: messages, users, role memberships, webhooks, invites, integrations, boosts, auto-mod, stickers, emojis, community setup.\n`);
if (!flags.has('--apply')) {
  console.log('Dry run complete; nothing changed. Add --apply after reviewing the blueprint.');
  process.exit(0);
}
const token = process.env.DISCORD_BOT_TOKEN;
if (!token || /^(?:Bearer|Bot)\s/i.test(token) || !/^[\w.-]{40,}$/.test(token))
  throw Error('Set DISCORD_BOT_TOKEN to a valid bot token (do not include Bot prefix). Never use a user token.');
const BASE = 'https://discord.com/api/v10';
const wait = ms => new Promise(r=>setTimeout(r,ms));
async function api(method,path,payload) {
  for (let attempt=0;attempt<6;attempt++) {
    const response=await fetch(BASE+path,{method,headers:{Authorization:'Bot '+token,...(payload===undefined?{}:{'Content-Type':'application/json'})},
      body:payload===undefined?undefined:JSON.stringify(payload)});
    if (response.status===429) {
      const rate=await response.json().catch(()=>({}));
      const delay=Math.min(15000,Math.max(500,Math.ceil(Number(rate.retry_after||1)*1000)));
      console.log('Discord rate limit: pausing '+delay+'ms'); await wait(delay); continue;
    }
    if (response.status>=500 && attempt<5) {await wait(800*(attempt+1));continue;}
    const body=response.status===204?null:await response.json().catch(()=>null);
    if (!response.ok) throw Error(`${method} ${path}: HTTP ${response.status} ${JSON.stringify(body).slice(0,1000)}`);
    return body;
  }
  throw Error(`Too many retries: ${method} ${path}`);
}
// Validate target guild + bot membership before starting mutations.
const [guild,me,existingRoles,existingChannels] = await Promise.all([
  api('GET',`/guilds/${targetId}`),
  api('GET','/users/@me'),
  api('GET',`/guilds/${targetId}/roles`),
  api('GET',`/guilds/${targetId}/channels`)
]);
if (!me.bot) throw Error('Provided credential is not for a Discord bot');
const member=await api('GET',`/guilds/${targetId}/members/${me.id}`);
const memberRoles=existingRoles.filter(r=>member.roles?.includes(r.id));
const botPermissions=existingRoles.filter(r=>r.id===targetId || memberRoles.some(m=>m.id===r.id))
  .reduce((value,r)=>value | BigInt(r.permissions||'0'),0n);
const can = bit => (botPermissions&8n)!==0n || (botPermissions & bit)!==0n;
const grantable = p => String((botPermissions & 8n) !== 0n ? BigInt(permission(p)) : BigInt(permission(p)) & botPermissions);
if (!can(1n<<28n) && !can(1n<<4n)) throw Error('Bot needs MANAGE_ROLES and MANAGE_CHANNELS in target guild');
if (!can(1n<<28n) || !can(1n<<4n)) throw Error('Bot needs both MANAGE_ROLES and MANAGE_CHANNELS');
const isEmpty = existingRoles.filter(r=>r.id!==targetId && !r.managed).length===0 &&
  existingChannels.filter(c=>c.type!==0 || c.name!=='general').length===0;
if (!isEmpty && !flags.has('--allow-existing'))
  throw Error('Target has existing roles or channels. Use a fresh server, or --allow-existing to append without deleting anything.');
const maxPosition=Math.max(0,...memberRoles.map(r=>r.position));
console.log(`Connected as ${me.username} to ${guild.name}. Bot top role position: ${maxPosition}. Starting import...`);
const roleIds=new Map([[blueprint.sourceGuildId,targetId]]);
for (const role of sortedRoles) {
  const payload={name:role.name,permissions:grantable(role.permissions),color:role.color||0,
    hoist:!!role.hoist,mentionable:!!role.mentionable};
  const created=await api('POST',`/guilds/${targetId}/roles`,payload);
  roleIds.set(String(role.id),created.id);
  console.log(`Role: ${role.name} -> ${created.id}`);
}
// Recreate relative ordering, when Discord permits placement below the bot's top role.
try {
  const placements=sortedRoles.filter(r=>roleIds.has(String(r.id)))
    .map((r,i)=>({id:roleIds.get(String(r.id)),position:i+1}));
  if (placements.length) await api('PATCH',`/guilds/${targetId}/roles`,placements);
} catch (e) { console.warn('Could not reorder roles: '+e.message); }
if (flags.has('--overwrite-everyone')) {
  const from=roles.find(r=>r.everyone || r.id===blueprint.sourceGuildId);
  if (from) await api('PATCH',`/guilds/${targetId}/roles/${targetId}`,{permissions:grantable(from.permissions)});
}
const channelIds=new Map();
const skipped=[];
function mappedOverwrites(channel) {
  return (channel.permissionOverwrites||[]).filter(o=>o.type===0)
    .map(o=>({id:roleIds.get(String(o.id)),type:0,allow:grantable(o.allow),deny:grantable(o.deny)}))
    .filter(o=>o.id);
}
async function createChannel(ch) {
  const data={name:ch.name,type:ch.type,permission_overwrites:mappedOverwrites(ch)};
  if (ch.type!==4) {
    if (ch.parentId && channelIds.has(ch.parentId)) data.parent_id=channelIds.get(ch.parentId);
    if ([0,5,15,16].includes(ch.type)) {
      if (ch.topic!=null) data.topic=String(ch.topic).slice(0,ch.type===15||ch.type===16?4096:1024);
      data.nsfw=!!ch.nsfw;
      data.rate_limit_per_user=Math.max(0,Math.min(21600,ch.rateLimitPerUser||0));
    }
    if ([2,13].includes(ch.type)) {
      if (ch.bitrate) data.bitrate=ch.bitrate;
      data.user_limit=Math.max(0,Math.min(99,ch.userLimit||0));
      if (ch.rtcRegion) data.rtc_region=ch.rtcRegion;
    }
    if ((ch.type===15||ch.type===16) && Array.isArray(ch.availableTags))
      data.available_tags=ch.availableTags.filter(t=>t.name).slice(0,20).map(t=>({name:t.name,moderated:!!t.moderated,
        ...(t.emojiName?{emoji_name:t.emojiName}:{})}));
  }
  try {
    const created=await api('POST',`/guilds/${targetId}/channels`,data);
    channelIds.set(ch.id,created.id); console.log(`Channel: ${ch.name} -> ${created.id}`);
  } catch (e) {skipped.push(`${ch.name}: ${e.message}`);console.error(`Skipped channel ${ch.name}: ${e.message}`);}
}
for (const category of categories) await createChannel(category);
for (const child of children) await createChannel(child);
// Remap any child whose parent was late or unavailable. Never delete existing channels.
for (const ch of children) {
  if (ch.parentId && channelIds.has(ch.id) && channelIds.has(ch.parentId)) {
    await api('PATCH',`/channels/${channelIds.get(ch.id)}`,{parent_id:channelIds.get(ch.parentId)}).catch(e=>skipped.push(`Parent ${ch.name}: ${e.message}`));
  }
}
const g=blueprint.guild;
const meta={name:String(g.name||'Cordly Clone').slice(0,100)};
if (g.description) meta.description=String(g.description).slice(0,120);
if (g.preferredLocale) meta.preferred_locale=g.preferredLocale;
if (Number.isInteger(g.verificationLevel)) meta.verification_level=g.verificationLevel;
if (Number.isInteger(g.explicitContentFilter)) meta.explicit_content_filter=g.explicitContentFilter;
if (Number.isInteger(g.defaultMessageNotifications)) meta.default_message_notifications=g.defaultMessageNotifications;
if (Number.isInteger(g.afkTimeout)) meta.afk_timeout=g.afkTimeout;
if (flags.has('--copy-assets')) {
  for (const [key,url] of [['icon',g.iconUrl],['banner',g.bannerUrl],['splash',g.splashUrl],['discovery_splash',g.discoverySplashUrl]]) {
    if (!url) continue;
    if (!/^https:\/\/cdn\.discordapp\.com\/(icons|banners|splashes|discovery-splashes)\/\d{17,20}\/[a-z0-9_]+\.(png|gif|jpe?g|webp)\?size=\d+$/i.test(url)) {
      console.warn(`Asset skipped: unsupported ${key} URL`);continue;
    }
    try {
      const resp=await fetch(url);if (!resp.ok) throw Error('HTTP '+resp.status);
      const bytes=Buffer.from(await resp.arrayBuffer());
      if(bytes.length>8*1024*1024) throw Error('file exceeds 8 MiB');
      const ext=url.match(/\.(png|gif|jpe?g|webp)/i)[1].toLowerCase();
      meta[key]=`data:image/${ext==='jpg'?'jpeg':ext};base64,${bytes.toString('base64')}`;
    } catch(e) {skipped.push(`Asset ${key}: ${e.message}`);}
  }
}
if (!can(1n<<5n)) {
  skipped.push('Server name/description/icon: bot lacks MANAGE_GUILD');
} else {
  try {await api('PATCH',`/guilds/${targetId}`,meta);console.log('Server metadata applied');}
  catch(e) {
    skipped.push('Some server metadata or artwork: '+e.message);
    // Description, splash and banner can require Community or boost features. Never lose the name for this.
    try { await api('PATCH',`/guilds/${targetId}`,{name:meta.name});console.log('Server name applied'); }
    catch (nameError) {skipped.push('Server name: '+nameError.message);}
  }
}
console.log(`Completed: ${roleIds.size-1} roles, ${channelIds.size} channels. Skipped: ${skipped.length}`);
for(const item of skipped) console.log('  - '+item);
console.log('Verify channel permissions manually before inviting members. Existing members, messages and roles were not modified (except optional @everyone).');
