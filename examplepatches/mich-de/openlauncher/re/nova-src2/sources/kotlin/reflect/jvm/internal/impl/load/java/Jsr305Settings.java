package kotlin.reflect.jvm.internal.impl.load.java;

import b.c9;
import b70.h;
import java.util.Map;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.collections.builders.ListBuilder;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import ul.b;

/* loaded from: classes5.dex */
public final class Jsr305Settings {

    @NotNull
    private final Lazy description$delegate;

    @NotNull
    private final ReportLevel globalLevel;
    private final boolean isDisabled;

    @Nullable
    private final ReportLevel migrationLevel;

    @NotNull
    private final Map<FqName, ReportLevel> userDefinedLevelForSpecificAnnotation;

    /* JADX WARN: Multi-variable type inference failed */
    public Jsr305Settings(@NotNull ReportLevel globalLevel, @Nullable ReportLevel reportLevel, @NotNull Map<FqName, ? extends ReportLevel> userDefinedLevelForSpecificAnnotation) {
        Intrinsics.g(globalLevel, "globalLevel");
        Intrinsics.g(userDefinedLevelForSpecificAnnotation, "userDefinedLevelForSpecificAnnotation");
        this.globalLevel = globalLevel;
        this.migrationLevel = reportLevel;
        this.userDefinedLevelForSpecificAnnotation = userDefinedLevelForSpecificAnnotation;
        this.description$delegate = LazyKt.a(new Function0<String[]>() { // from class: kotlin.reflect.jvm.internal.impl.load.java.Jsr305Settings$description$2
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final String[] invoke() {
                Jsr305Settings jsr305Settings = this.this$0;
                ListBuilder listBuilderW = b.w();
                listBuilderW.add(jsr305Settings.getGlobalLevel().getDescription());
                ReportLevel migrationLevel = jsr305Settings.getMigrationLevel();
                if (migrationLevel != null) {
                    listBuilderW.add("under-migration:" + migrationLevel.getDescription());
                }
                for (Map.Entry<FqName, ReportLevel> entry : jsr305Settings.getUserDefinedLevelForSpecificAnnotation().entrySet()) {
                    listBuilderW.add("@" + entry.getKey() + AbstractJsonLexerKt.COLON + entry.getValue().getDescription());
                }
                return (String[]) b.m(listBuilderW).toArray(new String[0]);
            }
        });
        ReportLevel reportLevel2 = ReportLevel.IGNORE;
        this.isDisabled = globalLevel == reportLevel2 && reportLevel == reportLevel2 && userDefinedLevelForSpecificAnnotation.isEmpty();
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Jsr305Settings)) {
            return false;
        }
        Jsr305Settings jsr305Settings = (Jsr305Settings) obj;
        return this.globalLevel == jsr305Settings.globalLevel && this.migrationLevel == jsr305Settings.migrationLevel && Intrinsics.b(this.userDefinedLevelForSpecificAnnotation, jsr305Settings.userDefinedLevelForSpecificAnnotation);
    }

    @NotNull
    public final ReportLevel getGlobalLevel() {
        return this.globalLevel;
    }

    @Nullable
    public final ReportLevel getMigrationLevel() {
        return this.migrationLevel;
    }

    @NotNull
    public final Map<FqName, ReportLevel> getUserDefinedLevelForSpecificAnnotation() {
        return this.userDefinedLevelForSpecificAnnotation;
    }

    public int hashCode() {
        int iHashCode = this.globalLevel.hashCode() * 31;
        ReportLevel reportLevel = this.migrationLevel;
        return this.userDefinedLevelForSpecificAnnotation.hashCode() + ((iHashCode + (reportLevel == null ? 0 : reportLevel.hashCode())) * 31);
    }

    public final boolean isDisabled() {
        return this.isDisabled;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("Jsr305Settings(globalLevel=");
        sb2.append(this.globalLevel);
        sb2.append(", migrationLevel=");
        sb2.append(this.migrationLevel);
        sb2.append(", userDefinedLevelForSpecificAnnotation=");
        return c9.l(sb2, this.userDefinedLevelForSpecificAnnotation, ')');
    }

    public /* synthetic */ Jsr305Settings(ReportLevel reportLevel, ReportLevel reportLevel2, Map map, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(reportLevel, (i5 & 2) != 0 ? null : reportLevel2, (i5 & 4) != 0 ? h.f17594a : map);
    }
}
