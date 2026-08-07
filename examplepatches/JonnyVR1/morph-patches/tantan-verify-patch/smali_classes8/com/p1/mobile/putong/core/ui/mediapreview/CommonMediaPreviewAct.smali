.class public Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;
.super Lcom/p1/mobile/putong/app/PutongMvpAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpAct<",
        "Ll/il5;",
        "Ll/jl5;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Ll/zs80;

.field public f:Ll/jl5;

.field public g:Ll/il5;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Z1()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->hi(Lcom/p1/mobile/android/app/Act;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static final a2(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "current_data"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "all_data"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method


# virtual methods
.method public bridge synthetic X1()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->b2()Ll/il5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic Y1()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->c2()Ll/jl5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b2()Ll/il5;
    .locals 1

    .line 1
    new-instance v0, Ll/il5;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/il5;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->g:Ll/il5;

    .line 7
    .line 8
    return-object v0
.end method

.method public c2()Ll/jl5;
    .locals 2

    .line 1
    new-instance v0, Ll/prd;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/prd;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->e:Ll/zs80;

    .line 7
    .line 8
    new-instance v0, Ll/jl5;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/jl5;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->f:Ll/jl5;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->e:Ll/zs80;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/jl5;->i(Ll/pq80;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->f:Ll/jl5;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->e:Ll/zs80;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/jl5;->f(Ll/ys80;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->f:Ll/jl5;

    .line 28
    .line 29
    return-object p0
.end method

.method public d2()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->e:Ll/zs80;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, v0}, Ll/ys80;->a(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public finish()V
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setResult(I)V

    .line 3
    .line 4
    .line 5
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "CommonMediaPreviewAdapter"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0, v1}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hasCustomTransition()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    sget v0, Ll/x7c0;->a:I

    .line 31
    .line 32
    sget v1, Ll/x7c0;->b:I

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public onDestroyLifecycle()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onDestroyLifecycle()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->Z1()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-static {p0, v0}, Ll/hkl0;->a(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public onPauseLifecycle()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onPauseLifecycle()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->Z1()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {p0, v0}, Ll/hkl0;->a(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->dimStatusBar(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget v0, Ll/c9c0;->W1:I

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/high16 v0, -0x1000000

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hasCustomTransition()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    sget p1, Ll/x7c0;->c:I

    .line 37
    .line 38
    sget v0, Ll/x7c0;->d:I

    .line 39
    .line 40
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method
