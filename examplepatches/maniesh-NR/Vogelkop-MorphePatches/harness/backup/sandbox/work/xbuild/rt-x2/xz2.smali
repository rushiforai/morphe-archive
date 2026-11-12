.class public final Lxz2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnDrawListener;


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/view/View;Lh3l;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lxz2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lxz2;->c:Ljava/lang/Object;

    iput-object p1, p0, Lxz2;->d:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    return-void
.end method

.method public constructor <init>(Lyz2;Lcom/opera/android/browser/OperaPageRootView;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lxz2;->a:B

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lxz2;->c:Ljava/lang/Object;

    iput-object p1, p0, Lxz2;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onDraw()V
    .registers 4

    iget-byte v0, p0, Lxz2;->a:B

    iget-object v1, p0, Lxz2;->d:Ljava/lang/Object;

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_3a

    iget-boolean v0, p0, Lxz2;->b:Z

    if-nez v0, :cond_1a

    iput-boolean v2, p0, Lxz2;->b:Z

    check-cast v1, Landroid/view/View;

    new-instance v0, Lqlk;

    const/16 v2, 0x18

    invoke-direct {v0, p0, v2}, Lqlk;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_1a
    return-void

    :pswitch_1b
    iget-boolean v0, p0, Lxz2;->b:Z

    if-nez v0, :cond_38

    iput-boolean v2, p0, Lxz2;->b:Z

    check-cast v1, Lyz2;

    iget-object v0, v1, Lzz2;->c:Ljava/lang/Object;

    check-cast v0, Loml;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    iget-object v0, p0, Lxz2;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/OperaPageRootView;

    new-instance v1, Lfv2;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    :cond_38
    return-void

    nop

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method
