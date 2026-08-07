.class public final Ll/ydq0$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ydq0;->l(Lcom/p1/mobile/android/app/Act;Ll/w2c0;)Landroid/animation/Animator;
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
        "l/ydq0$a",
        "Landroid/animation/AnimatorListenerAdapter;",
        "Landroid/animation/Animator;",
        "animation",
        "",
        "onAnimationEnd",
        "(Landroid/animation/Animator;)V",
        "b_core_intlGmsRelease"
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
.field public final synthetic a:Ll/ydq0;

.field public final synthetic b:Ll/w2c0;


# direct methods
.method public constructor <init>(Ll/ydq0;Ll/w2c0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ydq0$a;->a:Ll/ydq0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ydq0$a;->b:Ll/w2c0;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ydq0$a;->a:Ll/ydq0;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/ydq0;->n()Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderBaseView;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderBaseView;->h()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/ydq0$a;->b:Ll/w2c0;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/w2c0;->E()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
