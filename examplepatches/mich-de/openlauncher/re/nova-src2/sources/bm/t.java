package bm;

import ads_mobile_sdk.cw0;
import ads_mobile_sdk.dj0;
import ads_mobile_sdk.i03;
import ads_mobile_sdk.jn;
import ads_mobile_sdk.jr0;
import ads_mobile_sdk.qw2;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ShortcutInfo;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.service.notification.StatusBarNotification;
import android.util.ArrayMap;
import android.util.DisplayMetrics;
import b.u4;
import b.x2;
import bm.t;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.android.launcher3.util.ComponentKey;
import com.google.firebase.components.DependencyException;
import e00.u3;
import eb0.q0;
import fa.v;
import fz.d0;
import ga.j;
import java.lang.annotation.Annotation;
import java.lang.reflect.Proxy;
import java.lang.reflect.Type;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.util.ArrayDeque;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import java.util.function.Consumer;
import java.util.stream.Collectors;
import kotlin.jvm.internal.Intrinsics;
import o9.g3;
import o9.t1;
import x80.w;
import ya.g0;
import ya.l0;

/* loaded from: classes.dex */
public final class t implements x2, c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18109a;

    /* renamed from: b, reason: collision with root package name */
    public Object f18110b;

    /* renamed from: c, reason: collision with root package name */
    public Object f18111c;

    /* renamed from: d, reason: collision with root package name */
    public Object f18112d;

    /* renamed from: e, reason: collision with root package name */
    public Object f18113e;

    /* renamed from: f, reason: collision with root package name */
    public Object f18114f;

    /* renamed from: g, reason: collision with root package name */
    public Object f18115g;

    public /* synthetic */ t() {
        this.f18109a = 5;
    }

    public static List n(ga.e eVar, List list) {
        String className = (l0.f(eVar) && l0.g(eVar)) ? ShortcutKey.d(eVar.d(), eVar.o).f21251a.getClassName() : null;
        if (className == null) {
            return list;
        }
        return (List) list.stream().filter(new v(2, className, (l0.f(eVar) && l0.g(eVar)) ? ((ga.j) eVar).B : g3.f79849d)).collect(Collectors.toList());
    }

    @Override // b.x2
    public cw0 a() {
        switch (this.f18109a) {
            case 1:
                return cw0.AD_SIZE;
            default:
                return cw0.RTB_SIGNAL;
        }
    }

    @Override // bm.c
    public nm.b c(r rVar) {
        if (((Set) this.f18112d).contains(rVar)) {
            return ((c) this.f18115g).c(rVar);
        }
        throw new DependencyException("Attempting to request an undeclared dependency Deferred<" + rVar + ">.");
    }

    /*  JADX ERROR: NullPointerException in pass: ConstructorVisitor
        java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.RegisterArg.sameRegAndSVar(jadx.core.dex.instructions.args.InsnArg)" because "resultArg" is null
        	at jadx.core.dex.visitors.MoveInlineVisitor.processMove(MoveInlineVisitor.java:52)
        	at jadx.core.dex.visitors.MoveInlineVisitor.moveInline(MoveInlineVisitor.java:41)
        	at jadx.core.dex.visitors.ConstructorVisitor.visit(ConstructorVisitor.java:43)
        */
    @Override // b.x2
    public java.lang.Object d(
    /*  JADX ERROR: Method generation error
        jadx.core.utils.exceptions.JadxRuntimeException: Code variable not set in r33v0 ??
        	at jadx.core.dex.instructions.args.SSAVar.getCodeVar(SSAVar.java:236)
        	at jadx.core.codegen.MethodGen.addMethodArguments(MethodGen.java:224)
        	at jadx.core.codegen.MethodGen.addDefinition(MethodGen.java:169)
        	at jadx.core.codegen.ClassGen.addMethodCode(ClassGen.java:405)
        	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:335)
        	at jadx.core.codegen.ClassGen.lambda$addInnerClsAndMethods$3(ClassGen.java:301)
        	at java.base/java.util.stream.ForEachOps$ForEachOp$OfRef.accept(ForEachOps.java:186)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.stream.SortedOps$RefSortingSink.end(SortedOps.java:395)
        	at java.base/java.util.stream.Sink$ChainedReference.end(Sink.java:261)
        	at java.base/java.util.stream.ReferencePipeline$7$1FlatMap.end(ReferencePipeline.java:284)
        	at java.base/java.util.stream.AbstractPipeline.copyInto(AbstractPipeline.java:571)
        	at java.base/java.util.stream.AbstractPipeline.wrapAndCopyInto(AbstractPipeline.java:560)
        	at java.base/java.util.stream.ForEachOps$ForEachOp.evaluateSequential(ForEachOps.java:153)
        	at java.base/java.util.stream.ForEachOps$ForEachOp$OfRef.evaluateSequential(ForEachOps.java:176)
        	at java.base/java.util.stream.AbstractPipeline.evaluate(AbstractPipeline.java:265)
        	at java.base/java.util.stream.ReferencePipeline.forEach(ReferencePipeline.java:632)
        	at jadx.core.codegen.ClassGen.addInnerClsAndMethods(ClassGen.java:297)
        	at jadx.core.codegen.ClassGen.addClassBody(ClassGen.java:286)
        	at jadx.core.codegen.ClassGen.addClassBody(ClassGen.java:270)
        	at jadx.core.codegen.ClassGen.addClassCode(ClassGen.java:161)
        	at jadx.core.codegen.ClassGen.makeClass(ClassGen.java:103)
        	at jadx.core.codegen.CodeGen.wrapCodeGen(CodeGen.java:45)
        	at jadx.core.codegen.CodeGen.generateJavaCode(CodeGen.java:34)
        	at jadx.core.codegen.CodeGen.generate(CodeGen.java:22)
        	at jadx.core.ProcessClass.process(ProcessClass.java:79)
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:403)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:391)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:341)
        */
    /*  JADX ERROR: NullPointerException in pass: ConstructorVisitor
        java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.RegisterArg.sameRegAndSVar(jadx.core.dex.instructions.args.InsnArg)" because "resultArg" is null
        	at jadx.core.dex.visitors.MoveInlineVisitor.processMove(MoveInlineVisitor.java:52)
        	at jadx.core.dex.visitors.MoveInlineVisitor.moveInline(MoveInlineVisitor.java:41)
        */

    @Override // bm.c
    public nm.c e(r rVar) {
        if (((Set) this.f18114f).contains(rVar)) {
            return ((c) this.f18115g).e(rVar);
        }
        throw new DependencyException("Attempting to request an undeclared dependency Provider<Set<" + rVar + ">>.");
    }

    @Override // bm.c
    public nm.c f(Class cls) {
        return h(r.a(cls));
    }

    @Override // bm.c
    public Set g(r rVar) {
        if (((Set) this.f18113e).contains(rVar)) {
            return ((c) this.f18115g).g(rVar);
        }
        throw new DependencyException("Attempting to request an undeclared dependency Set<" + rVar + ">.");
    }

    @Override // bm.c
    public nm.c h(r rVar) {
        if (((Set) this.f18111c).contains(rVar)) {
            return ((c) this.f18115g).h(rVar);
        }
        throw new DependencyException("Attempting to request an undeclared dependency Provider<" + rVar + ">.");
    }

    @Override // bm.c
    public nm.b i(Class cls) {
        return c(r.a(cls));
    }

    public fl.k j() throws GeneralSecurityException {
        if (((Integer) this.f18110b) == null) {
            throw new GeneralSecurityException("AES key size is not set");
        }
        if (((Integer) this.f18111c) == null) {
            throw new GeneralSecurityException("HMAC key size is not set");
        }
        if (((Integer) this.f18112d) == null) {
            throw new GeneralSecurityException("iv size is not set");
        }
        Integer num = (Integer) this.f18113e;
        if (num == null) {
            throw new GeneralSecurityException("tag size is not set");
        }
        if (((fl.j) this.f18114f) == null) {
            throw new GeneralSecurityException("hash type is not set");
        }
        if (((fl.j) this.f18115g) == null) {
            throw new GeneralSecurityException("variant is not set");
        }
        int iIntValue = num.intValue();
        fl.j jVar = (fl.j) this.f18114f;
        if (jVar == fl.j.f55336c) {
            if (iIntValue > 20) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 20 bytes for SHA1", num));
            }
        } else if (jVar == fl.j.f55337d) {
            if (iIntValue > 28) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 28 bytes for SHA224", num));
            }
        } else if (jVar == fl.j.f55338e) {
            if (iIntValue > 32) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 32 bytes for SHA256", num));
            }
        } else if (jVar == fl.j.f55339f) {
            if (iIntValue > 48) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 48 bytes for SHA384", num));
            }
        } else {
            if (jVar != fl.j.f55340g) {
                throw new GeneralSecurityException("unknown hash type; must be SHA1, SHA224, SHA256, SHA384 or SHA512");
            }
            if (iIntValue > 64) {
                throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; can be at most 64 bytes for SHA512", num));
            }
        }
        return new fl.k(((Integer) this.f18110b).intValue(), ((Integer) this.f18111c).intValue(), ((Integer) this.f18112d).intValue(), ((Integer) this.f18113e).intValue(), (fl.j) this.f18115g, (fl.j) this.f18114f);
    }

    public eb0.f k(Type type, Annotation[] annotationArr) {
        Objects.requireNonNull(type, "returnType == null");
        Objects.requireNonNull(annotationArr, "annotations == null");
        List list = (List) this.f18114f;
        int iIndexOf = list.indexOf(null) + 1;
        int size = list.size();
        for (int i5 = iIndexOf; i5 < size; i5++) {
            eb0.f fVarA = ((eb0.e) list.get(i5)).a(type, annotationArr);
            if (fVarA != null) {
                return fVarA;
            }
        }
        StringBuilder sb2 = new StringBuilder("Could not locate call adapter for ");
        sb2.append(type);
        sb2.append(".\n  Tried:");
        int size2 = list.size();
        while (iIndexOf < size2) {
            sb2.append("\n   * ");
            sb2.append(((eb0.e) list.get(iIndexOf)).getClass().getName());
            iIndexOf++;
        }
        throw new IllegalArgumentException(sb2.toString());
    }

    public Object l(Class cls) {
        if (!cls.isInterface()) {
            throw new IllegalArgumentException("API declarations must be interfaces.");
        }
        ArrayDeque arrayDeque = new ArrayDeque(1);
        arrayDeque.add(cls);
        while (!arrayDeque.isEmpty()) {
            Class cls2 = (Class) arrayDeque.removeFirst();
            if (cls2.getTypeParameters().length != 0) {
                StringBuilder sb2 = new StringBuilder("Type parameters are unsupported on ");
                sb2.append(cls2.getName());
                if (cls2 != cls) {
                    sb2.append(" which is an interface of ");
                    sb2.append(cls.getName());
                }
                throw new IllegalArgumentException(sb2.toString());
            }
            Collections.addAll(arrayDeque, cls2.getInterfaces());
        }
        return Proxy.newProxyInstance(cls.getClassLoader(), new Class[]{cls}, new q0(this, cls));
    }

    public w9.a m(ga.e eVar) {
        w9.a aVar;
        if (!l0.h(eVar) || (aVar = (w9.a) ((HashMap) this.f18112d).get(g0.a(eVar))) == null || n(eVar, aVar.f94116a).isEmpty()) {
            return null;
        }
        return aVar;
    }

    public int o(ga.e eVar) {
        ComponentName componentNameI;
        Integer num;
        if (!l0.f(eVar) || eVar.f57290b != 0 || (componentNameI = eVar.i()) == null || (num = (Integer) ((HashMap) this.f18111c).get(new ComponentKey(componentNameI, eVar.o))) == null) {
            return 0;
        }
        return num.intValue();
    }

    public List p(g0 g0Var) {
        return (List) ((List) this.f18113e).stream().filter(new ka.g(g0Var, 0)).flatMap(new aa.t(21)).filter(new ka.g(g0Var, 1)).collect(Collectors.toList());
    }

    public void q(List list) {
        HashMap map = (HashMap) this.f18112d;
        if (list == null) {
            return;
        }
        HashMap map2 = new HashMap(map);
        map.clear();
        Iterator it = list.iterator();
        while (it.hasNext()) {
            StatusBarNotification statusBarNotification = (StatusBarNotification) it.next();
            g0 g0Var = new g0(statusBarNotification.getPackageName(), statusBarNotification.getUser());
            w9.a fVar = (w9.a) map.get(g0Var);
            if (fVar == null) {
                fVar = new mz.f(g0Var);
                map.put(g0Var, fVar);
            }
            fVar.a(mz.h.a(statusBarNotification));
        }
        for (g0 g0Var2 : map.keySet()) {
            w9.a aVar = (w9.a) map2.get(g0Var2);
            w9.a aVar2 = (w9.a) map.get(g0Var2);
            if (aVar == null || aVar.b() != aVar2.b()) {
                map2.put(g0Var2, aVar2);
            } else {
                map2.remove(g0Var2);
            }
        }
        if (!map2.isEmpty()) {
            u3 u3Var = new u3(map2, 10);
            ((Consumer) this.f18110b).accept(u3Var);
            ((ka.j) this.f18115g).p(u3Var);
        }
        ((ka.j) this.f18115g).C(map2);
    }

    public eb0.m r(Type type, Annotation[] annotationArr, Annotation[] annotationArr2) {
        Objects.requireNonNull(type, "type == null");
        Objects.requireNonNull(annotationArr2, "methodAnnotations == null");
        List list = (List) this.f18113e;
        int iIndexOf = list.indexOf(null) + 1;
        int size = list.size();
        for (int i5 = iIndexOf; i5 < size; i5++) {
            eb0.m mVarA = ((eb0.l) list.get(i5)).a(type, annotationArr, annotationArr2, this);
            if (mVarA != null) {
                return mVarA;
            }
        }
        StringBuilder sb2 = new StringBuilder("Could not locate RequestBody converter for ");
        sb2.append(type);
        sb2.append(".\n  Tried:");
        int size2 = list.size();
        while (iIndexOf < size2) {
            sb2.append("\n   * ");
            sb2.append(((eb0.l) list.get(iIndexOf)).getClass().getName());
            iIndexOf++;
        }
        throw new IllegalArgumentException(sb2.toString());
    }

    public eb0.m s(Type type, Annotation[] annotationArr) {
        Objects.requireNonNull(type, "type == null");
        Objects.requireNonNull(annotationArr, "annotations == null");
        List list = (List) this.f18113e;
        int iIndexOf = list.indexOf(null) + 1;
        int size = list.size();
        for (int i5 = iIndexOf; i5 < size; i5++) {
            eb0.m mVarB = ((eb0.l) list.get(i5)).b(type, annotationArr, this);
            if (mVarB != null) {
                return mVarB;
            }
        }
        StringBuilder sb2 = new StringBuilder("Could not locate ResponseBody converter for ");
        sb2.append(type);
        sb2.append(".\n  Tried:");
        int size2 = list.size();
        while (iIndexOf < size2) {
            sb2.append("\n   * ");
            sb2.append(((eb0.l) list.get(iIndexOf)).getClass().getName());
            iIndexOf++;
        }
        throw new IllegalArgumentException(sb2.toString());
    }

    public void t(int i5) throws InvalidAlgorithmParameterException {
        if (i5 != 16 && i5 != 24 && i5 != 32) {
            throw new InvalidAlgorithmParameterException(String.format("Invalid key size %d; only 16-byte, 24-byte and 32-byte AES keys are supported", Integer.valueOf(i5)));
        }
        this.f18110b = Integer.valueOf(i5);
    }

    public void u(int i5) throws InvalidAlgorithmParameterException {
        if (i5 < 16) {
            throw new InvalidAlgorithmParameterException(String.format("Invalid key size in bytes %d; HMAC key must be at least 16 bytes", Integer.valueOf(i5)));
        }
        this.f18111c = Integer.valueOf(i5);
    }

    public void v(int i5) throws GeneralSecurityException {
        if (i5 < 12 || i5 > 16) {
            throw new GeneralSecurityException(String.format("Invalid IV size in bytes %d; IV size must be between 12 and 16 bytes", Integer.valueOf(i5)));
        }
        this.f18112d = Integer.valueOf(i5);
    }

    public void w(int i5) throws GeneralSecurityException {
        if (i5 < 10) {
            throw new GeneralSecurityException(String.format("Invalid tag size in bytes %d; must be at least 10 bytes", Integer.valueOf(i5)));
        }
        this.f18113e = Integer.valueOf(i5);
    }

    public void x(Type type, Annotation[] annotationArr) {
        Objects.requireNonNull(type, "type == null");
        List list = (List) this.f18113e;
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((eb0.l) list.get(i5)).getClass();
        }
    }

    public t(jr0 flags, Optional optionalBannerRequest, Optional optionalSignalRequest, i03 rtbAdapterSignalCollector, qw2 requestType, ni.q adRequest) {
        this.f18109a = 2;
        Intrinsics.g(flags, "flags");
        Intrinsics.g(optionalBannerRequest, "optionalBannerRequest");
        Intrinsics.g(optionalSignalRequest, "optionalSignalRequest");
        Intrinsics.g(rtbAdapterSignalCollector, "rtbAdapterSignalCollector");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(adRequest, "adRequest");
        this.f18110b = optionalBannerRequest;
        this.f18111c = optionalSignalRequest;
        this.f18112d = rtbAdapterSignalCollector;
        this.f18113e = requestType;
        this.f18114f = adRequest;
        this.f18115g = (List) flags.a("gad:scar_rtb_signal:enabled_list", ul.b.P("8"), jn.a$20);
    }

    @Override // bm.c
    public Object a(Class cls) {
        if (((Set) this.f18110b).contains(r.a(cls))) {
            Object objA = ((c) this.f18115g).a(cls);
            if (!cls.equals(km.b.class)) {
                return objA;
            }
            return new s();
        }
        throw new DependencyException("Attempting to request an undeclared dependency " + cls + ".");
    }

    public int a(int i5) {
        float fA;
        float f11 = i5;
        DisplayMetrics displayMetrics = ((Context) this.f18113e).getResources().getDisplayMetrics();
        if (Build.VERSION.SDK_INT >= 34) {
            fA = z4.d.a(f11, displayMetrics);
        } else {
            float f12 = displayMetrics.density;
            fA = f12 == 0.0f ? 0.0f : f11 / f12;
        }
        return (int) Math.ceil(fA);
    }

    public t(Optional bannerRequest, Optional swipeableInterstitialRequest, qw2 requestType, Context context, jr0 flags, dj0 displayUtil) {
        this.f18109a = 1;
        Intrinsics.g(bannerRequest, "bannerRequest");
        Intrinsics.g(swipeableInterstitialRequest, "swipeableInterstitialRequest");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(context, "context");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(displayUtil, "displayUtil");
        this.f18110b = bannerRequest;
        this.f18111c = swipeableInterstitialRequest;
        this.f18112d = requestType;
        this.f18113e = context;
        this.f18114f = flags;
        this.f18115g = displayUtil;
    }

    public t(String str, String str2, Set set) {
        this.f18109a = 8;
        Set setUnmodifiableSet = set == null ? Collections.EMPTY_SET : Collections.unmodifiableSet(set);
        this.f18110b = setUnmodifiableSet;
        Map map = Collections.EMPTY_MAP;
        this.f18112d = str;
        this.f18113e = str2;
        this.f18114f = ci.a.f19948a;
        HashSet hashSet = new HashSet(setUnmodifiableSet);
        Iterator it = map.values().iterator();
        if (!it.hasNext()) {
            this.f18111c = Collections.unmodifiableSet(hashSet);
            return;
        }
        throw u4.e(it);
    }

    public t(b bVar, c cVar) {
        this.f18109a = 0;
        HashSet hashSet = new HashSet();
        HashSet hashSet2 = new HashSet();
        HashSet hashSet3 = new HashSet();
        HashSet hashSet4 = new HashSet();
        HashSet hashSet5 = new HashSet();
        Set<k> set = bVar.f18065c;
        Set set2 = bVar.f18069g;
        for (k kVar : set) {
            int i5 = kVar.f18091c;
            int i11 = kVar.f18090b;
            boolean z11 = i5 == 0;
            r rVar = kVar.f18089a;
            if (z11) {
                if (i11 == 2) {
                    hashSet4.add(rVar);
                } else {
                    hashSet.add(rVar);
                }
            } else if (i5 == 2) {
                hashSet3.add(rVar);
            } else if (i11 == 2) {
                hashSet5.add(rVar);
            } else {
                hashSet2.add(rVar);
            }
        }
        if (!set2.isEmpty()) {
            hashSet.add(r.a(km.b.class));
        }
        this.f18110b = Collections.unmodifiableSet(hashSet);
        this.f18111c = Collections.unmodifiableSet(hashSet2);
        this.f18112d = Collections.unmodifiableSet(hashSet3);
        this.f18113e = Collections.unmodifiableSet(hashSet4);
        this.f18114f = Collections.unmodifiableSet(hashSet5);
        this.f18115g = cVar;
    }

    public t(Context context, lz.f fVar) {
        this.f18109a = 7;
        this.f18110b = context;
        final int i5 = 0;
        this.f18111c = new Handler(ya.j.f97149d.f97215a.getLooper(), new Handler.Callback(this) { // from class: lz.d

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ t f75169b;

            {
                this.f75169b = this;
            }

            @Override // android.os.Handler.Callback
            public final boolean handleMessage(Message message) throws Throwable {
                j jVar;
                switch (i5) {
                    case 0:
                        if (message.what == 1) {
                            Object obj = message.obj;
                            List list = obj != null ? (List) obj : Collections.EMPTY_LIST;
                            ArrayMap arrayMap = new ArrayMap();
                            Iterator it = list.iterator();
                            while (true) {
                                boolean zHasNext = it.hasNext();
                                t tVar = this.f75169b;
                                if (!zHasNext) {
                                    Message.obtain((Handler) tVar.f18112d, 1, arrayMap).sendToTarget();
                                    break;
                                } else {
                                    ShortcutKey shortcutKey = (ShortcutKey) it.next();
                                    Context context2 = (Context) tVar.f18110b;
                                    qa.b bVarC = shortcutKey.a(context2).c(11);
                                    if (bVarC.isEmpty()) {
                                        jVar = null;
                                    } else {
                                        jVar = new j(context2, (ShortcutInfo) bVarC.get(0));
                                        ((d0) tVar.f18114f).n(jVar, (ShortcutInfo) bVarC.get(0));
                                    }
                                    if (jVar != null) {
                                        arrayMap.put(shortcutKey, jVar);
                                    }
                                }
                            }
                        }
                        break;
                    default:
                        t tVar2 = this.f75169b;
                        HashMap map = (HashMap) tVar2.f18115g;
                        if (message.what == 1) {
                            map.clear();
                            map.putAll((Map) message.obj);
                            ((f) tVar2.f18113e).run();
                            break;
                        }
                        break;
                }
                return true;
            }
        });
        final int i11 = 1;
        this.f18112d = new Handler(Looper.getMainLooper(), new Handler.Callback(this) { // from class: lz.d

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ t f75169b;

            {
                this.f75169b = this;
            }

            @Override // android.os.Handler.Callback
            public final boolean handleMessage(Message message) throws Throwable {
                j jVar;
                switch (i11) {
                    case 0:
                        if (message.what == 1) {
                            Object obj = message.obj;
                            List list = obj != null ? (List) obj : Collections.EMPTY_LIST;
                            ArrayMap arrayMap = new ArrayMap();
                            Iterator it = list.iterator();
                            while (true) {
                                boolean zHasNext = it.hasNext();
                                t tVar = this.f75169b;
                                if (!zHasNext) {
                                    Message.obtain((Handler) tVar.f18112d, 1, arrayMap).sendToTarget();
                                    break;
                                } else {
                                    ShortcutKey shortcutKey = (ShortcutKey) it.next();
                                    Context context2 = (Context) tVar.f18110b;
                                    qa.b bVarC = shortcutKey.a(context2).c(11);
                                    if (bVarC.isEmpty()) {
                                        jVar = null;
                                    } else {
                                        jVar = new j(context2, (ShortcutInfo) bVarC.get(0));
                                        ((d0) tVar.f18114f).n(jVar, (ShortcutInfo) bVarC.get(0));
                                    }
                                    if (jVar != null) {
                                        arrayMap.put(shortcutKey, jVar);
                                    }
                                }
                            }
                        }
                        break;
                    default:
                        t tVar2 = this.f75169b;
                        HashMap map = (HashMap) tVar2.f18115g;
                        if (message.what == 1) {
                            map.clear();
                            map.putAll((Map) message.obj);
                            ((f) tVar2.f18113e).run();
                            break;
                        }
                        break;
                }
                return true;
            }
        });
        this.f18113e = fVar;
        this.f18114f = ((t1) t1.f80131h.h(context)).f80135d;
        this.f18115g = new HashMap();
    }

    public t(Consumer consumer) {
        this.f18109a = 6;
        this.f18111c = new HashMap();
        this.f18112d = new HashMap();
        List list = Collections.EMPTY_LIST;
        this.f18113e = list;
        this.f18114f = list;
        this.f18115g = ka.j.f71282ap;
        this.f18110b = consumer;
    }

    public t(x80.h hVar, w wVar, List list, List list2, Executor executor) {
        this.f18109a = 4;
        this.f18110b = new ConcurrentHashMap();
        this.f18111c = hVar;
        this.f18112d = wVar;
        this.f18113e = list;
        this.f18114f = list2;
        this.f18115g = executor;
    }

    public t(a90.e taskRunner) {
        this.f18109a = 3;
        Intrinsics.g(taskRunner, "taskRunner");
        this.f18110b = taskRunner;
        this.f18115g = e90.g.f52317a;
    }

    @Override // bm.c
    public Object d(r rVar) {
        if (((Set) this.f18110b).contains(rVar)) {
            return ((c) this.f18115g).d(rVar);
        }
        throw new DependencyException("Attempting to request an undeclared dependency " + rVar + ".");
    }
}
