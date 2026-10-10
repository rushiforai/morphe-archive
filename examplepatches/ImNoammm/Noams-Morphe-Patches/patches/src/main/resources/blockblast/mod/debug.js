// Debug log: every screen/prefab the game opens (UI.show) goes to <files>/bbmod.log. A script placed at
// <files>/bbmod-cmd.js (the app's private folder, so only the app or root can) is evaluated in the game once
// a second and removed; its result is logged. That is how the patches are tested over adb.
bb.feature('debug', {
    title: 'Debug',
    settings: [
        { key: 'enabled', type: 'toggle', label: 'Log opened screens', def: true },
    ],
    start: function () {
        bb.on('UI', function (exports) {
            bb.wrap(exports.UI, 'show', function (original) {
                return function (config) {
                    if (bb.get('debug', 'enabled')) bb.log('UI.show', config && (config.name || config.url));
                    return original.apply(this, arguments);
                };
            });
        });

        var fileUtils = jsb.fileUtils;
        var commandPath = fileUtils.getWritablePath() + 'bbmod-cmd.js';
        setInterval(function () {
            if (!fileUtils.isFileExist(commandPath)) return;
            var code = fileUtils.getStringFromFile(commandPath);
            fileUtils.removeFile(commandPath);
            try {
                var result = (0, eval)(code);
                bb.log('=>', typeof result === 'string' ? result : safeJson(result));
            } catch (e) {
                bb.log('eval failed:', e, e && e.stack);
            }
        }, 1000);

        function safeJson(value) {
            var seen = [];
            try {
                return JSON.stringify(value, function (key, v) {
                    if (v && typeof v === 'object') {
                        if (seen.indexOf(v) >= 0) return '[circular]';
                        seen.push(v);
                    }
                    return typeof v === 'function' ? '[function]' : v;
                });
            } catch (e) {
                return String(value);
            }
        }
    },
});
