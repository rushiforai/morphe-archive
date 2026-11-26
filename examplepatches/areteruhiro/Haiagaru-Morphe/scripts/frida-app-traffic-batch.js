rpc.exports.test = () => new Promise(resolve => Java.perform(() => {
    let config, data, configHad, configValue, featuresHad, featuresValue, app, traffic, fixture;
    const result = {fixtureOnly: true, aggregatePersisted: false, pendingCleared: false, recordedBytes: 0};
    try {
        app = Java.use('android.app.ActivityThread').currentApplication();
        const pkg = String(app.getPackageName());
        if (!/\.haiagaru\.reporter(?:191|226|242)$/.test(pkg)) throw Error('Isolated reporter only');
        config = app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config', 0);
        data = app.getSharedPreferences('haiagaru.traffic-usage', 0);
        configHad = config.contains('recordAppTraffic');
        configValue = config.getBoolean('recordAppTraffic', true);
        featuresHad = data.contains('features');
        featuresValue = data.getString('features', '{}');
        traffic = Java.use('app.morphe.extension.chmate.AppTrafficUsage');
        config.edit().putBoolean('recordAppTraffic', true).commit();
        fixture = 'fixture_traffic_batch_' + Date.now();
        const record = traffic.recordFeatureBytes.overload('android.content.Context', 'java.lang.String', 'long');
        const started = Date.now();
        for (let i = 0; i < 1000; i++) record.call(traffic, app, fixture, 1);
        result.recordCallMillis = Date.now() - started;
        const pendingField = traffic.class.getDeclaredField('FEATURE_PENDING');
        pendingField.setAccessible(true);
        const pending = Java.cast(pendingField.get(null), Java.use('java.util.Map'));
        const rows = pending.values().iterator();
        let count = 0;
        while (rows.hasNext()) {
            const pendingRow = Java.cast(rows.next(), Java.use('java.util.Map'));
            const value = pendingRow.get(fixture);
            if (value !== null) count = Number(String(value.toString()));
        }
        if (count !== 1000) throw Error('pending count expected 1000, got ' + count);
        result.recordedBytes = count;
        if (data.getString('features', '{}').indexOf(fixture) >= 0) throw Error('feature data was written before batching delay');
        setTimeout(() => Java.perform(() => {
            try {
                const saved = data.getString('features', '{}');
                if (saved.indexOf('"' + fixture + '":1000') < 0) throw Error('batched total was not persisted');
                const pendingField = traffic.class.getDeclaredField('FEATURE_PENDING');
                pendingField.setAccessible(true);
                result.pendingCleared = Java.cast(pendingField.get(null), Java.use('java.util.Map')).isEmpty();
                if (!result.pendingCleared) throw Error('pending batch was not cleared after persistence');
                result.aggregatePersisted = true;
                result.batchedInTwoSeconds = true;
                const throttle = traffic.class.getDeclaredField('RESUME_SAMPLE_MIN_INTERVAL_MS');
                throttle.setAccessible(true);
                result.resumeSampleMinimumMs = Number(throttle.getLong(null));
                if (result.resumeSampleMinimumMs < 60000) throw Error('resume sample throttle below 60 seconds');
                resolve(result);
            } catch (error) { resolve({error: String(error), fixtureOnly: true}); }
            finally {
                try { traffic.flushFeatureBytes.overload('android.content.Context').call(traffic, app); } catch (_) {}
                try {
                    const editor = data.edit();
                    if (featuresHad) editor.putString('features', featuresValue); else editor.remove('features');
                    editor.commit();
                } catch (_) {}
                try {
                    const editor = config.edit();
                    if (configHad) editor.putBoolean('recordAppTraffic', configValue); else editor.remove('recordAppTraffic');
                    editor.commit();
                } catch (_) {}
            }
        }), 2600);
    } catch (error) {
        const message = String(error);
        setTimeout(() => Java.perform(() => {
            try {
                const editor = data.edit();
                if (featuresHad) editor.putString('features', featuresValue); else editor.remove('features');
                editor.commit();
            } catch (_) {}
            try {
                const editor = config.edit();
                if (configHad) editor.putBoolean('recordAppTraffic', configValue); else editor.remove('recordAppTraffic');
                editor.commit();
            } catch (_) {}
            resolve({error: message, fixtureOnly: true});
        }), 2600);
    }
}));
