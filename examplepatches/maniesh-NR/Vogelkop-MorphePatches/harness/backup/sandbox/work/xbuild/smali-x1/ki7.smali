.class public final Lki7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# instance fields
.field public final synthetic a:Llqh;

.field public final synthetic b:Lkotlin/jvm/functions/Function0;

.field public final synthetic c:Llqh;


# direct methods
.method public constructor <init>(Llqh;Lkotlin/jvm/functions/Function0;Llqh;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lki7;->a:Llqh;

    iput-object p2, p0, Lki7;->b:Lkotlin/jvm/functions/Function0;

    iput-object p3, p0, Lki7;->c:Llqh;

    return-void
.end method


# virtual methods
.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2

    iget-object p0, p0, Lki7;->c:Llqh;

    const/4 p1, 0x1

    iput-boolean p1, p0, Llqh;->a:Z

    return-void
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 2

    iget-object p1, p0, Lki7;->a:Llqh;

    iget-boolean p1, p1, Llqh;->a:Z

    if-nez p1, :cond_b

    iget-object p0, p0, Lki7;->b:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    :cond_b
    return-void
.end method

.method public final onAnimationRepeat(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method
