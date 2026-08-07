.class public final Ll/opd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/him$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/opd$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u0000 \u000e2\u00020\u0001:\u0001\tB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nR\u001a\u0010\u0007\u001a\u00020\u00068\u0016X\u0096\u0004\u00a2\u0006\u000c\n\u0004\u0008\t\u0010\u000b\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000f"
    }
    d2 = {
        "Ll/opd;",
        "Ll/him$b;",
        "<init>",
        "()V",
        "",
        "headerBytes",
        "",
        "headerSize",
        "Ll/him;",
        "a",
        "([BI)Ll/him;",
        "I",
        "b",
        "()I",
        "Companion",
        "imagepipeline-base_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ll/opd$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final b:[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final c:I

.field public static final d:[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final e:I

.field public static final f:[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final g:[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final h:[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final i:I

.field public static final j:[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final k:I

.field public static final l:[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final m:[[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final n:[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final o:[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final p:I


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Ll/opd$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/opd$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/opd;->Companion:Ll/opd$a;

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    new-array v0, v0, [B

    .line 11
    .line 12
    fill-array-data v0, :array_0

    .line 13
    .line 14
    .line 15
    sput-object v0, Ll/opd;->b:[B

    .line 16
    .line 17
    array-length v0, v0

    .line 18
    sput v0, Ll/opd;->c:I

    .line 19
    .line 20
    const/16 v0, 0x8

    .line 21
    .line 22
    new-array v0, v0, [B

    .line 23
    .line 24
    fill-array-data v0, :array_1

    .line 25
    .line 26
    .line 27
    sput-object v0, Ll/opd;->d:[B

    .line 28
    .line 29
    array-length v0, v0

    .line 30
    sput v0, Ll/opd;->e:I

    .line 31
    .line 32
    const-string v0, "GIF87a"

    .line 33
    .line 34
    invoke-static {v0}, Ll/kim;->a(Ljava/lang/String;)[B

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Ll/opd;->f:[B

    .line 39
    .line 40
    const-string v0, "GIF89a"

    .line 41
    .line 42
    invoke-static {v0}, Ll/kim;->a(Ljava/lang/String;)[B

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Ll/opd;->g:[B

    .line 47
    .line 48
    const-string v0, "BM"

    .line 49
    .line 50
    invoke-static {v0}, Ll/kim;->a(Ljava/lang/String;)[B

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sput-object v0, Ll/opd;->h:[B

    .line 55
    .line 56
    array-length v0, v0

    .line 57
    sput v0, Ll/opd;->i:I

    .line 58
    .line 59
    const/4 v0, 0x4

    .line 60
    new-array v1, v0, [B

    .line 61
    .line 62
    fill-array-data v1, :array_2

    .line 63
    .line 64
    .line 65
    sput-object v1, Ll/opd;->j:[B

    .line 66
    .line 67
    array-length v1, v1

    .line 68
    sput v1, Ll/opd;->k:I

    .line 69
    .line 70
    const-string v1, "ftyp"

    .line 71
    .line 72
    invoke-static {v1}, Ll/kim;->a(Ljava/lang/String;)[B

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    sput-object v1, Ll/opd;->l:[B

    .line 77
    .line 78
    const-string v1, "heic"

    .line 79
    .line 80
    invoke-static {v1}, Ll/kim;->a(Ljava/lang/String;)[B

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    const-string v1, "heix"

    .line 85
    .line 86
    invoke-static {v1}, Ll/kim;->a(Ljava/lang/String;)[B

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    const-string v1, "hevc"

    .line 91
    .line 92
    invoke-static {v1}, Ll/kim;->a(Ljava/lang/String;)[B

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    const-string v1, "hevx"

    .line 97
    .line 98
    invoke-static {v1}, Ll/kim;->a(Ljava/lang/String;)[B

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    const-string v1, "mif1"

    .line 103
    .line 104
    invoke-static {v1}, Ll/kim;->a(Ljava/lang/String;)[B

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    const-string v1, "msf1"

    .line 109
    .line 110
    invoke-static {v1}, Ll/kim;->a(Ljava/lang/String;)[B

    .line 111
    .line 112
    .line 113
    move-result-object v7

    .line 114
    filled-new-array/range {v2 .. v7}, [[B

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    sput-object v1, Ll/opd;->m:[[B

    .line 119
    .line 120
    new-array v1, v0, [B

    .line 121
    .line 122
    fill-array-data v1, :array_3

    .line 123
    .line 124
    .line 125
    sput-object v1, Ll/opd;->n:[B

    .line 126
    .line 127
    new-array v0, v0, [B

    .line 128
    .line 129
    fill-array-data v0, :array_4

    .line 130
    .line 131
    .line 132
    sput-object v0, Ll/opd;->o:[B

    .line 133
    .line 134
    array-length v0, v1

    .line 135
    sput v0, Ll/opd;->p:I

    .line 136
    .line 137
    return-void

    .line 138
    nop

    .line 139
    :array_0
    .array-data 1
        -0x1t
        -0x28t
        -0x1t
    .end array-data

    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    :array_1
    .array-data 1
        -0x77t
        0x50t
        0x4et
        0x47t
        0xdt
        0xat
        0x1at
        0xat
    .end array-data

    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    :array_2
    .array-data 1
        0x0t
        0x0t
        0x1t
        0x0t
    .end array-data

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    :array_3
    .array-data 1
        0x49t
        0x49t
        0x2at
        0x0t
    .end array-data

    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    :array_4
    .array-data 1
        0x4dt
        0x4dt
        0x0t
        0x2at
    .end array-data
.end method

.method public constructor <init>()V
    .locals 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x15

    .line 5
    .line 6
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const/16 v0, 0x14

    .line 11
    .line 12
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    sget v0, Ll/opd;->c:I

    .line 17
    .line 18
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    sget v0, Ll/opd;->e:I

    .line 23
    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    const/4 v0, 0x6

    .line 29
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    sget v0, Ll/opd;->i:I

    .line 34
    .line 35
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    sget v0, Ll/opd;->k:I

    .line 40
    .line 41
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    const/16 v0, 0xc

    .line 46
    .line 47
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v8

    .line 51
    filled-new-array/range {v1 .. v8}, [Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, [Ljava/lang/Comparable;

    .line 56
    .line 57
    invoke-static {v0}, Lkotlin/collections/ArraysKt;->maxOrNull([Ljava/lang/Comparable;)Ljava/lang/Comparable;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    check-cast v0, Ljava/lang/Number;

    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iput v0, p0, Ll/opd;->a:I

    .line 70
    .line 71
    return-void

    .line 72
    :cond_0
    const-string p0, "Required value was null."

    .line 73
    .line 74
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    const/4 p0, 0x0

    .line 78
    throw p0
.end method

.method public static final synthetic c()[B
    .locals 1

    .line 1
    sget-object v0, Ll/opd;->h:[B

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic d()[B
    .locals 1

    .line 1
    sget-object v0, Ll/opd;->n:[B

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic e()I
    .locals 1

    .line 1
    sget v0, Ll/opd;->p:I

    .line 2
    .line 3
    return v0
.end method

.method public static final synthetic f()[B
    .locals 1

    .line 1
    sget-object v0, Ll/opd;->o:[B

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic g()[B
    .locals 1

    .line 1
    sget-object v0, Ll/opd;->f:[B

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic h()[B
    .locals 1

    .line 1
    sget-object v0, Ll/opd;->g:[B

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic i()[B
    .locals 1

    .line 1
    sget-object v0, Ll/opd;->l:[B

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic j()[[B
    .locals 1

    .line 1
    sget-object v0, Ll/opd;->m:[[B

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic k()[B
    .locals 1

    .line 1
    sget-object v0, Ll/opd;->j:[B

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic l()[B
    .locals 1

    .line 1
    sget-object v0, Ll/opd;->b:[B

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic m()[B
    .locals 1

    .line 1
    sget-object v0, Ll/opd;->d:[B

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a([BI)Ll/him;
    .locals 1
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-static {p1, p0, p2}, Ll/vup0;->h([BII)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Ll/opd;->Companion:Ll/opd$a;

    .line 12
    .line 13
    invoke-static {p0, p1, p2}, Ll/opd$a;->a(Ll/opd$a;[BI)Ll/him;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    sget-object p0, Ll/opd;->Companion:Ll/opd$a;

    .line 19
    .line 20
    invoke-static {p0, p1, p2}, Ll/opd$a;->g(Ll/opd$a;[BI)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    sget-object p0, Ll/ppd;->a:Ll/him;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    invoke-static {p0, p1, p2}, Ll/opd$a;->h(Ll/opd$a;[BI)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    sget-object p0, Ll/ppd;->b:Ll/him;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_2
    invoke-static {p0, p1, p2}, Ll/opd$a;->d(Ll/opd$a;[BI)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    sget-object p0, Ll/ppd;->c:Ll/him;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_3
    invoke-static {p0, p1, p2}, Ll/opd$a;->b(Ll/opd$a;[BI)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_4

    .line 52
    .line 53
    sget-object p0, Ll/ppd;->d:Ll/him;

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_4
    invoke-static {p0, p1, p2}, Ll/opd$a;->f(Ll/opd$a;[BI)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    sget-object p0, Ll/ppd;->e:Ll/him;

    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_5
    invoke-static {p0, p1, p2}, Ll/opd$a;->e(Ll/opd$a;[BI)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_6

    .line 70
    .line 71
    sget-object p0, Ll/ppd;->k:Ll/him;

    .line 72
    .line 73
    return-object p0

    .line 74
    :cond_6
    invoke-static {p0, p1, p2}, Ll/opd$a;->c(Ll/opd$a;[BI)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_7

    .line 79
    .line 80
    sget-object p0, Ll/ppd;->l:Ll/him;

    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_7
    sget-object p0, Ll/him;->c:Ll/him;

    .line 84
    .line 85
    return-object p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/opd;->a:I

    .line 2
    .line 3
    return p0
.end method
