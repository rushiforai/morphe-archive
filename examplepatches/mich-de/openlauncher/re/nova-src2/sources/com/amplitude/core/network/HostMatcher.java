package com.amplitude.core.network;

import b70.c;
import b70.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import io.sentry.w3;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.Regex;
import kotlin.text.RegexOption;
import org.jetbrains.annotations.NotNull;
import r70.j;
import r70.k;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\"\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0002\b\u0002\u0018\u00002\u00020\u0001B\u0013\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0002\u0010\u0005J\u000e\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0004R!\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00070\u00038BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b\n\u0010\u000b\u001a\u0004\b\b\u0010\tR!\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00040\r8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b\u0010\u0010\u000b\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0014"}, d2 = {"Lcom/amplitude/core/network/HostMatcher;", b.f42142b, "hosts", b.f42142b, b.f42142b, "(Ljava/util/List;)V", "hostRegexes", "Lkotlin/text/Regex;", "getHostRegexes", "()Ljava/util/List;", "hostRegexes$delegate", "Lkotlin/Lazy;", "hostSet", b.f42142b, "getHostSet", "()Ljava/util/Set;", "hostSet$delegate", "matches", b.f42142b, "host", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
final class HostMatcher {

    /* renamed from: hostRegexes$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy hostRegexes;

    /* renamed from: hostSet$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy hostSet;

    public HostMatcher(@NotNull final List<String> hosts) {
        Intrinsics.g(hosts, "hosts");
        this.hostRegexes = LazyKt.a(new Function0<List<? extends Regex>>() { // from class: com.amplitude.core.network.HostMatcher$hostRegexes$2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final List<Regex> invoke() {
                List<String> list = hosts;
                ArrayList arrayList = new ArrayList();
                for (Object obj : list) {
                    if (k.K0((String) obj, "*", false)) {
                        arrayList.add(obj);
                    }
                }
                ArrayList arrayList2 = new ArrayList(c.u0(arrayList, 10));
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    String str = (String) it.next();
                    String strM = c1.m('$', "^", Intrinsics.b(str, "*") ? w3.DEFAULT_PROPAGATION_TARGETS : j.F0(j.F0(str, ".", "\\.", false), "*", "[^.]+", false));
                    RegexOption[] regexOptionArr = RegexOption.f72028c;
                    arrayList2.add(new Regex(strM, 0));
                }
                return arrayList2;
            }
        });
        this.hostSet = LazyKt.a(new Function0<Set<? extends String>>() { // from class: com.amplitude.core.network.HostMatcher$hostSet$2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final Set<String> invoke() {
                List<String> list = hosts;
                ArrayList arrayList = new ArrayList();
                for (Object obj : list) {
                    if (!k.K0((String) obj, "*", false)) {
                        arrayList.add(obj);
                    }
                }
                ArrayList arrayList2 = new ArrayList(c.u0(arrayList, 10));
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    String lowerCase = ((String) it.next()).toLowerCase(Locale.ROOT);
                    Intrinsics.f(lowerCase, "toLowerCase(...)");
                    arrayList2.add(lowerCase);
                }
                return g.N1(arrayList2);
            }
        });
    }

    private final List<Regex> getHostRegexes() {
        return (List) this.hostRegexes.getValue();
    }

    private final Set<String> getHostSet() {
        return (Set) this.hostSet.getValue();
    }

    public final boolean matches(@NotNull String host) {
        Intrinsics.g(host, "host");
        Set<String> hostSet = getHostSet();
        String lowerCase = host.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        if (hostSet.contains(lowerCase)) {
            return true;
        }
        List<Regex> hostRegexes = getHostRegexes();
        if ((hostRegexes instanceof Collection) && hostRegexes.isEmpty()) {
            return false;
        }
        Iterator<T> it = hostRegexes.iterator();
        while (it.hasNext()) {
            if (((Regex) it.next()).f(host)) {
                return true;
            }
        }
        return false;
    }
}
