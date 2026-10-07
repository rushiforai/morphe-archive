.class final Le/e/a/ThemeChoice$ThemedSpinner;
.super Landroid/widget/BaseAdapter;
.source "ThemeChoice.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ThemeChoice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ThemedSpinner"
.end annotation


# instance fields
.field final context:Landroid/content/Context;

.field final original:Landroid/widget/SpinnerAdapter;


# direct methods
.method constructor <init>(Landroid/widget/SpinnerAdapter;Landroid/content/Context;)V
    .registers 3

    .line 118
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object p1, p0, Le/e/a/ThemeChoice$ThemedSpinner;->original:Landroid/widget/SpinnerAdapter;

    iput-object p2, p0, Le/e/a/ThemeChoice$ThemedSpinner;->context:Landroid/content/Context;

    new-instance p2, Le/e/a/ThemeChoice$ThemedSpinner$1;

    invoke-direct {p2, p0}, Le/e/a/ThemeChoice$ThemedSpinner$1;-><init>(Le/e/a/ThemeChoice$ThemedSpinner;)V

    invoke-interface {p1, p2}, Landroid/widget/SpinnerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .line 119
    iget-object v0, p0, Le/e/a/ThemeChoice$ThemedSpinner;->original:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5

    .line 121
    iget-object v0, p0, Le/e/a/ThemeChoice$ThemedSpinner;->original:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1, p2, p3}, Landroid/widget/SpinnerAdapter;->getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Le/e/a/ThemeChoice;->tree(Landroid/view/View;)V

    invoke-static {p1}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    return-object p1
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3

    .line 119
    iget-object v0, p0, Le/e/a/ThemeChoice$ThemedSpinner;->original:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1}, Landroid/widget/SpinnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .registers 4

    .line 119
    iget-object v0, p0, Le/e/a/ThemeChoice$ThemedSpinner;->original:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1}, Landroid/widget/SpinnerAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5

    .line 120
    iget-object v0, p0, Le/e/a/ThemeChoice$ThemedSpinner;->original:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1, p2, p3}, Landroid/widget/SpinnerAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Le/e/a/ThemeChoice;->tree(Landroid/view/View;)V

    return-object p1
.end method

.method public hasStableIds()Z
    .registers 2

    .line 119
    iget-object v0, p0, Le/e/a/ThemeChoice$ThemedSpinner;->original:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0}, Landroid/widget/SpinnerAdapter;->hasStableIds()Z

    move-result v0

    return v0
.end method
