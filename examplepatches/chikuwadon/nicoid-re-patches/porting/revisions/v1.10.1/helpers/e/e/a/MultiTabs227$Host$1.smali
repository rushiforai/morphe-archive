.class Le/e/a/MultiTabs227$Host$1;
.super Ljava/lang/Object;
.source "MultiTabs227.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/MultiTabs227$Host;->restoreScroll(Ljava/lang/Object;Le/e/a/SavedTabs227$Tab;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/MultiTabs227$Host;

.field private final synthetic val$fragment:Ljava/lang/Object;

.field private final synthetic val$list:Landroid/widget/ListView;

.field private final synthetic val$t:Le/e/a/SavedTabs227$Tab;


# direct methods
.method constructor <init>(Le/e/a/MultiTabs227$Host;Ljava/lang/Object;Landroid/widget/ListView;Le/e/a/SavedTabs227$Tab;)V
    .registers 5

    .line 58
    iput-object p1, p0, Le/e/a/MultiTabs227$Host$1;->this$1:Le/e/a/MultiTabs227$Host;

    iput-object p2, p0, Le/e/a/MultiTabs227$Host$1;->val$fragment:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/MultiTabs227$Host$1;->val$list:Landroid/widget/ListView;

    iput-object p4, p0, Le/e/a/MultiTabs227$Host$1;->val$t:Le/e/a/SavedTabs227$Tab;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 10

    .line 58
    iget-object p1, p0, Le/e/a/MultiTabs227$Host$1;->this$1:Le/e/a/MultiTabs227$Host;

    iget-object p1, p1, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    iget-object p2, p0, Le/e/a/MultiTabs227$Host$1;->val$fragment:Ljava/lang/Object;

    if-ne p1, p2, :cond_36

    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result p1

    if-nez p1, :cond_f

    goto :goto_36

    :cond_f
    iget-object p1, p0, Le/e/a/MultiTabs227$Host$1;->val$list:Landroid/widget/ListView;

    invoke-virtual {p1}, Landroid/widget/ListView;->getCount()I

    move-result p1

    if-lez p1, :cond_35

    iget-object p1, p0, Le/e/a/MultiTabs227$Host$1;->val$list:Landroid/widget/ListView;

    iget-object p2, p0, Le/e/a/MultiTabs227$Host$1;->val$t:Le/e/a/SavedTabs227$Tab;

    iget p2, p2, Le/e/a/SavedTabs227$Tab;->position:I

    iget-object p3, p0, Le/e/a/MultiTabs227$Host$1;->val$list:Landroid/widget/ListView;

    invoke-virtual {p3}, Landroid/widget/ListView;->getCount()I

    move-result p3

    add-int/lit8 p3, p3, -0x1

    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    move-result p2

    iget-object p3, p0, Le/e/a/MultiTabs227$Host$1;->val$t:Le/e/a/SavedTabs227$Tab;

    iget p3, p3, Le/e/a/SavedTabs227$Tab;->top:I

    invoke-virtual {p1, p2, p3}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    iget-object p1, p0, Le/e/a/MultiTabs227$Host$1;->val$list:Landroid/widget/ListView;

    invoke-virtual {p1, p0}, Landroid/widget/ListView;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :cond_35
    return-void

    :cond_36
    :goto_36
    iget-object p1, p0, Le/e/a/MultiTabs227$Host$1;->val$list:Landroid/widget/ListView;

    invoke-virtual {p1, p0}, Landroid/widget/ListView;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method
