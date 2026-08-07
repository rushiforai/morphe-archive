.class final Lcom/google/android/libraries/places/internal/zzkc;
.super Ljava/util/LinkedHashMap;
.source "SourceFile"


# direct methods
.method public constructor <init>(IFZ)V
    .locals 0

    .line 1
    const/high16 p1, 0x3f400000    # 0.75f

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    const/16 p3, 0x10

    .line 5
    .line 6
    invoke-direct {p0, p3, p1, p2}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final removeEldestEntry(Ljava/util/Map$Entry;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/util/AbstractMap;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 p1, 0xa

    .line 6
    .line 7
    if-le p0, p1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method
