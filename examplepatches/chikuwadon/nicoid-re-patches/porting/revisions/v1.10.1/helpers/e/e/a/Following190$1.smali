.class Le/e/a/Following190$1;
.super Ljava/lang/Object;
.source "Following190.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/Following190;->attach(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$loading:[Le/e/a/NetworkTask;

.field private final synthetic val$rows:[Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>([Le/e/a/NetworkTask;[Landroid/widget/LinearLayout;)V
    .registers 3

    .line 30
    iput-object p1, p0, Le/e/a/Following190$1;->val$loading:[Le/e/a/NetworkTask;

    iput-object p2, p0, Le/e/a/Following190$1;->val$rows:[Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 30
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 3

    .line 30
    iget-object p1, p0, Le/e/a/Following190$1;->val$loading:[Le/e/a/NetworkTask;

    const/4 v0, 0x0

    aget-object p1, p1, v0

    if-eqz p1, :cond_a

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancel()V

    :cond_a
    iget-object p1, p0, Le/e/a/Following190$1;->val$rows:[Landroid/widget/LinearLayout;

    const/4 v0, 0x2

    aget-object p1, p1, v0

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object p1

    instance-of p1, p1, Le/e/a/NetworkTask;

    if-eqz p1, :cond_24

    iget-object p1, p0, Le/e/a/Following190$1;->val$rows:[Landroid/widget/LinearLayout;

    aget-object p1, p1, v0

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/NetworkTask;

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancel()V

    :cond_24
    return-void
.end method
