Java.perform(() => {
    const app = Java.use('android.app.ActivityThread').currentApplication();
    if (!String(app.getPackageName()).endsWith('.reporter191')) throw new Error('Isolated 191 required');
    const gateway = Java.use('app.morphe.extension.chmate.SiteBoardGateway').get(app);
    const home = Java.use('app.morphe.extension.chmate.GlobalSearchHome');
    const click = home.legacyClick.overload('java.lang.Object', 'android.widget.ListView', 'int');
    const AndroidUri = Java.use('android.net.Uri');
    click.implementation = function (owner, list, pos) {
        const rows = [];
        for (let i = 0; i < list.getCount(); i++) {
            const row = list.getItemAtPosition(i);
            if (row === null || String(row.getClass().getName()) !== 'o.onAdDisplayed$IconCompatParcelizer') continue;
            const field = row.getClass().getDeclaredField('a');
            field.setAccessible(true);
            const decoded = String(AndroidUri.decode(String(field.get(row))));
            if (!/^127\.0\.0\.1:[0-9]+\/hb[a-f0-9]{32}$/.test(decoded)) continue;
            const url = String(gateway.originalUrl('http://' + decoded + '/'));
            const match = /^https:\/\/bakusai\.com\/thr_tl\/acode=([0-9]+)\/(ctgid=[0-9]+\/bid=[0-9]+\/)$/.exec(url);
            if (match) rows.push({ index: i, region: match[1], board: match[2] });
        }
        const groups = new Map();
        for (const row of rows) {
            let group = groups.get(row.board);
            if (!group) groups.set(row.board, group = []);
            group.push(row.region);
        }
        send({bakusaiRows: rows.length, distinctBoards: groups.size,
            regionalDuplicates: Array.from(groups, ([board, regions]) => ({board, regions})).filter(group => group.regions.length > 1)});
        return true;
    };
    send('Tap any HOME search result to inspect the list once.');
});
