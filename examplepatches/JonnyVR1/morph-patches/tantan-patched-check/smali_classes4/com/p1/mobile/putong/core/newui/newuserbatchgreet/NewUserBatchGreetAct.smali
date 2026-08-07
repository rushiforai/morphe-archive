.class public Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Ll/qn40;

.field public d:Ll/vn40;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->e2()V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->d2()V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->lambda$debugItems$0()V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->lambda$debugItems$1()V

    return-void
.end method

.method private synthetic lambda$debugItems$0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->d:Ll/vn40;

    .line 2
    .line 3
    iget-object p0, p0, Ll/vn40;->j:Lv/VEditText;

    .line 4
    .line 5
    const-string v0, "\u6b22\u8fce\u65b0\u4eba\uff0c\u70ed\u70c8\u6b22\u8fce,\u6b22\u8fce\u65b0\u4eba\uff0c\u70ed\u70c8\u6b22\u8fce,\u6b22\u8fce\u65b0\u4eba\uff0c\u70ed\u70c8\u6b22\u8fce"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic lambda$debugItems$1()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->g2(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public final b2()Ll/qn40;
    .locals 1

    .line 1
    new-instance v0, Ll/qn40;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qn40;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final c2()Ll/vn40;
    .locals 1

    .line 1
    new-instance v0, Ll/vn40;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vn40;-><init>(Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public checkGradientColors()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->checkGradientColors()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/g9c0;->Y:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setStatusBarColorResId(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic d2()V
    .locals 1

    .line 1
    const/4 v0, 0x6

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->g2(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public debugItems()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->debugItems()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/dn40;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/dn40;-><init>(Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;)V

    .line 8
    .line 9
    .line 10
    const-string v2, "\u9884\u8bbe\u6587\u672c"

    .line 11
    .line 12
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/en40;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/en40;-><init>(Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;)V

    .line 22
    .line 23
    .line 24
    const-string v2, "\u6dfb\u52a0\u6570\u91cf3"

    .line 25
    .line 26
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/fn40;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/fn40;-><init>(Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;)V

    .line 36
    .line 37
    .line 38
    const-string v2, "\u6dfb\u52a0\u6570\u91cf6"

    .line 39
    .line 40
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    new-instance v1, Ll/gn40;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/gn40;-><init>(Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;)V

    .line 50
    .line 51
    .line 52
    const-string p0, "\u6dfb\u52a0\u6570\u91cf9"

    .line 53
    .line 54
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    return-object v0
.end method

.method public final synthetic e2()V
    .locals 1

    .line 1
    const/16 v0, 0x9

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->g2(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public finish()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v0, 0x0

    .line 9
    sget v1, Ll/y7c0;->b:I

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final g2(I)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x0

    .line 15
    :goto_0
    if-ge v2, p1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->d:Ll/vn40;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/vn40;->p(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->d:Ll/vn40;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/vn40;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->b2()Ll/qn40;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->c:Ll/qn40;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->c2()Ll/vn40;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->d:Ll/vn40;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->c:Ll/qn40;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->d:Ll/vn40;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->c:Ll/qn40;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/vn40;->f(Ll/qn40;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newuserbatchgreet/NewUserBatchGreetAct;->c:Ll/qn40;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/qn40;->Z()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
