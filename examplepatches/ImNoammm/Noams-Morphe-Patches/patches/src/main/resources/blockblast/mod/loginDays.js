// Login days: Param230012Trait's score multiplier scales every clear by a function of the distinct days
// ScoreParam230012Info.recordLogin has counted (Param230012TraitData). With the toggle on, the count is the
// chosen number instead of counted logins.
bb.feature('loginDays', {
    title: 'Score multiplier',
    settings: [
        { key: 'enabled', type: 'toggle', label: 'Fixed login days', def: true },
        {
            key: 'days', type: 'choice', label: 'Login days', def: 1,
            note: 'Multiplier: 1 + log10(days) + 1/(1 + days mod 10)',
            values: [1, 2, 3, 5, 7, 10, 20, 30, 50, 100].map(function (n) { return { v: n, label: n + (n === 1 ? ' day' : ' days') }; }),
        },
    ],
    start: function () {
        function apply() {
            if (!bb.get('loginDays', 'enabled')) return;
            var Info = bb.module('ScoreParam230012Info');
            if (!Info) return;
            var info = Info.param230012Info;
            var days = Math.max(1, Math.floor(Number(bb.get('loginDays', 'days')) || 1));
            var data = info.paramData;
            if (data.days !== days || data.curDay !== days) {
                var next = {};
                for (var key in data) next[key] = data[key];
                next.days = days;
                next.curDay = days;
                info.updateParamData(next);
            }
        }
        bb.on('ScoreParam230012Info', function (exports) {
            ['init', 'recordLogin'].forEach(function (name) {
                bb.wrap(exports.param230012Info, name, function (original) {
                    return function () {
                        var result = original.apply(this, arguments);
                        apply();
                        return result;
                    };
                });
            });
        });
        bb.sub(function (id) { if (id === 'loginDays') apply(); });
    },
});
