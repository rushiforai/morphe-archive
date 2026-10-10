// Drag speed: when the game screen is created BlocksProducer_Proxy.onTriggerBlocksTouch gives the touch
// component the ratio the held piece moves per finger movement (1.5, or what DragRateTrait picks for the
// screen size). With the toggle on the chosen ratio is used instead.
bb.feature('dragSpeed', {
    title: 'Drag',
    settings: [
        { key: 'enabled', type: 'toggle', label: 'Override drag speed', def: true },
        { key: 'ratio', type: 'number', label: 'Drag ratio', def: 1.5, min: 0.5, max: 4, step: 0.25, note: 'iOS uses 1.5; 1 follows the finger exactly' },
    ],
    start: function () {
        function chosen() { return Math.max(0.5, Math.min(4, Number(bb.get('dragSpeed', 'ratio')) || 1.5)); }
        function applyLive() {
            var Touch = bb.module('BlocksProducerTouch');
            if (!Touch || typeof Cinst !== 'function') return;
            var touch = Cinst(Touch.default);
            if (touch) touch.setState({ ratioValue: chosen() });
        }
        bb.on('BlocksProducer_Proxy', function (exports) {
            bb.wrap(exports.BlocksProducer_Proxy.prototype, 'onTriggerBlocksTouch', function (original) {
                return function (ratio) {
                    if (!bb.get('dragSpeed', 'enabled')) return original.apply(this, arguments);
                    return original.call(this, chosen());
                };
            });
        });
        bb.sub(function (id, key) {
            if (id === 'dragSpeed' && bb.get('dragSpeed', 'enabled')) applyLive();
        });
    },
});
