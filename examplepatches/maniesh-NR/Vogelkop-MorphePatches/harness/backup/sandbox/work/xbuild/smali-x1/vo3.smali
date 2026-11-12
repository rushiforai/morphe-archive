.class public final Lvo3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lxj;

.field public final b:Lso3;

.field public final c:Landroid/widget/FrameLayout;

.field public final synthetic d:Lwo3;


# direct methods
.method public constructor <init>(Lwo3;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvo3;->d:Lwo3;

    iget-object v0, p1, Lwo3;->B:Lxj;

    iput-object v0, p0, Lvo3;->a:Lxj;

    new-instance v0, Lso3;

    const/4 v1, 0x5

    invoke-direct {v0, p1, v1}, Lso3;-><init>(Lwo3;B)V

    iput-object v0, p0, Lvo3;->b:Lso3;

    new-instance v0, Landroid/widget/FrameLayout;

    iget-object v1, p1, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    iget-object p1, p1, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iput-object v0, p0, Lvo3;->c:Landroid/widget/FrameLayout;

    return-void
.end method
