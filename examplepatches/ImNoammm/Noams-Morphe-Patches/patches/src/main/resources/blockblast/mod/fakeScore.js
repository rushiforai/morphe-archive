// A fake best score: while on, every read of classHighScore (a live storage getter behind the crowns
// and result screens) answers the chosen number; off restores the real best. Writes only land above the
// real record, and Classic game overs refresh it directly, since the game compares runs against the fake.
bb.feature('fakeScore', {
    title: 'Best score',
    settings: [
        { key: 'enabled', type: 'toggle', label: 'Fake best score', def: false,
            note: 'Shows your chosen number as the best; off brings the real one back' },
        { key: 'value', type: 'number', label: 'Fake value', def: 1000000, min: 0, max: 99999999, step: 10000 },
    ],
    start: function () {
        var bypass = false;
        function on() { return bb.get('fakeScore', 'enabled'); }
        function fake() { return +bb.get('fakeScore', 'value') || 0; }
        function raw(fn) {
            bypass = true;
            try { return fn(); } finally { bypass = false; }
        }

        bb.on('Storage', function (exports) {
            var storage = exports.storage;
            bb.wrap(storage, 'getItem', function (original) {
                return function (key) {
                    if (!bypass && key === 'classHighScore' && on()) return fake();
                    return original.apply(this, arguments);
                };
            });
            bb.wrap(storage, 'setItem', function (original) {
                return function (key, value) {
                    if (!bypass && key === 'classHighScore' && on()) {
                        var real = raw(function () { return +storage.getItem('classHighScore', 0) || 0; });
                        if (!(+value > real)) return; // never let a faked comparison shrink the record
                    }
                    return original.apply(this, arguments);
                };
            });
        });

        function refreshReal() {
            if (!on()) return;
            try {
                var storage = bb.module('Storage').storage;
                raw(function () {
                    var real = +storage.getItem('classHighScore', 0) || 0;
                    var score = +storage.getItem('classScore', 0) || 0;
                    if (score > real) storage.setItem('classHighScore', score);
                });
            } catch (e) { bb.log('fakeScore: real-best refresh failed:', e); }
        }
        bb.onEvent('E_ClassFail_Show', refreshReal);
        bb.onEvent('E_ClassWin_Show', refreshReal);
    },
});
