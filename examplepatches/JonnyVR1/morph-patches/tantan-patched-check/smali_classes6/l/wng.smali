.class public Ll/wng;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/xng;",
        ">;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;

    .line 5
    .line 6
    iput-object p1, p0, Ll/wng;->b:Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Ll/wng;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wng;->j0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Ll/wng;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wng;->l0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g0(Ll/wng;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wng;->k0(Ljava/util/List;)V

    return-void
.end method

.method private synthetic j0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wng;->m0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tng;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/tng;-><init>(Ll/wng;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final h0()Ljava/lang/String;
    .locals 0

    .line 1
    iget p0, p0, Ll/wng;->a:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "myGroup"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, "hot"

    .line 9
    .line 10
    return-object p0
.end method

.method public i0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wng;->b:Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "page_type"

    .line 8
    .line 9
    const/4 v2, -0x1

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Ll/wng;->a:I

    .line 15
    .line 16
    return-void
.end method

.method public final synthetic k0(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/xng;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xng;->f()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/xng;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/xng;->e(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic l0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/xng;

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ll/xng;->e(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Ll/xng;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xng;->f()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public m0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wng;->b:Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wng;->h0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-virtual {v1, v2, v3}, Ll/jka;->q7(Ljava/lang/String;I)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/ung;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/ung;-><init>(Ll/wng;)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/vng;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/vng;-><init>(Ll/wng;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method
