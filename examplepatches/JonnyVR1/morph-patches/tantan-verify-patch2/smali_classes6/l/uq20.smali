.class public Ll/uq20;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/jr20;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/uq20;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/uq20;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic e0(Ll/uq20;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uq20;->j0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f0()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/uq20;->b:Ljava/util/ArrayList;

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
    iput-object v0, p0, Ll/uq20;->b:Ljava/util/ArrayList;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/uq20;->b:Ljava/util/ArrayList;

    .line 13
    .line 14
    return-object p0
.end method

.method public g0()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/uq20;->h0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/jr20;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/jr20;->q()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public h0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uq20;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public i0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/tq20;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/tq20;-><init>(Ll/uq20;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic j0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    instance-of p1, p1, Lcom/p1/mobile/android/app/c$a;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/jr20;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/jr20;->u()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public k0(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    sget v0, Ll/cn40;->a:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    if-ne p2, v0, :cond_0

    .line 7
    .line 8
    const-string p1, "framePath"

    .line 9
    .line 10
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-nez p2, :cond_1

    .line 19
    .line 20
    iget-object p2, p0, Ll/uq20;->b:Ljava/util/ArrayList;

    .line 21
    .line 22
    const/4 p3, 0x0

    .line 23
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    instance-of p2, p2, Lcom/p1/mobile/putong/data/Video;

    .line 28
    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    iget-object p2, p0, Ll/uq20;->b:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 38
    .line 39
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 48
    .line 49
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast p1, Ll/jr20;

    .line 52
    .line 53
    iget-object p0, p0, Ll/uq20;->b:Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Ll/jr20;->x(Ljava/util/ArrayList;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    const/4 p0, 0x1

    .line 60
    if-ne p1, p0, :cond_1

    .line 61
    .line 62
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->t()V

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method

.method public l0(Landroid/content/Intent;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "extra_images"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Ll/uq20;->b:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast p1, Ll/jr20;

    .line 33
    .line 34
    iget-object v0, p0, Ll/uq20;->b:Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Ll/jr20;->y(Ljava/util/ArrayList;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    invoke-virtual {p0}, Ll/uq20;->o0()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public m0(Landroid/content/Intent;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const-string v0, "extra_images"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/util/ArrayList;

    .line 8
    .line 9
    iput-object p1, p0, Ll/uq20;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ljava/util/ArrayList;

    .line 22
    .line 23
    iput-object p1, p0, Ll/uq20;->b:Ljava/util/ArrayList;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public n0(Lcom/p1/mobile/putong/feed/data/NewMomentDraft;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/jr20;

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->text:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/jr20;->z(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 14
    .line 15
    check-cast p1, Ljava/util/ArrayList;

    .line 16
    .line 17
    iput-object p1, p0, Ll/uq20;->b:Ljava/util/ArrayList;

    .line 18
    .line 19
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p0, Ll/jr20;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/jr20;->x(Ljava/util/ArrayList;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public o0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uq20;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->M2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
