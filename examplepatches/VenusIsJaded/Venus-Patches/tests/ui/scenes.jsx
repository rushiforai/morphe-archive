// Discord screens with what Venus adds to them, for ?scene= (see entry.jsx). Discord's own parts are stand-ins drawn from
// made-up data (a server called Game Night, three friends); Venus's parts are the real runtime, hooked into the stand-in
// modules exactly as it hooks Discord's. Sheets Venus opens (showActionSheet / showSimpleActionSheet) slide up over the
// screen the way Discord's do.
//   scene=serverMenu   the server list with Game Night held: Discord's hold menu plus Venus's Server info row
//   scene=serverInfo   the Server info sheet (Server info tapped in that menu)
//   scene=serverEditMenu  the server list with Game Night held, with Edit servers locally on: the menu's Edit locally row, and the
//                      list drawn through GuildStore, so set={"serverEdits":{...}} shows local names and icons in it
//   scene=serverEdit   the Edit locally sheet for Game Night (Edit locally tapped in that menu); server=1 or 2 opens Art Room or Work Devs
//                      (fixed IDs 1100000000000000002 / ...003), so set={"serverEdits":{...}} can give them a saved edit
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
//   scene=removeMode   Remove anything: the Messages tab header, a DM header, a profile's buttons, your profile pill and the message
//                      bar, in removal mode (a red X on every removable button, the floating bar at the bottom). ask=<name> taps that
//                      button's X (ask=Voice call button), and confirm=1 then answers Remove, so the "Remove this button?" alert shows; mode=off draws them without removal; scene=settings&mode=on shows Settings in removal mode
//                      mode, so set={"hideAnythingSpots":"..."} shows the rows closed up
//   scene=removeProfile  Remove anything on someone's profile: the ⋯ button, server tag, badges, mutual servers, Add Friend, Message, Call,
//                      the Activity and Wishlist tabs, both Member Since dates, Roles, Connections and the note (mode=off: no removal mode)
//   scene=removeMenu   the same profile with its ⋯ menu open
//   scene=removeHeaders  the Messages tab header and a server's channel list header, laid out from the heights Discord measures
//   scene=removeGuild  the server menu: Community Server pill, Boost / Invite / Notifications, its rows and switches, Server Emoji
//   scene=longEdit     Send long messages: saving an edit past Discord's limit (the alert that explains why it wasn't sent)
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
const chan = n => Array.from({ length: n }, (_, i) => ({ channel: { id: String(i) } }));

// The saved settings each scene starts from: the features it draws, plus the options its description names.
export const SCENE_SETTINGS = {
  serverMenu: { serverInfo: true }, serverInfo: { serverInfo: true }, serverEditMenu: { serverEdit: true, serverInfo: true }, serverEdit: { serverEdit: true }, readAll: { readAll: true }, readAllHold: { readAll: true },
  reviews: { reviewDB: true }, serverSheet: { reviewDB: true }, hiddenChannel: { hiddenChannels: true }, settings: {},
  youBar: { youBarSettings: true, accountSwitcher: true }, translateBar: { translate: true, translateMode: "manual" },
  messageMenu: { translate: true }, bulkDelete: { bulkDelete: true }, longMessageFailed: { splitMessages: true }, longEdit: { splitMessages: true },
  removeMode: { hideAnything: true }, removeProfile: { hideAnything: true }, removeMenu: { hideAnything: true },
  removeHeaders: { hideAnything: true }, removeGuild: { hideAnything: true },
};

// The stand-in modules: Discord's stores the sheet reads, its sheets, and the two guild-bar modules Venus hooks.
export const hooked = [1390, 5108, 16748, 2087, 1415, 16754, 13181, 1085, 2065, 4750, 1112, 16858, 10368, 5432, 9675, 14213, 7174, 9379,
  14827, 16467, 12854, 13425, 9115, 11935, 11942, 11946, 11957, 11956,
  13092, 14279, 10533, 13418, 8525, 12364, 12365, 10614, 6882, 13402, 16466, 16575, 11997, 14206, 14212, 14143, 14216];
