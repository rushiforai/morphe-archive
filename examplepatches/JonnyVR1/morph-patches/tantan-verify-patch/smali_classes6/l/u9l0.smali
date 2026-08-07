.class public final Ll/u9l0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0014\n\u0002\u0008\u0003\n\u0002\u0010\u0007\n\u0002\u0008\u0006\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J-\u0010\u000b\u001a\u00020\t2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\u000f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0017\u0010\u0012\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0010\u00a8\u0006\u0013"
    }
    d2 = {
        "Ll/u9l0;",
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
        "",
        "x",
        "b",
        "(F)F",
        "y",
        "c",
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
.field public static final INSTANCE:Ll/u9l0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/u9l0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/u9l0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/u9l0;->INSTANCE:Ll/u9l0;

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
    .locals 2
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
    move-result v0

    .line 11
    int-to-float v0, v0

    .line 12
    int-to-float p1, p1

    .line 13
    div-float/2addr v0, p1

    .line 14
    invoke-virtual {p0, v0}, Ll/u9l0;->b(F)F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x0

    .line 19
    aput v0, p4, v1

    .line 20
    .line 21
    invoke-virtual {p3}, Ll/mi80;->d()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    int-to-float v0, v0

    .line 26
    int-to-float p2, p2

    .line 27
    div-float/2addr v0, p2

    .line 28
    invoke-virtual {p0, v0}, Ll/u9l0;->c(F)F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v1, 0x1

    .line 33
    aput v0, p4, v1

    .line 34
    .line 35
    invoke-virtual {p3}, Ll/mi80;->c()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    int-to-float v0, v0

    .line 40
    div-float/2addr v0, p1

    .line 41
    invoke-virtual {p0, v0}, Ll/u9l0;->b(F)F

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const/4 v1, 0x2

    .line 46
    aput v0, p4, v1

    .line 47
    .line 48
    invoke-virtual {p3}, Ll/mi80;->d()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    int-to-float v0, v0

    .line 53
    invoke-virtual {p3}, Ll/mi80;->a()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    int-to-float v1, v1

    .line 58
    add-float/2addr v0, v1

    .line 59
    div-float/2addr v0, p2

    .line 60
    invoke-virtual {p0, v0}, Ll/u9l0;->c(F)F

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    const/4 v1, 0x3

    .line 65
    aput v0, p4, v1

    .line 66
    .line 67
    invoke-virtual {p3}, Ll/mi80;->c()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    int-to-float v0, v0

    .line 72
    invoke-virtual {p3}, Ll/mi80;->b()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    int-to-float v1, v1

    .line 77
    add-float/2addr v0, v1

    .line 78
    div-float/2addr v0, p1

    .line 79
    invoke-virtual {p0, v0}, Ll/u9l0;->b(F)F

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    const/4 v1, 0x4

    .line 84
    aput v0, p4, v1

    .line 85
    .line 86
    invoke-virtual {p3}, Ll/mi80;->d()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    int-to-float v0, v0

    .line 91
    div-float/2addr v0, p2

    .line 92
    invoke-virtual {p0, v0}, Ll/u9l0;->c(F)F

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    const/4 v1, 0x5

    .line 97
    aput v0, p4, v1

    .line 98
    .line 99
    invoke-virtual {p3}, Ll/mi80;->c()I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    int-to-float v0, v0

    .line 104
    invoke-virtual {p3}, Ll/mi80;->b()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    int-to-float v1, v1

    .line 109
    add-float/2addr v0, v1

    .line 110
    div-float/2addr v0, p1

    .line 111
    invoke-virtual {p0, v0}, Ll/u9l0;->b(F)F

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    const/4 v0, 0x6

    .line 116
    aput p1, p4, v0

    .line 117
    .line 118
    invoke-virtual {p3}, Ll/mi80;->d()I

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    int-to-float p1, p1

    .line 123
    invoke-virtual {p3}, Ll/mi80;->a()I

    .line 124
    .line 125
    .line 126
    move-result p3

    .line 127
    int-to-float p3, p3

    .line 128
    add-float/2addr p1, p3

    .line 129
    div-float/2addr p1, p2

    .line 130
    invoke-virtual {p0, p1}, Ll/u9l0;->c(F)F

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    const/4 p1, 0x7

    .line 135
    aput p0, p4, p1

    .line 136
    .line 137
    return-object p4
.end method

.method public final b(F)F
    .locals 0

    .line 1
    const/high16 p0, 0x40000000    # 2.0f

    .line 2
    .line 3
    mul-float/2addr p1, p0

    .line 4
    const/high16 p0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    sub-float/2addr p1, p0

    .line 7
    return p1
.end method

.method public final c(F)F
    .locals 0

    .line 1
    const/high16 p0, 0x40000000    # 2.0f

    .line 2
    .line 3
    mul-float/2addr p1, p0

    .line 4
    sub-float/2addr p1, p0

    .line 5
    const/high16 p0, -0x40800000    # -1.0f

    .line 6
    .line 7
    mul-float/2addr p1, p0

    .line 8
    const/high16 p0, 0x3f800000    # 1.0f

    .line 9
    .line 10
    sub-float/2addr p1, p0

    .line 11
    return p1
.end method
