package io.branch.search.internal;

import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.y4, reason: case insensitive filesystem */
/* loaded from: classes.dex */
public abstract class AbstractC3464y4 implements InterfaceC3481z4 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f66305a;

    /* renamed from: io.branch.search.internal.y4$a */
    public static final class a extends AbstractC3464y4 {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final a f66306b = new a();

        public a() {
            super(0);
        }
    }

    public AbstractC3464y4() {
        this.f66305a = "icon";
    }

    @Override // io.branch.search.internal.InterfaceC3481z4
    @NotNull
    public final String getPath() {
        return this.f66305a;
    }

    public /* synthetic */ AbstractC3464y4(int i5) {
        this();
    }
}
