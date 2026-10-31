package kw;

import java.util.Comparator;
import kotlin.NoWhenBranchMatchedException;

/* loaded from: classes4.dex */
public final class c0 implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public static final c0 f72334a = new c0();

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        int i5;
        w0 w0Var = (w0) obj;
        w0 w0Var2 = (w0) obj2;
        int i11 = 2;
        if (w0Var instanceof u0) {
            i5 = 0;
        } else if (w0Var instanceof v0) {
            i5 = 1;
        } else {
            if (w0Var != null) {
                throw new NoWhenBranchMatchedException();
            }
            i5 = 2;
        }
        if (w0Var2 instanceof u0) {
            i11 = 0;
        } else if (w0Var2 instanceof v0) {
            i11 = 1;
        } else if (w0Var2 != null) {
            throw new NoWhenBranchMatchedException();
        }
        return i5 - i11;
    }
}
