.class final Le/e/a/Following190$UserRows;
.super Landroid/widget/BaseAdapter;
.source "Following190.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Following190;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "UserRows"
.end annotation


# instance fields
.field final original:Landroid/widget/ListAdapter;


# direct methods
.method constructor <init>(Landroid/widget/ListAdapter;)V
    .registers 3

    .line 47
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object p1, p0, Le/e/a/Following190$UserRows;->original:Landroid/widget/ListAdapter;

    new-instance v0, Le/e/a/Following190$UserRows$1;

    invoke-direct {v0, p0}, Le/e/a/Following190$UserRows$1;-><init>(Le/e/a/Following190$UserRows;)V

    invoke-interface {p1, v0}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .registers 2

    .line 47
    iget-object v0, p0, Le/e/a/Following190$UserRows;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->areAllItemsEnabled()Z

    move-result v0

    return v0
.end method

.method public getCount()I
    .registers 2

    .line 47
    iget-object v0, p0, Le/e/a/Following190$UserRows;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3

    .line 47
    iget-object v0, p0, Le/e/a/Following190$UserRows;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .registers 4

    .line 47
    iget-object v0, p0, Le/e/a/Following190$UserRows;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .registers 3

    .line 47
    iget-object v0, p0, Le/e/a/Following190$UserRows;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result p1

    return p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5

    .line 47
    iget-object v0, p0, Le/e/a/Following190$UserRows;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1, p2, p3}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Le/e/a/Following190;->sizeRow(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    if-eqz p2, :cond_15

    const/4 p3, -0x2

    iput p3, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_15
    instance-of p2, p1, Landroid/widget/LinearLayout;

    if-eqz p2, :cond_21

    move-object p2, p1

    check-cast p2, Landroid/widget/LinearLayout;

    const/16 p3, 0x10

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->setGravity(I)V

    :cond_21
    invoke-static {p1}, Le/e/a/Following190;->style(Landroid/view/View;)V

    return-object p1
.end method

.method public getViewTypeCount()I
    .registers 2

    .line 47
    iget-object v0, p0, Le/e/a/Following190$UserRows;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getViewTypeCount()I

    move-result v0

    return v0
.end method

.method public isEnabled(I)Z
    .registers 3

    .line 47
    iget-object v0, p0, Le/e/a/Following190$UserRows;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result p1

    return p1
.end method
