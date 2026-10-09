.class Le/e/a/ContentFilter$1;
.super Landroid/widget/ArrayAdapter;
.source "ContentFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/ContentFilter;->lambda$12(Landroid/content/Context;[ILandroid/widget/Button;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private final synthetic val$c:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;I[Ljava/lang/String;Landroid/content/Context;)V
    .registers 5

    .line 18
    iput-object p4, p0, Le/e/a/ContentFilter$1;->val$c:Landroid/content/Context;

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 4

    .line 18
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    instance-of p2, p1, Landroid/widget/TextView;

    if-eqz p2, :cond_14

    move-object p2, p1

    check-cast p2, Landroid/widget/TextView;

    iget-object p3, p0, Le/e/a/ContentFilter$1;->val$c:Landroid/content/Context;

    invoke-static {p3}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_14
    return-object p1
.end method
