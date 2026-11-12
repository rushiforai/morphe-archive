.class public final Ln4h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public a:I

.field public b:I

.field public final synthetic c:Lshf;


# direct methods
.method public constructor <init>(Lshf;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln4h;->c:Lshf;

    const/4 p1, -0x1

    iput p1, p0, Ln4h;->a:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget v0, p0, Ln4h;->a:I

    iget-object v1, p0, Ln4h;->c:Lshf;

    iget-object v2, v1, Lshf;->a:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/ToolbarProgressBar;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/opera/android/custom_views/SmoothProgressBar;->a:Z

    invoke-virtual {v2, v0}, Lcom/opera/android/custom_views/ToolbarProgressBar;->setProgress(I)V

    iget v0, p0, Ln4h;->b:I

    if-lez v0, :cond_1c

    iget-object v1, v1, Lshf;->a:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/ToolbarProgressBar;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/opera/android/custom_views/SmoothProgressBar;->a:Z

    invoke-virtual {v1, v0}, Lcom/opera/android/custom_views/ToolbarProgressBar;->setProgress(I)V

    :cond_1c
    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 v0, -0x1

    iput v0, p0, Ln4h;->a:I

    iput v3, p0, Ln4h;->b:I

    return-void
.end method