let host = null; // the Scene, once drawn: shows and hides sheets
// Discord's own text for the message keys Remove anything matches labels by (en-GB, from the APK), served as intl (1126) in
// the remove* scenes, so labels are found the way they are in Discord.
const EN_TEXT = {"/AXYnE": "Copy User ID", "2QmKZ2": "Server Tag", "3fe7U5": "Connections", "4lTDZq": "Mutual Servers", "5h0QOP": "Search", "7815ae": "Add Friend", "7UgSGP": "Allow Message Requests", "7lZ31J": "Wishlist", "8pOYUE": "Change Friend Nickname", "8wXU9B": "Unignore", "Aen9eh": "Report Server", "BGYkaH": "Add Friend Nickname", "DisZzB": "View Per-server Profile", "Dv8gFT": "Leave Hub", "FB2ZZV": "Show All Channels", "GISTta": "View Main Profile", "HcoRu0": "Notifications", "J2TBi3": "Leave Server", "K7iRig": "Community Server", "KXNTgb": "Allow Direct Messages", "LPJmL/": "Roles", "LXw470": "Main", "PHjkRE": "Apps", "PKQB/H": "Edit Per-server Profile", "PdRCRg": "More Options", "Q60n1E": "Server Emoji", "QvQeLv": "Copy User Info", "Sd8Ixw": "Invite to Server", "TbHyMG": "Report This User for Abuse", "Uj0md3": "Boost", "UwOLJO": "Hide Muted Channels", "VINpSK": "Invite", "WqhZss": "Copy Link", "XyHpKH": "Unblock", "a6XYD9": "Member Since", "bHa9kN": "Ring", "chq59f": "Activity", "e6RscS": "Mark as Read", "h9mGOP": "Channels & Roles", "jhJzez": "Report App", "l4Emac": "Block", "l6w3Vj": "Badges", "mQKv+v": "Note (only visible to you)", "n5zMI+": "Remove from Group", "tlopTM": "Events", "xNdRDO": "Shop This Look", "y5MwJy": "Copy Username", "ygslb0": "Stop Ringing", "ytCpKs": "Ignore", "zROXEV": "Message"};
const T_ = k => EN_TEXT[k] || k;
const removeScene = /^remove(Profile|Menu|Headers|Guild)$/.test(q.get("scene") || "");
export function setHost(next) { host = next; } // a settings page can host sheets too
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
    // Like 350.8: getGuildIconSource builds its own CDN link and never calls getGuildIconURL, so both need hooking.
    1415: { default: { getUserAvatarURL: () => null, getGuildIconURL: g => g && g.icon ? "https://cdn.discordapp.com/icons/" + g.id + "/" + g.icon + ".png" : null,
      getGuildIconSource: g => g && g.icon ? { uri: "https://cdn.discordapp.com/icons/" + g.id + "/" + g.icon + ".png?size=" + (g.size || 96) } : null } },
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
    // Remove anything: Discord's buttons, drawn from the same icons Venus matches them by (global.__r, like inspectedExport).
    14827: { default: p => <RN.View style={{ flex: 1 }}>{p.children}</RN.View> },
    7569: { IconButton: p => p.label ? <RN.Pressable accessibilityLabel={p.label} onPress={p.onPress} style={[TILE, p.grow ? { flexGrow: 1 } : null]}>{p.icon}
      <D.Text variant="text-sm/semibold" color="text-strong">{p.label}</D.Text></RN.Pressable> :
      <RN.Pressable accessibilityLabel={p.accessibilityLabel} onPress={p.onPress} style={ROUND}>{p.icon}</RN.Pressable> },
    ...(removeScene ? { 1126: { t: Object.fromEntries(Object.keys(EN_TEXT).map(k => [k, k])), intl: { string: k => EN_TEXT[k] || "" } } } : {}),
    6055: { default: store({ getMessageRequestsCount: () => 9 }) }, 6056: { default: store({ getSpamChannelsCount: () => 0 }) },
    9358: { ContextMenu: StubContextMenu }, 14279: { ContextMenuItem: StubMenuItem },
    13092: { default: () => React.createElement(global.__r(9358).ContextMenu, { items: MENU_ITEMS, children: p => <RN.Pressable {...p} accessibilityLabel="More" style={MORE}>
      {icon(9237, "MoreHorizontalIcon", "sm")}</RN.Pressable> }) },
    10533: { default: PrimaryInfo },
    13418: { default: () => <RN.View style={{ flexDirection: "row", alignItems: "center", gap: 6 }}><RN.View style={{ width: 18, height: 18, borderRadius: 6, backgroundColor: "#eb459e" }} />
      <D.Text variant="text-sm/semibold" color="text-default">1 Mutual Server</D.Text></RN.View> },
    8525: { useSegmentedControlState: o => ({ items: o.items }) },
    12364: { Tabs: p => <RN.View style={{ flexDirection: "row", paddingHorizontal: 16, borderBottomWidth: 1, borderColor: D.tok("BORDER_SUBTLE") }}>
      {p.state.items.map((item, i) => React.createElement(global.__r(12365).TabItem, { key: item.id, index: i, state: p.state, label: item.label, grow: true }))}</RN.View> },
    12365: { TabItem: p => <RN.View style={{ flexGrow: 1, alignItems: "center", paddingVertical: 12, borderBottomWidth: 2, borderColor: p.index === 0 ? D.tok("TEXT_STRONG") : "transparent" }}>
      <D.Text variant="text-md/semibold" color={p.index === 0 ? "text-strong" : "text-muted"}>{p.label}</D.Text></RN.View> },
    10614: { default: AboutMe },
    6882: { default: () => <Section title={T_("LPJmL/")}><RN.View style={{ flexDirection: "row", flexWrap: "wrap", gap: 8 }}>{ROLES.map(([name, color]) =>
      <RN.View key={name} style={[CHIP, { gap: 6 }]}><RN.View style={{ width: 10, height: 10, borderRadius: 5, backgroundColor: color }} />
        <D.Text variant="text-sm/medium" color="text-strong">{name}</D.Text></RN.View>)}</RN.View></Section> },
    13402: { UserProfileAccountConnectionsCard: () => <Section title={T_("3fe7U5")}><RN.View style={{ flexDirection: "row", alignItems: "center", gap: 12, padding: 14,
      borderRadius: 12, backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") }}>{icon(9207, "GameControllerIcon", "md")}<D.Text variant="text-md/semibold" color="text-strong">CynfulSolver</D.Text></RN.View></Section> },
    16466: { default: () => ({ headerSize: MSG_HEADER, listTop: MSG_HEADER }) },
    16575: { useRedesignGuildHeaderHeight: () => GUILD_HEADER }, 5384: { SMALL_BUTTON_HEIGHT: 40 }, 11762: { SEARCH_BAR_MARGIN_BOTTOM: 12 },
    11997: { default: function ConnectedGuildSearchAndInviteInner(p) { return <GuildSearchAndInvite guildId={p.guildId} canInvite />; } },
    14206: { default: GuildSheetHeader }, 14212: { default: GuildTabItems }, 14143: { GuildUnreadAction, GuildActionSheetSecondaryActions }, 14216: { default: GuildEmoji },
    11940: { MediaKeyboardButtonIcon: D.makeIcon("PlusLargeIcon") },
    16468: { default: () => <RN.Pressable style={[ROUND, { flexDirection: "row", width: undefined, paddingHorizontal: 12, gap: 6 }]}>{icon(6770, "EnvelopeIcon", "sm")}
      <D.Text variant="text-sm/bold" color="text-strong">9</D.Text></RN.Pressable> },
    16467: { default: () => <RN.View style={{ paddingHorizontal: 16, paddingTop: 12, paddingBottom: 12, gap: 8 }}>
      <D.Text variant="heading-xl/bold" color="text-strong">Messages</D.Text>
      <RN.View style={{ flexDirection: "row", alignItems: "center", gap: 8 }}>
        {React.createElement(global.__r(7569).IconButton, { icon: icon(6740, "MagnifyingGlassIcon", "sm"), accessibilityLabel: "Search" })}
        {React.createElement(global.__r(16468).default)}
        <RN.View style={{ flex: 1 }}><D.Button text="Add Friends" variant="secondary" size="sm" /></RN.View>
        {React.createElement(global.__r(7569).IconButton, { icon: icon(10310, "PlusLargeIcon", "sm"), accessibilityLabel: "New message" })}
      </RN.View></RN.View> },
    12854: { default: () => <RN.View style={{ flexDirection: "row", gap: 6 }}>
      <RN.Pressable onPress={() => {}} style={ROUND}>{icon(9317, "PhoneCallIcon", "sm")}</RN.Pressable>
      <RN.Pressable onPress={() => {}} style={ROUND}>{icon(10771, "VideoIcon", "sm")}</RN.Pressable>
      <RN.Pressable onPress={() => {}} style={ROUND}>{icon(6740, "MagnifyingGlassIcon", "sm")}</RN.Pressable></RN.View> },
    // UserProfileContactButtons: Message and Call for a friend (the removeMode scene); Add Friend, then Message and Call as
    // icon buttons, for someone who isn't one yet (the removeProfile scene).
    13425: { default: () => removeScene ? <RN.View style={{ flexDirection: "row", gap: 8 }}>
      <RN.View style={{ flex: 1 }}><FriendRequestButton user={PROFILE_USER} location="profile" hasCustomProfileTheme={false} ButtonComponent={ProfileButton} /></RN.View>
      {React.createElement(global.__r(7569).IconButton, { icon: icon(8194, "ChatIcon", "sm"), accessibilityLabel: "Message" })}
      {React.createElement(global.__r(7569).IconButton, { icon: icon(9317, "PhoneCallIcon", "sm"), accessibilityLabel: "Call" })}</RN.View> :
      <RN.View style={{ flexDirection: "row", gap: 8 }}>
      <RN.View style={{ flex: 1 }}><ProfileButton icon={icon(8194, "ChatIcon", "sm")} text="Message" /></RN.View>
      <RN.View style={{ flex: 1 }}><ProfileButton icon={icon(9317, "PhoneCallIcon", "sm")} text="Call" /></RN.View></RN.View> },
    9115: { default: () => <RN.View style={{ flexDirection: "row", alignSelf: "center", gap: 8, padding: 8, borderRadius: 28, backgroundColor: D.tok("BACKGROUND_SURFACE_HIGH") }}>
      {[["quests", 13012, "QuestsIcon"], ["shop", 11828, "ShopIcon"], ["nitro", 9031, "NitroWheelIcon"], ["settings", 7092, "SettingsIcon"]].map(([key, id, name]) =>
        <RN.View key={key} style={[ROUND, { backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") }]}>{icon(id, name, "sm")}</RN.View>)}</RN.View> },
    11935: { default: () => <RN.View style={{ flexDirection: "row", gap: 6 }}>
      <ActionButton IconComponent={global.__r(11940).MediaKeyboardButtonIcon} />
      {React.createElement(global.__r(11942).default)}{React.createElement(global.__r(11946).default, { shouldShowGiftButton: true })}</RN.View> },
    11942: { default: () => <ActionButton IconComponent={global.__r(8229).AppsIcon} /> },
    11946: { default: () => <ActionButton IconComponent={global.__r(11540).GiftIcon} /> },
    11957: { default: () => <ActionButton IconComponent={global.__r(11106).MicrophoneIcon} /> },
    11956: { default: p => p.canSendVoiceMessage ? React.createElement(global.__r(11957).default) :
      <ActionButton IconComponent={global.__r(5040).SendMessageIcon} brand /> },
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
  return <RN.View style={{ width: D.W, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_BASE_LOWEST"), justifyContent: "flex-end" }}>
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
  // Through GuildStore and AvatarUtils.getGuildIconSource, like Discord's GuildsBarGuild, so Edit servers locally shows here too.
  const store = global.__r(2087).default, g = store.getGuild(guilds[index].id) || guilds[index], source = g.icon ? global.__r(1415).default.getGuildIconSource({ id: g.id, icon: g.icon, size: 96 }) : null;
  return <RN.View key={g.id} style={[iconBox(D.tok("BACKGROUND_SURFACE_HIGH"), 16), { position: "relative", overflow: "visible" }]}>
    {g.icon ? <RN.Image source={source || {}} style={{ width: 48, height: 48, borderRadius: 16 }} /> :
      <D.Text variant="text-md/semibold" color="text-strong">{g.name.split(" ").filter(Boolean).map(w => w[0]).join("").slice(0, 3)}</D.Text>}
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
    <D.Text variant="heading-md/bold" color="text-strong">{(global.__r(2087).default.getGuild(guild.id) || guild).name}</D.Text>
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
  // Through toSettingListItems (14974) like Discord's list, which leaves out rows Remove anything took away.
  const toItems = global.__r(14974).toSettingListItems, listed = typeof toItems === "function" ? toItems(config) : config;
  const render = global.__r(14973).renderSettingItem;
  const [, bump] = React.useState(0);
  React.useEffect(() => { const store = global.__r(14838).default; return store && store.subscribe ? store.subscribe(() => bump(n => n + 1)) : undefined; }, []);
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
          // Through renderSettingItem (14973) as Discord draws each row, so removal mode marks it.
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
    // ask= is a button's name as Venus says it (Voice call button): its X is labelled "Remove: <name>".
    // confirm=1 then says yes in the alert, so the button goes and the bar offers Undo.
    const yes = q.get("confirm") ? () => press(() => tappable(text("Remove"))) : null;
    press(() => tappable(text("Start removing")), q.get("ask") ? () => press(() => document.querySelector(`[aria-label="Remove: ${q.get("ask")}"]`), yes) : null);
  }, []);
}
function RemoveMode({ defined, registry }) {
  const node = registry.VENUS_HIDEANYTHING, Page = node && node.screen && node.screen.getComponent();
  const App = defined[14827].exports.default, Messages = defined[16467].exports.default, Dm = defined[12854].exports.default;
  const Contact = defined[13425].exports.default, Pill = defined[9115].exports.default, Actions = defined[11935].exports.default, Send = defined[11956].exports.default;
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
    if (name === "serverEdit") { const row = defined[16748].exports.default((guilds[Number(q.get("server")) || 0] || guild).id).find(it => it.label === "Edit locally"); if (row) row.action(); else console.warn("No Edit locally row"); }
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
  if (name === "removeMode" && !sheets.length) return <RemoveMode defined={defined} registry={registry} />;
  if (/^remove(Profile|Menu|Headers|Guild)$/.test(name) && !sheets.length) return <RemoveScene defined={defined} registry={registry} dim={name === "removeGuild"}>
    {name === "removeHeaders" ? <HeadersScreen defined={defined} /> : name === "removeGuild" ? <GuildMenuSheet defined={defined} /> : <ProfileScreen defined={defined} />}</RemoveScene>;
  if (name === "reviews") return <Profile defined={defined} />;
  if (name === "youBar") return <YouBar defined={defined} />;
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
// Venus finds every spot by the same props, icons and message keys it uses in Discord.
const TILE = { minHeight: 64, borderRadius: 16, paddingVertical: 10, paddingHorizontal: 8, gap: 6, alignItems: "center", justifyContent: "center",
  backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") };
const CHIP = { flexDirection: "row", alignItems: "center", paddingHorizontal: 10, paddingVertical: 6, borderRadius: 10, backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") };
const MORE = { width: 36, height: 36, borderRadius: 10, alignItems: "center", justifyContent: "center", backgroundColor: "#00000066" };
const ROLES = [["Good Kitty <3", "#f47fff"], ["She/Her", "#5ad7e3"], ["He/Him", "#45ddc0"], ["Announcement Pings", "#a37ca0"], ["Server Booster", "#ff73fa"]];
const MSG_HEADER = 100, GUILD_HEADER = 122;
const PROFILE_USER = { id: "1200000000000000004", username: "cynfulsolver", globalName: "Cyn" };
const REPORT = ["wqHXNt", "TbHyMG", "jhJzez"].map(k => EN_TEXT[k]).find(Boolean) || "Report User Profile";
const MENU_ITEMS = [[{ label: T_("GISTta"), action() {} }, { label: T_("Sd8Ixw"), action() {} }, { label: T_("y5MwJy"), action() {} }, { label: T_("PHjkRE"), action() {} }],
  [{ label: T_("ytCpKs"), action() {} }, { label: T_("l4Emac"), variant: "destructive", action() {} }, { label: REPORT, variant: "destructive", action() {} }]];
function StubContextMenu(p) {
  const open = q.get("scene") === "removeMenu", Item = global.__r(14279).ContextMenuItem;
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
      <TextWithIcon themeType="dark" icon={React.createElement(global.__r(10173).ClydeIcon, { size: "sm" })} accessibilityLabel="Joined Discord: Apr 23, 2020">Apr 23, 2020</TextWithIcon>
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
function FriendRequestButton(p) { const Btn = p.ButtonComponent; return <Btn brand icon={icon(5032, "UserPlusIcon", "sm")} text={T_("7815ae")} />; }
function ProfileScreen({ defined }) {
  const Menu = defined[13092].exports.default, Info = defined[10533].exports.default, Mutuals = defined[13418].exports.default, Contact = defined[13425].exports.default;
  const Tabs = defined[12364].exports.Tabs, About = defined[10614].exports.default, Roles = defined[6882].exports.default;
  const Connections = defined[13402].exports.UserProfileAccountConnectionsCard, Note = defined[13181].exports.default;
  const state = defined[8525].exports.useSegmentedControlState({ items: [{ id: "main", label: T_("LXw470"), page: null }, { id: "activity", label: T_("chq59f"), page: null },
    { id: "wishlist", label: T_("7lZ31J"), page: null }] });
  return <RN.View style={{ backgroundColor: D.tok("BACKGROUND_BASE_LOWER") }}>
    <RN.View style={{ height: 120, backgroundColor: "#4e3d6b" }}>
      <RN.View style={{ position: "absolute", top: 12, right: 12 }}><Menu /></RN.View></RN.View>
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
    backgroundColor: D.tok("BACKGROUND_MOD_SUBTLE") }}>{icon(6740, "MagnifyingGlassIcon", "sm")}<D.Text variant="text-md/semibold" color="text-default">{T_("5h0QOP")}</D.Text></RN.Pressable>;
}
function GuildSearchAndInvite(p) {
  return <RN.View style={{ flexDirection: "row", gap: 8 }}>
    <SearchPill onPress={() => {}} onPressIn={() => {}} onPressOut={() => {}} />
    {React.createElement(global.__r(7569).IconButton, { icon: icon(5032, "UserPlusIcon", "sm"), accessibilityLabel: T_("VINpSK"), onPress() {}, onPressDisabled() {} })}
    {React.createElement(global.__r(7569).IconButton, { icon: icon(8675, "CalendarIcon", "sm"), accessibilityLabel: T_("tlopTM"), onPress() {} })}
  </RN.View>;
}
function DmRows({ n }) {
  return <RN.View style={{ paddingHorizontal: 12, gap: 6 }}>{["Adreanne", "Dippy", "dertodeskonig", "PowerBot"].slice(0, n).map((name, i) =>
    <RN.View key={name} style={{ flexDirection: "row", alignItems: "center", gap: 12, padding: 8 }}>
      <RN.View style={{ width: 40, height: 40, borderRadius: 20, backgroundColor: ["#eb459e", "#f0b232", "#5865f2", "#23a55a"][i] }} />
      <D.Text variant="text-md/semibold" color="text-strong">{name}</D.Text></RN.View>)}</RN.View>;
}
function HeadersScreen({ defined }) {
  const Messages = defined[16467].exports.default, specs = defined[16466].exports.default(), Search = defined[11997].exports.default;
  const height = defined[16575].exports.useRedesignGuildHeaderHeight(guild);
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
  return <RN.View style={[CHIP, { alignSelf: "flex-start", gap: 6, paddingVertical: 4 }]}>{icon(9099, "GlobeEarthIcon", "xs")}
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
  const B = global.__r(7569).IconButton;
  return <RN.View style={{ flexDirection: "row", gap: 8 }}>
    <B variant="secondary" grow label="9 Boosts" icon={icon(9405, "BoostGemIcon", "md")} onPress={() => {}} />
    <B variant="secondary" grow label={T_("VINpSK")} icon={icon(5032, "UserPlusIcon", "md")} onPress={() => {}} />
    <B variant="secondary" grow label={T_("HcoRu0")} icon={icon(8768, "BellIcon", "md")} onPress={() => {}} />
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
  const Header = defined[14206].exports.default, TabItems = defined[14212].exports.default, A = defined[14143].exports, Emoji = defined[14216].exports.default;
  return <RN.View style={{ backgroundColor: D.tok("MOBILE_ACTIONSHEET_BACKGROUND"), borderTopLeftRadius: 24, borderTopRightRadius: 24, padding: 16, gap: 16, marginTop: 24 }}>
    <Header guild={guild} />
    <TabItems guild={guild} />
    <A.GuildUnreadAction guild={guild} />
    <A.GuildActionSheetSecondaryActions guild={guild} />
    <Emoji guildId={guild.id} />
  </RN.View>;
}
function RemoveScene({ defined, registry, children }) {
  const node = registry.VENUS_HIDEANYTHING, Page = node && node.screen && node.screen.getComponent();
  const App = defined[14827].exports.default;
  useStartRemoving();
  return <RN.View style={{ width: D.W, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_BASE_LOWEST") }}>
    <App>{children}<RN.View style={{ height: 180 }} /></App>
    <RN.View style={{ height: 1, overflow: "hidden", opacity: 0 }}>{Page ? <Page /> : null}</RN.View>
  </RN.View>;
}
