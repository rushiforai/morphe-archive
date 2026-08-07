.class public Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->s0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$a;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$a;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->o:Lv/VFrame;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method
