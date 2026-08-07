.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# static fields
.field public static e:Ljava/lang/String; = "from"

.field public static f:Ljava/lang/String; = "extra_location"


# instance fields
.field public c:Ll/ub40;

.field public d:Ll/lb40;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->Y1(Landroid/content/Context;Ljava/lang/String;[D)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static Y1(Landroid/content/Context;Ljava/lang/String;[D)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->e:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    array-length p0, p2

    .line 26
    const/4 p1, 0x2

    .line 27
    if-ne p0, p1, :cond_1

    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->f:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[D)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    :cond_1
    return-object v0
.end method


# virtual methods
.method public finish()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/a8c0;->e:I

    .line 5
    .line 6
    sget v1, Ll/a8c0;->j:I

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->c:Ll/ub40;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ub40;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    new-instance v0, Ll/ub40;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ub40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->c:Ll/ub40;

    .line 7
    .line 8
    new-instance v0, Ll/lb40;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/lb40;-><init>(Ll/ner;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->d:Ll/lb40;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->c:Ll/ub40;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->d:Ll/lb40;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ar2;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onStopLifecycle()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->c:Ll/ub40;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ub40;->x()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onStopLifecycle()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_poi_list_pop"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->d:Ll/lb40;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/lb40;->m0()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
