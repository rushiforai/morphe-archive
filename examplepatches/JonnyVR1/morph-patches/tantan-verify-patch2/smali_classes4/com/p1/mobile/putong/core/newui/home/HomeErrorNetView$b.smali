.class public Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;->k()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView$b;->a:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView$b;->a:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;->a:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

    .line 7
    .line 8
    const/high16 p1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Fk()V

    .line 22
    .line 23
    .line 24
    return-void
.end method
