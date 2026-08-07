.class public Ll/q8e0;
.super Ll/o5e0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o5e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/Link;Ll/abe0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;-><init>(Lcom/p1/mobile/putong/data/Link;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    move-object v1, p0

    .line 11
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-static {p5}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->X(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    const/4 v6, 0x1

    .line 18
    move-object v2, p2

    .line 19
    move-object v3, p3

    .line 20
    move-object v4, p4

    .line 21
    move-object v7, p6

    .line 22
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->v0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public a(Ll/abe0;Ll/z20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p2, "platform"

    .line 6
    .line 7
    invoke-static {p0, p2}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v6

    .line 11
    const-string p2, "shareTitle"

    .line 12
    .line 13
    invoke-static {p0, p2}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    const-string p2, "description"

    .line 18
    .line 19
    invoke-static {p0, p2}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    const-string p2, "url"

    .line 24
    .line 25
    invoke-static {p0, p2}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    const-string v0, "pic"

    .line 30
    .line 31
    invoke-static {p0, v0}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    const-string v0, "dialogTitle"

    .line 36
    .line 37
    invoke-static {p0, v0}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    new-instance v1, Lcom/p1/mobile/putong/data/Link;

    .line 42
    .line 43
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Link;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object p2, v1, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    instance-of p0, p0, Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    if-eqz p0, :cond_0

    .line 55
    .line 56
    new-instance v0, Ll/p8e0;

    .line 57
    .line 58
    move-object v2, p1

    .line 59
    invoke-direct/range {v0 .. v7}, Ll/p8e0;-><init>(Lcom/p1/mobile/putong/data/Link;Ll/abe0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    move-object v2, p1

    .line 67
    invoke-virtual {v2}, Ll/abe0;->b()Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v2}, Ll/abe0;->b()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {p1}, Ll/xwa;->f(Landroid/content/Context;)Landroid/content/Intent;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public c(Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
