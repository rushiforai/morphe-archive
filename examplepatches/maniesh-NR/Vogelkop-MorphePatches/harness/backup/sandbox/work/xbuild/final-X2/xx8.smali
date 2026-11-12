.class public final Lxx8;
.super Ljava/util/LinkedHashMap;
.source "SourceFile"


# instance fields
.field public final synthetic a:S


# direct methods
.method public constructor <init>(I)V
    .registers 4

    iput-short p1, p0, Lxx8;->a:S

    const/4 p1, 0x0

    const/high16 v0, 0x3f400000    # 0.75f

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    return-void
.end method


# virtual methods
.method public final removeEldestEntry(Ljava/util/Map$Entry;)Z
    .registers 3

    invoke-virtual {p0}, Ljava/util/AbstractMap;->size()I

    move-result p1

    iget-short p0, p0, Lxx8;->a:S

    const/4 v0, 0x1

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    if-le p1, p0, :cond_e

    return v0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method
