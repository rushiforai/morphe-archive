.class final Le/e/a/Ranking190$CategoryRows;
.super Landroid/widget/BaseAdapter;
.source "Ranking190.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Ranking190;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "CategoryRows"
.end annotation


# instance fields
.field final original:Landroid/widget/ListAdapter;


# direct methods
.method constructor <init>(Landroid/widget/ListAdapter;)V
    .registers 3

    .line 62
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$CategoryRows;->original:Landroid/widget/ListAdapter;

    new-instance v0, Le/e/a/Ranking190$CategoryRows$1;

    invoke-direct {v0, p0}, Le/e/a/Ranking190$CategoryRows$1;-><init>(Le/e/a/Ranking190$CategoryRows;)V

    invoke-interface {p1, v0}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .registers 2

    .line 62
    iget-object v0, p0, Le/e/a/Ranking190$CategoryRows;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->areAllItemsEnabled()Z

    move-result v0

    return v0
.end method

.method public getCount()I
    .registers 2

    .line 62
    iget-object v0, p0, Le/e/a/Ranking190$CategoryRows;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3

    .line 62
    iget-object v0, p0, Le/e/a/Ranking190$CategoryRows;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .registers 4

    .line 62
    iget-object v0, p0, Le/e/a/Ranking190$CategoryRows;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .registers 3

    .line 62
    iget-object v0, p0, Le/e/a/Ranking190$CategoryRows;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result p1

    return p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 8

    .line 62
    iget-object v0, p0, Le/e/a/Ranking190$CategoryRows;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1, p2, p3}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    invoke-static {p2}, Le/e/a/Ranking190;->titleView(Landroid/view/View;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {p0, p1}, Le/e/a/Ranking190$CategoryRows;->getItem(I)Ljava/lang/Object;

    if-eqz v0, :cond_36

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Le/e/a/Ranking190$CategoryRows;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne p1, v2, :cond_36

    new-instance p1, Le/e/a/UiGlyph190;

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "editor"

    invoke-direct {p1, v2, v3}, Le/e/a/UiGlyph190;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, p1, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    const/16 p3, 0xc

    invoke-static {p1, p3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    :cond_36
    return-object p2
.end method

.method public getViewTypeCount()I
    .registers 2

    .line 62
    iget-object v0, p0, Le/e/a/Ranking190$CategoryRows;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getViewTypeCount()I

    move-result v0

    return v0
.end method

.method public isEnabled(I)Z
    .registers 3

    .line 62
    iget-object v0, p0, Le/e/a/Ranking190$CategoryRows;->original:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result p1

    return p1
.end method
