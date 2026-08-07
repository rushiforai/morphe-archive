.class public Lcom/p1/mobile/putong/core/ui/map/MapPreviewAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Ll/fxw;

.field public d:Ll/jxw;


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


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/map/MapPreviewAct;->d:Ll/jxw;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/jxw;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    new-instance v0, Ll/fxw;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/fxw;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/map/MapPreviewAct;->c:Ll/fxw;

    .line 10
    .line 11
    new-instance v0, Ll/jxw;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/jxw;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/map/MapPreviewAct;->d:Ll/jxw;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/map/MapPreviewAct;->c:Ll/fxw;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/map/MapPreviewAct;->c:Ll/fxw;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v1, "location"

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ll/fxw;->h0(Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/map/MapPreviewAct;->c:Ll/fxw;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/fxw;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
