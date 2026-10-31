package androidx.room;

import kotlin.Deprecated;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public abstract class r {

    @JvmField
    public final int version;

    public r(int i5) {
        this.version = i5;
    }

    public abstract void createAllTables(d7.a aVar);

    public abstract void dropAllTables(d7.a aVar);

    public abstract void onCreate(d7.a aVar);

    public abstract void onOpen(d7.a aVar);

    public abstract void onPostMigrate(d7.a aVar);

    public abstract void onPreMigrate(d7.a aVar);

    public abstract s onValidateSchema(d7.a aVar);

    @Deprecated
    public void validateMigration(@NotNull d7.a db2) {
        Intrinsics.g(db2, "db");
        throw new UnsupportedOperationException("validateMigration is deprecated");
    }
}
