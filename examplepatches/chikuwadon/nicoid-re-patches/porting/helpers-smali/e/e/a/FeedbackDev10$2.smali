.class Le/e/a/FeedbackDev10$2;
.super Ljava/lang/Object;
.source "FeedbackDev10.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/FeedbackDev10;->installNg(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$list:Landroid/widget/ListView;

.field final synthetic val$manager:Ljava/lang/Object;

.field final synthetic val$nativeAdapter:Landroid/widget/BaseAdapter;


# direct methods
.method constructor <init>(Landroid/widget/ListView;Landroid/widget/BaseAdapter;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 114
    iput-object p1, p0, Le/e/a/FeedbackDev10$2;->val$list:Landroid/widget/ListView;

    iput-object p2, p0, Le/e/a/FeedbackDev10$2;->val$nativeAdapter:Landroid/widget/BaseAdapter;

    iput-object p3, p0, Le/e/a/FeedbackDev10$2;->val$manager:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 4

    .line 114
    iget-object p1, p0, Le/e/a/FeedbackDev10$2;->val$list:Landroid/widget/ListView;

    iget-object v0, p0, Le/e/a/FeedbackDev10$2;->val$nativeAdapter:Landroid/widget/BaseAdapter;

    iget-object v1, p0, Le/e/a/FeedbackDev10$2;->val$manager:Ljava/lang/Object;

    invoke-static {p1, v0, v1}, Le/e/a/FeedbackDev10;->refreshNg(Landroid/widget/ListView;Landroid/widget/BaseAdapter;Ljava/lang/Object;)V

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 114
    return-void
.end method
