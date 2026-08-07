.class Ll/koh0$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/koh0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# direct methods
.method public static synthetic a(Ll/aje;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/koh0$d;->b(Ll/aje;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static b(Ll/aje;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/aje;",
            ")",
            "Ljava/util/List<",
            "Ll/wr4;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/aje;->d()Ll/ire0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    const/4 v1, 0x4

    .line 8
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0}, Ll/cje;->k(Ll/ire0;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0}, Ll/ire0;->i()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    new-instance v2, Ll/psy;

    .line 22
    .line 23
    invoke-direct {v2}, Ll/psy;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-instance v2, Ll/m9e;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/m9e;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    :goto_0
    if-nez v1, :cond_1

    .line 39
    .line 40
    new-instance v1, Ll/m9l0;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/m9l0;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    :cond_1
    new-instance v1, Ll/k9l0;

    .line 49
    .line 50
    invoke-direct {v1}, Ll/k9l0;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    invoke-static {p0}, Ll/cje;->m(Ll/ire0;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_2

    .line 61
    .line 62
    new-instance p0, Ll/auj0;

    .line 63
    .line 64
    invoke-direct {p0}, Ll/auj0;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    new-instance p0, Ll/tc2;

    .line 71
    .line 72
    invoke-direct {p0}, Ll/tc2;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    :cond_2
    new-instance p0, Ll/ezc0;

    .line 79
    .line 80
    invoke-direct {p0}, Ll/ezc0;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    new-instance p0, Ll/sc2;

    .line 87
    .line 88
    invoke-direct {p0}, Ll/sc2;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    return-object v0
.end method
