.class public final Lkotlin/enums/EnumEntriesKt;
.super Ljava/lang/Object;
.source "EnumEntries.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\u001aB\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u0001\"\u0010\u0008\u0000\u0010\u0002\u0018\u0001*\u0008\u0012\u0004\u0012\u0002H\u00020\u0003H\u0087\u0088\u0004b\u0010\u0008\u0004\u0012\u000c\u0008\u0005\u0012\u0008\u0008\u000cJ\u0004\u0008\t0\u0006b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u001aF\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u0002H\n0\u0001\"\u000e\u0008\u0000\u0010\n*\u0008\u0012\u0004\u0012\u0002H\n0\u00032\u0012\u0010\u000b\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\n0\r0\u000cH\u0081\u0080\u0004b\u0002\u0008\u000eb\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\u000f\u001aI\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u0002H\n0\u0001\"\u000e\u0008\u0000\u0010\n*\u0008\u0012\u0004\u0012\u0002H\n0\u00032\u000c\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u0002H\n0\rH\u0081\u0080\u0004b\u0002\u0008\u000eb\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\u000fb\u0002\u0008\u0012\u00a2\u0006\u0002\u0010\u0011\u00a8\u0006\u0013"
    }
    d2 = {
        "enumEntries",
        "Lkotlin/enums/EnumEntries;",
        "T",
        "",
        "Lkotlin/WasExperimental;",
        "markerClass",
        "Lkotlin/ExperimentalStdlibApi;",
        "Lkotlin/SinceKotlin;",
        "version",
        "2.0",
        "E",
        "entriesProvider",
        "Lkotlin/Function0;",
        "",
        "Lkotlin/PublishedApi;",
        "1.8",
        "entries",
        "([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;",
        "Lkotlin/internal/UsedFromCompilerGeneratedCode;",
        "kotlin-stdlib"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final synthetic enumEntries()Lkotlin/enums/EnumEntries;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Enum<",
            "TT;>;>()",
            "Lkotlin/enums/EnumEntries<",
            "TT;>;"
        }
    .end annotation

    .line 38
    new-instance v0, Lkotlin/NotImplementedError;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v1}, Lkotlin/NotImplementedError;-><init>(Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    throw v0
.end method

.method public static final enumEntries(Lkotlin/jvm/functions/Function0;)Lkotlin/enums/EnumEntries;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Enum<",
            "TE;>;>(",
            "Lkotlin/jvm/functions/Function0<",
            "[TE;>;)",
            "Lkotlin/enums/EnumEntries<",
            "TE;>;"
        }
    .end annotation

    const-string v0, "entriesProvider"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    new-instance v0, Lkotlin/enums/EnumEntriesList;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/Enum;

    invoke-direct {v0, p0}, Lkotlin/enums/EnumEntriesList;-><init>([Ljava/lang/Enum;)V

    check-cast v0, Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static final enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Enum<",
            "TE;>;>([TE;)",
            "Lkotlin/enums/EnumEntries<",
            "TE;>;"
        }
    .end annotation

    const-string v0, "entries"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 51
    new-instance v0, Lkotlin/enums/EnumEntriesList;

    invoke-direct {v0, p0}, Lkotlin/enums/EnumEntriesList;-><init>([Ljava/lang/Enum;)V

    check-cast v0, Lkotlin/enums/EnumEntries;

    return-object v0
.end method
