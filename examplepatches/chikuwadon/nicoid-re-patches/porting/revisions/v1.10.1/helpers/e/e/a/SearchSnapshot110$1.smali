.class Le/e/a/SearchSnapshot110$1;
.super Landroid/widget/BaseAdapter;
.source "SearchSnapshot110.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/SearchSnapshot110;->sortControl(Landroid/content/Context;Landroid/view/View;Landroid/content/SharedPreferences;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$original:Landroid/widget/SpinnerAdapter;

.field private final synthetic val$p:Landroid/content/SharedPreferences;


# direct methods
.method constructor <init>(Landroid/widget/SpinnerAdapter;Landroid/content/SharedPreferences;)V
    .registers 3

    .line 12
    iput-object p1, p0, Le/e/a/SearchSnapshot110$1;->val$original:Landroid/widget/SpinnerAdapter;

    iput-object p2, p0, Le/e/a/SearchSnapshot110$1;->val$p:Landroid/content/SharedPreferences;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .registers 2

    .line 12
    const/4 v0, 0x0

    return v0
.end method

.method public getCount()I
    .registers 2

    .line 12
    iget-object v0, p0, Le/e/a/SearchSnapshot110$1;->val$original:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5

    .line 12
    iget-object v0, p0, Le/e/a/SearchSnapshot110$1;->val$original:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1, p2, p3}, Landroid/widget/SpinnerAdapter;->getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p0, p1}, Le/e/a/SearchSnapshot110$1;->isEnabled(I)Z

    move-result p3

    invoke-virtual {p2, p3}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p0, p1}, Le/e/a/SearchSnapshot110$1;->isEnabled(I)Z

    move-result p1

    if-eqz p1, :cond_16

    const/high16 p1, 0x3f800000    # 1.0f

    goto :goto_19

    :cond_16
    const p1, 0x3ecccccd    # 0.4f

    :goto_19
    invoke-virtual {p2, p1}, Landroid/view/View;->setAlpha(F)V

    return-object p2
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3

    .line 12
    iget-object v0, p0, Le/e/a/SearchSnapshot110$1;->val$original:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1}, Landroid/widget/SpinnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .registers 4

    .line 12
    iget-object v0, p0, Le/e/a/SearchSnapshot110$1;->val$original:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1}, Landroid/widget/SpinnerAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5

    .line 12
    iget-object v0, p0, Le/e/a/SearchSnapshot110$1;->val$original:Landroid/widget/SpinnerAdapter;

    invoke-interface {v0, p1, p2, p3}, Landroid/widget/SpinnerAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public isEnabled(I)Z
    .registers 4

    .line 12
    const/16 v0, 0xc

    if-ne p1, v0, :cond_24

    iget-object p1, p0, Le/e/a/SearchSnapshot110$1;->val$p:Landroid/content/SharedPreferences;

    const-string v0, "nicoidMinViews"

    const-string v1, ""

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_22

    iget-object p1, p0, Le/e/a/SearchSnapshot110$1;->val$p:Landroid/content/SharedPreferences;

    const-string v0, "nicoidMaxViews"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_24

    :cond_22
    const/4 p1, 0x0

    return p1

    :cond_24
    const/4 p1, 0x1

    return p1
.end method
