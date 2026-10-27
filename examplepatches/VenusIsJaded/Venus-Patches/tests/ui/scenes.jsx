// Discord screens with what Venus adds to them, for ?scene= (see entry.jsx). Discord's own parts are stand-ins drawn from
// made-up data (a server called Game Night, three friends); Venus's parts are the real runtime, hooked into the stand-in
// modules exactly as it hooks Discord's. Sheets Venus opens (showActionSheet / showSimpleActionSheet) slide up over the
// screen the way Discord's do.
//   scene=serverMenu   the server list with Game Night held: Discord's hold menu plus Venus's Server info row
//   scene=serverInfo   the Server info sheet (Server info tapped in that menu)
//   scene=readAll      the server list with the Read all pill above the servers
//   scene=readAllHold  Read all held: the one-time choices sheet
//   scene=reviews      Alex's profile with Venus's Reviews card under the note (reviews=0: none yet; signed in: set={"reviewAuth":{"token":"x","account":"123456789012345678"}})
//   scene=hiddenChannel  a locked channel (staff-only) tapped: Venus's details dialog in Discord's alert
//   scene=settings     Discord's main Settings screen, with the Venus section where Venus puts it
//   scene=youBar       the profile bar at the bottom: Discord's bell, then Venus's Switch accounts and settings buttons
//   scene=translateBar a chat in Spanish with the Translate pill at the top (translateMode manual)
//   scene=bulkDelete   Bulk delete messages: Select Messages tapped in your message's hold menu, so the chat shows the
//                      selection bar in the message bar's place (add on=translate&set={"translateMode":"manual"} for both bars)
//   scene=longMessageFailed  Send long messages: a 3-part message whose second part Discord refused (the alert that offers the rest)
//   scene=longEdit     Send long messages: saving an edit past Discord's limit (the alert that explains why it wasn't sent)
// Edge cases: friends=0 (none of your friends are in Game Night), owner=me (you own it), desc=0 (no description).
import * as React from "react";
import * as RN from "react-native-web";
import * as D from "./discord.jsx";

const q = new URLSearchParams(location.search);
const DAY = 86400000, now = Date.now();
const GUILD = "1100000000000000001";
// Snowflakes that decode to real dates, so "Created" and "You joined" read like a real server.
const snowflake = ms => String((BigInt(ms - 1420070400000) << 22n) + 1n);
const allPeople = [
  { id: "1200000000000000001", username: "alex", globalName: "Alex", avatar: null, status: "online", nick: null },
  { id: "1200000000000000002", username: "sam_", globalName: "Sam", avatar: null, status: "idle", nick: "Sammy" },
  { id: "1200000000000000003", username: "jordan", globalName: "Jordan", avatar: null, status: "dnd", nick: null },
];
const people = q.get("friends") === "0" ? [] : allPeople;
const guild = { id: snowflake(now - 3.2 * 365 * DAY), name: "Game Night", icon: null, banner: null, splash: null,
  description: q.get("desc") === "0" ? "" : "Weekly game nights, clips and memes. Be nice.",
  memberCount: 1284, premiumSubscriberCount: 9, premiumTier: 2, ownerId: q.get("owner") === "me" ? "123456789012345678" : allPeople[0].id, vanityURLCode: "gamenight",
  verificationLevel: 2, preferredLocale: "en-US", features: new Set(["COMMUNITY"]) };
const guilds = [guild, { id: "1100000000000000002", name: "Art Room", icon: null }, { id: "1100000000000000003", name: "Work Devs", icon: null }];
const chan = n => Array.from({ length: n }, (_, i) => ({ channel: { id: String(i) } }));

