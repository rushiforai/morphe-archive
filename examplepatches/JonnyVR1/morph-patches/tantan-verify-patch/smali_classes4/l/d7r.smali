.class public Ll/d7r;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/d7r$b;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/xx3;)V
    .locals 10

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xx3;->b()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-eqz v1, :cond_3

    .line 15
    .line 16
    array-length v2, v1

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    goto :goto_2

    .line 20
    :cond_0
    invoke-static {v0}, Ll/nki;->i(Ljava/io/File;)J

    .line 21
    .line 22
    .line 23
    move-result-wide v2

    .line 24
    new-instance v4, Ll/d7r$b;

    .line 25
    .line 26
    const/4 v5, 0x0

    .line 27
    invoke-direct {v4, v5}, Ll/d7r$b;-><init>(Ll/d7r$a;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v4}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xx3;->c()J

    .line 34
    .line 35
    .line 36
    move-result-wide v6

    .line 37
    cmp-long v2, v2, v6

    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    if-ltz v2, :cond_1

    .line 41
    .line 42
    array-length v2, v1

    .line 43
    int-to-double v6, v2

    .line 44
    const-wide v8, 0x3fd3333333333333L    # 0.3

    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    mul-double/2addr v6, v8

    .line 50
    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    .line 51
    .line 52
    add-double/2addr v6, v8

    .line 53
    double-to-int v2, v6

    .line 54
    move v4, v3

    .line 55
    :goto_0
    if-ge v4, v2, :cond_1

    .line 56
    .line 57
    aget-object v6, v1, v4

    .line 58
    .line 59
    invoke-static {v6}, Ll/nki;->f(Ljava/io/File;)Z

    .line 60
    .line 61
    .line 62
    add-int/lit8 v4, v4, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    if-nez v0, :cond_2

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    new-instance v1, Ll/d7r$b;

    .line 73
    .line 74
    invoke-direct {v1, v5}, Ll/d7r$b;-><init>(Ll/d7r$a;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 78
    .line 79
    .line 80
    array-length v1, v0

    .line 81
    invoke-virtual {p0}, Ll/xx3;->d()I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-le v1, v2, :cond_3

    .line 86
    .line 87
    :goto_1
    array-length v1, v0

    .line 88
    invoke-virtual {p0}, Ll/xx3;->d()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    sub-int/2addr v1, v2

    .line 93
    if-ge v3, v1, :cond_3

    .line 94
    .line 95
    aget-object v1, v0, v3

    .line 96
    .line 97
    invoke-static {v1}, Ll/nki;->f(Ljava/io/File;)Z

    .line 98
    .line 99
    .line 100
    add-int/lit8 v3, v3, 0x1

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_3
    :goto_2
    return-void
.end method
