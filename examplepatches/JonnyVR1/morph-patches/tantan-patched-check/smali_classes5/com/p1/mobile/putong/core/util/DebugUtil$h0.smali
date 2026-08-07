.class public Lcom/p1/mobile/putong/core/util/DebugUtil$h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->uj(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$h0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$h0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 11

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->new_()Lcom/p1/mobile/putong/core/data/SalvagePopUser;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "rightSwipe"

    .line 14
    .line 15
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SalvagePopUserType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->salvagePopUserType:Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 20
    .line 21
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->new_()Lcom/p1/mobile/putong/core/data/SalvagePopUser;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "see"

    .line 28
    .line 29
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SalvagePopUserType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->salvagePopUserType:Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 34
    .line 35
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    new-instance v7, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    sget-object v4, Ll/slp;->Companion:Ll/slp$b;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    const/4 v9, 0x0

    .line 61
    const/4 v10, 0x0

    .line 62
    const/4 v6, 0x1

    .line 63
    const/4 v8, 0x0

    .line 64
    invoke-virtual/range {v4 .. v10}, Ll/slp$b;->i(Landroid/content/Context;ZLjava/util/List;Ll/y20;Ll/y20;Ll/y20;)Ll/slp;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static synthetic b()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H2:Ll/cb9;

    .line 4
    .line 5
    iget-object v0, v0, Ll/cb9;->R:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/byd0;->clear()Z

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H2:Ll/cb9;

    .line 13
    .line 14
    iget-object v0, v0, Ll/cb9;->S:Ll/byd0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/byd0;->clear()Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->new_()Lcom/p1/mobile/putong/core/data/SalvagePopUser;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "rightSwipe"

    .line 14
    .line 15
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SalvagePopUserType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->salvagePopUserType:Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 20
    .line 21
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    new-instance v6, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-interface {v6, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    sget-object v3, Ll/slp;->Companion:Ll/slp$b;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    const/4 v8, 0x0

    .line 38
    const/4 v9, 0x0

    .line 39
    const/4 v5, 0x0

    .line 40
    const/4 v7, 0x0

    .line 41
    invoke-virtual/range {v3 .. v9}, Ll/slp$b;->i(Landroid/content/Context;ZLjava/util/List;Ll/y20;Ll/y20;Ll/y20;)Ll/slp;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 12

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->new_()Lcom/p1/mobile/putong/core/data/SalvagePopUser;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "rightSwipe"

    .line 14
    .line 15
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SalvagePopUserType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->salvagePopUserType:Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 20
    .line 21
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->new_()Lcom/p1/mobile/putong/core/data/SalvagePopUser;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "see"

    .line 28
    .line 29
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SalvagePopUserType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->salvagePopUserType:Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 34
    .line 35
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    new-instance v7, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    sget-object v4, Ll/fbp;->Companion:Ll/fbp$b;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    const/4 v10, 0x0

    .line 61
    const/4 v11, 0x0

    .line 62
    const/4 v6, 0x0

    .line 63
    const/4 v8, 0x0

    .line 64
    const/4 v9, 0x0

    .line 65
    invoke-virtual/range {v4 .. v11}, Ll/fbp$b;->i(Landroid/content/Context;ZLjava/util/List;Ljava/lang/Runnable;Ll/y20;Ll/y20;Ll/y20;)Ll/fbp;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 12

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->new_()Lcom/p1/mobile/putong/core/data/SalvagePopUser;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "rightSwipe"

    .line 14
    .line 15
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SalvagePopUserType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->salvagePopUserType:Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 20
    .line 21
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->new_()Lcom/p1/mobile/putong/core/data/SalvagePopUser;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "see"

    .line 28
    .line 29
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SalvagePopUserType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->salvagePopUserType:Lcom/p1/mobile/putong/core/data/SalvagePopUserType;

    .line 34
    .line 35
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/SalvagePopUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    new-instance v7, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    sget-object v4, Ll/fbp;->Companion:Ll/fbp$b;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    const/4 v10, 0x0

    .line 67
    const/4 v11, 0x0

    .line 68
    const/4 v6, 0x1

    .line 69
    const/4 v8, 0x0

    .line 70
    const/4 v9, 0x0

    .line 71
    invoke-virtual/range {v4 .. v11}, Ll/fbp$b;->i(Landroid/content/Context;ZLjava/util/List;Ljava/lang/Runnable;Ll/y20;Ll/y20;Ll/y20;)Ll/fbp;

    .line 72
    .line 73
    .line 74
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$h0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$h0;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    new-instance v1, Ll/jdd;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/jdd;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v2, "\u56fd\u9645\u5316 \u4f1a\u5458\u633d\u56de\u5f39\u7a97\u7f13\u5b58\u6e05\u7a7a"

    .line 14
    .line 15
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$h0;->a:Ljava/util/ArrayList;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$h0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 25
    .line 26
    new-instance v2, Ll/kdd;

    .line 27
    .line 28
    invoke-direct {v2, v1}, Ll/kdd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 29
    .line 30
    .line 31
    const-string v1, "premium \u633d\u56de\u5f39\u7a97"

    .line 32
    .line 33
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$h0;->a:Ljava/util/ArrayList;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$h0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 43
    .line 44
    new-instance v2, Ll/ldd;

    .line 45
    .line 46
    invoke-direct {v2, v1}, Ll/ldd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 47
    .line 48
    .line 49
    const-string v1, "premium \u633d\u56de\u5f39\u7a97\u5927"

    .line 50
    .line 51
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$h0;->a:Ljava/util/ArrayList;

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$h0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 61
    .line 62
    new-instance v2, Ll/mdd;

    .line 63
    .line 64
    invoke-direct {v2, v1}, Ll/mdd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 65
    .line 66
    .line 67
    const-string v1, "ultra \u633d\u56de\u5f39\u7a97\u5c0f"

    .line 68
    .line 69
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$h0;->a:Ljava/util/ArrayList;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$h0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 79
    .line 80
    new-instance v2, Ll/ndd;

    .line 81
    .line 82
    invoke-direct {v2, v1}, Ll/ndd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 83
    .line 84
    .line 85
    const-string v1, "ultra \u633d\u56de\u5f39\u7a97\u5927"

    .line 86
    .line 87
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$h0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 95
    .line 96
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$h0;->a:Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method