// The stand-in modules: Discord's stores the sheet reads, its sheets, and the two guild-bar modules Venus hooks.
export const hooked = [1390, 5108, 16748, 16754, 13181, 1085, 2065, 4750, 1112, 16858, 10368, 5432, 9675, 14213, 7174, 9379];
let host = null; // the Scene, once drawn: shows and hides sheets
export function modules(store, me) {
  const user = id => id === me.id ? me : allPeople.find(p => p.id === id) || null;
  return {
    1390: { default: store({ getCurrentUser: () => me, getUser: user }) },
    4760: { default: store({ getFriendIDs: () => people.map(p => p.id), getRelationships: () => ({}) }) },
    5108: { default: store({ getStatus: id => (allPeople.find(p => p.id === id) || {}).status || "offline" }) },
    2087: { default: store({ getGuild: id => guilds.find(g => g.id === id) || null, getGuilds: () => Object.fromEntries(guilds.map(g => [g.id, g])) }) },
    5020: { default: store({ getMemberCount: () => 1284, getOnlineCount: () => 312 }) },
    2125: { default: store({ getMember: (g, id) => { const p = allPeople.find(x => x.id === id); return p && id !== allPeople[2].id ? { nick: p.nick } : null; },
      getSelfMemberJoinedAt: () => new Date(now - 400 * DAY) }) },
    2119: { default: store({ getNumRoles: () => 10 }) },
    4748: { default: store({ getChannels: () => ({ SELECTABLE: chan(12), VOCAL: chan(3) }) }) },
    6054: { default: store({ getGuildScheduledEventsForGuild: () => [{}] }) },
    5989: { default: store({ getGuildEmojis: () => new Array(24).fill({}) }) },
    6031: { default: store({ getStickersByGuildId: () => new Array(3).fill({}) }) },
    6098: { default: { requestMembersById() {} } },
    8301: { getUser: () => Promise.resolve() }, 8299: { default: o => console.log("TOAST open profile " + o.userId) },
    1415: { default: { getUserAvatarURL: () => null } },
    6899: { ActionSheet }, 6839: { BottomSheetTitleHeader: SheetHeader }, 6894: { ActionSheetCloseButton: SheetClose },
    5056: { default: { hideActionSheet: key => host && host.hide(key) }, showActionSheet: o => host && host.show(o.key, o.content) },
    6891: { showSimpleActionSheet: o => host && host.show(o.key, <SimpleSheet {...o} />) },
    6307: { BottomSheetScrollView: p => <RN.View>{p.children}</RN.View> },
    16744: { FastListRenderSections: SECTIONS },
    // getGuildsBarGuildMenuItems: Discord's own rows in the server icon's hold menu.
    16748: { default: () => [{ IconComponent: D.makeIcon("EnvelopeIcon"), label: "Invite", action() {} },
      { IconComponent: D.makeIcon("BellIcon"), label: "Mute Server", action() {} }, { IconComponent: D.makeIcon("SettingsIcon"), label: "Settings", action() {} }] },
    // useGuildsBarProps: the server list's sections (DMs, a separator, then servers), drawn one by one.
    // UserProfileNote: the last card of a profile, under which Venus adds Reviews.
    13181: { default: () => <D.TableRowGroup><D.TableRow label="Note" subLabel="Tap to add a note" icon={<D.TableRowIcon IconComponent={D.makeIcon("PaperPlusIcon")} />} arrow /></D.TableRowGroup> },
    // Discord's old Form parts and Card, which the Reviews card is built from.
    8575: { FormRow, FormLabel: p => <D.Text variant="text-md/semibold" color="text-strong" style={p.style}>{p.text}</D.Text>,
      FormSubLabel: p => <D.Text variant="text-sm/medium" color="text-default" style={p.style}>{p.text}</D.Text> },
    6182: { Card: p => <RN.View style={{ gap: 8 }}>{p.title ? <D.Text variant="text-sm/semibold" color="text-muted">{p.title}</D.Text> : null}{p.children}</RN.View> },
    // A locked channel: Discord can't show it to you, but it sent its record (created, last message, last pin).
    1085: { Permissions: { VIEW_CHANNEL: 1024 } },
    2065: { default: store({ getChannel: id => CHANNELS[id] || null, getBasicChannel: id => CHANNELS[id] || null }) },
    4750: { default: { can: (bit, channel) => !(channel && channel.id === LOCKED), canBasicChannel: (bit, channel) => !(channel && channel.id === LOCKED) } },
    1112: { transitionTo: route => console.log("TOAST navigated " + route), replaceWith() {}, transitionToGuild() {} },
    // Discord's alert (AlertActionCreators.show): title, body, Venus's details as children, and two buttons.
    5300: { default: { show: o => host && host.show("alert", <Alert {...o} />) } },
    // The profile bar's round buttons (YouBarButton) and the bell Venus adds its buttons after.
    16857: { default: YouBarButton }, 15378: { YOU_BAR_BUTTON_ICON_SIZE: 20 },
    16858: { default: () => <YouBarButton badge={15} icon={React.createElement(D.makeIcon("BellIcon"), { size: "custom", style: { width: 20, height: 20 } })} accessibilityLabel="Notifications" /> },
    // A chat: ChatViewWrapper with Discord's messages, and the message store the Translate pill reads.
    10368: { default: p => <RN.View style={{ flex: 1, position: "relative" }}>{p.children}</RN.View> },
    5432: { default: store({ getMessages: () => ({ _array: SPANISH }), getMessage: (c, id) => SPANISH.find(m => m.id === id) || null }) },
    // useChatBottomManagerUIStore: the message bar's measured height, which the selection bar fills.
    9379: { useBestActiveChatInputContainerHeight: () => COMPOSER, useChatInputContainerHeight: () => COMPOSER, useSmallSuggestionBarHeight: () => 0 },
    // LongPressMessageActionSheet: a message's hold menu, Discord's rows that Venus adds Translate after.
    9675: { default: MessageMenu },
    // GuildActionSheetJoinRequestRow: the server sheet's last row, which Venus turns into its Reviews row.
    14213: { default: () => null },
    // MessageActionCreators: sendMessage resolves the first part and rejects the second, the way Discord's does when a send
    // fails (rate limit, AutoMod, no connection); editMessage just says it was called.
    7174: { default: { sendMessage: (() => { let n = 0; return () => ++n === 2 ? Promise.reject(new Error("429")) : Promise.resolve({ ok: true }); })(),
      editMessage: () => { console.log("TOAST edit reached Discord"); return Promise.resolve(); } } },
    16754: { default: () => ({ listDataProps: { itemSize: s => s === SECTIONS.SEPARATOR ? 12 : 56, renderItem: guildBarItem } }) },
  };
}
// The channel's ID is its creation date, like every Discord ID.
const LOCKED = snowflake(now - 500 * DAY);
const CHANNELS = { [LOCKED]: { id: LOCKED, guild_id: guild.id, type: 0, name: "staff-only", lastMessageId: snowflake(now - 2 * 3600000), lastPinTimestamp: new Date(now - 12 * DAY).toISOString() } };
function Alert(p) {
  const close = () => host && host.hide("alert");
  return <RN.View style={{ marginHorizontal: 24, marginTop: 120, borderRadius: 24, padding: 24, gap: 16, backgroundColor: D.tok("MOBILE_ALERT_BACKGROUND_DEFAULT") }}>
    <D.Text variant="heading-lg/bold" color="text-strong">{p.title}</D.Text>
    {p.body ? <D.Text variant="text-md/medium" color="text-default">{p.body}</D.Text> : null}
    {p.children || null}
    <RN.View style={{ gap: 8 }}>
      <D.Button text={p.confirmText} variant="primary" onPress={() => { close(); p.onConfirm && p.onConfirm(); }} />
      {p.cancelText ? <D.Button text={p.cancelText} variant="secondary" onPress={() => { close(); p.onCancel && p.onCancel(); }} /> : null}
    </RN.View>
  </RN.View>;
}
// YouBarButton (16857): Discord's IconButton, "tertiary" (a bare icon), or "secondary-overlay" over a nameplate.
function YouBarButton(p) {
  return <RN.Pressable accessibilityLabel={p.accessibilityLabel} onPress={p.onPress} style={{ height: 40, minWidth: 40, paddingHorizontal: p.badge ? 10 : 0, borderRadius: 20,
    flexDirection: "row", gap: 6, alignItems: "center", justifyContent: "center", backgroundColor: p.hasNameplate || p.badge ? D.tok("BACKGROUND_MOD_SUBTLE") : "transparent" }}>
    {p.icon}{p.badge ? <RN.View style={{ minWidth: 22, height: 18, borderRadius: 9, paddingHorizontal: 5, alignItems: "center", justifyContent: "center", backgroundColor: D.tok("STATUS_DANGER") }}>
      <D.Text variant="text-xs/bold" style={{ color: "#fff" }}>{p.badge}</D.Text></RN.View> : null}</RN.Pressable>;
}
// The profile bar under the server and channel lists: avatar, name and status, then the bell and what Venus adds.
function YouBar({ defined }) {
  const Bell = defined[16858].exports.default;
  return <RN.View style={{ width: 412, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_BASE_LOWEST"), justifyContent: "flex-end" }}>
    <RN.View style={{ marginLeft: 8, marginRight: 12, marginBottom: 12, flexDirection: "row", alignItems: "center", gap: 8, paddingLeft: 84, paddingRight: 8, height: 64,
      borderRadius: 20, borderWidth: 1, borderColor: D.tok("BORDER_SUBTLE"), backgroundColor: D.tok("BACKGROUND_BASE_LOWER") }}>
      <RN.View style={{ position: "absolute", left: 4, bottom: 4, width: 72, height: 72, borderRadius: 36, backgroundColor: "#f0b232" }}>
        <RN.View style={{ position: "absolute", right: 2, bottom: 2, width: 20, height: 20, borderRadius: 10, borderWidth: 4, borderColor: D.tok("BACKGROUND_BASE_LOWER"), backgroundColor: D.tok("STATUS_ONLINE") }} /></RN.View>
      <RN.View style={{ flex: 1 }}><D.Text variant="text-md/semibold" color="text-strong" numberOfLines={1}>Venus</D.Text><D.Text variant="text-sm/medium" color="text-muted">Online</D.Text></RN.View>
      <Bell />
    </RN.View>
  </RN.View>;
}
const CHAT = "1400000000000000001", COMPOSER = 64;
const SPANISH = [{ id: "1", channel_id: CHAT, content: "¡Hola a todos! ¿Quién viene esta noche?", author: { id: allPeople[0].id, username: "lucia" } },
  { id: "2", channel_id: CHAT, content: "Yo llego a las ocho, guárdenme un sitio.", author: { id: allPeople[1].id, username: "sam_" } },
  { id: "3", channel_id: CHAT, content: "Wait, wrong link", author: { id: "123456789012345678", username: "venus" }, state: "SENT", type: 0 },
  { id: "4", channel_id: CHAT, content: "Let me clean these up", author: { id: "123456789012345678", username: "venus" }, state: "SENT", type: 0 }];
function Chat({ defined }) {
  const Wrapper = defined[10368].exports.default;
  return <RN.View style={{ width: 412, height: 520, backgroundColor: D.tok("BACKGROUND_BASE_LOWER") }}>
    <RN.View style={{ height: 52, flexDirection: "row", alignItems: "center", gap: 8, paddingHorizontal: 16, borderBottomWidth: 1, borderColor: D.tok("BORDER_SUBTLE") }}>
      {React.createElement(D.makeIcon("HashmarkIcon"), { size: "sm", color: D.tok("CHANNEL_ICON") })}<D.Text variant="text-md/bold" color="text-strong">general</D.Text></RN.View>
    <Wrapper channelId={CHAT}>
      <RN.View style={{ flex: 1, justifyContent: "flex-end", padding: 16, gap: 14, paddingBottom: 16 + COMPOSER }}>
        {SPANISH.map(m => <RN.View key={m.id} style={{ flexDirection: "row", gap: 12 }}>
          <RN.View style={{ width: 40, height: 40, borderRadius: 20, backgroundColor: m.id === "1" ? "#f0b232" : m.id === "2" ? "#eb459e" : "#5865f2" }} />
          <RN.View style={{ flex: 1 }}><D.Text variant="text-md/semibold" color="text-strong">{m.author.username}</D.Text><D.Text variant="text-md/normal" color="text-default">{m.content}</D.Text></RN.View>
        </RN.View>)}
      </RN.View>
      {/* Discord's message bar: the list keeps its height clear at the bottom, as DCDChatList does. */}
      <RN.View style={{ position: "absolute", left: 0, right: 0, bottom: 0, height: COMPOSER, flexDirection: "row", alignItems: "center", gap: 8, paddingHorizontal: 12 }}>
        <RN.View style={{ width: 40, height: 40, borderRadius: 20, backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") }} />
        <RN.View style={{ flex: 1, height: 40, borderRadius: 20, justifyContent: "center", paddingHorizontal: 16, backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") }}>
          <D.Text variant="text-md/medium" color="text-muted">Message #general</D.Text></RN.View>
      </RN.View>
    </Wrapper>
  </RN.View>;
}
function FormRow(p) {
  return <RN.Pressable onLongPress={p.onLongPress} style={[{ flexDirection: "row", gap: 12, padding: 12, alignItems: "flex-start" }, p.style]}>
    {p.leading || null}<RN.View style={{ flex: 1, gap: 2 }}>{p.label}{p.subLabel}</RN.View></RN.Pressable>;
}
// ReviewDB answers from made-up reviews, so the card draws without the network.
const REVIEWS = q.get("reviews") === "0" ? [] : [
  { id: 1, type: 3, comment: "Spreading hate is not okay. Be respectful.", sender: { username: "ReviewDB", discordID: "0", badges: [] }, timestamp: now / 1000 },
  { id: 2, type: 0, comment: "Great teammate, always shows up for game night!", sender: { username: "sam_", discordID: allPeople[1].id, badges: [] }, timestamp: (now - 20 * DAY) / 1000 },
  { id: 3, type: 0, comment: "Helped me set up my server. 10/10", sender: { username: "jordan", discordID: allPeople[2].id, badges: [] }, timestamp: (now - 90 * DAY) / 1000 } ];
const realFetch = window.fetch;
window.fetch = (url, o) => /manti\.vendicated\.dev/.test(String(url)) ?
  Promise.resolve({ ok: true, status: 200, json: () => Promise.resolve(/admins/.test(url) ? [] : { success: true, reviews: REVIEWS }) }) : realFetch(url, o);
// A profile: banner, avatar, name, then its cards ending with the note (and what Venus adds after it).
function Profile({ defined }) {
  const Note = defined[13181].exports.default;
  return <RN.View style={{ width: 412, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_BASE_LOWER") }}>
    <RN.View style={{ height: 110, backgroundColor: "#3ba55c" }} />
    <RN.View style={{ paddingHorizontal: 16, marginTop: -44, gap: 4 }}>
      <RN.View style={{ width: 88, height: 88, borderRadius: 44, borderWidth: 6, borderColor: D.tok("BACKGROUND_BASE_LOWER"), backgroundColor: "#3ba55c", alignItems: "center", justifyContent: "center" }}>
        <D.Text variant="heading-xl/bold" style={{ color: "#fff" }}>A</D.Text></RN.View>
      <D.Text variant="heading-xl/bold" color="text-strong">Alex</D.Text>
      <D.Text variant="text-md/medium" color="text-muted">alex</D.Text>
    </RN.View>
    <RN.View style={{ padding: 16, gap: 12 }}>
      <D.TableRowGroup title="About Me"><D.TableRow label="Plays way too much Valorant." /></D.TableRowGroup>
      <Note userId={allPeople[0].id} />
    </RN.View>
  </RN.View>;
}
// Discord's message hold menu: the message, then a group of rows.
const MESSAGE_ROWS = [["Reply", "ArrowAngleLeftUpIcon"], ["Forward", "ArrowAngleRightUpIcon"], ["Copy Text", "CopyIcon"], ["Mark Unread", "ChatMarkUnreadIcon"]];
function MessageMenu(p) {
  const rows = MESSAGE_ROWS.map(([label, icon]) => <D.TableRow key={label} label={label} icon={<D.TableRowIcon IconComponent={D.makeIcon(icon)} />} onPress={() => {}} />);
  return <ActionSheet>
    <RN.View style={{ paddingHorizontal: 16, paddingBottom: 24, gap: 16 }}>
      <D.Text variant="text-md/normal" color="text-default" numberOfLines={2}>{p.message.content}</D.Text>
      <D.TableRowGroup>{rows}</D.TableRowGroup>
    </RN.View>
  </ActionSheet>;
}
// Discord's server sheet: the server, its buttons, a few rows, then the join request row.
function GuildSheet({ defined }) {
  const Join = defined[14213].exports.default;
  return <ActionSheet>
    <RN.View style={{ paddingHorizontal: 16, paddingBottom: 24, gap: 16 }}>
      <RN.View style={{ width: 64, height: 64, borderRadius: 20, backgroundColor: D.tok("BACKGROUND_SURFACE_HIGH"), alignItems: "center", justifyContent: "center" }}>
        <D.Text variant="heading-lg/bold" color="text-strong">GN</D.Text></RN.View>
      <RN.View style={{ gap: 2 }}><D.Text variant="heading-xl/bold" color="text-strong">{guild.name}</D.Text>
        <D.Text variant="text-sm/medium" color="text-muted">312 Online · 1,284 Members</D.Text></RN.View>
      <D.TableRowGroup>
        <D.TableRow label="Invite" icon={<D.TableRowIcon IconComponent={D.makeIcon("UserPlusIcon")} />} arrow />
        <D.TableRow label="Notifications" icon={<D.TableRowIcon IconComponent={D.makeIcon("BellIcon")} />} arrow />
        <D.TableRow label="Settings" icon={<D.TableRowIcon IconComponent={D.makeIcon("SettingsIcon")} />} arrow />
      </D.TableRowGroup>
      <Join guild={guild} />
    </RN.View>
  </ActionSheet>;
}
const SECTIONS = { MESSAGES: 0, SEPARATOR: 6, GUILD: 7 };

// Discord's sheet: a rounded card at the bottom with a grabber, an optional header, and its content.
function ActionSheet(props) {
  return <RN.View style={{ backgroundColor: D.tok("MOBILE_ACTIONSHEET_BACKGROUND"), borderTopLeftRadius: 24, borderTopRightRadius: 24, paddingTop: 8, maxHeight: "100%" }}>
    <RN.View style={{ alignSelf: "center", width: 36, height: 4, borderRadius: 2, backgroundColor: D.tok("BACKGROUND_MOD_STRONG"), marginBottom: 8 }} />
    {props.header || null}
    {props.children}
  </RN.View>;
}
function SheetHeader(props) {
  return <RN.View style={{ flexDirection: "row", alignItems: "center", paddingHorizontal: 16, paddingBottom: 12, minHeight: 40 }}>
    <RN.View style={{ flex: 1 }}><D.Text variant="heading-lg/bold" color="text-strong">{props.title}</D.Text></RN.View>
    {props.trailing || null}
  </RN.View>;
}
const X = D.makeIcon("XSmallIcon");
function SheetClose(props) {
  return <RN.Pressable onPress={props.onPress} accessibilityLabel="Close" style={{ width: 32, height: 32, borderRadius: 16, alignItems: "center", justifyContent: "center",
    backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") }}><X size="sm" /></RN.Pressable>;
}
function SimpleSheet(props) {
  return <ActionSheet header={props.header ? <SheetHeader title={props.header.title} /> : null}>
    <RN.View style={{ paddingHorizontal: 12, paddingBottom: 24 }}><D.TableRowGroup>
      {props.options.map(o => <D.TableRow key={o.label} label={o.label} subLabel={o.subtitle} icon={o.icon ? <D.TableRowIcon IconComponent={o.icon} /> : null}
        onPress={() => { host && host.hide(props.key); o.onPress && o.onPress(); }} />)}
    </D.TableRowGroup></RN.View>
  </ActionSheet>;
}

// The server list, Discord's 72 dp column: a DM button, the separator (where Venus puts Read all), then server icons.
function guildBarItem(section, index) {
  if (section === SECTIONS.SEPARATOR) return <RN.View key="sep" style={{ alignSelf: "center", width: 32, height: 2, borderRadius: 1, marginVertical: 5, backgroundColor: D.tok("BACKGROUND_MOD_STRONG") }} />;
  if (section === SECTIONS.MESSAGES) return <RN.View key="dm" style={iconBox(D.tok("BACKGROUND_BRAND"), 16)}>{React.createElement(D.makeIcon("ChatIcon"), { size: "md", color: "#fff" })}</RN.View>;
  const g = guilds[index];
  return <RN.View key={g.id} style={[iconBox(D.tok("BACKGROUND_SURFACE_HIGH"), 16), { position: "relative" }]}>
    <D.Text variant="text-md/semibold" color="text-strong">{g.name.split(" ").map(w => w[0]).join("")}</D.Text>
    {index !== 1 ? <RN.View style={{ position: "absolute", left: -12, width: 4, height: 8, borderRadius: 2, backgroundColor: D.tok("TEXT_STRONG") }} /> : null}
  </RN.View>;
}
const iconBox = (bg, r) => ({ alignSelf: "center", width: 48, height: 48, borderRadius: r, backgroundColor: bg, alignItems: "center", justifyContent: "center", marginVertical: 4 });
function GuildBar({ defined }) {
  const props = defined[16754].exports.default(), data = props.listDataProps;
  const items = [[SECTIONS.MESSAGES, 0], [SECTIONS.SEPARATOR, 0], [SECTIONS.GUILD, 0], [SECTIONS.GUILD, 1], [SECTIONS.GUILD, 2]];
  return <RN.View style={{ width: 72, paddingTop: 8, backgroundColor: D.tok("BACKGROUND_BASE_LOWEST") }}>
    {items.map(([s, i], n) => <RN.View key={n} style={{ height: data.itemSize(s), justifyContent: "center" }}>{data.renderItem(s, i)}</RN.View>)}
  </RN.View>;
}
// The channel list next to it, so the bar sits in context.
function Channels() {
  return <RN.View style={{ flex: 1, backgroundColor: D.tok("BACKGROUND_BASE_LOWER"), borderTopLeftRadius: 16, padding: 16, gap: 10 }}>
    <D.Text variant="heading-md/bold" color="text-strong">Game Night</D.Text>
    {["general", "clips", "memes", "lfg"].map(c => <RN.View key={c} style={{ flexDirection: "row", gap: 8, alignItems: "center" }}>
      {React.createElement(D.makeIcon("HashmarkIcon"), { size: "sm", color: D.tok("CHANNEL_ICON") })}<D.Text variant="text-md/medium" color="text-muted">{c}</D.Text></RN.View>)}
  </RN.View>;
}
// Discord's hold menu for a server: a floating card of rows next to the icon.
function GuildMenu({ defined }) {
  const items = defined[16748].exports.default(GUILD === guild.id ? GUILD : guild.id);
  return <RN.View style={{ position: "absolute", left: 76, top: 120, width: 240, borderRadius: 16, overflow: "hidden", backgroundColor: D.tok("BACKGROUND_SURFACE_HIGHEST"),
    shadowColor: "#000", shadowOpacity: 0.35, shadowRadius: 16 }}>
    {items.map((it, i) => <RN.Pressable key={i} onPress={it.action} accessibilityLabel={it.label}
      style={{ flexDirection: "row", alignItems: "center", gap: 12, paddingHorizontal: 16, paddingVertical: 12, borderTopWidth: i ? 1 : 0, borderColor: D.tok("BORDER_SUBTLE") }}>
      {React.createElement(it.IconComponent, { size: "sm", color: D.tok("INTERACTIVE_ICON_DEFAULT") })}
      <D.Text variant="text-md/semibold" color="text-strong">{it.label}</D.Text></RN.Pressable>)}
  </RN.View>;
}

// Discord's Settings screen: its own sections around Account, run through createList (10664), which Venus hooks to add
// its section. Discord's rows are labels only; Venus's rows are the real registry nodes.
// Discord 350.8's own sections and rows (SettingsOverviewScreen 17675), with each row's icon from its setting def.
const DISCORD_SECTIONS = [["Account Settings", [["PREMIUM", "Get Nitro", "NitroWheelIcon"], ["ACCOUNT", "Account", "UserCircleIcon"],
  ["CONTENT_AND_SOCIAL", "Content & Social", "FriendsIcon"], ["DATA_AND_PRIVACY", "Data & Privacy", "ShieldLockIcon"],
  ["SPONSORED_CONTENT_PREFERENCES", "Sponsored Content", "QuestsIcon"], ["FAMILY_CENTER", "Family Center", "GroupIcon"],
  ["AUTHORIZED_APPS", "Authorized Apps", "KeyIcon"], ["DEVICES", "Devices", "LaptopPhoneIcon"], ["CONNECTIONS", "Connections", "PuzzlePieceIcon"],
  ["CLIPS", "Clips", "ClipsIcon"], ["SCAN_QR_CODE", "Scan QR Code", "QrCodeIcon"]]],
  ["Billing Settings", [["COLLECTIBLES_SHOP", "Shop", "ShopIcon"], ["QUEST_HOME", "Quests", "QuestsIcon"],
    ["PREMIUM_GUILD_BOOSTING", "Server Boost", "BoostGemIcon"], ["PREMIUM_GIFTING", "Gift Inventory", "GiftIcon"]]],
  ["App Settings", [["VOICE", "Voice", "MicrophoneIcon"], ["APPEARANCE", "Appearance", "PaintPaletteIcon"], ["ACCESSIBILITY", "Accessibility", "AccessibilityIcon"],
    ["LANGUAGE", "Language", "LanguageIcon"], ["CHAT", "Chat", "ImageTextIcon"], ["WEB_BROWSER", "Web Browser", "GlobeEarthIcon"],
    ["NOTIFICATIONS", "Notifications", "BellIcon"], ["ADVANCED", "Advanced", "SettingsIcon"]]],
  ["Support", [["SUPPORT", "Support", "CircleQuestionIcon"], ["UPLOAD_DEBUG_LOGS", "Upload debug logs to Discord Support", "CircleInformationIcon"],
    ["ACKNOWLEDGEMENTS", "Acknowledgements", "CircleInformationIcon"]]],
  ["What's New", [["CHANGE_LOG", "What's New", "CircleInformationIcon"]]],
  [null, [["LOGOUT", "Log Out", "DoorExitIcon"]]]];
function SettingsScreen({ defined, registry }) {
  const plain = Object.fromEntries(DISCORD_SECTIONS.flatMap(([, rows]) => rows.map(([id, label, icon]) => [id, { type: "route", title: label, IconComponent: D.makeIcon(icon) }])));
  const config = defined[10664].exports.createList({ sections: DISCORD_SECTIONS.map(([label, rows]) => ({ label, settings: rows.map(r => r[0]) })) });
  const List = defined[14971] ? defined[14971].exports.SettingsList : null;
  const all = Object.assign({}, registry, plain);
  return <RN.View style={{ width: 412, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_BASE_LOW") }}>
    <RN.View style={{ height: 56, flexDirection: "row", alignItems: "center", paddingHorizontal: 16 }}><D.Text variant="heading-lg/bold" color="text-strong">Settings</D.Text></RN.View>
    <RN.View style={{ paddingHorizontal: 12, paddingBottom: 16 }}><D.SearchField placeholder="Search" /></RN.View>
    <RN.View style={{ paddingHorizontal: 12, paddingBottom: 24, gap: 24 }}>
      {config.sections.map((section, i) => <D.TableRowGroup key={i} title={section.label}>
        {section.settings.map(id => { const n = all[id]; if (!n) return null;
          const title = n.useTitle ? n.useTitle() : n.title, desc = n.useDescription ? n.useDescription() : null;
          return <D.TableRow key={id} label={title} subLabel={desc} icon={n.IconComponent ? <D.TableRowIcon IconComponent={n.IconComponent} /> : null} arrow />; })}
      </D.TableRowGroup>)}
    </RN.View>
  </RN.View>;
}

export function Scene({ name, defined, registry }) {
  const [sheets, setSheets] = React.useState([]);
  host = { show: (key, content) => setSheets(list => list.filter(s => s.key !== key).concat([{ key, content }])), hide: key => setSheets(list => list.filter(s => s.key !== key)) };
  React.useEffect(() => {
    if (name === "hiddenChannel") defined[1112].exports.transitionTo("/channels/" + guild.id + "/" + LOCKED);
    if (name === "bulkDelete") host.show("MessageLongPressActionSheet", React.createElement(defined[9675].exports.default, { message: SPANISH[3], channel: { id: CHAT }, onClose() {} }));
    if (name === "messageMenu") host.show("MessageLongPressActionSheet", React.createElement(defined[9675].exports.default, { message: SPANISH[0], onClose() {} }));
    if (name === "serverSheet") host.show("guild", <GuildSheet defined={defined} />);
    if (name === "longMessageFailed" || name === "longEdit") {
      const actions = defined[7174].exports.default, line = "Here's everything from tonight's planning call, so nobody has to ask again. ";
      global.__venusPatches.setSetting("splitMessages", true);
      // After the language pack has loaded (lang=), as it has long before anyone sends in Discord.
      setTimeout(() => {
        if (name === "longEdit") actions.editMessage("1", "2", { content: line.repeat(32) });
        else actions.sendMessage("1", { content: line.repeat(70), invalidEmojis: [], validNonShortcutEmojis: [] }, false, {});
      }, 300);
    }
    if (name === "serverInfo") { const row = defined[16748].exports.default(guild.id).find(it => it.label === "Server info"); if (row) row.action(); else console.warn("No Server info row"); }
    // A hold: the pill's own onLongPress, found through React's props on the element (a browser has no long press).
    // Retried until the pill is drawn: with lang= it waits for the language pack, and its label isn't English.
    if (name === "readAllHold") { let tries = 0; const hold = () => {
      let fiber = null;
      for (const e of document.querySelectorAll("[role=button]")) {
        const key = Object.keys(e).find(k => k.startsWith("__reactFiber"));
        let f = key && e[key];
        while (f && !(f.memoizedProps && f.memoizedProps.onLongPress)) f = f.return;
        if (f) { fiber = f; break; }
      }
      if (fiber) fiber.memoizedProps.onLongPress({}); else if (++tries < 20) setTimeout(hold, 50); else console.warn("No Read all hold");
    }; setTimeout(hold, 50); }
  }, []);
  if (name === "reviews") return <Profile defined={defined} />;
  if (name === "youBar") return <YouBar defined={defined} />;
  if (name === "translateBar" || name === "bulkDelete" && !sheets.length) return <Chat defined={defined} />;
  if (name === "settings") return <SettingsScreen defined={defined} registry={registry} />;
  const top = sheets[sheets.length - 1];
  // With a sheet open, the screen behind is dimmed and the sheet is laid out in full below a strip of it, so the
  // screenshot shows the whole sheet the way you'd scroll through it.
  if (top) return <RN.View style={{ width: 412, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_SCRIM") }}>
    {top.key === "alert" ? null : <RN.View style={{ height: 72 }} />}
    {top.content}
  </RN.View>;
  return <RN.View style={{ width: 412, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_BASE_LOWEST") }}>
    <RN.View style={{ flexDirection: "row", height: 520 }}>
      <GuildBar defined={defined} />
      <Channels />
      {name === "serverMenu" ? <GuildMenu defined={defined} /> : null}
    </RN.View>
  </RN.View>;
}
