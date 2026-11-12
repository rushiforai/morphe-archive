.class public final Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0008B\u001d\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;",
        "Landroid/widget/FrameLayout;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "nrn",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:Lnrn;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    sget-object p1, Lnrn;->a:Lnrn;

    iput-object p1, p0, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;->a:Lnrn;

    return-void
.end method


# virtual methods
.method public final a()Ljrc;
    .registers 4

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    const v0, 0x7f0a08f0

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    if-eqz v1, :cond_19

    new-instance v0, Ljrc;

    check-cast p0, Landroid/widget/LinearLayout;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, v2}, Ljrc;-><init>(Landroid/widget/LinearLayout;Lcom/google/android/material/button/MaterialButton;B)V

    return-object v0

    :cond_19
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final b()Lb98;
    .registers 3

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    const v0, 0x7f0a0aad

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    if-eqz v1, :cond_19

    new-instance v0, Lb98;

    check-cast p0, Landroid/widget/FrameLayout;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Lb98;-><init>(Landroid/widget/FrameLayout;B)V

    return-object v0

    :cond_19
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final c()Ljrc;
    .registers 4

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    const v0, 0x7f0a0c5a

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    if-eqz v1, :cond_19

    new-instance v0, Ljrc;

    check-cast p0, Landroid/widget/LinearLayout;

    const/4 v2, 0x2

    invoke-direct {v0, p0, v1, v2}, Ljrc;-><init>(Landroid/widget/LinearLayout;Lcom/google/android/material/button/MaterialButton;B)V

    return-object v0

    :cond_19
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final d(Lnrn;)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;->a:Lnrn;

    if-eq v0, p1, :cond_54

    iput-object p1, p0, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;->a:Lnrn;

    invoke-virtual {p0}, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;->c()Ljrc;

    move-result-object v0

    iget-object v0, v0, Ljrc;->b:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;->b()Lb98;

    move-result-object v0

    iget-object v0, v0, Lb98;->b:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;->a()Ljrc;

    move-result-object v0

    iget-object v0, v0, Ljrc;->b:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_54

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eq p1, v0, :cond_4b

    const/4 v0, 0x2

    if-eq p1, v0, :cond_41

    const/4 v0, 0x3

    if-ne p1, v0, :cond_3d

    invoke-virtual {p0}, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;->a()Ljrc;

    move-result-object p0

    iget-object p0, p0, Ljrc;->b:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_3d
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_41
    invoke-virtual {p0}, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;->b()Lb98;

    move-result-object p0

    iget-object p0, p0, Lb98;->b:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_4b
    invoke-virtual {p0}, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;->c()Ljrc;

    move-result-object p0

    iget-object p0, p0, Ljrc;->b:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_54
    return-void
.end method
