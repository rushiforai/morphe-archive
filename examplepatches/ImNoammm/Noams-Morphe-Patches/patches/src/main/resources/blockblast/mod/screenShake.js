// Screen shake: Shake.start moves the camera along a 9-point path on big clears; off, it never starts.
bb.feature('screenShake', {
    title: 'Screen',
    settings: [
        { key: 'enabled', type: 'toggle', label: 'Screen shake', def: false },
    ],
    start: function () {
        bb.on('Shake', function (exports) {
            bb.wrap(exports.shake, 'start', function (original) {
                return function () {
                    if (!bb.get('screenShake', 'enabled')) return;
                    return original.apply(this, arguments);
                };
            });
        });
    },
});
