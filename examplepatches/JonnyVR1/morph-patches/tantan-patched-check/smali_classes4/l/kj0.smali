.class public Ll/kj0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/lj0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kj0;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f0(Ll/kj0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kj0;->h0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Ll/kj0;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kj0;->i0(Ll/vg60;)V

    return-void
.end method

.method private synthetic h0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/lj0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Lcom/p1/mobile/putong/core/R$string;->h1:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Ll/lj0;->q(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p1, Ll/lj0;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/lj0;->m()V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p0, Ll/lj0;

    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-virtual {p0, v0, p1}, Ll/lj0;->l(ZZ)V

    .line 36
    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 43
    .line 44
    .line 45
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/f;->p3(Z)Lrx/c;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private synthetic i0(Ll/vg60;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kj0;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;->f:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;->g:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast v0, Ll/lj0;

    .line 24
    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v2, "\u672a\u804a\u914d\u5bf9("

    .line 28
    .line 29
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p1, Ll/vg60;->a:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v2, ")"

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Ll/lj0;->q(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast v0, Ll/lj0;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/lj0;->p()V

    .line 58
    .line 59
    .line 60
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 61
    .line 62
    check-cast p0, Ll/lj0;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ll/lj0;->n(Ll/vg60;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/hj0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/hj0;-><init>(Ll/kj0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->fo()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/ij0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/ij0;-><init>(Ll/kj0;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ll/jj0;

    .line 30
    .line 31
    invoke-direct {p0}, Ll/jj0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method
