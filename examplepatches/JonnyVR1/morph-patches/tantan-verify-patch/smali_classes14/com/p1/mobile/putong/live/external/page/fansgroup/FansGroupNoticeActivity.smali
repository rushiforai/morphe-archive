.class public Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeActivity;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Ll/igg;

.field public d:Ll/hgg;


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

.method public static X1(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeActivity;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeActivity;->c:Ll/igg;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/igg;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/igg;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/igg;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeActivity;->c:Ll/igg;

    .line 10
    .line 11
    new-instance v0, Ll/hgg;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/hgg;-><init>(Ll/ner;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeActivity;->d:Ll/hgg;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeActivity;->c:Ll/igg;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeActivity;->d:Ll/hgg;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/hgg;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_live_fanbasegroup_notice"

    .line 2
    .line 3
    return-object p0
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
