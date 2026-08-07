.class public final Ll/vqi0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0014\n\u0002\u0008\u0006\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J-\u0010\u000b\u001a\u00020\t2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0015\u0010\r\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\r\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "Ll/vqi0;",
        "",
        "<init>",
        "()V",
        "",
        "width",
        "height",
        "Ll/mi80;",
        "rect",
        "",
        "array",
        "a",
        "(IILl/mi80;[F)[F",
        "b",
        "([F)[F",
        "base_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ll/vqi0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/vqi0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vqi0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/vqi0;->INSTANCE:Ll/vqi0;

    .line 7
    .line 8
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


# virtual methods
.method public final a(IILl/mi80;[F)[F
    .locals 1
    .param p3    # Ll/mi80;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # [F
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ll/mi80;->c()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    int-to-float p0, p0

    .line 12
    int-to-float p1, p1

    .line 13
    div-float/2addr p0, p1

    .line 14
    const/4 v0, 0x0

    .line 15
    aput p0, p4, v0

    .line 16
    .line 17
    invoke-virtual {p3}, Ll/mi80;->d()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    int-to-float p0, p0

    .line 22
    int-to-float p2, p2

    .line 23
    div-float/2addr p0, p2

    .line 24
    const/4 v0, 0x1

    .line 25
    aput p0, p4, v0

    .line 26
    .line 27
    invoke-virtual {p3}, Ll/mi80;->c()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    int-to-float p0, p0

    .line 32
    div-float/2addr p0, p1

    .line 33
    const/4 v0, 0x2

    .line 34
    aput p0, p4, v0

    .line 35
    .line 36
    invoke-virtual {p3}, Ll/mi80;->d()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    int-to-float p0, p0

    .line 41
    invoke-virtual {p3}, Ll/mi80;->a()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    int-to-float v0, v0

    .line 46
    add-float/2addr p0, v0

    .line 47
    div-float/2addr p0, p2

    .line 48
    const/4 v0, 0x3

    .line 49
    aput p0, p4, v0

    .line 50
    .line 51
    invoke-virtual {p3}, Ll/mi80;->c()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    int-to-float p0, p0

    .line 56
    invoke-virtual {p3}, Ll/mi80;->b()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    int-to-float v0, v0

    .line 61
    add-float/2addr p0, v0

    .line 62
    div-float/2addr p0, p1

    .line 63
    const/4 v0, 0x4

    .line 64
    aput p0, p4, v0

    .line 65
    .line 66
    invoke-virtual {p3}, Ll/mi80;->d()I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    int-to-float p0, p0

    .line 71
    div-float/2addr p0, p2

    .line 72
    const/4 v0, 0x5

    .line 73
    aput p0, p4, v0

    .line 74
    .line 75
    invoke-virtual {p3}, Ll/mi80;->c()I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    int-to-float p0, p0

    .line 80
    invoke-virtual {p3}, Ll/mi80;->b()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    int-to-float v0, v0

    .line 85
    add-float/2addr p0, v0

    .line 86
    div-float/2addr p0, p1

    .line 87
    const/4 p1, 0x6

    .line 88
    aput p0, p4, p1

    .line 89
    .line 90
    invoke-virtual {p3}, Ll/mi80;->d()I

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    int-to-float p0, p0

    .line 95
    invoke-virtual {p3}, Ll/mi80;->a()I

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    int-to-float p1, p1

    .line 100
    add-float/2addr p0, p1

    .line 101
    div-float/2addr p0, p2

    .line 102
    const/4 p1, 0x7

    .line 103
    aput p0, p4, p1

    .line 104
    .line 105
    return-object p4
.end method

.method public final b([F)[F
    .locals 5
    .param p1    # [F
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
    aget v0, p1, p0

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    aget v2, p1, v1

    .line 9
    .line 10
    const/4 v3, 0x2

    .line 11
    aget v4, p1, v3

    .line 12
    .line 13
    aput v4, p1, p0

    .line 14
    .line 15
    const/4 p0, 0x3

    .line 16
    aget v4, p1, p0

    .line 17
    .line 18
    aput v4, p1, v1

    .line 19
    .line 20
    const/4 v1, 0x6

    .line 21
    aget v4, p1, v1

    .line 22
    .line 23
    aput v4, p1, v3

    .line 24
    .line 25
    const/4 v3, 0x7

    .line 26
    aget v4, p1, v3

    .line 27
    .line 28
    aput v4, p1, p0

    .line 29
    .line 30
    const/4 p0, 0x4

    .line 31
    aget v4, p1, p0

    .line 32
    .line 33
    aput v4, p1, v1

    .line 34
    .line 35
    const/4 v1, 0x5

    .line 36
    aget v4, p1, v1

    .line 37
    .line 38
    aput v4, p1, v3

    .line 39
    .line 40
    aput v0, p1, p0

    .line 41
    .line 42
    aput v2, p1, v1

    .line 43
    .line 44
    return-object p1
.end method
