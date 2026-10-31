package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.n5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3279n5 {

    /* renamed from: io.branch.search.internal.n5$a */
    public static final class a {
        public static void a(@NotNull InterfaceC3279n5 interfaceC3279n5, @NotNull InterfaceC3365s7 database) {
            Intrinsics.g(database, "database");
            database.execSQL("CREATE TABLE IF NOT EXISTS `" + interfaceC3279n5.getName() + "` (" + interfaceC3279n5.a() + ')');
        }
    }

    @NotNull
    String a();

    void a(@NotNull InterfaceC3365s7 interfaceC3365s7);

    @NotNull
    String getName();
}
