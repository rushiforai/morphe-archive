// The game's gear popup, tidied through the key-list transforms (bb.ui.onSetupKeys): More games becomes
// the game's own Home button (the hall and its home tile go), More settings can be removed, and the
// default/close-skin buttons go while the mod themes are on, since the two skin systems would fight.
bb.feature('setupMenu', {
    title: 'Settings menu',
    settings: [
        { key: 'homeButton', type: 'toggle', label: 'Remove More games', def: true, note: 'The gear popup gets Back to home instead; the home tile goes away' },
        { key: 'hideMoreSettings', type: 'toggle', label: 'Remove More settings', def: false, note: 'Hides the game’s second settings page' },
        { key: 'hideDefaultSkin', type: 'toggle', label: 'Hide the skin buttons', note: 'The default/close-skin buttons; the mod themes replace them',
          def: !!(window.__bbmod && (window.__bbmod.blockTheme || window.__bbmod.colorTheme || window.__bbmod.menuTheme || window.__bbmod.fxTheme)) },
        { key: 'hideAdventure', type: 'toggle', label: 'Hide Adventure', def: false, note: 'The Adventure button leaves the home screen' },
        { key: 'hideMedal', type: 'toggle', label: 'Hide Medal', def: false, note: 'The medal ribbon in the home corner' },
        { key: 'hideWinStreak', type: 'toggle', label: 'Hide daily victories', def: false, note: 'The Consecutive Daily Victories card' },
    ],
    start: function () {
        // Home-screen tiles. Traits add some of them after the page shows (the More Games tile), and the
        // page is re-activated without a new show when coming back from a game, so the choices are
        // asserted every frame while the page is active; each node is found once and cached.
        var HOME = {
            homeButton: ['btn_layout/GameLobbyAddMoreGame', 'moreGameBtn'],
            hideAdventure: ['btn_layout/btn_JourneyLoading'],
            hideMedal: ['medalBtn'],
            hideWinStreak: ['winStreak'],
        };
        var homeNodes = {};
        bb.frame(function () {
            var page = cc.find('persist/uiLayer/homePage');
            if (!page || !page.activeInHierarchy) return;
            Object.keys(HOME).forEach(function (key) {
                var hide = !!bb.get('setupMenu', key);
                HOME[key].forEach(function (path) {
                    var node = homeNodes[path];
                    if (!node || !cc.isValid(node)) node = homeNodes[path] = cc.find(path, page) || bb.ui.find(page, path.split('/').pop());
                    if (node && node.active !== !hide) node.active = !hide;
                });
            });
        });

        // The row list as the popup lays it out (see bb.ui.onSetupKeys in ui.js).
        bb.ui.onSetupKeys(function (keys) {
            if (bb.get('setupMenu', 'homeButton')) {
                keys = keys.map(function (k) { return k === 'moreGames' ? 'home' : k === 'ios_moreGames' ? 'ios_home' : k; });
            }
            if (bb.get('setupMenu', 'hideMoreSettings')) {
                keys = keys.filter(function (k) { return k !== 'moreSettings' && k !== 'ios_moreSettings'; });
            }
            if (bb.get('setupMenu', 'hideDefaultSkin')) {
                keys = keys.filter(function (k) { return k !== 'SetAddDefultSkinBtn' && k !== 'SetAddCloseSkinBtn'; });
            }
            return keys;
        });

        bb.on('Setup_Proxy', function (exports) {
            var proto = exports.Setup_Proxy.prototype;
            // Home was mapped in above; make sure a tap on the old More games slot never opens the hall.
            bb.wrap(proto, 'onClick_moreGames', function (original) {
                return function () {
                    if (bb.get('setupMenu', 'homeButton')) return;
                    return original.apply(this, arguments);
                };
            });
        });
    },
});
