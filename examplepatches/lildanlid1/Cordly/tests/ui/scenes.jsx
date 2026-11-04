// Discord screens with what Conduit adds to them, for ?scene= (see entry.jsx). Discord's own parts are stand-ins drawn from
// made-up data (a server called Game Night, three friends); Conduit's parts are the real runtime, hooked into the stand-in
// modules exactly as it hooks Discord's. Sheets Conduit opens (showActionSheet / showSimpleActionSheet) slide up over the
// screen the way Discord's do.
//   scene=serverMenu   the server list with Game Night held: Discord's hold menu plus Conduit's Server info row
//   scene=serverInfo   the Server info sheet (Server info tapped in that menu)
//   scene=serverEditMenu  the server list with Game Night held, with Edit servers locally on: the menu's Edit locally row, and the
//                      list drawn through GuildStore, so set={"serverEdits":{...}} shows local names and icons in it
//   scene=serverEdit   the Edit locally sheet for Game Night (Edit locally tapped in that menu); server=1 or 2 opens Art Room or Work Devs
//                      (fixed IDs 1100000000000000002 / ...003), so set={"serverEdits":{...}} can give them a saved edit
//   scene=readAll      the server list with the Read all pill above the servers
//   scene=readAllHold  Read all held: the one-time choices sheet
//   scene=reviews      Alex's profile with Conduit's Reviews card under the note (reviews=0: none yet; signed in: set={"reviewAuth":{"token":"x","account":"123456789012345678"}})
//   scene=hiddenChannel  a locked channel (staff-only) tapped: Conduit's details dialog in Discord's alert
//   scene=settings     Discord's main Settings screen, with the Conduit section where Conduit puts it
//   scene=youBar       the profile bar at the bottom: Discord's bell, then Conduit's Switch accounts and settings buttons
//   scene=translateBar a chat in Spanish with the Translate pill at the top (translateMode manual)
//   scene=bulkDelete   Bulk delete messages: Select Messages tapped in your message's hold menu, so the chat shows the
//                      selection bar in the message bar's place (add on=translate&set={"translateMode":"manual"} for both bars)
//   scene=longMessageFailed  Send long messages: a 3-part message whose second part Discord refused (the alert that offers the rest)
//   scene=removeMode   Remove anything: the Messages tab header, a DM header, a profile's buttons, your profile pill and the message
//                      bar, in removal mode (a red X on every removable button, the floating bar at the bottom). ask=<name> taps that
//                      button's X (ask=Voice call button), and confirm=1 then answers Remove, so the "Remove this button?" alert shows; mode=off draws them without removal; scene=settings&mode=on shows Settings in removal mode
//                      mode, so set={"hideAnythingSpots":"..."} shows the rows closed up
//   scene=removeProfile  Remove anything on someone's profile: the ⋯ button, server tag, badges, mutual servers, Add Friend, Message, Call,
//                      the Activity and Wishlist tabs, both Member Since dates, Roles, Connections and the note (mode=off: no removal mode)
//   scene=removeMenu   the same profile with its ⋯ menu open
//   scene=removeHeaders  the Messages tab header and a server's channel list header, laid out from the heights Discord measures
//   scene=removeMessage  your message's hold menu: quick reactions and every row, with Translate and Select Messages added by Conduit
//   scene=removeGuild  the server menu: Community Server pill, Boost / Invite / Notifications, its rows and switches, Server Emoji
//   scene=removeDetails  a DM's details: search / bell / settings in the header, the Members ... Files tabs and New Group above the
//                      members, drawn in its padded wrapper the way Discord draws it
//   scene=chatAdditions  a server chat with what Conduit adds to messages: Show timeout duration's tag on Sam (timed out for 2h 14m)
//                      and Download voice messages' button under a voice message, drawn from the real row hook (RowGenerator 8013)
//   scene=cloneEmoji   Discord's sheet for a custom emoji tapped in chat, with Clone emojis and stickers' Add to a server button;
//                      add tap=Add to a server for the server picker it opens (Work Devs is full, so it shows No free slots)
//   scene=longEdit     Send long messages: saving an edit past Discord's limit (the alert that explains why it wasn't sent)
//   scene=viewRawMenu  View raw data: your message's hold menu with the View raw data row Conduit adds
//   scene=viewRaw      the viewer a View raw data row opens: kind=message (default; tab=content for the Raw content tab), server, user
//                      (who=me has email and phone, left out), channel (ch=text|thread|post|dm|group) or role; set={"viewRawWrap":false} for lines that scroll
//   scene=viewRawChannel  a channel's hold menu with its View raw data row
//   scene=viewRawProfile  a profile's ⋯ menu opened, View raw data in a group of its own above Block and Report
//   scene=viewRawRole  a role on a profile held: Discord's little menu with View raw data under Copy ID (tap=View raw data opens it)
// Edge cases: friends=0 (none of your friends are in Game Night), owner=me (you own it), desc=0 (no description).
// Each scene turns on the features it shows (SCENE_SETTINGS below), so scene=serverInfo needs no on=; set= still wins
// (set={"readAll":false} draws the screen with the feature off). shot.cjs --scenes draws every one of them.
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
const TIMEOUT_UNTIL = new Date(now + (2 * 60 + 14) * 60000 - 30000).toISOString();
const chan = n => Array.from({ length: n }, (_, i) => ({ channel: { id: String(i) } }));

// The saved settings each scene starts from: the features it draws, plus the options its description names.
export const SCENE_SETTINGS = {
  serverMenu: { serverInfo: true }, serverInfo: { serverInfo: true }, serverEditMenu: { serverEdit: true, serverInfo: true }, serverEdit: { serverEdit: true }, readAll: { readAll: true }, readAllHold: { readAll: true },
  reviews: { reviewDB: true }, serverSheet: { reviewDB: true }, hiddenChannel: { hiddenChannels: true }, settings: {},
  youBar: { youBarSettings: true, accountSwitcher: true }, translateBar: { translate: true, translateMode: "manual" },
  messageMenu: { translate: true }, bulkDelete: { bulkDelete: true }, expandBar: { expandBar: true }, longMessageFailed: { splitMessages: true }, longEdit: { splitMessages: true },
  removeMode: { hideAnything: true }, removeProfile: { hideAnything: true }, removeMenu: { hideAnything: true },
  chatAdditions: { timeoutDuration: true, voiceDownload: true }, cloneEmoji: { cloneExpressions: true },
  viewRawMenu: { viewRaw: true }, viewRaw: { viewRaw: true }, viewRawChannel: { viewRaw: true }, viewRawProfile: { viewRaw: true }, viewRawRole: { viewRaw: true },
  removeHeaders: { hideAnything: true }, removeGuild: { hideAnything: true }, removeMessage: { hideAnything: true, translate: true, bulkDelete: true },
  removeDetails: { hideAnything: true },
};

// The stand-in modules: Discord's stores the sheet reads, its sheets, and the two guild-bar modules Conduit hooks.
export const hooked = [9839, 8013, 1392, 5207, 17433, 2090, 1417, 17439, 14101, 1087, 2068, 4845, 1114, 17538, 10692, 5532, 9978, 13759, 14995, 7445, 9683,
  15590, 17157, 13780, 14204, 9419, 12892, 12897, 12901, 12909, 12908,
  14015, 15046, 10858, 14197, 8805, 11678, 11679, 10939, 7158, 14182, 17156, 17263, 12942, 14988, 14994, 14925, 14998, 10596, 17245, 10780, 7167,
  17881, 17869, 9052, 11164];
