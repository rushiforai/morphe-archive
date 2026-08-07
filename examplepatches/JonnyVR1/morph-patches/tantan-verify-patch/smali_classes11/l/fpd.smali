.class public final Ll/fpd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/h5l;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final d:[I


# instance fields
.field public final b:I

.field public final c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x7

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/fpd;->d:[I

    .line 8
    .line 9
    return-void

    .line 10
    nop

    .line 11
    :array_0
    .array-data 4
        0x8
        0xd
        0xb
        0x2
        0x0
        0x1
        0x7
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 9
    invoke-direct {p0, v0, v1}, Ll/fpd;-><init>(IZ)V

    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/fpd;->b:I

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/fpd;->c:Z

    .line 7
    .line 8
    return-void
.end method

.method public static b(ILjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/fpd;->d:[I

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/common/primitives/Ints;->i([II)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-eq v0, v1, :cond_1

    .line 9
    .line 10
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public static e(Ll/h0j0;Lcom/google/android/exoplayer2/k;Ljava/util/List;)Ll/d6j;
    .locals 2
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/h0j0;",
            "Lcom/google/android/exoplayer2/k;",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;)",
            "Ll/d6j;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/d6j;

    .line 2
    .line 3
    invoke-static {p1}, Ll/fpd;->g(Lcom/google/android/exoplayer2/k;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x4

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    :goto_0
    if-eqz p2, :cond_1

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_1
    sget-object p2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 16
    .line 17
    :goto_1
    const/4 v1, 0x0

    .line 18
    invoke-direct {v0, p1, p0, v1, p2}, Ll/d6j;-><init>(ILl/h0j0;Ll/yej0;Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method public static f(IZLcom/google/android/exoplayer2/k;Ljava/util/List;Ll/h0j0;)Ll/ikj0;
    .locals 1
    .param p3    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ",
            "Lcom/google/android/exoplayer2/k;",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;",
            "Ll/h0j0;",
            ")",
            "Ll/ikj0;"
        }
    .end annotation

    .line 1
    or-int/lit8 v0, p0, 0x10

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    or-int/lit8 v0, p0, 0x30

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    new-instance p0, Lcom/google/android/exoplayer2/k$b;

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string p1, "application/cea-608"

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    sget-object p3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 31
    .line 32
    :goto_0
    iget-object p0, p2, Lcom/google/android/exoplayer2/k;->i:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_3

    .line 39
    .line 40
    const-string p1, "audio/mp4a-latm"

    .line 41
    .line 42
    invoke-static {p0, p1}, Ll/kb00;->b(Ljava/lang/String;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_2

    .line 47
    .line 48
    or-int/lit8 v0, v0, 0x2

    .line 49
    .line 50
    :cond_2
    const-string p1, "video/avc"

    .line 51
    .line 52
    invoke-static {p0, p1}, Ll/kb00;->b(Ljava/lang/String;Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_3

    .line 57
    .line 58
    or-int/lit8 v0, v0, 0x4

    .line 59
    .line 60
    :cond_3
    new-instance p0, Ll/ikj0;

    .line 61
    .line 62
    new-instance p1, Ll/mtd;

    .line 63
    .line 64
    invoke-direct {p1, v0, p3}, Ll/mtd;-><init>(ILjava/util/List;)V

    .line 65
    .line 66
    .line 67
    const/4 p2, 0x2

    .line 68
    invoke-direct {p0, p2, p4, p1}, Ll/ikj0;-><init>(ILl/h0j0;Ll/jkj0$c;)V

    .line 69
    .line 70
    .line 71
    return-object p0
.end method

.method public static g(Lcom/google/android/exoplayer2/k;)Z
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/k;->j:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    move v1, v0

    .line 8
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/metadata/Metadata;->e()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-ge v1, v2, :cond_2

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/metadata/Metadata;->d(I)Lcom/google/android/exoplayer2/metadata/Metadata$Entry;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    instance-of v3, v2, Lcom/google/android/exoplayer2/source/hls/HlsTrackMetadataEntry;

    .line 19
    .line 20
    if-eqz v3, :cond_1

    .line 21
    .line 22
    check-cast v2, Lcom/google/android/exoplayer2/source/hls/HlsTrackMetadataEntry;

    .line 23
    .line 24
    iget-object p0, v2, Lcom/google/android/exoplayer2/source/hls/HlsTrackMetadataEntry;->variantInfos:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    xor-int/lit8 p0, p0, 0x1

    .line 31
    .line 32
    return p0

    .line 33
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    return v0
.end method

.method public static h(Ll/zrf;Ll/asf;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-interface {p0, p1}, Ll/zrf;->f(Ll/asf;)Z

    .line 2
    .line 3
    .line 4
    move-result p0
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    invoke-interface {p1}, Ll/asf;->h()V

    .line 6
    .line 7
    .line 8
    return p0

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    invoke-interface {p1}, Ll/asf;->h()V

    .line 11
    .line 12
    .line 13
    throw p0

    .line 14
    :catch_0
    invoke-interface {p1}, Ll/asf;->h()V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0
.end method


# virtual methods
.method public bridge synthetic a(Landroid/net/Uri;Lcom/google/android/exoplayer2/k;Ljava/util/List;Ll/h0j0;Ljava/util/Map;Ll/asf;Ll/bf80;)Ll/k5l;
    .locals 0
    .param p3    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual/range {p0 .. p7}, Ll/fpd;->c(Landroid/net/Uri;Lcom/google/android/exoplayer2/k;Ljava/util/List;Ll/h0j0;Ljava/util/Map;Ll/asf;Ll/bf80;)Ll/gj3;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Landroid/net/Uri;Lcom/google/android/exoplayer2/k;Ljava/util/List;Ll/h0j0;Ljava/util/Map;Ll/asf;Ll/bf80;)Ll/gj3;
    .locals 6
    .param p3    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Lcom/google/android/exoplayer2/k;",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;",
            "Ll/h0j0;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;",
            "Ll/asf;",
            "Ll/bf80;",
            ")",
            "Ll/gj3;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p7, p2, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p7}, Ll/eki;->a(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p7

    .line 7
    invoke-static {p5}, Ll/eki;->b(Ljava/util/Map;)I

    .line 8
    .line 9
    .line 10
    move-result p5

    .line 11
    invoke-static {p1}, Ll/eki;->c(Landroid/net/Uri;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    sget-object v1, Ll/fpd;->d:[I

    .line 18
    .line 19
    array-length v2, v1

    .line 20
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-static {p7, v0}, Ll/fpd;->b(ILjava/util/List;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p5, v0}, Ll/fpd;->b(ILjava/util/List;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1, v0}, Ll/fpd;->b(ILjava/util/List;)V

    .line 30
    .line 31
    .line 32
    array-length v2, v1

    .line 33
    const/4 v3, 0x0

    .line 34
    move v4, v3

    .line 35
    :goto_0
    if-ge v4, v2, :cond_0

    .line 36
    .line 37
    aget v5, v1, v4

    .line 38
    .line 39
    invoke-static {v5, v0}, Ll/fpd;->b(ILjava/util/List;)V

    .line 40
    .line 41
    .line 42
    add-int/lit8 v4, v4, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-interface {p6}, Ll/asf;->h()V

    .line 46
    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-ge v3, v2, :cond_4

    .line 54
    .line 55
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Ljava/lang/Integer;

    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-virtual {p0, v2, p2, p3, p4}, Ll/fpd;->d(ILcom/google/android/exoplayer2/k;Ljava/util/List;Ll/h0j0;)Ll/zrf;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-static {v4}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    check-cast v4, Ll/zrf;

    .line 74
    .line 75
    invoke-static {v4, p6}, Ll/fpd;->h(Ll/zrf;Ll/asf;)Z

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    if-eqz v5, :cond_1

    .line 80
    .line 81
    new-instance p0, Ll/gj3;

    .line 82
    .line 83
    invoke-direct {p0, v4, p2, p4}, Ll/gj3;-><init>(Ll/zrf;Lcom/google/android/exoplayer2/k;Ll/h0j0;)V

    .line 84
    .line 85
    .line 86
    return-object p0

    .line 87
    :cond_1
    if-nez v1, :cond_3

    .line 88
    .line 89
    if-eq v2, p7, :cond_2

    .line 90
    .line 91
    if-eq v2, p5, :cond_2

    .line 92
    .line 93
    if-eq v2, p1, :cond_2

    .line 94
    .line 95
    const/16 v5, 0xb

    .line 96
    .line 97
    if-ne v2, v5, :cond_3

    .line 98
    .line 99
    :cond_2
    move-object v1, v4

    .line 100
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_4
    new-instance p0, Ll/gj3;

    .line 104
    .line 105
    invoke-static {v1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    check-cast p1, Ll/zrf;

    .line 110
    .line 111
    invoke-direct {p0, p1, p2, p4}, Ll/gj3;-><init>(Ll/zrf;Lcom/google/android/exoplayer2/k;Ll/h0j0;)V

    .line 112
    .line 113
    .line 114
    return-object p0
.end method

.method public final d(ILcom/google/android/exoplayer2/k;Ljava/util/List;Ll/h0j0;)Ll/zrf;
    .locals 1
    .param p3    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SwitchIntDef"
        }
    .end annotation

    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/android/exoplayer2/k;",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;",
            "Ll/h0j0;",
            ")",
            "Ll/zrf;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_5

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_4

    .line 8
    .line 9
    const/4 v0, 0x7

    .line 10
    if-eq p1, v0, :cond_3

    .line 11
    .line 12
    const/16 v0, 0x8

    .line 13
    .line 14
    if-eq p1, v0, :cond_2

    .line 15
    .line 16
    const/16 v0, 0xb

    .line 17
    .line 18
    if-eq p1, v0, :cond_1

    .line 19
    .line 20
    const/16 p0, 0xd

    .line 21
    .line 22
    if-eq p1, p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0

    .line 26
    :cond_0
    new-instance p0, Ll/fvp0;

    .line 27
    .line 28
    iget-object p1, p2, Lcom/google/android/exoplayer2/k;->c:Ljava/lang/String;

    .line 29
    .line 30
    invoke-direct {p0, p1, p4}, Ll/fvp0;-><init>(Ljava/lang/String;Ll/h0j0;)V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_1
    iget p1, p0, Ll/fpd;->b:I

    .line 35
    .line 36
    iget-boolean p0, p0, Ll/fpd;->c:Z

    .line 37
    .line 38
    invoke-static {p1, p0, p2, p3, p4}, Ll/fpd;->f(IZLcom/google/android/exoplayer2/k;Ljava/util/List;Ll/h0j0;)Ll/ikj0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_2
    invoke-static {p4, p2, p3}, Ll/fpd;->e(Ll/h0j0;Lcom/google/android/exoplayer2/k;Ljava/util/List;)Ll/d6j;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_3
    new-instance p0, Ll/z610;

    .line 49
    .line 50
    const/4 p1, 0x0

    .line 51
    const-wide/16 p2, 0x0

    .line 52
    .line 53
    invoke-direct {p0, p1, p2, p3}, Ll/z610;-><init>(IJ)V

    .line 54
    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_4
    new-instance p0, Ll/v90;

    .line 58
    .line 59
    invoke-direct {p0}, Ll/v90;-><init>()V

    .line 60
    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_5
    new-instance p0, Ll/b9;

    .line 64
    .line 65
    invoke-direct {p0}, Ll/b9;-><init>()V

    .line 66
    .line 67
    .line 68
    return-object p0

    .line 69
    :cond_6
    new-instance p0, Ll/x8;

    .line 70
    .line 71
    invoke-direct {p0}, Ll/x8;-><init>()V

    .line 72
    .line 73
    .line 74
    return-object p0
.end method
