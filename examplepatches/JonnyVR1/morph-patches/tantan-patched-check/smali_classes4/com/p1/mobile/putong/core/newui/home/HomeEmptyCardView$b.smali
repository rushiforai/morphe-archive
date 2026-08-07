.class public Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;->v()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView$b;->a:Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;

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
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView$b;->a:Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;

    .line 7
    .line 8
    const/high16 v0, 0x3f800000    # 1.0f

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/xra;->v()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->ALREADY_AUTH:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 20
    .line 21
    invoke-static {p1}, Ll/jj40;->a(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView$b;->a:Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/HomeEmptyCardView;->g:Lv/VText;

    .line 30
    .line 31
    const/4 p1, 0x1

    .line 32
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method