let host = null; // the Scene, once drawn: shows and hides sheets
// Discord's own text for the message keys Remove anything matches labels by (en-GB, from the APK), served as intl (1128) in
// the remove* scenes, so labels are found the way they are in Discord.
const EN_TEXT = {"3hF1W4": "New Group", "fsBWmS": "Edit Message", "5IEsGx": "Reply", "I3ltXO": "Forward", "rBIGBL": "Create Thread", "39d0Wj": "View Thread", "JrGD7E": "Copy Text", "RpE9k7": "Mark Unread", "CvQ18w": "Pin Message", "Bse+F/": "Unpin Message", "tpxJto": "Bookmark Message", "SvXS1Z": "Remove Bookmark", "mJ3P0N": "Create Reminder", "vrbqs1": "Edit Reminder", "P8tvKG": "Mention", "Xrt5Po": "Copy Message Link", "zBoHlf": "Copy Message ID", "S/xNKV": "Save Image", "JVuuz3": "Save Video", "vbAEaA": "Save File", "8xHmxo": "Copy Image Link", "92CPQ+": "Copy Media Link", "MFGE51": "Publish", "wUIMqa": "Remove Embeds", "4sxKOb": "Remove Embed", "ZbtGBm": "Remove All Reactions", "n5EBAJ": "Report to Discord", "+78Pfm": "Report", "xwMqD7": "Delete Message", "/AXYnE": "Copy User ID", "2QmKZ2": "Server Tag", "3fe7U5": "Connections", "4lTDZq": "Mutual Servers", "5h0QOP": "Search", "7815ae": "Add Friend", "7UgSGP": "Allow Message Requests", "7lZ31J": "Wishlist", "8pOYUE": "Change Friend Nickname", "8wXU9B": "Unignore", "Aen9eh": "Report Server", "BGYkaH": "Add Friend Nickname", "DisZzB": "View Per-server Profile", "Dv8gFT": "Leave Hub", "FB2ZZV": "Show All Channels", "GISTta": "View Main Profile", "HcoRu0": "Notifications", "J2TBi3": "Leave Server", "K7iRig": "Community Server", "KXNTgb": "Allow Direct Messages", "LPJmL/": "Roles", "LXw470": "Main", "PHjkRE": "Apps", "PKQB/H": "Edit Per-server Profile", "PdRCRg": "More Options", "Q60n1E": "Server Emoji", "QvQeLv": "Copy User Info", "Sd8Ixw": "Invite to Server", "TbHyMG": "Report This User for Abuse", "Uj0md3": "Boost", "UwOLJO": "Hide Muted Channels", "VINpSK": "Invite", "WqhZss": "Copy Link", "XyHpKH": "Unblock", "a6XYD9": "Member Since", "bHa9kN": "Ring", "chq59f": "Activity", "e6RscS": "Mark as Read", "h9mGOP": "Channels & Roles", "jhJzez": "Report App", "l4Emac": "Block", "l6w3Vj": "Badges", "mQKv+v": "Note (only visible to you)", "n5zMI+": "Remove from Group", "tlopTM": "Events", "xNdRDO": "Shop This Look", "y5MwJy": "Copy Username", "ygslb0": "Stop Ringing", "ytCpKs": "Ignore", "zROXEV": "Message"};
const T_ = k => EN_TEXT[k] || k;
const removeScene = /^remove(Profile|Menu|Headers|Guild|Message|Details)$/.test(q.get("scene") || "");
export function setHost(next) { host = next; } // a settings page can host sheets too
export function modules(store, me) {
  const user = id => id === me.id ? Object.assign({}, me, { email: "venus@example.com", phone: "+15555550123", verified: true, mfaEnabled: true, discriminator: "0", bot: false }) :
    id === PROFILE_USER.id ? Object.assign({}, PROFILE_USER, { avatar: null, discriminator: "0", bot: false, publicFlags: 64, premiumType: 0, banner: null }) :
    allPeople.find(p => p.id === id) || null;
  return {
    1392: { default: store({ getCurrentUser: () => me, getUser: user }) },
    4855: { default: store({ getFriendIDs: () => people.map(p => p.id), getRelationships: () => ({}) }) },
    5207: { default: store({ getStatus: id => (allPeople.find(p => p.id === id) || {}).status || "offline" }) },
    2090: { default: store({ getGuild: id => guilds.find(g => g.id === id) || null, getGuilds: () => Object.fromEntries(guilds.map(g => [g.id, g])) }) },
    5116: { default: store({ getMemberCount: () => 1284, getOnlineCount: () => 312 }) },
    2128: { default: store({ getMember: (g, id) => { if (id === PROFILE_USER.id) return { userId: id, guildId: g, nick: "Cyn", roles: ROLE_RECORDS.map(r => r.id), joinedAt: new Date(now - 90 * DAY), premiumSince: null, pending: false, communicationDisabledUntil: null }; const p = allPeople.find(x => x.id === id); return p && id !== allPeople[2].id ? Object.assign({ nick: p.nick }, id === allPeople[1].id ? { communicationDisabledUntil: TIMEOUT_UNTIL } : null) : null; },
      getSelfMemberJoinedAt: () => new Date(now - 400 * DAY) }) },
    2122: { default: store({ getNumRoles: () => 10, getRole: (g, id) => ROLE_RECORDS.find(r => r.id === id) || null }) },
    4843: { default: store({ getChannels: () => ({ SELECTABLE: chan(12), VOCAL: chan(3) }) }) },
    6332: { default: store({ getGuildScheduledEventsForGuild: () => [{}] }) },
    6245: { default: store({ getGuildEmojis: () => new Array(24).fill({}) }) },
    6287: { default: store({ getStickersByGuildId: () => new Array(3).fill({}) }) },
    6377: { default: { requestMembersById() {} } },
    8579: { getUser: () => Promise.resolve() }, 8577: { default: o => console.log("TOAST open profile " + o.userId) },
    // Like 350.8: getGuildIconSource builds its own CDN link and never calls getGuildIconURL, so both need hooking.
    1417: { default: { getUserAvatarURL: () => null, getGuildIconURL: g => g && g.icon ? "https://cdn.discordapp.com/icons/" + g.id + "/" + g.icon + ".png" : null,
      getGuildIconSource: g => g && g.icon ? { uri: "https://cdn.discordapp.com/icons/" + g.id + "/" + g.icon + ".png?size=" + (g.size || 96) } : null } },
    7175: { ActionSheet }, 7117: { BottomSheetTitleHeader: SheetHeader }, 7170: { ActionSheetCloseButton: SheetClose },
    5155: { default: { hideActionSheet: key => host && host.hide(key) }, showActionSheet: o => host && host.show(o.key, o.content) },
    7167: { showSimpleActionSheet: o => { if (q.get("scene") === "viewRaw" && o.key === "RoleItem") o.options[o.options.length - 1].onPress(); else host && host.show(o.key, <SimpleSheet {...o} />); } },
    6584: { BottomSheetScrollView: p => <RN.View>{p.children}</RN.View> }, 6727: { LegacyScrollView: RN.ScrollView },
    17429: { FastListRenderSections: SECTIONS },
    // getGuildsBarGuildMenuItems: Discord's own rows in the server icon's hold menu.
    17433: { default: () => [{ IconComponent: D.makeIcon("EnvelopeIcon"), label: "Invite", action() {} },
      { IconComponent: D.makeIcon("BellIcon"), label: "Mute Server", action() {} }, { IconComponent: D.makeIcon("SettingsIcon"), label: "Settings", action() {} }] },
    // useGuildsBarProps: the server list's sections (DMs, a separator, then servers), drawn one by one.
    // UserProfileNote: the last card of a profile, under which Conduit adds Reviews.
    14101: { default: () => <D.TableRowGroup><D.TableRow label="Note" subLabel="Tap to add a note" icon={<D.TableRowIcon IconComponent={D.makeIcon("PaperPlusIcon")} />} arrow /></D.TableRowGroup> },
    // Discord's old Form parts and Card, which the Reviews card is built from.
    8855: { FormRow, FormLabel: p => <D.Text variant="text-md/semibold" color="text-strong" style={p.style}>{p.text}</D.Text>,
      FormSubLabel: p => <D.Text variant="text-sm/medium" color="text-default" style={p.style}>{p.text}</D.Text> },
    6459: { Card: p => <RN.View style={{ gap: 8 }}>{p.title ? <D.Text variant="text-sm/semibold" color="text-muted">{p.title}</D.Text> : null}{p.children}</RN.View> },
    // A locked channel: Discord can't show it to you, but it sent its record (created, last message, last pin).
    1087: { Permissions: { VIEW_CHANNEL: 1024, CREATE_GUILD_EXPRESSIONS: 8796093022208, MANAGE_GUILD_EXPRESSIONS: 1073741824 } },
    2068: { default: store({ getChannel: id => CHANNELS[id] || null, getBasicChannel: id => CHANNELS[id] || null }) },
    4845: { default: { can: (bit, channel) => !(channel && channel.id === LOCKED), canBasicChannel: (bit, channel) => !(channel && channel.id === LOCKED) } },
    1114: { transitionTo: route => console.log("TOAST navigated " + route), replaceWith() {}, transitionToGuild() {} },
    // Discord's alert (AlertActionCreators.show): title, body, Conduit's details as children, and two buttons.
    5400: { default: { show: o => host && host.show("alert", <Alert {...o} />) } },
    // The profile bar's round buttons (YouBarButton) and the bell Conduit adds its buttons after.
    17537: { default: YouBarButton }, 16140: { YOU_BAR_BUTTON_ICON_SIZE: 20 },
    17538: { default: () => <YouBarButton badge={15} icon={React.createElement(D.makeIcon("BellIcon"), { size: "custom", style: { width: 20, height: 20 } })} accessibilityLabel="Notifications" /> },
    // A chat: ChatViewWrapper with Discord's messages, and the message store the Translate pill reads.
    10692: { default: p => <RN.View style={{ flex: 1, position: "relative" }}>{p.children}</RN.View> },
    5532: { default: store({ getMessages: () => ({ _array: SPANISH }), getMessage: (c, id) => SPANISH.find(m => m.id === id) || null }) },
    // useChatBottomManagerUIStore: the message bar's measured height, which the selection bar fills.
    9683: { useBestActiveChatInputContainerHeight: () => COMPOSER, useChatInputContainerHeight: () => COMPOSER, useSmallSuggestionBarHeight: () => 0 },
    // LongPressMessageActionSheet: a message's hold menu, Discord's rows that Conduit adds Translate after.
    // RowGenerator: generate(row) gives the message as the native chat gets it (createMessageContent's fields).
    8013: { default: class RowGenerator { generate(row) { const m = row.message; return { message: { id: m.id, channelId: m.channel_id, guildId: GUILD,
      authorId: m.author.id, username: m.author.username, content: m.content } }; } } },
    // MessageEmojiActionSheet: the sheet a custom emoji in chat opens, and the stores Clone emojis and stickers reads.
    9839: { default: EmojiSheet },
    6243: { default: store({ getCustomEmojiById: id => id === WAVE.id ? WAVE : null, getGuildEmoji: id => new Array(EMOJI_USED[id] || 0).fill({ animated: false }) }) },
    6286: { default: store({ getStickersByGuildId: () => [], getStickerById: () => null }) },
    8294: { getMaxEmojiSlots: () => 50, getTotalStickerCountForTier: t => [5, 15, 30, 60][t] || 5 },
    9978: { default: MessageMenu }, 13759: { default: EmojiRow },
    // GuildActionSheetJoinRequestRow: the server sheet's last row, which Conduit turns into its Reviews row.
    14995: { default: () => null },
    // MessageActionCreators: sendMessage resolves the first part and rejects the second, the way Discord's does when a send
    // fails (rate limit, AutoMod, no connection); editMessage just says it was called.
    7445: { default: { sendMessage: (() => { let n = 0; return () => ++n === 2 ? Promise.reject(new Error("429")) : Promise.resolve({ ok: true }); })(),
      editMessage: () => { console.log("TOAST edit reached Discord"); return Promise.resolve(); } } },
    17439: { default: () => ({ listDataProps: { itemSize: s => s === SECTIONS.SEPARATOR ? 12 : 56, renderItem: guildBarItem } }) },
    // Remove anything: Discord's buttons, drawn from the same icons Conduit matches them by (global.__r, like inspectedExport).
    15590: { default: p => <RN.View style={{ flex: 1 }}>{p.children}</RN.View> },
    7840: { IconButton: p => p.label ? <RN.Pressable accessibilityLabel={p.label} onPress={p.onPress} style={[TILE, p.grow ? { flexGrow: 1 } : null]}>{p.icon}
      <D.Text variant="text-sm/semibold" color="text-strong">{p.label}</D.Text></RN.Pressable> :
      <RN.Pressable accessibilityLabel={p.accessibilityLabel} onPress={p.onPress} style={ROUND}>{p.icon}</RN.Pressable> },
    ...(removeScene ? { 1128: { t: Object.fromEntries(Object.keys(EN_TEXT).map(k => [k, k])), intl: { string: k => EN_TEXT[k] || "" } } } : {}),
    6333: { default: store({ getMessageRequestsCount: () => 9 }) }, 6334: { default: store({ getSpamChannelsCount: () => 0 }) },
    9662: { ContextMenu: StubContextMenu }, 15046: { ContextMenuItem: StubMenuItem },
    14015: { default: () => React.createElement(global.__r(9662).ContextMenu, { items: MENU_ITEMS, children: p => <RN.Pressable {...p} accessibilityLabel="More" style={MORE}>
      {icon(9543, "MoreHorizontalIcon", "sm")}</RN.Pressable> }) },
    10858: { default: PrimaryInfo },
    14197: { default: () => <RN.View style={{ flexDirection: "row", alignItems: "center", gap: 6 }}><RN.View style={{ width: 18, height: 18, borderRadius: 6, backgroundColor: "#eb459e" }} />
      <D.Text variant="text-sm/semibold" color="text-default">1 Mutual Server</D.Text></RN.View> },
    8805: { useSegmentedControlState: o => ({ items: o.items }) },
    11678: { Tabs: p => <RN.View style={{ flexDirection: "row", paddingHorizontal: 16, borderBottomWidth: 1, borderColor: D.tok("BORDER_SUBTLE") }}>
      {p.state.items.map((item, i) => React.createElement(global.__r(11679).TabItem, { key: item.id, index: i, state: p.state, label: item.label, grow: true }))}</RN.View> },
    11679: { TabItem: p => <RN.View style={{ flexGrow: 1, alignItems: "center", paddingVertical: 12, borderBottomWidth: 2, borderColor: p.index === 0 ? D.tok("TEXT_STRONG") : "transparent" }}>
      <D.Text variant="text-md/semibold" color={p.index === 0 ? "text-strong" : "text-muted"}>{p.label}</D.Text></RN.View> },
    10939: { default: AboutMe },
    // Discord's roles card: a list given guildMemberRoleIds, drawing one RoleItem per role (long press: its Copy ID menu).
    7158: { default: () => <Section title={T_("LPJmL/")}><RoleList guildMemberRoleIds={ROLE_RECORDS.map(r => r.id)} guildId={guild.id} /></Section> },
    10596: { default: ChannelMenu }, 17245: { default: ChannelMenu }, 10780: { default: ChannelMenu },
    14182: { UserProfileAccountConnectionsCard: () => <Section title={T_("3fe7U5")}><RN.View style={{ flexDirection: "row", alignItems: "center", gap: 12, padding: 14,
      borderRadius: 12, backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") }}>{icon(9514, "GameControllerIcon", "md")}<D.Text variant="text-md/semibold" color="text-strong">CynfulSolver</D.Text></RN.View></Section> },
    17156: { default: () => ({ headerSize: MSG_HEADER, listTop: MSG_HEADER }) },
    17263: { useRedesignGuildHeaderHeight: () => GUILD_HEADER }, 5484: { SMALL_BUTTON_HEIGHT: 40 }, 11895: { SEARCH_BAR_MARGIN_BOTTOM: 12 },
    12942: { default: function ConnectedGuildSearchAndInviteInner(p) { return <GuildSearchAndInvite guildId={p.guildId} canInvite />; } },
    14988: { default: GuildSheetHeader }, 14994: { default: GuildTabItems }, 14925: { GuildUnreadAction, GuildActionSheetSecondaryActions }, 14998: { default: GuildEmoji },
    12895: { MediaKeyboardButtonIcon: D.makeIcon("PlusLargeIcon") },
    // A channel's details: the navigation bar draws NavigationHeader through renderItem, the tabs come from
    // useSearchSegmentedControlState and SegmentedControlItem, and New Group from useMemberListAction.
    17881: { default: () => <DetailsTransition items={[{ key: "main" }]} renderItem={() => <NavigationHeader />} /> },
    17869: { useSearchSegmentedControlState: o => ({ items: o.items, visibleTabs: o.visibleTabs }) },
    9052: { SegmentedControlItem: p => <RN.View style={{ paddingHorizontal: 10, paddingVertical: 8 }}>
      <D.Text variant="text-md/semibold" color={p.index === 0 ? "text-brand" : "text-muted"}>{p.state.items[p.index].label}</D.Text></RN.View> },
    11164: { default: () => ({ listActionHeight: () => 112, listActionRenderer: () => <RN.View style={{ paddingTop: 24 }}>
      <RN.Pressable onPress={() => {}} style={{ flexDirection: "row", alignItems: "center", gap: 14, padding: 16, borderRadius: 16, backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") }}>
        {icon(11175, "ChatPlusIcon", "md")}<RN.View style={{ flex: 1 }}><D.Text variant="text-md/semibold" color="text-strong">{T_("3hF1W4")}</D.Text>
        <D.Text variant="text-sm/medium" color="text-muted">Create a new group with aestheicadreanne</D.Text></RN.View>
        {icon(5097, "ChevronSmallRightIcon", "sm")}</RN.Pressable></RN.View> }) },
    17158: { default: () => <RN.Pressable style={[ROUND, { flexDirection: "row", width: undefined, paddingHorizontal: 12, gap: 6 }]}>{icon(7047, "EnvelopeIcon", "sm")}
      <D.Text variant="text-sm/bold" color="text-strong">9</D.Text></RN.Pressable> },
    17157: { default: () => <RN.View style={{ paddingHorizontal: 16, paddingTop: 12, paddingBottom: 12, gap: 8 }}>
      <D.Text variant="heading-xl/bold" color="text-strong">Messages</D.Text>
      <RN.View style={{ flexDirection: "row", alignItems: "center", gap: 8 }}>
        {React.createElement(global.__r(7840).IconButton, { icon: icon(7017, "MagnifyingGlassIcon", "sm"), accessibilityLabel: "Search" })}
        {React.createElement(global.__r(17158).default)}
        <RN.View style={{ flex: 1 }}><D.Button text="Add Friends" variant="secondary" size="sm" /></RN.View>
        {React.createElement(global.__r(7840).IconButton, { icon: icon(10621, "PlusLargeIcon", "sm"), accessibilityLabel: "New message" })}
      </RN.View></RN.View> },
    13780: { default: () => <RN.View style={{ flexDirection: "row", gap: 6 }}>
      <RN.Pressable onPress={() => {}} style={ROUND}>{icon(9621, "PhoneCallIcon", "sm")}</RN.Pressable>
      <RN.Pressable onPress={() => {}} style={ROUND}>{icon(11187, "VideoIcon", "sm")}</RN.Pressable>
      <RN.Pressable onPress={() => {}} style={ROUND}>{icon(7017, "MagnifyingGlassIcon", "sm")}</RN.Pressable></RN.View> },
    // UserProfileContactButtons: Message and Call for a friend (the removeMode scene); Add Friend, then Message and Call as
    // icon buttons, for someone who isn't one yet (the removeProfile scene).
    14204: { default: () => removeScene ? <RN.View style={{ flexDirection: "row", gap: 8 }}>
      <RN.View style={{ flex: 1 }}><FriendRequestButton user={PROFILE_USER} location="profile" hasCustomProfileTheme={false} ButtonComponent={ProfileButton} /></RN.View>
      {React.createElement(global.__r(7840).IconButton, { icon: icon(8471, "ChatIcon", "sm"), accessibilityLabel: "Message" })}
      {React.createElement(global.__r(7840).IconButton, { icon: icon(9621, "PhoneCallIcon", "sm"), accessibilityLabel: "Call" })}</RN.View> :
      <RN.View style={{ flexDirection: "row", gap: 8 }}>
      <RN.View style={{ flex: 1 }}><ProfileButton icon={icon(8471, "ChatIcon", "sm")} text="Message" /></RN.View>
      <RN.View style={{ flex: 1 }}><ProfileButton icon={icon(9621, "PhoneCallIcon", "sm")} text="Call" /></RN.View></RN.View> },
    9419: { default: () => <RN.View style={{ flexDirection: "row", alignSelf: "center", gap: 8, padding: 8, borderRadius: 28, backgroundColor: D.tok("BACKGROUND_SURFACE_HIGH") }}>
      {[["quests", 13929, "QuestsIcon"], ["shop", 11964, "ShopIcon"], ["nitro", 9327, "NitroWheelIcon"], ["settings", 7368, "SettingsIcon"]].map(([key, id, name]) =>
        <RN.View key={key} style={[ROUND, { backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") }]}>{icon(id, name, "sm")}</RN.View>)}</RN.View> },
    12892: { default: () => <RN.View style={{ flexDirection: "row", gap: 6 }}>
      <ActionButton IconComponent={global.__r(12895).MediaKeyboardButtonIcon} />
      {React.createElement(global.__r(12897).default)}{React.createElement(global.__r(12901).default, { shouldShowGiftButton: true })}</RN.View> },
    12897: { default: () => <ActionButton IconComponent={global.__r(8506).AppsIcon} /> },
    12901: { default: () => <ActionButton IconComponent={global.__r(12668).GiftIcon} /> },
    12909: { default: () => <ActionButton IconComponent={global.__r(11492).MicrophoneIcon} /> },
    12908: { default: p => p.canSendVoiceMessage ? React.createElement(global.__r(12909).default) :
      <ActionButton IconComponent={global.__r(5139).SendMessageIcon} brand /> },
  };
}
// The channel's ID is its creation date, like every Discord ID.
const LOCKED = snowflake(now - 500 * DAY);
const RAW_CH = { text: "1400000000000000002", thread: "1400000000000000003", forum: "1400000000000000004", post: "1400000000000000005", dm: "1400000000000000006", group: "1400000000000000007" };
const CHANNELS = {
  [RAW_CH.text]: { id: RAW_CH.text, guild_id: guild.id, type: 0, name: "general", topic: "Game night planning. Be nice.", position: 0, parent_id: null, nsfw: false, rateLimitPerUser: 0, lastMessageId: snowflake(now - 3600000), permissionOverwrites: { [guild.id]: { id: guild.id, type: 0, allow: 0n, deny: 2048n } } },
  [RAW_CH.thread]: { id: RAW_CH.thread, guild_id: guild.id, type: 11, name: "Friday game plan", parent_id: RAW_CH.text, ownerId: allPeople[0].id, memberCount: 4, messageCount: 37, archived: false, autoArchiveDuration: 1440, locked: false },
  [RAW_CH.forum]: { id: RAW_CH.forum, guild_id: guild.id, type: 15, name: "clips", topic: "Share your best plays", parent_id: null, availableTags: [{ id: "1", name: "Funny", emojiName: "\ud83d\ude02" }] },
  [RAW_CH.post]: { id: RAW_CH.post, guild_id: guild.id, type: 11, name: "Triple kill on the last round", parent_id: RAW_CH.forum, ownerId: allPeople[1].id, memberCount: 2, messageCount: 9, appliedTags: ["1"], archived: false },
  [RAW_CH.dm]: { id: RAW_CH.dm, type: 1, recipients: [allPeople[0].id], lastMessageId: snowflake(now - 7200000) },
  [RAW_CH.group]: { id: RAW_CH.group, type: 3, name: "", ownerId: allPeople[0].id, recipients: [allPeople[0].id, allPeople[1].id], icon: null },
  [LOCKED]: { id: LOCKED, guild_id: guild.id, type: 0, name: "staff-only", lastMessageId: snowflake(now - 2 * 3600000), lastPinTimestamp: new Date(now - 12 * DAY).toISOString() } };
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
// YouBarButton (17537): Discord's IconButton, "tertiary" (a bare icon), or "secondary-overlay" over a nameplate.
function YouBarButton(p) {
  return <RN.Pressable accessibilityLabel={p.accessibilityLabel} onPress={p.onPress} style={{ height: 40, minWidth: 40, paddingHorizontal: p.badge ? 10 : 0, borderRadius: 20,
    flexDirection: "row", gap: 6, alignItems: "center", justifyContent: "center", backgroundColor: p.hasNameplate || p.badge ? D.tok("BACKGROUND_MOD_SUBTLE") : "transparent" }}>
    {p.icon}{p.badge ? <RN.View style={{ minWidth: 22, height: 18, borderRadius: 9, paddingHorizontal: 5, alignItems: "center", justifyContent: "center", backgroundColor: D.tok("STATUS_DANGER") }}>
      <D.Text variant="text-xs/bold" style={{ color: "#fff" }}>{p.badge}</D.Text></RN.View> : null}</RN.Pressable>;
}
// The profile bar under the server and channel lists: avatar, name and status, then the bell and what Conduit adds.
function YouBar({ defined }) {
  const Bell = defined[17538].exports.default;
  return <RN.View style={{ width: D.W, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_BASE_LOWEST"), justifyContent: "flex-end" }}>
    <RN.View style={{ marginLeft: 8, marginRight: 12, marginBottom: 12, flexDirection: "row", alignItems: "center", gap: 8, paddingLeft: 84, paddingRight: 8, height: 64,
      borderRadius: 20, borderWidth: 1, borderColor: D.tok("BORDER_SUBTLE"), backgroundColor: D.tok("BACKGROUND_BASE_LOWER") }}>
      <RN.View style={{ position: "absolute", left: 4, bottom: 4, width: 72, height: 72, borderRadius: 36, backgroundColor: "#f0b232" }}>
        <RN.View style={{ position: "absolute", right: 2, bottom: 2, width: 20, height: 20, borderRadius: 10, borderWidth: 4, borderColor: D.tok("BACKGROUND_BASE_LOWER"), backgroundColor: D.tok("STATUS_ONLINE") }} /></RN.View>
      <RN.View style={{ flex: 1 }}><D.Text variant="text-md/semibold" color="text-strong" numberOfLines={1}>Conduit</D.Text><D.Text variant="text-sm/medium" color="text-muted">Online</D.Text></RN.View>
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
  const Wrapper = defined[10692].exports.default;
  return <RN.View style={{ width: D.W, height: 520, backgroundColor: D.tok("BACKGROUND_BASE_LOWER") }}>
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
// What Conduit adds to chat rows: each stand-in message goes through the real runtime's row hook (8013), and the row is drawn
// from what comes back, the way the native chat draws Message: the tag pill (tagText and colors) after the name, and the
// call-to-action button (ctaButton) under the content.
const ADDITIONS = [
  { id: "11", channel_id: CHAT, content: "Did anyone save the clip from last night?", author: { id: allPeople[0].id, username: "Alex" }, color: "#3ba55c", time: "4:01 PM" },
  { id: "12", channel_id: CHAT, content: "", flags: 8192, attachments: [{ url: "https://cdn.discordapp.com/attachments/1/2/voice-message.ogg", filename: "voice-message.ogg", content_type: "audio/ogg", duration_secs: 14 }],
    author: { id: allPeople[0].id, username: "Alex" }, color: "#3ba55c", time: "4:01 PM", voice: true },
  { id: "13", channel_id: CHAT, content: "I can't talk right now, I'll explain later", author: { id: allPeople[1].id, username: "Sam" }, color: "#eb459e", time: "4:03 PM" },
  { id: "14", channel_id: CHAT, content: "lol what did you do", author: { id: allPeople[2].id, username: "Jordan" }, color: "#f0b232", time: "4:04 PM" },
];
const argb = n => typeof n === "number" ? "rgba(" + [(n >> 16) & 255, (n >> 8) & 255, n & 255].join(",") + "," + (((n >>> 24) & 255) / 255).toFixed(3) + ")" : undefined;
function Waveform() {
  const bars = [4, 9, 14, 8, 18, 12, 6, 16, 20, 10, 7, 15, 11, 5, 13, 17, 9, 6, 12, 8, 4, 10, 14, 7, 5, 9, 6, 4];
  return <RN.View style={{ flexDirection: "row", alignItems: "center", gap: 6, alignSelf: "flex-start", paddingVertical: 8, paddingLeft: 8, paddingRight: 14, borderRadius: 24,
    backgroundColor: D.tok("BACKGROUND_SURFACE_HIGH"), marginTop: 4 }}>
    <RN.View style={{ width: 32, height: 32, borderRadius: 16, backgroundColor: D.tok("BACKGROUND_BRAND"), alignItems: "center", justifyContent: "center" }}>
      <RN.View style={{ marginLeft: 3, width: 0, height: 0, borderTopWidth: 6, borderBottomWidth: 6, borderLeftWidth: 10, borderTopColor: "transparent", borderBottomColor: "transparent", borderLeftColor: "#fff" }} /></RN.View>
    <RN.View style={{ flexDirection: "row", alignItems: "center", gap: 2, height: 22 }}>
      {bars.map((h, i) => <RN.View key={i} style={{ width: 3, height: h, borderRadius: 2, backgroundColor: D.tok("INTERACTIVE_TEXT_DEFAULT"), opacity: 0.75 }} />)}</RN.View>
    <D.Text variant="text-sm/medium" color="text-muted" style={{ marginLeft: 4 }}>0:14</D.Text>
  </RN.View>;
}
function AdditionRow({ source, message, first }) {
  const cta = message.ctaButton;
  return <RN.View style={{ flexDirection: "row", gap: 12, paddingHorizontal: 16, paddingTop: first ? 14 : 2 }}>
    {first ? <RN.View style={{ width: 40, height: 40, borderRadius: 20, backgroundColor: source.color, alignItems: "center", justifyContent: "center" }}>
      <D.Text variant="text-md/bold" style={{ color: "#fff" }}>{source.author.username[0]}</D.Text></RN.View> : <RN.View style={{ width: 40 }} />}
    <RN.View style={{ flex: 1 }}>
      {first ? <RN.View style={{ flexDirection: "row", alignItems: "center", gap: 6, flexWrap: "wrap" }}>
        <D.Text variant="text-md/semibold" color="text-strong">{source.author.username}</D.Text>
        {message.tagText ? <RN.View accessibilityLabel={message.tagAccessibilityLabel} style={{ paddingHorizontal: 5, height: 17, borderRadius: 4, justifyContent: "center", backgroundColor: argb(message.tagBackgroundColor) }}>
          <D.Text variant="text-xxs/bold" style={{ color: argb(message.tagTextColor) }}>{message.tagText}</D.Text></RN.View> : null}
        <D.Text variant="text-xs/medium" color="text-muted">Today at {source.time}</D.Text>
      </RN.View> : null}
      {source.voice ? <Waveform /> : <D.Text variant="text-md/normal" color="text-default">{source.content}</D.Text>}
      {cta ? <RN.Pressable accessibilityRole="button" style={{ alignSelf: "flex-start", marginTop: 8, height: 32, paddingHorizontal: 14, borderRadius: 16, flexDirection: "row", alignItems: "center", gap: 6,
        backgroundColor: argb(cta.backgroundColor) }}>
        <D.Text variant="text-sm/semibold" style={{ color: argb(cta.textColor) }}>{cta.text}</D.Text></RN.Pressable> : null}
    </RN.View>
  </RN.View>;
}
function ChatAdditions({ defined }) {
  // Discord's native rows are drawn again when Conduit's language file has loaded (languageChanged redraws them); the
  // stand-in does the same by generating its rows again for a moment after it opens.
  const [, redraw] = React.useState(0);
  React.useEffect(() => { let n = 0; const t = setInterval(() => { redraw(v => v + 1); if (++n >= 10) clearInterval(t); }, 200); return () => clearInterval(t); }, []);
  const Generator = defined[8013].exports.default, gen = new Generator();
  const rows = ADDITIONS.map(m => ({ source: m, message: gen.generate({ rowType: 1, message: m }).message }));
  return <RN.View style={{ width: D.W, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_BASE_LOWER") }}>
    <RN.View style={{ height: 52, flexDirection: "row", alignItems: "center", gap: 8, paddingHorizontal: 16, borderBottomWidth: 1, borderColor: D.tok("BORDER_SUBTLE") }}>
      {React.createElement(D.makeIcon("HashmarkIcon"), { size: "sm", color: D.tok("CHANNEL_ICON") })}<D.Text variant="text-md/bold" color="text-strong">general</D.Text></RN.View>
    <RN.View style={{ paddingBottom: 16 }}>
      {rows.map((r, i) => <AdditionRow key={r.source.id} source={r.source} message={r.message} first={i === 0 || rows[i - 1].source.author.id !== r.source.author.id} />)}
    </RN.View>
  </RN.View>;
}
// A custom emoji tapped in chat: Discord's sheet for it (MessageEmojiActionSheet), which Clone emojis and stickers adds to.
const WAVE = { id: "1300000000000000001", name: "gg_wave", animated: false };
const EMOJI_USED = { "1100000000000000002": 47, "1100000000000000003": 50 };
function EmojiSheet(p) {
  const n = p.emojiNode;
  return <ActionSheet startExpanded>
    <RN.View style={{ paddingHorizontal: 16, paddingBottom: 8, gap: 12 }}>
      <RN.View style={{ flexDirection: "row", gap: 12, alignItems: "center" }}>
        <RN.View style={{ width: 48, height: 48, borderRadius: 8, backgroundColor: "#f0b23233", alignItems: "center", justifyContent: "center" }}><RN.Text style={{ fontSize: 30 }}>👋</RN.Text></RN.View>
        <RN.View style={{ flex: 1, gap: 2 }}><D.Text variant="text-lg/bold" color="text-strong">:{n.alt}:</D.Text>
          <D.Text variant="text-sm/medium" color="text-muted">This emoji is from Cozy Corner. Join the server to use it.</D.Text></RN.View>
      </RN.View>
      <D.Button text="Join Server" variant="primary" size="md" grow />
    </RN.View>
  </ActionSheet>;
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
// A profile: banner, avatar, name, then its cards ending with the note (and what Conduit adds after it).
function Profile({ defined }) {
  const Note = defined[14101].exports.default;
  return <RN.View style={{ width: D.W, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_BASE_LOWER") }}>
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
// Discord's message hold menu (LongPressMessageActionSheet): the quick reactions (EmojiRow) in its header, then its rows in
// groups, labelled with Discord's own messages the way Discord labels them, so Remove anything finds them by message key.
const MESSAGE_GROUPS = [[["fsBWmS", "PencilIcon"], ["5IEsGx", "ArrowAngleLeftUpIcon"], ["I3ltXO", "ArrowAngleRightUpIcon"], ["rBIGBL", "ThreadIcon"]],
  [["JrGD7E", "CopyIcon"], ["RpE9k7", "ChatMarkUnreadIcon"], ["CvQ18w", "PinIcon"], ["tpxJto", "BookmarkOutlineIcon"], ["mJ3P0N", "ClockIcon", true], ["PHjkRE", "AppsIcon", true],
    ["P8tvKG", "AtIcon"], ["Xrt5Po", "LinkIcon"]],
  [["xwMqD7", "TrashIcon", false, "danger"]]];
const REACTIONS = ["🔥", "✅", "❤️", "🤮", "🩷", "🤡"];
function EmojiRow() {
  const cell = { flex: 1, aspectRatio: 1, maxWidth: 48, borderRadius: 12, alignItems: "center", justifyContent: "center", backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") };
  return <RN.View style={{ flexDirection: "row", gap: 8, paddingHorizontal: 16, paddingBottom: 12 }}>
    {REACTIONS.map(e => <RN.View key={e} style={cell}><RN.Text style={{ fontSize: 22 }}>{e}</RN.Text></RN.View>)}
    <RN.View style={cell}>{React.createElement(D.makeIcon("ReactionIcon"), { size: "md" })}</RN.View>
  </RN.View>;
}
function MessageMenu(p) {
  const Row = r => <D.TableRow key={r[0]} label={T_(r[0])} arrow={!!r[2]} variant={r[3]} icon={<D.TableRowIcon IconComponent={D.makeIcon(r[1])} variant={r[3]} />} onPress={() => {}} />;
  const Emoji = global.__r(13759).default;
  return <ActionSheet header={<Emoji message={p.message} />}>
    <RN.View style={{ paddingHorizontal: 16, paddingBottom: 24, gap: 16 }}>
      {MESSAGE_GROUPS.map((g, i) => <D.TableRowGroup key={i}>{g.map(Row)}</D.TableRowGroup>)}
    </RN.View>
  </ActionSheet>;
}
// Discord's server sheet: the server, its buttons, a few rows, then the join request row.
function GuildSheet({ defined }) {
  const Join = defined[14995].exports.default;
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

// The server list, Discord's 72 dp column: a DM button, the separator (where Conduit puts Read all), then server icons.
function guildBarItem(section, index) {
  if (section === SECTIONS.SEPARATOR) return <RN.View key="sep" style={{ alignSelf: "center", width: 32, height: 2, borderRadius: 1, marginVertical: 5, backgroundColor: D.tok("BACKGROUND_MOD_STRONG") }} />;
  if (section === SECTIONS.MESSAGES) return <RN.View key="dm" style={iconBox(D.tok("BACKGROUND_BRAND"), 16)}>{React.createElement(D.makeIcon("ChatIcon"), { size: "md", color: "#fff" })}</RN.View>;
  // Through GuildStore and AvatarUtils.getGuildIconSource, like Discord's GuildsBarGuild, so Edit servers locally shows here too.
  const store = global.__r(2090).default, g = store.getGuild(guilds[index].id) || guilds[index], source = g.icon ? global.__r(1417).default.getGuildIconSource({ id: g.id, icon: g.icon, size: 96 }) : null;
  return <RN.View key={g.id} style={[iconBox(D.tok("BACKGROUND_SURFACE_HIGH"), 16), { position: "relative", overflow: "visible" }]}>
    {g.icon ? <RN.Image source={source || {}} style={{ width: 48, height: 48, borderRadius: 16 }} /> :
      <D.Text variant="text-md/semibold" color="text-strong">{g.name.split(" ").filter(Boolean).map(w => w[0]).join("").slice(0, 3)}</D.Text>}
    {index !== 1 ? <RN.View style={{ position: "absolute", left: -12, width: 4, height: 8, borderRadius: 2, backgroundColor: D.tok("TEXT_STRONG") }} /> : null}
  </RN.View>;
}
const iconBox = (bg, r) => ({ alignSelf: "center", width: 48, height: 48, borderRadius: r, backgroundColor: bg, alignItems: "center", justifyContent: "center", marginVertical: 4 });
function GuildBar({ defined }) {
  const props = defined[17439].exports.default(), data = props.listDataProps;
  const items = [[SECTIONS.MESSAGES, 0], [SECTIONS.SEPARATOR, 0], [SECTIONS.GUILD, 0], [SECTIONS.GUILD, 1], [SECTIONS.GUILD, 2]];
  return <RN.View style={{ width: 72, paddingTop: 8, backgroundColor: D.tok("BACKGROUND_BASE_LOWEST") }}>
    {items.map(([s, i], n) => <RN.View key={n} style={{ height: data.itemSize(s), justifyContent: "center" }}>{data.renderItem(s, i)}</RN.View>)}
  </RN.View>;
}
// The channel list next to it, so the bar sits in context.
function Channels() {
  return <RN.View style={{ flex: 1, backgroundColor: D.tok("BACKGROUND_BASE_LOWER"), borderTopLeftRadius: 16, padding: 16, gap: 10 }}>
    <D.Text variant="heading-md/bold" color="text-strong">{(global.__r(2090).default.getGuild(guild.id) || guild).name}</D.Text>
    {["general", "clips", "memes", "lfg"].map(c => <RN.View key={c} style={{ flexDirection: "row", gap: 8, alignItems: "center" }}>
      {React.createElement(D.makeIcon("HashmarkIcon"), { size: "sm", color: D.tok("CHANNEL_ICON") })}<D.Text variant="text-md/medium" color="text-muted">{c}</D.Text></RN.View>)}
  </RN.View>;
}
// Discord's hold menu for a server: a floating card of rows next to the icon.
function GuildMenu({ defined }) {
  const items = defined[17433].exports.default(GUILD === guild.id ? GUILD : guild.id);
  return <RN.View style={{ position: "absolute", left: 76, top: 120, width: 240, borderRadius: 16, overflow: "hidden", backgroundColor: D.tok("BACKGROUND_SURFACE_HIGHEST"),
    shadowColor: "#000", shadowOpacity: 0.35, shadowRadius: 16 }}>
    {items.map((it, i) => <RN.Pressable key={i} onPress={it.action} accessibilityLabel={it.label}
      style={{ flexDirection: "row", alignItems: "center", gap: 12, paddingHorizontal: 16, paddingVertical: 12, borderTopWidth: i ? 1 : 0, borderColor: D.tok("BORDER_SUBTLE") }}>
      {React.createElement(it.IconComponent, { size: "sm", color: D.tok("INTERACTIVE_ICON_DEFAULT") })}
      <D.Text variant="text-md/semibold" color="text-strong">{it.label}</D.Text></RN.Pressable>)}
  </RN.View>;
}

// Discord's Settings screen: its own sections around Account, run through createList (11084), which Conduit hooks to add
// its section. Discord's rows are labels only; Conduit's rows are the real registry nodes.
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
  const config = defined[11084].exports.createList({ sections: DISCORD_SECTIONS.map(([label, rows]) => ({ label, settings: rows.map(r => r[0]) })) });
  const List = defined[15733] ? defined[15733].exports.SettingsList : null;
  const all = Object.assign({}, registry, plain);
  // Through toSettingListItems (15736) like Discord's list, which leaves out rows Remove anything took away.
  const toItems = global.__r(15736).toSettingListItems, listed = typeof toItems === "function" ? toItems(config) : config;
  const render = global.__r(15735).renderSettingItem;
  const [, bump] = React.useState(0);
  React.useEffect(() => { const store = global.__r(15601).default; return store && store.subscribe ? store.subscribe(() => bump(n => n + 1)) : undefined; }, []);
  // mode=on starts removal mode from the Remove anything page (drawn out of sight), so every row shows its X.
  const node = registry.VENUS_HIDEANYTHING, Page = q.get("mode") === "on" && node && node.screen && node.screen.getComponent();
  React.useEffect(() => {
    if (!Page) return;
    let tries = 0; const go = () => { const hit = Array.from(document.querySelectorAll("#root div[dir], #root span")).find(e => !e.children.length && (e.textContent || "").trim() === "Start removing");
      if (hit) (hit.closest("[tabindex]") || hit).click(); else if (++tries < 30) setTimeout(go, 50); }; go();
  }, []);
  return <RN.View style={{ width: D.W, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_BASE_LOW") }}>
    <RN.View style={{ height: 56, flexDirection: "row", alignItems: "center", paddingHorizontal: 16 }}><D.Text variant="heading-lg/bold" color="text-strong">Settings</D.Text></RN.View>
    <RN.View style={{ paddingHorizontal: 12, paddingBottom: 16 }}><D.SearchField placeholder="Search" /></RN.View>
    <RN.View style={{ paddingHorizontal: 12, paddingBottom: 24, gap: 24 }}>
      {listed.sections.filter(section => section.settings.length).map((section, i) => <D.TableRowGroup key={i} title={section.label}>
        {section.settings.map(id => { const n = all[id]; if (!n) return null;
          const title = n.useTitle ? n.useTitle() : n.title, desc = n.useDescription ? n.useDescription() : null;
          const row = <D.TableRow label={title} subLabel={desc} icon={n.IconComponent ? <D.TableRowIcon IconComponent={n.IconComponent} /> : null} arrow />;
          // Through renderSettingItem (15735) as Discord draws each row, so removal mode marks it.
          return <React.Fragment key={id}>{render ? render({ setting: id, row }) : row}</React.Fragment>; })}
      </D.TableRowGroup>)}
    </RN.View>
    {Page ? <RN.View style={{ height: 1, overflow: "hidden", opacity: 0 }}><Page /></RN.View> : null}
  </RN.View>;
}

const ROUND = { width: 40, height: 40, borderRadius: 20, alignItems: "center", justifyContent: "center", backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") };
const icon = (id, name, size) => React.createElement(global.__r(id)[name], { size: size || "md" });
function ActionButton(p) {
  return <RN.Pressable style={[ROUND, p.brand ? { backgroundColor: D.tok("CONTROL_PRIMARY_BACKGROUND_DEFAULT") } : null]}>
    {React.createElement(p.IconComponent, { size: "sm", color: p.brand ? "#fff" : undefined })}</RN.Pressable>;
}
function ProfileButton(p) {
  return <RN.Pressable style={{ height: 40, borderRadius: 20, flexDirection: "row", gap: 8, alignItems: "center", justifyContent: "center",
    backgroundColor: D.tok(p.brand ? "CONTROL_PRIMARY_BACKGROUND_DEFAULT" : "CONTROL_SECONDARY_BACKGROUND_DEFAULT") }}>
    {p.icon}<D.Text variant="text-md/semibold" color="text-strong">{p.text}</D.Text></RN.Pressable>;
}
function Caption(p) { return <RN.View style={{ paddingHorizontal: 16, paddingTop: 14, paddingBottom: 6 }}><D.Text variant="text-xs/bold" color="text-muted">{p.children}</D.Text></RN.View>; }
// Removal mode starts from the Remove anything page's own button, drawn out of sight, as a tap there would.
function useStartRemoving() {
  React.useEffect(() => {
    if (q.get("mode") === "off") return;
    const press = (find, then) => { let tries = 0; const go = () => { const hit = find(); if (hit) { hit.click(); if (then) setTimeout(then, 150); } else if (++tries < 30) setTimeout(go, 50); }; go(); };
    const text = want => Array.from(document.querySelectorAll("#root div[dir], #root span")).find(e => !e.children.length && (e.textContent || "").trim() === want);
    const tappable = e => e && (e.closest("[tabindex]") || e);
    // ask= is a button's name as Conduit says it (Voice call button): its X is labelled "Remove: <name>".
    // confirm=1 then says yes in the alert, so the button goes and the bar offers Undo.
    const yes = q.get("confirm") ? () => press(() => tappable(text("Remove"))) : null;
    press(() => tappable(text("Start removing")), q.get("ask") ? () => press(() => document.querySelector(`[aria-label="Remove: ${q.get("ask")}"]`), yes) : null);
  }, []);
}
function RemoveMode({ defined, registry }) {
  const node = registry.VENUS_HIDEANYTHING, Page = node && node.screen && node.screen.getComponent();
  const App = defined[15590].exports.default, Messages = defined[17157].exports.default, Dm = defined[13780].exports.default;
  const Contact = defined[14204].exports.default, Pill = defined[9419].exports.default, Actions = defined[12892].exports.default, Send = defined[12908].exports.default;
  useStartRemoving();
  const card = { marginHorizontal: 12, borderRadius: 16, padding: 12, backgroundColor: D.tok("BACKGROUND_BASE_LOWER") };
  return <RN.View style={{ width: 412, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_BASE_LOWEST") }}>
    <App>
      <Messages />
      <Caption>DIRECT MESSAGE</Caption>
      <RN.View style={[card, { flexDirection: "row", alignItems: "center", gap: 10 }]}>
        <RN.View style={{ width: 32, height: 32, borderRadius: 16, backgroundColor: "#eb459e" }} />
        <RN.View style={{ flex: 1 }}><D.Text variant="text-md/bold" color="text-strong">Dippy</D.Text></RN.View><Dm /></RN.View>
      <Caption>ALEX'S PROFILE</Caption>
      <RN.View style={card}><Contact /></RN.View>
      <Caption>YOUR PROFILE</Caption>
      <RN.View style={{ paddingVertical: 4 }}><Pill /></RN.View>
      <Caption>MESSAGE BAR</Caption>
      <RN.View style={[card, { flexDirection: "row", alignItems: "center", gap: 6, padding: 8, borderRadius: 28 }]}>
        <Actions /><RN.View style={{ flex: 1, height: 40, borderRadius: 20, paddingHorizontal: 14, justifyContent: "center", backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") }}>
          <D.Text variant="text-md/medium" color="text-muted">Message @Dippy</D.Text></RN.View>
        <Send canSendVoiceMessage /></RN.View>
      <RN.View style={{ height: 200 }} />
    </App>
    <RN.View nativeID="hide-page" style={{ height: 1, overflow: "hidden", opacity: 0 }}>{Page ? <Page /> : null}</RN.View>
  </RN.View>;
}
export function Scene({ name, defined, registry }) {
  const [sheets, setSheets] = React.useState([]);
  host = { show: (key, content) => setSheets(list => list.filter(s => s.key !== key).concat([{ key, content }])), hide: key => setSheets(list => list.filter(s => s.key !== key)) };
  React.useEffect(() => {
    if (name === "hiddenChannel") defined[1114].exports.transitionTo("/channels/" + guild.id + "/" + LOCKED);
    if (name === "bulkDelete") host.show("MessageLongPressActionSheet", React.createElement(defined[9978].exports.default, { message: SPANISH[3], channel: { id: CHAT }, onClose() {} }));
    if (name === "messageMenu") host.show("MessageLongPressActionSheet", React.createElement(defined[9978].exports.default, { message: SPANISH[0], onClose() {} }));
    if (name === "serverSheet") host.show("guild", <GuildSheet defined={defined} />);
    if (name === "longMessageFailed" || name === "longEdit") {
      const actions = defined[7445].exports.default, line = "Here's everything from tonight's planning call, so nobody has to ask again. ";
      global.__venusPatches.setSetting("splitMessages", true);
      // After the language pack has loaded (lang=), as it has long before anyone sends in Discord.
      setTimeout(() => {
        if (name === "longEdit") actions.editMessage("1", "2", { content: line.repeat(32) });
        else actions.sendMessage("1", { content: line.repeat(70), invalidEmojis: [], validNonShortcutEmojis: [] }, false, {});
      }, 300);
    }
    const kind = q.get("kind") || "message", rawMenu = id => host.show("RawMenu", React.createElement(defined[id].exports.default, { channelId: RAW_CH[q.get("ch")] || RAW_CH.text }));
    if (name === "viewRawMenu") host.show("MessageLongPressActionSheet", React.createElement(defined[9978].exports.default, { message: RAW_MESSAGE, channel: { id: CHAT }, onClose() {} }));
    if (name === "viewRawChannel") rawMenu(q.get("ch") === "thread" ? 17245 : q.get("ch") === "post" ? 10780 : 10596);
    if (name === "viewRawRole" || name === "viewRaw" && kind === "role") autoHold(ROLES[0][0]);
    if (name === "viewRaw") {
      if (kind === "message") { host.show("MessageLongPressActionSheet", React.createElement(defined[9978].exports.default, { message: RAW_MESSAGE, channel: { id: CHAT }, onClose() {} })); autoTap("View raw data"); }
      if (kind === "channel") { rawMenu(q.get("ch") === "thread" ? 17245 : q.get("ch") === "post" ? 10780 : 10596); autoTap("View raw data"); }
      if (kind === "user") autoTap("View raw data");
      if (kind === "server") { const row = defined[17433].exports.default(guild.id).find(it => it.label === "View raw data"); if (row) row.action(); else console.warn("No View raw data row"); }
      if (q.get("tab") === "content") setTimeout(() => autoTap("Raw content"), 400);
    }
    if (name === "serverEdit") { const row = defined[17433].exports.default((guilds[Number(q.get("server")) || 0] || guild).id).find(it => it.label === "Edit locally"); if (row) row.action(); else console.warn("No Edit locally row"); }
    if (name === "serverInfo") { const row = defined[17433].exports.default(guild.id).find(it => it.label === "Server info"); if (row) row.action(); else console.warn("No Server info row"); }
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
  if (name === "removeMode" && !sheets.length) return <RemoveMode defined={defined} registry={registry} />;
  if (/^remove(Profile|Menu|Headers|Guild|Message|Details)$/.test(name) && !sheets.length) return <RemoveScene defined={defined} registry={registry} dim={name === "removeGuild"}>
    {name === "removeHeaders" ? <HeadersScreen defined={defined} /> : name === "removeDetails" ? <DetailsScreen defined={defined} /> : name === "removeGuild" ? <GuildMenuSheet defined={defined} /> :
      name === "removeMessage" ? <RN.View style={{ marginTop: 24 }}>{React.createElement(defined[9978].exports.default, { message: SPANISH[2], channel: { id: CHAT }, onClose() {} })}</RN.View> :
      <ProfileScreen defined={defined} />}</RemoveScene>;
  if (!sheets.length && (name === "viewRawProfile" || name === "viewRawRole" || name === "viewRaw" && (q.get("kind") === "user" || q.get("kind") === "role")))
    return <RN.View style={{ width: D.W, minHeight: 640, backgroundColor: D.tok("BACKGROUND_BASE_LOWER") }}><ProfileScreen defined={defined} /></RN.View>;
  if (name === "reviews") return <Profile defined={defined} />;
  if (name === "youBar") return <YouBar defined={defined} />;
  if (name === "chatAdditions") return <ChatAdditions defined={defined} />;
  if (name === "cloneEmoji" && !sheets.length) return <RN.View style={{ width: D.W, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_SCRIM") }}><RN.View style={{ height: 300 }} />{React.createElement(defined[9839].exports.default, { emojiNode: { id: WAVE.id, alt: WAVE.name, src: "https://cdn.discordapp.com/emojis/" + WAVE.id + ".png" } })}</RN.View>;
  if (name === "translateBar" || name === "bulkDelete" && !sheets.length) return <Chat defined={defined} />;
  if (name === "settings") return <SettingsScreen defined={defined} registry={registry} />;
  const top = sheets[sheets.length - 1];
  // With a sheet open, the screen behind is dimmed and the sheet is laid out in full below a strip of it, so the
  // screenshot shows the whole sheet the way you'd scroll through it.
  if (top) return <RN.View style={{ width: D.W, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_SCRIM") }}>
    {top.key === "alert" ? null : <RN.View style={{ height: 72 }} />}
    {top.content}
  </RN.View>;
  return <RN.View style={{ width: D.W, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_BASE_LOWEST") }}>
    <RN.View style={{ flexDirection: "row", height: 520 }}>
      <GuildBar defined={defined} />
      <Channels />
      {name === "serverMenu" || name === "serverEditMenu" ? <GuildMenu defined={defined} /> : null}
    </RN.View>
  </RN.View>;
}

// ---- Remove anything: someone's profile, the server header and the server menu, built the way Discord builds them, so
// Conduit finds every spot by the same props, icons and message keys it uses in Discord.
const TILE = { minHeight: 64, borderRadius: 16, paddingVertical: 10, paddingHorizontal: 8, gap: 6, alignItems: "center", justifyContent: "center",
  backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") };
const CHIP = { flexDirection: "row", alignItems: "center", paddingHorizontal: 10, paddingVertical: 6, borderRadius: 10, backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") };
const MORE = { width: 36, height: 36, borderRadius: 10, alignItems: "center", justifyContent: "center", backgroundColor: "#00000066" };
const ROLES = [["Good Kitty <3", "#f47fff"], ["She/Her", "#5ad7e3"], ["He/Him", "#45ddc0"], ["Announcement Pings", "#a37ca0"], ["Server Booster", "#ff73fa"]];
const ROLE_RECORDS = ROLES.map(([name, color], i) => ({ id: "15000000000000000" + (10 + i), name, color: parseInt(color.slice(1), 16), colorString: color, hoist: i === 4, mentionable: i === 3, managed: false,
  position: 5 - i, permissions: 1071698660929n, flags: 0, icon: null, unicodeEmoji: null, version: 1 }));
const MSG_HEADER = 100, GUILD_HEADER = 122;
const PROFILE_USER = { id: "1200000000000000004", username: "cynfulsolver", globalName: "Cyn" };
const REPORT = ["wqHXNt", "TbHyMG", "jhJzez"].map(k => EN_TEXT[k]).find(Boolean) || "Report User Profile";
const MENU_ITEMS = [[{ label: T_("GISTta"), action() {} }, { label: T_("Sd8Ixw"), action() {} }, { label: T_("y5MwJy"), action() {} }, { label: T_("PHjkRE"), action() {} }],
  [{ label: T_("ytCpKs"), action() {} }, { label: T_("l4Emac"), variant: "destructive", action() {} }, { label: REPORT, variant: "destructive", action() {} }]];
function StubContextMenu(p) {
  const open = q.get("scene") === "removeMenu" || q.get("scene") === "viewRawProfile" || q.get("scene") === "viewRaw" && q.get("kind") === "user", Item = global.__r(15046).ContextMenuItem;
  const groups = (p.items || []).map(g => Array.isArray(g) ? g : [g]).filter(g => g.length);
  return <RN.View style={{ position: "relative", zIndex: 5 }}>
    {typeof p.children === "function" ? p.children({ onPress() {} }) : p.children}
    {open ? <RN.View style={{ position: "absolute", top: 44, right: 0, width: 280, borderRadius: 16, overflow: "hidden", backgroundColor: D.tok("BACKGROUND_SURFACE_HIGHEST"),
      borderWidth: 1, borderColor: D.tok("BORDER_SUBTLE") }}>
      {groups.map((g, gi) => <RN.View key={gi} style={{ borderTopWidth: gi ? 6 : 0, borderColor: D.tok("BORDER_SUBTLE") }}>
        {g.map((it, i) => <Item key={it.label} index={i} label={it.label} variant={it.variant} onPress={it.action} />)}</RN.View>)}
    </RN.View> : null}
  </RN.View>;
}
function StubMenuItem(p) {
  return <RN.Pressable onPress={p.onPress} style={{ minHeight: 52, paddingHorizontal: 16, justifyContent: "center", borderTopWidth: p.index ? 1 : 0, borderColor: D.tok("BORDER_SUBTLE") }}>
    <D.Text variant="text-md/medium" color={p.variant === "destructive" ? "text-feedback-critical" : "text-strong"}>{p.label}</D.Text></RN.Pressable>;
}
function GuildTag(p) { return <RN.View style={[CHIP, { paddingVertical: 2, gap: 4 }]}><D.Text variant="text-sm/semibold" color="text-strong">💧 GOOP</D.Text></RN.View>; }
function ProfileBadgeRows() {
  return <RN.View style={[CHIP, { alignSelf: "flex-start", gap: 8 }]}>{["#f0b232", "#eb459e", "#5865f2", "#23a55a", "#00a8fc"].map(c =>
    <RN.View key={c} style={{ width: 18, height: 18, borderRadius: 9, backgroundColor: c }} />)}</RN.View>;
}
// UserProfilePrimaryInfo: name, username and pronouns with the server tag, then the badges.
function PrimaryInfo() {
  return <RN.View style={{ gap: 6 }}>
    <D.Text variant="heading-xl/bold" color="text-strong">Cyn / Emotional Support Kitty</D.Text>
    <RN.View style={{ flexDirection: "row", flexWrap: "wrap", alignItems: "center", gap: 6 }}>
      <D.Text variant="text-md/medium" color="text-default">cynfulsolver • He/Him or She/Her</D.Text>
      <GuildTag user={PROFILE_USER} themeType="dark" showToastOnPress primaryGuildOverride={null} />
    </RN.View>
    <ProfileBadgeRows userId={PROFILE_USER.id} badges={[1, 2, 3, 4, 5]} catalogBadges={[]} showToastOnPress themeType="dark" />
  </RN.View>;
}
function Section(p) { return <RN.View style={{ gap: 8 }}><D.Text variant="text-md/semibold" color="text-strong">{p.title}</D.Text>{p.children}</RN.View>; }
function TextWithIcon(p) { return <RN.View style={{ flexDirection: "row", alignItems: "center", gap: 6 }}>{p.icon}<D.Text variant="text-md/medium" color="text-default">{p.children}</D.Text></RN.View>; }
function ServerIcon(p) { return <RN.View style={{ width: 18, height: 18, borderRadius: 6, backgroundColor: "#eb459e" }} />; }
function Bio(p) { return <Section title="Bio"><D.Text variant="text-md/normal" color="text-default">Meow meow nya mrow nya meow</D.Text></Section>; }
// MemberJoinDates: the heading, then Discord's date and the server's with a dot between.
function MemberJoinDates(p) {
  return <RN.View style={{ gap: 8 }}><D.Text variant="text-md/semibold" color="text-strong">{T_("a6XYD9")}</D.Text>
    <RN.View style={{ flexDirection: "row", alignItems: "center", columnGap: 8 }}>
      <TextWithIcon themeType="dark" icon={React.createElement(global.__r(10475).ClydeIcon, { size: "sm" })} accessibilityLabel="Joined Discord: Apr 23, 2020">Apr 23, 2020</TextWithIcon>
      <D.Text variant="text-md/medium" color="text-muted" accessibilityElementsHidden importantForAccessibility="no-hide-descendants">•</D.Text>
      <TextWithIcon themeType="dark" icon={<ServerIcon guild={guild} size="XXSMALL" />} accessibilityLabel="Joined Game Night: Sep 2, 2026">Sep 2, 2026</TextWithIcon>
    </RN.View></RN.View>;
}
function AboutMe(p) {
  return <RN.View style={{ gap: 16 }}>
    <Bio userId={p.userId} displayProfile={{}} pendingBio={null} themeType="dark" lineClamp={6} />
    <MemberJoinDates userId={p.userId} guildId={p.guildId} themeType="dark" />
  </RN.View>;
}
function FriendRequestButton(p) { const Btn = p.ButtonComponent; return <Btn brand icon={icon(5131, "UserPlusIcon", "sm")} text={T_("7815ae")} />; }
// View raw data: Discord's role chips (a long press opens Copy ID), the channel / thread / forum post hold menu and the message
// the viewer shows, built the way Discord builds them so Conduit finds the same props it finds in Discord.
function RoleItem({ role, guildId }) {
  const hex = "#" + role.color.toString(16).padStart(6, "0");
  const hold = () => global.__r(7167).showSimpleActionSheet({ key: "RoleItem", hasIcons: true, options: [{ label: "Copy ID", icon: D.makeIcon("CopyIcon"), onPress() {} }] });
  return <RN.Pressable onPress={() => {}} onLongPress={hold} style={[CHIP, { gap: 6 }]}><RN.View style={{ width: 10, height: 10, borderRadius: 5, backgroundColor: hex }} />
    <D.Text variant="text-sm/medium" color="text-strong">{role.name}</D.Text></RN.Pressable>;
}
function RoleList({ guildMemberRoleIds, guildId }) {
  return <RN.View style={{ flexDirection: "row", flexWrap: "wrap", gap: 8 }}>{guildMemberRoleIds.map(id => <RoleItem key={id} role={ROLE_RECORDS.find(r => r.id === id)} guildId={guildId} />)}</RN.View>;
}
function ChannelMenu({ channelId }) {
  const rows = [["Mark as Read", "ChatMarkUnreadIcon"], ["Mute Channel", "BellSlashIcon"], ["Notification Settings", "BellIcon", true], ["Copy Link", "LinkIcon"], ["Copy Channel ID", "CopyIcon"]];
  return <ActionSheet header={<SheetHeader title={(CHANNELS[channelId] || {}).name} />}>
    <RN.View style={{ paddingHorizontal: 16, paddingBottom: 24, gap: 16 }}>
      <D.TableRowGroup>{rows.map(r => <D.TableRow key={r[0]} label={r[0]} arrow={!!r[2]} icon={<D.TableRowIcon IconComponent={D.makeIcon(r[1])} />} onPress={() => {}} />)}</D.TableRowGroup>
    </RN.View>
  </ActionSheet>;
}
const RAW_MESSAGE = { id: "1500000000000000001", channel_id: CHAT, type: 0, flags: 0, pinned: false, tts: false, mentionEveryone: false, state: "SENT", timestamp: new Date(now - 5 * 60000), editedTimestamp: null,
  content: "Anyone up for game night on Friday?\n**8pm** works for me, bring snacks.", author: { id: allPeople[1].id, username: "sam_", globalName: "Sam", discriminator: "0", avatar: null, bot: false },
  mentions: [], mentionRoles: [], attachments: [], embeds: [], reactions: [{ emoji: { id: null, name: "\ud83d\udd25" }, count: 3, me: true }] };
// A tap on text that arrives a moment later (the sheet that holds it is drawn after the first render).
function autoTap(text, tries = 0) {
  const hit = Array.from(document.querySelectorAll("#root [role], #root div[tabindex]")).find(e => (e.innerText || "").trim() === text);
  if (hit) hit.click(); else if (tries < 40) setTimeout(() => autoTap(text, tries + 1), 50); else console.warn("No " + text + " to tap");
}
// A long press: the onLongPress on the nearest React element above the text (a browser has no long press).
function autoHold(text, tries = 0) {
  for (const e of document.querySelectorAll("#root div, #root span")) {
    if (e.children.length || (e.textContent || "").trim() !== text) continue;
    const key = Object.keys(e).find(k => k.startsWith("__reactFiber"));
    let f = key && e[key];
    while (f && !(f.memoizedProps && f.memoizedProps.onLongPress)) f = f.return;
    if (f) { f.memoizedProps.onLongPress({}); return; }
  }
  if (tries < 40) setTimeout(() => autoHold(text, tries + 1), 50); else console.warn("No " + text + " to hold");
}
function ProfileScreen({ defined }) {
  const Menu = defined[14015].exports.default, Info = defined[10858].exports.default, Mutuals = defined[14197].exports.default, Contact = defined[14204].exports.default;
  const Tabs = defined[11678].exports.Tabs, About = defined[10939].exports.default, Roles = defined[7158].exports.default;
  const Connections = defined[14182].exports.UserProfileAccountConnectionsCard, Note = defined[14101].exports.default;
  const state = defined[8805].exports.useSegmentedControlState({ items: [{ id: "main", label: T_("LXw470"), page: null }, { id: "activity", label: T_("chq59f"), page: null },
    { id: "wishlist", label: T_("7lZ31J"), page: null }] });
  return <RN.View style={{ backgroundColor: D.tok("BACKGROUND_BASE_LOWER") }}>
    <RN.View style={{ height: 120, backgroundColor: "#4e3d6b" }}>
      <RN.View style={{ position: "absolute", top: 12, right: 12 }}><Menu userId={q.get("who") === "me" ? "123456789012345678" : PROFILE_USER.id} guildId={guild.id} /></RN.View></RN.View>
    <RN.View style={{ paddingHorizontal: 16, marginTop: -44, gap: 12 }}>
      <RN.View style={{ width: 88, height: 88, borderRadius: 44, borderWidth: 6, borderColor: D.tok("BACKGROUND_BASE_LOWER"), backgroundColor: "#2b2d6b" }} />
      <Info user={PROFILE_USER} guildId={guild.id} />
      <Mutuals user={PROFILE_USER} guildId={guild.id} />
      <Contact user={PROFILE_USER} />
    </RN.View>
    <RN.View style={{ marginTop: 12 }}><Tabs state={state} /></RN.View>
    <RN.View style={{ padding: 16, gap: 20 }}>
      <About userId={PROFILE_USER.id} guildId={guild.id} />
      <Roles userId={PROFILE_USER.id} guildId={guild.id} />
      <Connections user={PROFILE_USER} />
      <Note userId={PROFILE_USER.id} />
    </RN.View>
  </RN.View>;
}
// The Messages tab and a server's channel list, each placed under the header height Discord measures for it.
function SearchPill(p) {
  return <RN.Pressable onPress={p.onPress} style={{ flexGrow: 1, height: 40, borderRadius: 20, flexDirection: "row", gap: 8, alignItems: "center", justifyContent: "center",
    backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") }}>{icon(7017, "MagnifyingGlassIcon", "sm")}<D.Text variant="text-md/semibold" color="text-default">{T_("5h0QOP")}</D.Text></RN.Pressable>;
}
function GuildSearchAndInvite(p) {
  return <RN.View style={{ flexDirection: "row", gap: 8 }}>
    <SearchPill onPress={() => {}} onPressIn={() => {}} onPressOut={() => {}} />
    {React.createElement(global.__r(7840).IconButton, { icon: icon(5131, "UserPlusIcon", "sm"), accessibilityLabel: T_("VINpSK"), onPress() {}, onPressDisabled() {} })}
    {React.createElement(global.__r(7840).IconButton, { icon: icon(8952, "CalendarIcon", "sm"), accessibilityLabel: T_("tlopTM"), onPress() {} })}
  </RN.View>;
}
function DmRows({ n }) {
  return <RN.View style={{ paddingHorizontal: 12, gap: 6 }}>{["Adreanne", "Dippy", "dertodeskonig", "PowerBot"].slice(0, n).map((name, i) =>
    <RN.View key={name} style={{ flexDirection: "row", alignItems: "center", gap: 12, padding: 8 }}>
      <RN.View style={{ width: 40, height: 40, borderRadius: 20, backgroundColor: ["#eb459e", "#f0b232", "#5865f2", "#23a55a"][i] }} />
      <D.Text variant="text-md/semibold" color="text-strong">{name}</D.Text></RN.View>)}</RN.View>;
}
function HeadersScreen({ defined }) {
  const Messages = defined[17157].exports.default, specs = defined[17156].exports.default(), Search = defined[12942].exports.default;
  const height = defined[17263].exports.useRedesignGuildHeaderHeight(guild);
  return <RN.View style={{ gap: 12 }}>
    <Caption>MESSAGES TAB</Caption>
    <RN.View style={{ marginHorizontal: 12, borderRadius: 16, overflow: "hidden", backgroundColor: D.tok("BACKGROUND_BASE_LOWER") }}>
      <RN.View style={{ height: specs.listTop, overflow: "hidden" }}><Messages /></RN.View><DmRows n={3} /></RN.View>
    <Caption>CHANNEL LIST</Caption>
    <RN.View style={{ marginHorizontal: 12, borderRadius: 16, overflow: "hidden", backgroundColor: D.tok("BACKGROUND_BASE_LOWER") }}>
      <RN.View style={{ height, overflow: "hidden", paddingHorizontal: 16, paddingTop: 16 }}>
        <D.Text variant="heading-lg/bold" color="text-strong">veil . . .</D.Text>
        <D.Text variant="text-sm/medium" color="text-muted" style={{ marginBottom: 12 }}>269 Members • Community</D.Text>
        <Search guildId={guild.id} /></RN.View>
      {["levels", "arrival", "general chat"].map(c => <RN.View key={c} style={{ flexDirection: "row", gap: 8, alignItems: "center", paddingHorizontal: 16, paddingVertical: 8 }}>
        {React.createElement(D.makeIcon("HashmarkIcon"), { size: "sm", color: D.tok("CHANNEL_ICON") })}<D.Text variant="text-md/medium" color="text-muted">{c}</D.Text></RN.View>)}
    </RN.View>
  </RN.View>;
}
// The server menu: header with the Community Server pill, the button row, its rows and switches, then Server Emoji.
function CommunityPill(p) {
  return <RN.View style={[CHIP, { alignSelf: "flex-start", gap: 6, paddingVertical: 4 }]}>{icon(9393, "GlobeEarthIcon", "xs")}
    <D.Text variant="text-sm/semibold" color="text-strong">{T_("K7iRig")}</D.Text></RN.View>;
}
function GuildSheetHeader() {
  return <RN.View style={{ gap: 8 }}>
    <RN.View style={{ width: 68, height: 68, borderRadius: 20, backgroundColor: D.tok("BACKGROUND_SURFACE_HIGH") }} />
    <D.Text variant="heading-xl/bold" color="text-strong">Nai's Patches</D.Text>
    <CommunityPill guildVisibility="PUBLIC" />
    <D.Text variant="text-sm/medium" color="text-muted">46 Online • 483 Members</D.Text>
  </RN.View>;
}
function GuildTabItems() {
  const B = global.__r(7840).IconButton;
  return <RN.View style={{ flexDirection: "row", gap: 8 }}>
    <B variant="secondary" grow label="9 Boosts" icon={icon(9709, "BoostGemIcon", "md")} onPress={() => {}} />
    <B variant="secondary" grow label={T_("VINpSK")} icon={icon(5131, "UserPlusIcon", "md")} onPress={() => {}} />
    <B variant="secondary" grow label={T_("HcoRu0")} icon={icon(9045, "BellIcon", "md")} onPress={() => {}} />
  </RN.View>;
}
const named = (name, fn) => { fn.displayName = name; return fn; };
const Row = p => <D.TableRow label={p.label} variant={p.variant === "danger" ? "danger" : undefined} onPress={p.onPress || (() => {})} arrow={p.arrow} />;
const SwitchRow = p => <D.TableSwitchRow label={p.label} subLabel={p.subLabel} value={!!p.value} onValueChange={() => {}} />;
const BrowseChannelsOption = named("BrowseChannelsOption", () => <Row label={T_("h9mGOP")} arrow />);
const ChangeIdentityOption = named("ChangeIdentityOption", () => <Row label={T_("PKQB/H")} />);
const HideMutedChannelsOption = named("HideMutedChannelsOption", () => <SwitchRow label={T_("UwOLJO")} />);
const RestrictedGuildPrivacyOption = named("RestrictedGuildPrivacyOption", () => <SwitchRow label={T_("KXNTgb")} subLabel="Anyone in the server can message you" value />);
const MessageRequestRestrictedGuildPrivacyOption = named("MessageRequestRestrictedGuildPrivacyOption", () =>
  <SwitchRow label={T_("7UgSGP")} subLabel="Filter messages from members you may not know" value />);
function GuildUnreadAction() {
  return <D.TableRowGroup>
    <Row label={T_("e6RscS")} />
    <BrowseChannelsOption guild={guild} />
  </D.TableRowGroup>;
}
function GuildActionSheetSecondaryActions() {
  return <D.TableRowGroup>
    <ChangeIdentityOption guild={guild} user={PROFILE_USER} />
    <SwitchRow label={T_("FB2ZZV")} value />
    <HideMutedChannelsOption guild={guild} />
    <RestrictedGuildPrivacyOption guild={guild} />
    <MessageRequestRestrictedGuildPrivacyOption guild={guild} />
    <Row label={T_("Aen9eh")} />
    <Row label={T_("J2TBi3")} variant="danger" />
  </D.TableRowGroup>;
}
function GuildEmoji() {
  return <Section title={T_("Q60n1E")}><RN.View style={{ flexDirection: "row", flexWrap: "wrap", gap: 10, padding: 12, borderRadius: 16, backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") }}>
    {["🔺", "🐸", "🔻", "😏", "🥹", "⭐", "📺", "🤣"].map(e => <D.Text key={e} variant="heading-lg/bold" color="text-strong">{e}</D.Text>)}</RN.View></Section>;
}
function GuildMenuSheet({ defined }) {
  const Header = defined[14988].exports.default, TabItems = defined[14994].exports.default, A = defined[14925].exports, Emoji = defined[14998].exports.default;
  return <RN.View style={{ backgroundColor: D.tok("MOBILE_ACTIONSHEET_BACKGROUND"), borderTopLeftRadius: 24, borderTopRightRadius: 24, padding: 16, gap: 16, marginTop: 24 }}>
    <Header guild={guild} />
    <TabItems guild={guild} />
    <A.GuildUnreadAction guild={guild} />
    <A.GuildActionSheetSecondaryActions guild={guild} />
    <Emoji guildId={guild.id} />
  </RN.View>;
}
// ---- A DM's details (removeDetails).
const DETAIL_BUTTON = { width: 44, height: 44, borderRadius: 22, alignItems: "center", justifyContent: "center", backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") };
const detailButton = (name, id, iconName) => named(name, () => <RN.Pressable onPress={() => {}} style={DETAIL_BUTTON}>{icon(id, iconName, "md")}</RN.Pressable>);
const SearchButton = detailButton("SearchButton", 7017, "MagnifyingGlassIcon"), MuteButton = detailButton("MuteButton", 9045, "BellIcon");
const SettingsButton = detailButton("SettingsButton", 7368, "SettingsIcon");
function NavigationHeader() {
  return <RN.View style={{ flexDirection: "row", alignItems: "center", paddingHorizontal: 16, paddingVertical: 4, gap: 8 }}>
    {icon(12271, "ArrowLargeLeftIcon", "md")}<RN.View style={{ flex: 1 }} />
    <SearchButton /><MuteButton /><SettingsButton /></RN.View>;
}
function DetailsTransition(p) { return <RN.View>{p.items.map(item => <RN.View key={item.key}>{p.renderItem(item)}</RN.View>)}</RN.View>; }
const DETAIL_TABS = [["members", "9Oq93m", "Members"], ["media", "Aw9+/M", "Media"], ["pins", "/MoGoB", "Pins"], ["links", "DFSvTt", "Links"], ["files", "WgVYR/", "Files"]]
  .map(([id, key, label]) => ({ id, label: EN_TEXT[key] || label, page: null, count: 0 }));
function DetailsTabs({ defined }) {
  const state = defined[17869].exports.useSearchSegmentedControlState({ items: DETAIL_TABS, visibleTabs: DETAIL_TABS.map(t => t.id) });
  const Item = defined[9052].exports.SegmentedControlItem;
  return <RN.View style={{ flexDirection: "row", paddingHorizontal: 12, gap: 6, borderBottomWidth: 1, borderColor: D.tok("BORDER_SUBTLE") }}>
    {state.items.map((item, i) => <Item key={item.id} state={state} index={i} />)}</RN.View>;
}
function DetailsMembers({ defined }) {
  const action = defined[11164].exports.default({ channel: { id: RAW_CH.dm, isDM: () => true, isMultiUserDM: () => false } });
  return <RN.View style={{ paddingHorizontal: 16 }}>{action.listActionRenderer()}
    <D.Text variant="text-md/semibold" color="text-muted" style={{ marginTop: 24, marginBottom: 8 }}>Members — 2</D.Text>
    <RN.View style={{ borderRadius: 16, backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") }}>{["Adreanne", "Conduit"].map((name, i) =>
      <RN.View key={name} style={{ flexDirection: "row", alignItems: "center", gap: 12, padding: 14 }}>
        <RN.View style={{ width: 40, height: 40, borderRadius: 20, backgroundColor: i ? "#5865f2" : "#eb459e" }} />
        <D.Text variant="text-md/bold" color="text-strong">{name}</D.Text></RN.View>)}</RN.View></RN.View>;
}
function DetailsScreen({ defined }) {
  const Bar = defined[17881].exports.default;
  return <RN.View style={{ paddingTop: 8 }}>
    <Bar />
    <RN.View style={{ flexDirection: "row", alignItems: "center", gap: 12, paddingHorizontal: 16, paddingVertical: 12 }}>
      <RN.View style={{ width: 56, height: 56, borderRadius: 28, backgroundColor: "#eb459e" }} />
      <RN.View><D.Text variant="heading-lg/bold" color="text-strong">Adreanne</D.Text><D.Text variant="text-md/medium" color="text-muted">aestheicadreanne</D.Text></RN.View></RN.View>
    <DetailsTabs defined={defined} />
    <DetailsMembers defined={defined} />
  </RN.View>;
}
function RemoveScene({ defined, registry, children }) {
  const node = registry.VENUS_HIDEANYTHING, Page = node && node.screen && node.screen.getComponent();
  const App = defined[15590].exports.default;
  useStartRemoving();
  return <RN.View style={{ width: D.W, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_BASE_LOWEST") }}>
    <App>{children}<RN.View style={{ height: 180 }} /></App>
    <RN.View style={{ height: 1, overflow: "hidden", opacity: 0 }}>{Page ? <Page /> : null}</RN.View>
  </RN.View>;
}
