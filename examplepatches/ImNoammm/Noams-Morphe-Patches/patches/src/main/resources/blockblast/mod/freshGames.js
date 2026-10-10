// Fresh Classic games, as in the iOS-based app: a new game starts on an empty board in the original skin,
// and the tutorial counts as done.
bb.feature('freshGames', {
    title: 'New games',
    settings: [
        { key: 'emptyBoard', type: 'toggle', label: 'Empty board', def: true, note: 'No pre-filled cells; applies to the next new game' },
        { key: 'originalSkin', type: 'toggle', label: 'Original skin', def: true, note: 'A new game goes back to the original look' },
        { key: 'skipTutorial', type: 'toggle', label: 'Skip the tutorial', def: true },
    ],
    start: function () {
        function markTutorialDone() {
            var Storage = bb.module('Storage');
            if (!Storage) return;
            if (Storage.storage.getItem('classGuideStep', 0) < 3) Storage.storage.setItem('classGuideStep', 3);
            Storage.storage.setItem('isFinishedGuide', true);
        }
        bb.on('Storage', function () {
            if (bb.get('freshGames', 'skipTutorial')) markTutorialDone();
        });
        bb.sub(function (id, key, value) {
            if (id === 'freshGames' && key === 'skipTutorial' && value) markTutorialDone();
        });
        bb.on('ClassDefaultBoard_Proxy', function (exports) {
            var proto = exports.ClassDefaultBoard_Proxy.prototype;
            // For a new game onProduceClassDefaultBoard stores the result of this last step (classFaceBlocks
            // and classInitialFaceBlocks); every board-seeding trait runs in the steps before it.
            bb.wrap(proto, 'produceDefaultBoardFinal', function (original) {
                return function () {
                    var board = original.apply(this, arguments);
                    if (!bb.get('freshGames', 'emptyBoard')) return board;
                    return board.map(function (row) { return row.map(function () { return -1; }); });
                };
            });
            // All-clears move the skin along SkinInfo's sequence; a new game goes back to the original,
            // through the same E_Skin_Update the game's own restore dispatches.
            bb.wrap(proto, 'onProduceClassDefaultBoard', function (original) {
                return function (event) {
                    if (bb.get('freshGames', 'originalSkin') && event && event.data && event.data.newGame) {
                        var skinInfo = bb.module('SkinInfo').skinInfo;
                        if (skinInfo.currentSkinId !== skinInfo.originSkinId) {
                            var E_Skin_Update = bb.module('E_Skin_Update').E_Skin_Update;
                            bb.module('EventManager').EventManager.dispatchModuleEvent(new E_Skin_Update(skinInfo.originSkinId));
                        }
                    }
                    return original.apply(this, arguments);
                };
            });
        });
    },
});
