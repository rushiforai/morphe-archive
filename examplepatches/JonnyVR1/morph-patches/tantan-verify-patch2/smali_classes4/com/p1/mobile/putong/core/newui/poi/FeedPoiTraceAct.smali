.class public Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Landroid/view/View;

.field public d:Landroid/widget/FrameLayout;

.field public e:Ljava/lang/String;

.field public f:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "FeedPoiTraceAct"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;->e:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method private X1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "key_from"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;->g:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "key_target_moment"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;->h:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method

.method private Y1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;->e:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;->f:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    new-instance v1, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 20
    .line 21
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;->f:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 25
    .line 26
    new-instance v1, Landroid/os/Bundle;

    .line 27
    .line 28
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v2, "key_from"

    .line 32
    .line 33
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;->g:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const-string v2, "key_target_moment"

    .line 39
    .line 40
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;->h:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;->f:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 46
    .line 47
    invoke-virtual {v2, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    sget v2, Ll/adc0;->A4:I

    .line 55
    .line 56
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;->f:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;->e:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v1, v2, v3, p0}, Landroidx/fragment/app/k;->t(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Landroidx/fragment/app/k;->j()I

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->e0()Z

    .line 67
    .line 68
    .line 69
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->N8:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;->c:Landroid/view/View;

    .line 9
    .line 10
    sget p2, Ll/adc0;->A4:I

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Landroid/widget/FrameLayout;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;->d:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;->Y1()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;->c:Landroid/view/View;

    .line 24
    .line 25
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceAct;->X1()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_poi_nearby_card"

    .line 2
    .line 3
    return-object p0
.end method
