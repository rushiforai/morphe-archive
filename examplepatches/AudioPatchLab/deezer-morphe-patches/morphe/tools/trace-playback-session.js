Java.perform(() => {
    const Log = Java.use('android.util.Log');
    const Ex = Java.use('java.lang.Exception');
    const stack = () => Log.getStackTraceString(Ex.$new());
    const wrap = (cls) => {
        const C = Java.use(cls);
        C.startActivity.overloads.forEach(o => {
            o.implementation = function (...args) {
                const intent = args[0];
                const s = intent ? intent.toString() : '';
                if (s.indexOf('AuthUI') >= 0) {
                    console.log('=== LOGOUT startActivity ' + s);
                    console.log(stack());
                }
                return o.call(this, ...args);
            };
        });
    };
    wrap('android.content.ContextWrapper');
    wrap('android.app.Activity');
    const scheduler = Java.use('IIIIlllIllllIlI').lllIlIIIlllIIII.overload('java.lang.Runnable');
    scheduler.implementation = function (continuation) {
        console.log('Audio ad scheduler callback=' + (continuation !== null));
        return scheduler.call(this, continuation);
    };
    const gateway = Java.use('IlllIlIlIllllII').intercept;
    const chainClass = Java.use('IlllIIIllllllII');
    const methods = new Map();
    gateway.implementation = function (chain) {
        const thread = Process.getCurrentThreadId();
        const previous = methods.get(thread);
        let method;
        try {
            const request = Java.cast(chain, chainClass).IIlIIIIIlllIIIII.value;
            method = /[?&]method=([\w.]+)/.exec(String(request))?.[1];
        } catch (_) {
            console.log('Request name unavailable.');
        }
        try {
            if (method) methods.set(thread, method);
            const result = gateway.call(this, chain);
            if (['log.listen', 'log.batch_listen', 'mobile_getAudioBreak', 'mobile_getAudioBreakMultiple'].includes(method)) {
                console.log('HTTP ' + method + ' ' + /code=(\d+)/.exec(String(result))?.[1]);
            }
            return result;
        } finally {
            if (previous) methods.set(thread, previous);
            else methods.delete(thread);
        }
    };
    const error = Java.use('com.deezer.core.coredata.exceptions.ServerError').$init
        .overload('IlIlllIIIIlIll', 'java.lang.String', 'java.lang.String');
    error.implementation = function (type, value, payload) {
        const method = methods.get(Process.getCurrentThreadId());
        console.log('Gateway error ' + (method || '(outside interceptor)') + ' ' + String(type));
        return error.call(this, type, value, payload);
    };
    const handler = Java.use('IIlIlIlIIlIlIII').invoke.overload('java.lang.Object');
    handler.implementation = function (payload) {
        const branch = this.IlllIIlIIIlll.value;
        if (branch === 2 || branch === 3) console.log('Auth event branch=' + branch);
        return handler.call(this, payload);
    };
    const L = Java.use('IlIIlllllIll');
    L.IlIIllIlIIIIIlI.implementation = function (c, z) {
        console.log('=== Application.logout switching=' + z + '\n' + stack());
        return this.IlIIllIlIIIIIlI(c, z);
    };
    console.log('Logout trace ready');
});
