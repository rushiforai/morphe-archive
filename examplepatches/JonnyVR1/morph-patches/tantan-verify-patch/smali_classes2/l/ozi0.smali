.class public final Ll/ozi0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ozi0$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001:\u0001\u0006B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0006\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u001f\u0010\u000b\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\'\u0010\u000f\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u00042\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J/\u0010\u0014\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u00042\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\'\u0010\u0016\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u00042\u0006\u0010\u0012\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017R\u0018\u0010\u001a\u001a\u0006\u0012\u0002\u0008\u00030\u00188\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0006\u0010\u0019\u00a8\u0006\u001b"
    }
    d2 = {
        "Ll/ozi0;",
        "",
        "<init>",
        "()V",
        "",
        "orientation",
        "a",
        "(I)I",
        "Ljava/io/InputStream;",
        "stream",
        "length",
        "d",
        "(Ljava/io/InputStream;I)I",
        "Ll/ozi0$a;",
        "tiffHeader",
        "e",
        "(Ljava/io/InputStream;ILl/ozi0$a;)I",
        "",
        "isLittleEndian",
        "tagToFind",
        "c",
        "(Ljava/io/InputStream;IZI)I",
        "b",
        "(Ljava/io/InputStream;IZ)I",
        "Ljava/lang/Class;",
        "Ljava/lang/Class;",
        "TAG",
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
.field public static final INSTANCE:Ll/ozi0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ozi0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ozi0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ozi0;->INSTANCE:Ll/ozi0;

    .line 7
    .line 8
    const-class v0, Ll/ozi0;

    .line 9
    .line 10
    sput-object v0, Ll/ozi0;->a:Ljava/lang/Class;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final a(I)I
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-eq p0, v1, :cond_3

    .line 6
    .line 7
    const/4 v1, 0x3

    .line 8
    if-eq p0, v1, :cond_2

    .line 9
    .line 10
    const/4 v1, 0x6

    .line 11
    if-eq p0, v1, :cond_1

    .line 12
    .line 13
    const/16 v1, 0x8

    .line 14
    .line 15
    if-eq p0, v1, :cond_0

    .line 16
    .line 17
    return v0

    .line 18
    :cond_0
    const/16 p0, 0x10e

    .line 19
    .line 20
    return p0

    .line 21
    :cond_1
    const/16 p0, 0x5a

    .line 22
    .line 23
    return p0

    .line 24
    :cond_2
    const/16 p0, 0xb4

    .line 25
    .line 26
    return p0

    .line 27
    :cond_3
    return v0
.end method

.method public static final d(Ljava/io/InputStream;I)I
    .locals 5
    .param p0    # Ljava/io/InputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ozi0$a;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ozi0$a;-><init>()V

    .line 7
    .line 8
    .line 9
    sget-object v1, Ll/ozi0;->INSTANCE:Ll/ozi0;

    .line 10
    .line 11
    invoke-virtual {v1, p0, p1, v0}, Ll/ozi0;->e(Ljava/io/InputStream;ILl/ozi0$a;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {v0}, Ll/ozi0$a;->b()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    add-int/lit8 v2, v2, -0x8

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    if-le v2, p1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    int-to-long v3, v2

    .line 27
    invoke-virtual {p0, v3, v4}, Ljava/io/InputStream;->skip(J)J

    .line 28
    .line 29
    .line 30
    sub-int/2addr p1, v2

    .line 31
    invoke-virtual {v0}, Ll/ozi0$a;->c()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    const/16 v3, 0x112

    .line 36
    .line 37
    invoke-virtual {v1, p0, p1, v2, v3}, Ll/ozi0;->c(Ljava/io/InputStream;IZI)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-virtual {v0}, Ll/ozi0$a;->c()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-virtual {v1, p0, p1, v0}, Ll/ozi0;->b(Ljava/io/InputStream;IZ)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0

    .line 50
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 51
    return p0
.end method


# virtual methods
.method public final b(Ljava/io/InputStream;IZ)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 p0, 0xa

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-ge p2, p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x2

    .line 8
    invoke-static {p1, p0, p3}, Ll/u7g0;->a(Ljava/io/InputStream;IZ)I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    const/4 v1, 0x3

    .line 13
    if-eq p2, v1, :cond_1

    .line 14
    .line 15
    return v0

    .line 16
    :cond_1
    const/4 p2, 0x4

    .line 17
    invoke-static {p1, p2, p3}, Ll/u7g0;->a(Ljava/io/InputStream;IZ)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    const/4 v1, 0x1

    .line 22
    if-eq p2, v1, :cond_2

    .line 23
    .line 24
    return v0

    .line 25
    :cond_2
    invoke-static {p1, p0, p3}, Ll/u7g0;->a(Ljava/io/InputStream;IZ)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public final c(Ljava/io/InputStream;IZI)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 p0, 0xe

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-ge p2, p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x2

    .line 8
    invoke-static {p1, p0, p3}, Ll/u7g0;->a(Ljava/io/InputStream;IZ)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    add-int/lit8 p2, p2, -0x2

    .line 13
    .line 14
    :goto_0
    add-int/lit8 v2, v1, -0x1

    .line 15
    .line 16
    if-lez v1, :cond_2

    .line 17
    .line 18
    const/16 v1, 0xc

    .line 19
    .line 20
    if-lt p2, v1, :cond_2

    .line 21
    .line 22
    invoke-static {p1, p0, p3}, Ll/u7g0;->a(Ljava/io/InputStream;IZ)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    add-int/lit8 v3, p2, -0x2

    .line 27
    .line 28
    if-ne v1, p4, :cond_1

    .line 29
    .line 30
    return v3

    .line 31
    :cond_1
    const-wide/16 v3, 0xa

    .line 32
    .line 33
    invoke-virtual {p1, v3, v4}, Ljava/io/InputStream;->skip(J)J

    .line 34
    .line 35
    .line 36
    add-int/lit8 p2, p2, -0xc

    .line 37
    .line 38
    move v1, v2

    .line 39
    goto :goto_0

    .line 40
    :cond_2
    return v0
.end method

.method public final e(Ljava/io/InputStream;ILl/ozi0$a;)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    const/16 v0, 0x8

    .line 3
    .line 4
    if-gt p2, v0, :cond_0

    .line 5
    .line 6
    return p0

    .line 7
    :cond_0
    const/4 v1, 0x4

    .line 8
    invoke-static {p1, v1, p0}, Ll/u7g0;->a(Ljava/io/InputStream;IZ)I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    invoke-virtual {p3, v2}, Ll/ozi0$a;->d(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p3}, Ll/ozi0$a;->a()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const v3, 0x49492a00    # 823968.0f

    .line 20
    .line 21
    .line 22
    if-eq v2, v3, :cond_1

    .line 23
    .line 24
    invoke-virtual {p3}, Ll/ozi0$a;->a()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const v4, 0x4d4d002a    # 2.1495875E8f

    .line 29
    .line 30
    .line 31
    if-eq v2, v4, :cond_1

    .line 32
    .line 33
    sget-object p1, Ll/ozi0;->a:Ljava/lang/Class;

    .line 34
    .line 35
    const-string p2, "Invalid TIFF header"

    .line 36
    .line 37
    invoke-static {p1, p2}, Ll/huf;->d(Ljava/lang/Class;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return p0

    .line 41
    :cond_1
    invoke-virtual {p3}, Ll/ozi0$a;->a()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-ne v2, v3, :cond_2

    .line 46
    .line 47
    const/4 v2, 0x1

    .line 48
    goto :goto_0

    .line 49
    :cond_2
    move v2, p0

    .line 50
    :goto_0
    invoke-virtual {p3, v2}, Ll/ozi0$a;->f(Z)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p3}, Ll/ozi0$a;->c()Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-static {p1, v1, v2}, Ll/u7g0;->a(Ljava/io/InputStream;IZ)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    invoke-virtual {p3, p1}, Ll/ozi0$a;->e(I)V

    .line 62
    .line 63
    .line 64
    add-int/lit8 p2, p2, -0x8

    .line 65
    .line 66
    invoke-virtual {p3}, Ll/ozi0$a;->b()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-lt p1, v0, :cond_4

    .line 71
    .line 72
    invoke-virtual {p3}, Ll/ozi0$a;->b()I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    sub-int/2addr p1, v0

    .line 77
    if-le p1, p2, :cond_3

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    return p2

    .line 81
    :cond_4
    :goto_1
    sget-object p1, Ll/ozi0;->a:Ljava/lang/Class;

    .line 82
    .line 83
    const-string p2, "Invalid offset"

    .line 84
    .line 85
    invoke-static {p1, p2}, Ll/huf;->d(Ljava/lang/Class;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return p0
.end method
