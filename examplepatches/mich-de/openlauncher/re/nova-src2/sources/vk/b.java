package vk;

/* loaded from: classes.dex */
public abstract class b implements m {
    public abstract boolean a(char c11);

    @Override // vk.m
    public final boolean apply(Object obj) {
        return a(((Character) obj).charValue());
    }
}
