.class Le/e/a/VideoDetails$1;
.super Ljava/lang/Object;
.source "VideoDetails.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/VideoDetails;->loadSeries(Landroid/widget/LinearLayout;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$box:Landroid/widget/LinearLayout;

.field private final synthetic val$id:Ljava/lang/String;

.field private final synthetic val$loading:Landroid/widget/TextView;

.field private final synthetic val$task:Le/e/a/NetworkTask;


# direct methods
.method constructor <init>(Le/e/a/NetworkTask;Landroid/widget/TextView;Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .registers 5

    .line 13
    iput-object p1, p0, Le/e/a/VideoDetails$1;->val$task:Le/e/a/NetworkTask;

    iput-object p2, p0, Le/e/a/VideoDetails$1;->val$loading:Landroid/widget/TextView;

    iput-object p3, p0, Le/e/a/VideoDetails$1;->val$box:Landroid/widget/LinearLayout;

    iput-object p4, p0, Le/e/a/VideoDetails$1;->val$id:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    .line 13
    iget-object p1, p0, Le/e/a/VideoDetails$1;->val$task:Le/e/a/NetworkTask;

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p1

    if-eqz p1, :cond_1c

    iget-object p1, p0, Le/e/a/VideoDetails$1;->val$loading:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_1c

    iget-object p1, p0, Le/e/a/VideoDetails$1;->val$box:Landroid/widget/LinearLayout;

    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-object p1, p0, Le/e/a/VideoDetails$1;->val$box:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le/e/a/VideoDetails$1;->val$id:Ljava/lang/String;

    # invokes: Le/e/a/VideoDetails;->loadSeries(Landroid/widget/LinearLayout;Ljava/lang/String;)V
    invoke-static {p1, v0}, Le/e/a/VideoDetails;->access$7(Landroid/widget/LinearLayout;Ljava/lang/String;)V

    :cond_1c
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 13
    return-void
.end method
