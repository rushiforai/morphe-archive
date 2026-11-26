Java.perform(() => {
    const application = Java.use('android.app.ActivityThread').currentApplication();
    const packageName = String(application.getPackageName());
    if (!/\.haiagaru\.reporter(?:191|226|242)$/.test(packageName))
        throw Error('Use an isolated reporter package');
    const preferences = application.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config', 0);
    const unread = Java.use('app.morphe.extension.chmate.HiddenNgUnread');
    const count = unread.newArrivalCount.overload('int', 'int');
    count.implementation = function(previousTotal, currentTotal) {
        const started = Date.now();
        const adjusted = count.call(this, previousTotal, currentTotal);
        send({event: 'new-arrival-count', previousTotal, currentTotal,
            raw: Math.max(0, currentTotal - previousTotal), adjusted,
            excludeHidden: preferences.getBoolean('excludeHiddenNgNewArrivals', false),
            elapsedMs: Date.now() - started});
        return adjusted;
    };
    const refreshed = Java.use('app.morphe.extension.chmate.OpenTabsRefresh').refreshWatchedFragment.overload('java.lang.Object');
    refreshed.implementation = function(reader) {
        const result = refreshed.call(this, reader);
        send({event: 'background-reader-refresh', dispatched: result});
        return result;
    };
    send({event: 'attached', packageName, changesSettings: false, sendsPosts: false});
});
