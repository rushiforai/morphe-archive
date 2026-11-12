.class public final Lzk9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# instance fields
.field public a:I

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Lld9;


# direct methods
.method public constructor <init>(Lnrl;Landroid/view/View;Lld9;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lzk9;->b:Landroid/view/View;

    iput-object p3, p0, Lzk9;->c:Lld9;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 2

    iget p1, p0, Lzk9;->a:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lzk9;->a:I

    if-nez p1, :cond_f

    iget-object p1, p0, Lzk9;->b:Landroid/view/View;

    iget-object p0, p0, Lzk9;->c:Lld9;

    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_f
    return-void
.end method

.method public final onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2

    return-void
.end method

.method public final onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2

    iget p1, p0, Lzk9;->a:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lzk9;->a:I

    return-void
.end method
