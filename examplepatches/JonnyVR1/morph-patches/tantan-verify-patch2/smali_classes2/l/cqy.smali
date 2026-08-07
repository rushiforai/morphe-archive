.class public final Ll/cqy;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/cqy$b;,
        Ll/cqy$a;,
        Ll/cqy$c;
    }
.end annotation


# instance fields
.field private final a:I

.field private final b:I

.field private final c:Landroid/content/Context;

.field private final d:I


# direct methods
.method public constructor <init>(Ll/cqy$a;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/cqy$a;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object v0, p0, Ll/cqy;->c:Landroid/content/Context;

    .line 7
    .line 8
    iget-object v0, p1, Ll/cqy$a;->b:Landroid/app/ActivityManager;

    .line 9
    .line 10
    invoke-static {v0}, Ll/cqy;->e(Landroid/app/ActivityManager;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget v1, p1, Ll/cqy$a;->h:I

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    div-int/lit8 v1, v1, 0x2

    .line 19
    .line 20
    :cond_0
    iput v1, p0, Ll/cqy;->d:I

    .line 21
    .line 22
    iget-object v0, p1, Ll/cqy$a;->b:Landroid/app/ActivityManager;

    .line 23
    .line 24
    iget v2, p1, Ll/cqy$a;->f:F

    .line 25
    .line 26
    iget v3, p1, Ll/cqy$a;->g:F

    .line 27
    .line 28
    invoke-static {v0, v2, v3}, Ll/cqy;->c(Landroid/app/ActivityManager;FF)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v2, p1, Ll/cqy$a;->c:Ll/cqy$c;

    .line 33
    .line 34
    invoke-interface {v2}, Ll/cqy$c;->b()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    iget-object v3, p1, Ll/cqy$a;->c:Ll/cqy$c;

    .line 39
    .line 40
    invoke-interface {v3}, Ll/cqy$c;->a()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    mul-int/2addr v2, v3

    .line 45
    mul-int/lit8 v2, v2, 0x4

    .line 46
    .line 47
    int-to-float v2, v2

    .line 48
    iget v3, p1, Ll/cqy$a;->e:F

    .line 49
    .line 50
    mul-float/2addr v3, v2

    .line 51
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    iget v4, p1, Ll/cqy$a;->d:F

    .line 56
    .line 57
    mul-float/2addr v2, v4

    .line 58
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    sub-int v4, v0, v1

    .line 63
    .line 64
    add-int v5, v2, v3

    .line 65
    .line 66
    if-gt v5, v4, :cond_1

    .line 67
    .line 68
    iput v2, p0, Ll/cqy;->b:I

    .line 69
    .line 70
    iput v3, p0, Ll/cqy;->a:I

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    int-to-float v2, v4

    .line 74
    iget v3, p1, Ll/cqy$a;->e:F

    .line 75
    .line 76
    iget v4, p1, Ll/cqy$a;->d:F

    .line 77
    .line 78
    add-float/2addr v3, v4

    .line 79
    div-float/2addr v2, v3

    .line 80
    mul-float/2addr v4, v2

    .line 81
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    iput v3, p0, Ll/cqy;->b:I

    .line 86
    .line 87
    iget v3, p1, Ll/cqy$a;->e:F

    .line 88
    .line 89
    mul-float/2addr v2, v3

    .line 90
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    iput v2, p0, Ll/cqy;->a:I

    .line 95
    .line 96
    :goto_0
    const-string v2, "MemorySizeCalculator"

    .line 97
    .line 98
    const/4 v3, 0x3

    .line 99
    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_2

    .line 104
    .line 105
    iget v2, p0, Ll/cqy;->b:I

    .line 106
    .line 107
    invoke-direct {p0, v2}, Ll/cqy;->f(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    iget v2, p0, Ll/cqy;->a:I

    .line 111
    .line 112
    invoke-direct {p0, v2}, Ll/cqy;->f(I)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    invoke-direct {p0, v1}, Ll/cqy;->f(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    invoke-direct {p0, v0}, Ll/cqy;->f(I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    iget-object p0, p1, Ll/cqy$a;->b:Landroid/app/ActivityManager;

    .line 122
    .line 123
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getMemoryClass()I

    .line 124
    .line 125
    .line 126
    iget-object p0, p1, Ll/cqy$a;->b:Landroid/app/ActivityManager;

    .line 127
    .line 128
    invoke-static {p0}, Ll/cqy;->e(Landroid/app/ActivityManager;)Z

    .line 129
    .line 130
    .line 131
    :cond_2
    return-void
.end method

.method private static c(Landroid/app/ActivityManager;FF)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getMemoryClass()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x100000

    .line 6
    .line 7
    mul-int/2addr v0, v1

    .line 8
    invoke-static {p0}, Ll/cqy;->e(Landroid/app/ActivityManager;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    int-to-float v0, v0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    move p1, p2

    .line 16
    :cond_0
    mul-float/2addr v0, p1

    .line 17
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public static e(Landroid/app/ActivityManager;)Z
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/app/ActivityManager;->isLowRamDevice()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private f(I)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/cqy;->c:Landroid/content/Context;

    .line 2
    .line 3
    int-to-long v0, p1

    .line 4
    invoke-static {p0, v0, v1}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/cqy;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/cqy;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/cqy;->b:I

    .line 2
    .line 3
    return p0
.end method
