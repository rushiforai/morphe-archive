.class public final Lnicoid/network238/okio/internal/ZipFilesKt$buildIndex$$inlined$sortedBy$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okio/internal/ZipFilesKt;->buildIndex(Ljava/util/List;)Ljava/util/Map;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Comparator;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .line 102
    check-cast p1, Lnicoid/network238/okio/internal/ZipEntry;

    .line 103
    invoke-virtual {p1}, Lnicoid/network238/okio/internal/ZipEntry;->getCanonicalPath()Lnicoid/network238/okio/Path;

    move-result-object p1

    .line 102
    check-cast p2, Lnicoid/network238/okio/internal/ZipEntry;

    .line 103
    invoke-virtual {p2}, Lnicoid/network238/okio/internal/ZipEntry;->getCanonicalPath()Lnicoid/network238/okio/Path;

    move-result-object p2

    .line 102
    invoke-static {p1, p2}, Lnicoid/network238/kotlin/comparisons/ComparisonsKt;->compareValues(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result p1

    return p1
.end method
