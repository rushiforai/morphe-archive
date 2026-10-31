package io.sentry.internal.modules;

import io.sentry.ILogger;
import io.sentry.g3;
import java.net.URL;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes4.dex */
public final class c extends d {

    /* renamed from: d, reason: collision with root package name */
    public final Pattern f67335d;

    /* renamed from: e, reason: collision with root package name */
    public final Pattern f67336e;

    /* renamed from: f, reason: collision with root package name */
    public final ClassLoader f67337f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(ILogger iLogger) {
        super(iLogger);
        ClassLoader classLoader = c.class.getClassLoader();
        this.f67335d = Pattern.compile(".*/(.+)!/META-INF/MANIFEST.MF");
        this.f67336e = Pattern.compile("(.*?)-(\\d+\\.\\d+.*).jar");
        this.f67337f = classLoader == null ? ClassLoader.getSystemClassLoader() : classLoader;
    }

    @Override // io.sentry.internal.modules.d
    public final Map b() {
        HashMap map = new HashMap();
        ArrayList arrayList = new ArrayList();
        try {
            Enumeration<URL> resources = this.f67337f.getResources("META-INF/MANIFEST.MF");
            while (resources.hasMoreElements()) {
                Matcher matcher = this.f67335d.matcher(resources.nextElement().toString());
                b bVar = null;
                String strGroup = (matcher.matches() && matcher.groupCount() == 1) ? matcher.group(1) : null;
                if (strGroup != null) {
                    Matcher matcher2 = this.f67336e.matcher(strGroup);
                    if (matcher2.matches() && matcher2.groupCount() == 2) {
                        bVar = new b(matcher2.group(1), matcher2.group(2));
                    }
                }
                if (bVar != null) {
                    arrayList.add(bVar);
                }
            }
        } catch (Throwable th2) {
            this.f67339a.e(g3.ERROR, "Unable to detect modules via manifest files.", th2);
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            b bVar2 = (b) it.next();
            map.put(bVar2.f67333a, bVar2.f67334b);
        }
        return map;
    }
}
