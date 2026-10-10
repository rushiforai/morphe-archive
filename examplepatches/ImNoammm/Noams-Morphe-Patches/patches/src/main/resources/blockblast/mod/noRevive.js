// Disable revive: the game asks ClassRevive_Proxy.doNotReviveByTrait() before offering a revive (for an ad);
// false takes its own no-revive branch, which ends the game as usual.
bb.feature('noRevive', {
    title: 'Revive',
    settings: [
        { key: 'enabled', type: 'toggle', label: 'Disable revive', def: true },
    ],
    start: function () {
        bb.on('ClassRevive_Proxy', function (exports) {
            bb.wrap(exports.ClassRevive_Proxy.prototype, 'doNotReviveByTrait', function (original) {
                return function () {
                    return bb.get('noRevive', 'enabled') ? false : original.apply(this, arguments);
                };
            });
        });
    },
});
