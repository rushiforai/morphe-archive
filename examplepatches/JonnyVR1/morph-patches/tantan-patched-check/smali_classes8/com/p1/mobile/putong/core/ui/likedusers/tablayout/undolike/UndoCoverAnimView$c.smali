.class public final Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView;->g()Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "com/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView$c",
        "Landroid/animation/AnimatorListenerAdapter;",
        "Landroid/animation/Animator;",
        "animation",
        "",
        "onAnimationStart",
        "(Landroid/animation/Animator;)V",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView$c;->a:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView$c;->a:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView;->get_heart()Landroid/widget/ImageView;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView;->Companion:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView$a;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoCoverAnimView$a;->a()F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
