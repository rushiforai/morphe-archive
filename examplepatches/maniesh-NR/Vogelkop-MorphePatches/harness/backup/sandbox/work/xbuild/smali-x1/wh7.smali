.class public final Lwh7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxh7;

.field public final synthetic c:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lxh7;Landroid/view/View;B)V
    .registers 4

    iput-byte p3, p0, Lwh7;->a:B

    iput-object p1, p0, Lwh7;->b:Lxh7;

    iput-object p2, p0, Lwh7;->c:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final b(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final c(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final d(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final e(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final f(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2

    iget-byte p0, p0, Lwh7;->a:B

    return-void
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    iget-byte p1, p0, Lwh7;->a:B

    iget-object v0, p0, Lwh7;->c:Landroid/view/View;

    iget-object p0, p0, Lwh7;->b:Lxh7;

    packed-switch p1, :pswitch_data_20

    iget-object p1, p0, Lxh7;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/LinkedHashMap;

    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lxh7;->c()V

    return-void

    :pswitch_14
    iget-object p1, p0, Lxh7;->d:Ljava/lang/Object;

    check-cast p1, Ljava/util/LinkedHashMap;

    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lxh7;->c()V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method

.method public final onAnimationRepeat(Landroid/animation/Animator;)V
    .registers 2

    iget-byte p0, p0, Lwh7;->a:B

    return-void
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .registers 2

    iget-byte p0, p0, Lwh7;->a:B

    return-void
.end method
