.class final Le/e/a/ShortImages$Subscription;
.super Ljava/lang/Object;
.source "ShortImages.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ShortImages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Subscription"
.end annotation


# instance fields
.field final job:Le/e/a/ShortImages$Job;

.field final placeholder:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field final target:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/widget/ImageView;Landroid/widget/TextView;Le/e/a/ShortImages$Job;)V
    .registers 5
    .param p1, "target"    # Landroid/widget/ImageView;
    .param p2, "placeholder"    # Landroid/widget/TextView;
    .param p3, "job"    # Le/e/a/ShortImages$Job;

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/ShortImages$Subscription;->target:Ljava/lang/ref/WeakReference;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/ShortImages$Subscription;->placeholder:Ljava/lang/ref/WeakReference;

    iput-object p3, p0, Le/e/a/ShortImages$Subscription;->job:Le/e/a/ShortImages$Job;

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .line 78
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .line 79
    iget-object v0, p0, Le/e/a/ShortImages$Subscription;->job:Le/e/a/ShortImages$Job;

    # invokes: Le/e/a/ShortImages;->remove(Le/e/a/ShortImages$Job;Le/e/a/ShortImages$Subscription;)V
    invoke-static {v0, p0}, Le/e/a/ShortImages;->access$000(Le/e/a/ShortImages$Job;Le/e/a/ShortImages$Subscription;)V

    return-void
.end method
