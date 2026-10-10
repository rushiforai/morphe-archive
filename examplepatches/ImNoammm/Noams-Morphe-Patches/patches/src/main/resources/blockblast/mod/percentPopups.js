// Hides the "% of players" comparisons: the Adventure defeat tower (ChapterHardLevelDefeat), the
// in-level goal banner (PercentStreamer, a seeded roll that variant 1 shows as 100-c) and the chapter
// list's top-rank badge (the "ChapterRankPercent" screen). Classic has no such surface.
bb.feature('percentPopups', {
    title: 'Percent popups',
    settings: [
        { key: 'enabled', type: 'toggle', label: 'Hide "% of players" messages', def: true,
            note: 'The Adventure defeat percent, level banners and the top-rank badge' },
    ],
    start: function () {
        function on() { return bb.get('percentPopups', 'enabled'); }

        // Both are decorations rendered into their own nodes; hiding at render also covers the
        // trait paths that reuse a cached node, and toggling off brings them back on the next render.
        ['ChapterHardLevelDefeat', 'PercentStreamer'].forEach(function (name) {
            bb.on(name, function (exports) {
                bb.wrap(exports.default.prototype, 'render', function (original) {
                    return function () {
                        this.node.active = !on();
                        if (!this.node.active) return; // the tweens and texture loads are skipped too
                        return original.apply(this, arguments);
                    };
                });
            });
        });

        // The trait keeps the returned node and refreshes its label, so it is shown normally and
        // only made invisible; toggling the setting later brings it back on the next list render.
        bb.on('UI', function (exports) {
            bb.wrap(exports.UI, 'show', function (original) {
                return function (config) {
                    var result = original.apply(this, arguments);
                    if (config && config.name === 'ChapterRankPercent' && result && result.then) {
                        result.then(function (node) {
                            if (node && cc.isValid(node) && on()) node.active = false;
                        }, function () {});
                    }
                    return result;
                };
            });
        });
    },
});
