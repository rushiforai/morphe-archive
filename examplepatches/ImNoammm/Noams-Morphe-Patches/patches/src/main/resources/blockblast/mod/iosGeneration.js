// iOS generation: every Classic tray comes from the real iOS 7.4.3 game, running isolated here (env.js +
// ios-core.js over the scripts in assets/ios/game). Both Android algorithm handlers answer normal deals
// from it, each Android placement is mirrored into it, and on a disagreement it adopts Android's state.
bb.feature('iosGeneration', {
    title: 'Piece generation',
    settings: [
        { key: 'enabled', type: 'toggle', label: 'iOS generation algorithm', def: true, note: 'The iOS 7.4.3 game deals every tray; applies from the next tray' },
    ],
    start: function () {
        var fileUtils = jsb.fileUtils;
        var PREFIX = 'bbios:';
        var DEFAULT_STRATEGY = -1; // AlgorithmStrategyType.ALGO_STRATEGY_TYPE.DEFAULT
        var EMPTY_TRAY = [-1, -1, -1];
        var ios = null, booting = null;

        function on() { return !!bb.get('iosGeneration', 'enabled'); }
        function wait(ms) { return new Promise(function (resolve) { setTimeout(resolve, ms); }); }
        function same(a, b) { return JSON.stringify(a) === JSON.stringify(b); }
        function full(tray) { return !!tray && tray.length === 3 && tray.every(function (id) { return id >= 0; }); }
        function empty(tray) { return !!tray && tray.every(function (id) { return id < 0; }); }
        function androidStorage() { return bb.module('Storage').storage; }
        function androidState() {
            var s = androidStorage();
            return {
                board: s.getItem('classFaceBlocks', null),
                tray: s.getItem('classProducerBlocks', null),
                colors: s.getItem('classColorLists', null),
                score: s.getItem('classScore', 0),
                round: s.getItem('classRoundNum', 0),
            };
        }

        // The iOS game's localStorage: its own keys, prefixed, inside the app's, so its game survives restarts.
        function iosStorage() {
            function ours() {
                var keys = [];
                for (var i = 0; i < localStorage.length; i++) {
                    var k = localStorage.key(i);
                    if (k && k.indexOf(PREFIX) === 0) keys.push(k);
                }
                return keys;
            }
            return {
                getItem: function (k) { return localStorage.getItem(PREFIX + k); },
                setItem: function (k, v) { localStorage.setItem(PREFIX + k, String(v)); },
                removeItem: function (k) { localStorage.removeItem(PREFIX + k); },
                clear: function () { ours().forEach(function (k) { localStorage.removeItem(k); }); },
                key: function (i) { var k = ours()[i]; return k ? k.slice(PREFIX.length) : null; },
                get length() { return ours().length; },
            };
        }

        function boot() {
            if (booting) return booting;
            var t0 = Date.now();
            booting = new Promise(function (resolve) {
                try {
                    (0, eval)(fileUtils.getStringFromFile('ios/ios-core.js') + '\n;window.__bbIOSCore = IOSCore;');
                    (0, eval)(fileUtils.getStringFromFile('ios/env.js') + '\n;window.__bbMakeIosEnv = makeIosEnv;');
                    var storage = iosStorage();
                    var installTime = Number(storage.getItem('bb.installTime')) || Date.now();
                    storage.setItem('bb.installTime', installTime);
                    var env = window.__bbMakeIosEnv({
                        read: function (path) { return fileUtils.getStringFromFile(path); },
                        base: 'ios/game/',
                        storage: storage,
                        realGlobal: window,
                    });
                    // Attach before enterClassic, so a saved full tray is guarded on the first render too.
                    if (bb.guardIosTrays) bb.wrap(window.__bbIOSCore.ClassicCore.prototype, 'installHooks', function (original) {
                        return function () { original.apply(this, arguments); bb.guardIosTrays(this); };
                    });
                    window.__bbIOSCore.ClassicCore.create(env, { installTime: installTime }).then(function (core) {
                        ios = core;
                        bb.log('iosGeneration: iOS game ready in', Date.now() - t0, 'ms');
                        resolve(core);
                    }, function (e) {
                        bb.log('iosGeneration: iOS game failed to start:', e, e && e.stack);
                        resolve(null);
                    });
                } catch (e) {
                    bb.log('iosGeneration: iOS game failed to load:', e, e && e.stack);
                    resolve(null);
                }
            });
            return booting;
        }

        // Give the iOS game Android's current board, tray and colours (a resync); its score follows too.
        function adopt(state) {
            var s = ios.storage;
            s.setItem('classFaceBlocks', state.board);
            if (state.tray) s.setItem('classProducerBlocks', state.tray);
            if (state.colors) s.setItem('classColorLists', state.colors);
            s.setItem('classScore', state.score || 0);
        }

        // A new iOS game on Android's starting board, through its own new-game path; its opening board splash ends
        // at once (the core runs the splash's own completion), which deals its first tray.
        function newGame(board) {
            if (ios.result) {
                var screen = ios.result.screen || 'ClassFail';
                ios.result = null;
                ios.g.Cinst(ios.req(screen).default).onClickPlay();
            } else {
                ios.EventManager.dispatchModuleEvent(new (ios.req('E_Game_Replay').E_Game_Replay)());
            }
            return wait(100).then(function () {
                ios.storage.setItem('classFaceBlocks', board);
                return ios.boardIntroDone();
            });
        }

        // A deal for Android's board mid-game when the two games had drifted: the iOS game's own round end.
        function redeal(state) {
            adopt({ board: state.board, tray: EMPTY_TRAY, colors: state.colors, score: state.score });
            ios.EventManager.dispatchModuleEvent(new (ios.req('E_BlocksProducer_TouchEndDelay').E_BlocksProducer_TouchEndDelay)({ clearProducer: true, clearScreen: false }));
        }

        // The iOS game's tray for Android's current situation, or null (then Android deals this one). `starting`: this
        // is the first deal of a new Android game.
        function iosDeal(starting) {
            var state = androidState();
            return boot().then(function (core) {
                if (!core) return null;
                // a new game on both sides (also whenever the iOS game still sits on its own result screen)
                if (starting || core.result) return newGame(state.board);
                // mid-game the iOS game deals at its own round end, having played the same moves; if it is on another
                // board, or holds part of a tray, it is given Android's board and deals for that
                if (!same(core.board, state.board) || !(full(core.tray) || empty(core.tray))) {
                    bb.log('iosGeneration: the iOS game is out of step at a deal, resyncing it');
                    redeal(state);
                }
            }).then(function () {
                if (!ios) return null;
                var tries = 0;
                return (function poll() {
                    if (full(ios.tray) && same(ios.board, androidState().board)) return latestDeal();
                    if (++tries > 250) return null; // ~5 s
                    return wait(20).then(poll);
                })();
            });
        }

        // The tray, colours and planned positions of the iOS game's latest deal (its algorithm's own results).
        function latestDeal() {
            return {
                tray: ios.tray.slice(),
                colors: ios.req('ClassColorProducerGameInfo').classColorProducerGameInfo.colorList.slice(),
                pos: ios.storage.getItem('classBlockPosLists', []),
            };
        }

        function answer(event, original, self, args) {
            if (event.__bbAnswered) return; // the other handler already answered this deal
            event.__bbAnswered = true;
            var callback = event.option && event.option.callback;
            // Android deals the first tray of a game from the board splash's end (an all-clear wave ends the same
            // way, but never at score 0)
            var starting = splashEnding && !(androidState().score > 0);
            iosDeal(starting).then(function (deal) {
                if (!deal) {
                    bb.log('iosGeneration: no iOS tray, Android deals this one');
                    return original.apply(self, args);
                }
                bb.log('iosGeneration: iOS dealt', JSON.stringify(deal.tray), 'colours', JSON.stringify(deal.colors), starting ? '(new game)' : '');
                var s = androidStorage();
                s.setItem('classBlockLists', deal.tray);
                s.setItem('classBlockPosLists', deal.pos);
                bb.module('ClassColorProducerGameInfo').classColorProducerGameInfo.setColorList(deal.colors);
                if (typeof callback === 'function') callback();
            }, function (e) {
                bb.log('iosGeneration: deal failed:', e, e && e.stack);
                original.apply(self, args);
            });
        }

        // The game-start deal: the board splash's end deals when the tray is empty (ClassBlocksProducer_
        // BlocksProducerValidate_Proxy), synchronously, so a deal asked for inside it starts a game.
        var splashEnding = false;
        bb.on('ClassBlocksProducer_BlocksProducerValidate_Proxy', function (exports) {
            bb.wrap(exports.ClassBlocksProducer_BlocksProducerValidate_Proxy.prototype, 'onBoardSplashAnimationEnd', function (original) {
                return function () {
                    splashEnding = true;
                    try { return original.apply(this, arguments); } finally { splashEnding = false; }
                };
            });
        });

        // Android's algorithm handlers: a normal deal is answered from the iOS game instead.
        function isNormalDeal(event) {
            var o = event && event.option;
            return !!o && (o.strategyState === undefined || o.strategyState === DEFAULT_STRATEGY);
        }
        [['ClassAlgorithmStrategy_Run_Proxy', 'onTriggerStrategyRun'],
         ['ClassAlgorithmStrategyRefactored_Pipeline_Proxy', 'onClassAlgorithmStrategyRun']].forEach(function (hook) {
            bb.on(hook[0], function (exports) {
                bb.wrap(exports[hook[0]].prototype, hook[1], function (original) {
                    return function (event) {
                        if (on() && isNormalDeal(event)) return answer(event, original, this, arguments);
                        return original.apply(this, arguments);
                    };
                });
            });
        });

        // Android's placements, played in the iOS game too.
        bb.on('BlocksProducerTouch', function (exports) {
            bb.wrap(exports.default.prototype, 'onAfterTouchEnd', function (original) {
                return function () {
                    var placed = this._canSnap && this._showShaders, index = this._selectIndex;
                    var before = placed && on() && ios ? androidState() : null;
                    var result = original.apply(this, arguments);
                    if (before) mirror(index, placed, before);
                    return result;
                };
            });
        });

        function mirror(index, shaders, before) {
            try {
                var row = Infinity, col = Infinity;
                Object.keys(shaders).forEach(function (r) {
                    Object.keys(shaders[r]).forEach(function (c) { row = Math.min(row, +r); col = Math.min(col, +c); });
                });
                if (!same(ios.board, before.board) || !same(ios.tray, before.tray)) {
                    bb.log('iosGeneration: the iOS game drifted before a placement, resyncing');
                    adopt(before);
                }
                if (!ios.canPlace(index, row, col)) {
                    bb.log('iosGeneration: the iOS game cannot place slot', index, 'at', row, col);
                    return;
                }
                ios.place(index, row, col);
            } catch (e) {
                bb.log('iosGeneration: mirroring failed:', e, e && e.stack);
            }
        }

        bb.iosGame = function () { return ios; }; // for the debug console

        // Start the iOS game during Android's launch screen, so the first deal does not wait for it.
        bb.ui.onScreen('Launch', function () { if (on()) setTimeout(boot, 50); });
        bb.sub(function (id, key, value) { if (id === 'iosGeneration' && key === 'enabled' && value) boot(); });
    },
});
