.class public Ll/qnp0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qnp0;->f1(Landroid/view/View;)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:[Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Ll/gcg0;


# direct methods
.method public constructor <init>([Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/View;Ll/gcg0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/qnp0$b;->a:[Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 2
    .line 3
    iput-object p2, p0, Ll/qnp0$b;->b:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Ll/qnp0$b;->c:Ll/gcg0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/qnp0$b;->a:[Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget-object p1, p1, v0

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Ll/qnp0$b;->b:Landroid/view/View;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object v1, p0, Ll/qnp0$b;->a:[Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 15
    .line 16
    aget-object v0, v1, v0

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/qnp0$b;->c:Ll/gcg0;

    .line 22
    .line 23
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p1, p0, Ll/qnp0$b;->b:Landroid/view/View;

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
