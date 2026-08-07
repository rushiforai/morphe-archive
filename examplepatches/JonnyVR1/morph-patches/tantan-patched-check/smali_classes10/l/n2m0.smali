.class public Ll/n2m0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/fgn0;",
            ">;"
        }
    .end annotation
.end field


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

.method public static synthetic a(Ljava/lang/String;Ll/fgn0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/fgn0;->e()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static b()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/fgn0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/n2m0;->a:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/n2m0;->a:Ljava/util/List;

    .line 11
    .line 12
    new-instance v1, Ll/fgn0;

    .line 13
    .line 14
    const-string v2, "chatTopic"

    .line 15
    .line 16
    const-string v3, "\u804a\u5929\u8bdd\u9898"

    .line 17
    .line 18
    invoke-direct {v1, v2, v3}, Ll/fgn0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    sget-object v0, Ll/n2m0;->a:Ljava/util/List;

    .line 25
    .line 26
    new-instance v1, Ll/fgn0;

    .line 27
    .line 28
    const-string v2, "ktv"

    .line 29
    .line 30
    const-string v3, "KTV"

    .line 31
    .line 32
    invoke-direct {v1, v2, v3}, Ll/fgn0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    sget-object v0, Ll/n2m0;->a:Ljava/util/List;

    .line 39
    .line 40
    new-instance v1, Ll/fgn0;

    .line 41
    .line 42
    const-string v2, "undercover"

    .line 43
    .line 44
    const-string v3, "\u8c01\u662f\u5367\u5e95"

    .line 45
    .line 46
    invoke-direct {v1, v2, v3}, Ll/fgn0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    sget-object v0, Ll/n2m0;->a:Ljava/util/List;

    .line 53
    .line 54
    new-instance v1, Ll/fgn0;

    .line 55
    .line 56
    const-string v2, "auction"

    .line 57
    .line 58
    const-string v3, "\u62cd\u62cd\u4ea4\u53cb"

    .line 59
    .line 60
    invoke-direct {v1, v2, v3}, Ll/fgn0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    sget-object v0, Ll/n2m0;->a:Ljava/util/List;

    .line 67
    .line 68
    new-instance v1, Ll/fgn0;

    .line 69
    .line 70
    const-string v2, "announcement"

    .line 71
    .line 72
    const-string v3, "\u516c\u544a\u677f"

    .line 73
    .line 74
    invoke-direct {v1, v2, v3}, Ll/fgn0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    :cond_0
    sget-object v0, Ll/n2m0;->a:Ljava/util/List;

    .line 81
    .line 82
    return-object v0
.end method

.method public static c(Ljava/lang/String;)I
    .locals 2

    .line 1
    invoke-static {}, Ll/n2m0;->b()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/m2m0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/m2m0;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method
