// Guard the final full Classic tray, after generator fallbacks and before/after-producer traits.
// BlocksProducer inherits Component.setState; wrapping it here leaves all other components alone.
bb.feature('solvableTrays', {
    title: 'Classic difficulty',
    settings: [
        { key: 'enabled', type: 'toggle', label: 'Disable impossible levels', def: true,
            note: 'New trays can be played in full; your moves still matter' },
    ],
    start: function () {
        function full(state) {
            var tray = state && state.producerBlocks;
            return Array.isArray(tray) && tray.length === 3 && tray.every(function (id) { return id > 0; });
        }
        function guard(state, storage, shapes) {
            var fixed = bb.traySolver.repair(storage.getItem('classFaceBlocks', null), state.producerBlocks, shapes);
            if (!fixed || !fixed.changed) return state;
            // Per-cell colors and suggested positions belong to the old shapes; slot colors are retained.
            var next = {};
            Object.keys(state).forEach(function (key) { next[key] = state[key]; });
            next.producerBlocks = fixed.tray;
            next.itemsColors = undefined;
            storage.setItem('classProducerBlocks', fixed.tray.slice());
            storage.setItem('classBlockLists', fixed.tray.slice());
            storage.setItem('classBlockPosLists', []);
            bb.log('solvableTrays: replaced', JSON.stringify(state.producerBlocks), 'with', JSON.stringify(fixed.tray));
            return next;
        }

        // The embedded iOS game validates its tray before Android's polling bridge reads it. Guard its
        // final renderer too, so an impossible first move cannot start an irreversible game-over sequence.
        bb.guardIosTrays = function (ios) {
            if (ios.__bbSolvableTraysGuarded) return;
            bb.wrap(ios.req('BlocksProducer').default.prototype, 'setState', function (original) {
                return function (state) {
                    if (bb.get('solvableTrays', 'enabled') && bb.get('iosGeneration', 'enabled') && full(state) &&
                        !ios.req('ClassGuideInfo').classGuideInfo.show) {
                        var args = Array.prototype.slice.call(arguments);
                        args[0] = guard(state, ios.storage, ios.req('BinaryConfig').BlockShapeMap);
                        return original.apply(this, args);
                    }
                    return original.apply(this, arguments);
                };
            });
            ios.__bbSolvableTraysGuarded = true;
        };

        bb.on('BlocksProducer', function (exports) {
            bb.wrap(exports.default.prototype, 'setState', function (original) {
                return function (state) {
                    var guide = bb.module('ClassGuideInfo');
                    if (!bb.get('solvableTrays', 'enabled') || !bb.isClassic() || (guide && guide.classGuideInfo.show) ||
                        !full(state)) {
                        return original.apply(this, arguments);
                    }
                    var storage = bb.module('Storage').storage;
                    var next = guard(state, storage, bb.module('BinaryConfig').BlockShapeMap);
                    if (next === state) return original.apply(this, arguments);
                    var ios = bb.iosGame && bb.iosGame();
                    if (ios) {
                        ios.storage.setItem('classFaceBlocks', storage.getItem('classFaceBlocks', null));
                        ios.storage.setItem('classProducerBlocks', next.producerBlocks.slice());
                        ios.storage.setItem('classBlockLists', next.producerBlocks.slice());
                        ios.storage.setItem('classBlockPosLists', []);
                        if (state.colors) ios.storage.setItem('classColorLists', state.colors.slice());
                    }
                    var args = Array.prototype.slice.call(arguments);
                    args[0] = next;
                    return original.apply(this, args);
                };
            });
        });
    },
});
