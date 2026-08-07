.class public final synthetic Ll/qhh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic b:Landroid/widget/FrameLayout;

.field public final synthetic c:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field public final synthetic d:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/atomic/AtomicBoolean;Landroid/widget/FrameLayout;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qhh0;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p2, p0, Ll/qhh0;->b:Landroid/widget/FrameLayout;

    iput-object p3, p0, Ll/qhh0;->c:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    iput-object p4, p0, Ll/qhh0;->d:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qhh0;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v1, p0, Ll/qhh0;->b:Landroid/widget/FrameLayout;

    iget-object v2, p0, Ll/qhh0;->c:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    iget-object p0, p0, Ll/qhh0;->d:Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, p0}, Ll/uih0;->L(Ljava/util/concurrent/atomic/AtomicBoolean;Landroid/widget/FrameLayout;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Ljava/lang/Runnable;)V

    return-void
.end method
