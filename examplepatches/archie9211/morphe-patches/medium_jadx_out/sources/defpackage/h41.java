package defpackage;

import java.io.Serializable;
import java.lang.annotation.Annotation;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class h41 implements rg6, Serializable {
    public static final Object NO_RECEIVER = g41.a;
    private final boolean isTopLevel;
    private final String name;
    private final Class owner;
    protected final Object receiver;
    private transient rg6 reflected;
    private final String signature;

    public h41(Object obj, Class cls, String str, String str2, boolean z) {
        this.receiver = obj;
        this.owner = cls;
        this.name = str;
        this.signature = str2;
        this.isTopLevel = z;
    }

    @Override // defpackage.rg6
    public Object call(Object... objArr) {
        return getReflected().call(objArr);
    }

    @Override // defpackage.rg6
    public Object callBy(Map map) {
        return getReflected().callBy(map);
    }

    public rg6 compute() {
        rg6 rg6Var = this.reflected;
        if (rg6Var != null) {
            return rg6Var;
        }
        rg6 rg6VarComputeReflected = computeReflected();
        this.reflected = rg6VarComputeReflected;
        return rg6VarComputeReflected;
    }

    public abstract rg6 computeReflected();

    @Override // defpackage.qg6
    public List<Annotation> getAnnotations() {
        return getReflected().getAnnotations();
    }

    public Object getBoundReceiver() {
        return this.receiver;
    }

    @Override // defpackage.rg6
    public String getName() {
        return this.name;
    }

    public lh6 getOwner() {
        Class cls = this.owner;
        if (cls == null) {
            return null;
        }
        return this.isTopLevel ? n1b.a.c(cls) : n1b.a.b(cls);
    }

    @Override // defpackage.rg6
    public List<ri6> getParameters() {
        return getReflected().getParameters();
    }

    public abstract rg6 getReflected();

    @Override // defpackage.rg6
    public qj6 getReturnType() {
        return getReflected().getReturnType();
    }

    public String getSignature() {
        return this.signature;
    }

    @Override // defpackage.rg6
    public List<xj6> getTypeParameters() {
        return getReflected().getTypeParameters();
    }

    @Override // defpackage.rg6
    public ck6 getVisibility() {
        return getReflected().getVisibility();
    }

    @Override // defpackage.rg6
    public boolean isAbstract() {
        return getReflected().isAbstract();
    }

    @Override // defpackage.rg6
    public boolean isFinal() {
        return getReflected().isFinal();
    }

    @Override // defpackage.rg6
    public boolean isOpen() {
        return getReflected().isOpen();
    }
}
