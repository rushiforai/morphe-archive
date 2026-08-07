.class public Ll/teg;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/teg$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ll/teg$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/teg;->a:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/teg;->b:Ljava/util/Map;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    const/4 p1, 0x2

    .line 17
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/teg;->d()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/teg;->e()V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public a()Ll/teg$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/teg;->b:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Ll/teg;->a:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/teg$a;

    .line 14
    .line 15
    return-object p0
.end method

.method public b()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ll/teg$a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/teg;->b:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/teg;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public final d()V
    .locals 7

    .line 1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    iget-object v1, p0, Ll/teg;->b:Ljava/util/Map;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    new-instance v4, Ll/teg$a;

    .line 11
    .line 12
    sget v5, Lcom/p1/mobile/putong/live/livingroom/R$string;->k3:I

    .line 13
    .line 14
    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    const-string v6, "leaderboard_id_fans_recall"

    .line 19
    .line 20
    invoke-direct {v4, v5, v6, v2}, Ll/teg$a;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/teg;->b:Ljava/util/Map;

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    new-instance v4, Ll/teg$a;

    .line 34
    .line 35
    sget v5, Lcom/p1/mobile/putong/live/livingroom/R$string;->A3:I

    .line 36
    .line 37
    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    const-string v6, "fanBaseScore-audience-day-fanbaseuserscore"

    .line 42
    .line 43
    invoke-direct {v4, v5, v6, v2}, Ll/teg$a;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Ll/teg;->b:Ljava/util/Map;

    .line 50
    .line 51
    const/4 v2, 0x2

    .line 52
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    new-instance v4, Ll/teg$a;

    .line 57
    .line 58
    sget v5, Lcom/p1/mobile/putong/live/livingroom/R$string;->E3:I

    .line 59
    .line 60
    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    const-string v6, "business-audience-month-fanbaseuseractive"

    .line 65
    .line 66
    invoke-direct {v4, v5, v6, v2}, Ll/teg$a;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/teg;->b:Ljava/util/Map;

    .line 73
    .line 74
    const/4 v1, 0x3

    .line 75
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    new-instance v3, Ll/teg$a;

    .line 80
    .line 81
    sget-object v4, Ll/htd0;->f:Ll/htd0;

    .line 82
    .line 83
    invoke-static {v4}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    check-cast v4, Ll/civ;

    .line 88
    .line 89
    invoke-virtual {v4}, Ll/civ;->n()Z

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    if-eqz v4, :cond_0

    .line 94
    .line 95
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->n4:I

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->M3:I

    .line 99
    .line 100
    :goto_0
    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    const-string v4, "gift-audience-day-fanbaseusergift"

    .line 105
    .line 106
    invoke-direct {v3, v0, v4, v1}, Ll/teg$a;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 107
    .line 108
    .line 109
    invoke-interface {p0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public final e()V
    .locals 7

    .line 1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    iget-object v1, p0, Ll/teg;->b:Ljava/util/Map;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    new-instance v4, Ll/teg$a;

    .line 11
    .line 12
    sget v5, Lcom/p1/mobile/putong/live/livingroom/R$string;->A3:I

    .line 13
    .line 14
    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    const-string v6, "fanBaseScore-audience-day-fanbaseuserscore"

    .line 19
    .line 20
    invoke-direct {v4, v5, v6, v2}, Ll/teg$a;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/teg;->b:Ljava/util/Map;

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    new-instance v4, Ll/teg$a;

    .line 34
    .line 35
    sget v5, Lcom/p1/mobile/putong/live/livingroom/R$string;->E3:I

    .line 36
    .line 37
    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    const-string v6, "business-audience-month-fanbaseuseractive"

    .line 42
    .line 43
    invoke-direct {v4, v5, v6, v2}, Ll/teg$a;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/teg;->b:Ljava/util/Map;

    .line 50
    .line 51
    const/4 v1, 0x2

    .line 52
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    new-instance v3, Ll/teg$a;

    .line 57
    .line 58
    sget-object v4, Ll/htd0;->f:Ll/htd0;

    .line 59
    .line 60
    invoke-static {v4}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    check-cast v4, Ll/civ;

    .line 65
    .line 66
    invoke-virtual {v4}, Ll/civ;->n()Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-eqz v4, :cond_0

    .line 71
    .line 72
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->n4:I

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_0
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->M3:I

    .line 76
    .line 77
    :goto_0
    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const-string v4, "gift-audience-day-fanbaseusergift"

    .line 82
    .line 83
    invoke-direct {v3, v0, v4, v1}, Ll/teg$a;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 84
    .line 85
    .line 86
    invoke-interface {p0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public f(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/teg;->a:I

    .line 2
    .line 3
    return-void
.end method
