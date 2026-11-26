// Physical isolated reporter draft-save check. Uses a synthetic Edge thread URL and never submits.
const fixture = (() => {
  const url = 'https://bbs.eddibb.cc/test/read.cgi/liveedge/1999999926/';
  const text = 'Haiagaru Edge draft lifecycle fixture 20261126';
  let fragment = null;
  let store = null;
  let names = null;
  let directTest = false;
  const writes = [];
  const binds = [];

  function field(owner, name) {
    let f = null;
    for (let c = owner.getClass(); c != null; c = c.getSuperclass()) {
      try { f = c.getDeclaredField(name); break; } catch (_) { }
    }
    if (f === null) throw new Error('No field ' + name + ' in ' + owner.getClass().getName());
    f.setAccessible(true);
    return f;
  }
  function findVisible(className, remaining, done) {
    let found = null;
    Java.choose(className, {
      onMatch: item => {
        try {
          const activity = item.getActivity();
          if (found === null && activity !== null && !activity.isFinishing() && activity.hasWindowFocus())
            found = Java.retain(item);
        } catch (_) { }
      },
      onComplete: () => { }
    });
    if (found !== null) { done(found); return; }
    if (remaining <= 0) { done(null); return; }
    setTimeout(() => Java.perform(() => findVisible(className, remaining - 1, done)), 250);
  }

  return {
    prepare: () => new Promise(resolve => Java.perform(() => {
      const app = Java.use('android.app.ActivityThread').currentApplication();
      const pkg = String(app.getPackageName());
      const old = pkg.endsWith('.haiagaru.reporter191');
      const middle = pkg.endsWith('.haiagaru.reporter226');
      const modern = pkg.endsWith('.haiagaru.reporter242');
      if (!old && !middle && !modern) { resolve({ error: 'isolated reporter191/226/242 required', pkg }); return; }
      const fragmentClass = old ? 'o.p9ExternalSyntheticLambda6' : 'jp.syoboi.a2chMate.feature.resedit.ResEditFragment';
      names = {
        binding: old ? 'd' : middle ? 'h' : 'i',
        body: old ? 'f' : middle ? 'a' : 'b',
        rowClass: old ? 'o.n7' : middle ? 'o.setBorderWidth' : 'jp.syoboi.a2chMate.postdata.PostData',
        url: old ? 'l' : 'n', bodyData: old ? 'b' : middle ? 'h' : 'g',
        postedAt: middle ? 'g' : 'j',
        lookup: old ? 'd' : middle ? 'a' : 'c', remove: old ? 'c' : middle ? 'c' : 'e'
      };
      const empty = Java.use('app.morphe.extension.chmate.EmptyPostDrafts');
      const handle = empty.handle.overload('java.lang.Object', 'java.lang.Object');
      const autosave = Java.use('app.morphe.extension.chmate.EdgeDraftAutosave');
      const bind = autosave.bind.overload('java.lang.Object', 'android.widget.EditText', 'java.lang.String');
      bind.implementation = function (owner, body, target) {
        binds.push({ url: String(target), bodyClass: String(body.getClass().getName()) });
        return bind.call(autosave, owner, body, target);
      };
      handle.implementation = function (owner, data) {
        if (directTest) return handle.call(empty, owner, data);
        if (owner !== null) store = Java.retain(owner);
        const sample = {};
        try {
          sample.url = String(field(data, names.url).get(data));
          sample.bodyBeforeRepair = String(field(data, names.bodyData).get(data)).length;
          sample.postedAt = Number(field(data, names.postedAt).getLong(data));
          if (middle && sample.url.indexOf('bbs.eddibb.') >= 0) {
            field(data, names.bodyData).set(data, Java.use('java.lang.String').$new(''));
            sample.bodyBeforeRepair = 0;
            sample.simulatedStaleSnapshot = true;
          }
        } catch (error) { sample.error = String(error); }
        const result = handle.call(empty, owner, data);
        try { sample.bodyAfterRepair = String(field(data, names.bodyData).get(data)).length; } catch (_) { }
        sample.skippedNativeWrite = !!result;
        if (owner !== null) sample.ownerClass = String(owner.getClass().getName());
        if (data !== null) sample.dataClass = String(data.getClass().getName());
        writes.push(sample);
        return result;
      };

      const Intent = Java.use('android.content.Intent');
      const Uri = Java.use('android.net.Uri');
      const intent = Intent.$new('android.intent.action.SENDTO', Uri.parse(url));
      intent.setClassName(pkg, 'jp.syoboi.a2chMate.activity.ResEditActivity$Dialog');
      intent.addFlags(0x10000000);
      app.startActivity(intent);
      setTimeout(() => Java.perform(() => findVisible(fragmentClass, 30, item => {
        if (item === null) { resolve({ error: 'visible native composer not found' }); return; }
        Java.scheduleOnMainThread(() => {
          try {
            const binding = field(item, names.binding).get(item);
            const body = Java.cast(field(binding, names.body).get(binding), Java.use('android.widget.EditText'));
            const Buffer = Java.use('android.widget.TextView$BufferType');
            body.setText.overload('java.lang.CharSequence', 'android.widget.TextView$BufferType')
              .call(body, Java.use('java.lang.String').$new(text), Buffer.EDITABLE.value);
            fragment = Java.retain(item);
            let directRestoreCheck = null;
            if (old) {
              const row = Java.use('o.n7').$new();
              const urlField = field(row, names.url), bodyField = field(row, names.bodyData), postedField = field(row, names.postedAt);
              urlField.set(row, Java.use('java.lang.String').$new(url));
              bodyField.set(row, Java.use('java.lang.String').$new(''));
              postedField.setLong(row, 0);
              directTest = true;
              const restored = empty.handle.overload('java.lang.Object', 'java.lang.Object')
                .call(empty, Java.use('java.lang.Object').$new(), row);
              directTest = false;
              const bodyAfterRestore = String(bodyField.get(row));
              directRestoreCheck = { staleBodyLength: 0, restoredBodyMatches: bodyAfterRestore === text,
                restoredBodyLength: bodyAfterRestore.length, nativeWriteSkipped: !!restored };
            }
            resolve({ package: pkg, visibleEditor: true,
              editorBound: binds.some(item => item.url.indexOf('1999999926') >= 0),
              editorBindingCount: binds.length,
              directRestoreCheck,
              fixtureUrl: url });
          } catch (error) { resolve({ error: String(error) }); }
        });
      })), 1200);
    })),
    inspectAndClean: () => new Promise(resolve => Java.perform(() => {
      if (store === null) { resolve({ nativeLifecycleWriteObserved: false, guardWrites: writes.slice(), editorBindingCount: binds.length, fixtureRemoved: true }); return; }
      try {
        const stringClass = Java.use('java.lang.String').class;
        const lookup = store.getClass().getMethod(names.lookup, Java.array('java.lang.Class', [stringClass]));
        const urlArg = Java.array('java.lang.Object', [Java.use('java.lang.String').$new(url)]);
        const row = lookup.invoke(store, urlArg);
        const result = { nativeLifecycleWriteObserved: writes.length > 0, savedRowFound: row !== null,
          guardWrites: writes.slice(), editorBindingCount: binds.length };
        if (row !== null && String(row.getClass().getName()) === names.rowClass) {
          const saved = String(field(row, names.bodyData).get(row));
          result.savedBodyMatches = saved === text;
          result.savedBodyLength = saved.length;
        }
        if (row !== null) {
          const remove = store.getClass().getMethod(names.remove, Java.array('java.lang.Class', [row.getClass()]));
          remove.invoke(store, Java.array('java.lang.Object', [row]));
        }
        result.fixtureRemoved = lookup.invoke(store, urlArg) === null;
        resolve(result);
      } catch (error) {
        resolve({ error: String(error), guardWrites: writes.slice(), editorBindingCount: binds.length });
      }
    }))
  };
})();

rpc.exports.prepare = () => fixture.prepare();
rpc.exports.inspectandclean = () => fixture.inspectAndClean();
