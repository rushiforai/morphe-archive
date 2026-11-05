.class Le/e/a/CommentSettings194$Editor$14;
.super Landroid/widget/ArrayAdapter;
.source "CommentSettings194.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/CommentSettings194$Editor;->select([Ljava/lang/String;ILe/e/a/CommentSettings194$Editor$Choice;)Landroid/widget/Spinner;
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
.field final synthetic this$1:Le/e/a/CommentSettings194$Editor;


# direct methods
.method constructor <init>(Le/e/a/CommentSettings194$Editor;Landroid/content/Context;I[Ljava/lang/String;)V
    .registers 5

    .line 337
    iput-object p1, p0, Le/e/a/CommentSettings194$Editor$14;->this$1:Le/e/a/CommentSettings194$Editor;

    invoke-direct {p0, p2, p3, p4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 7

    .line 340
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    .line 341
    iget-object p2, p0, Le/e/a/CommentSettings194$Editor$14;->this$1:Le/e/a/CommentSettings194$Editor;

    iget-object p2, p2, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {p2}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 342
    iget-object p2, p0, Le/e/a/CommentSettings194$Editor$14;->this$1:Le/e/a/CommentSettings194$Editor;

    iget-object p2, p2, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {p2}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 343
    iget-object p2, p0, Le/e/a/CommentSettings194$Editor$14;->this$1:Le/e/a/CommentSettings194$Editor;

    const/16 p3, 0xc

    invoke-virtual {p2, p3}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result p2

    iget-object v0, p0, Le/e/a/CommentSettings194$Editor$14;->this$1:Le/e/a/CommentSettings194$Editor;

    invoke-virtual {v0, p3}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v0

    iget-object v1, p0, Le/e/a/CommentSettings194$Editor$14;->this$1:Le/e/a/CommentSettings194$Editor;

    invoke-virtual {v1, p3}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v1

    iget-object v2, p0, Le/e/a/CommentSettings194$Editor$14;->this$1:Le/e/a/CommentSettings194$Editor;

    invoke-virtual {v2, p3}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result p3

    invoke-virtual {p1, p2, v0, v1, p3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 344
    invoke-static {p1}, Le/e/a/Revision196;->centered(Landroid/widget/TextView;)V

    return-object p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 4

    .line 349
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    .line 350
    const/high16 p2, 0x41300000    # 11.0f

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 351
    iget-object p2, p0, Le/e/a/CommentSettings194$Editor$14;->this$1:Le/e/a/CommentSettings194$Editor;

    iget-object p2, p2, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {p2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 352
    iget-object p2, p0, Le/e/a/CommentSettings194$Editor$14;->this$1:Le/e/a/CommentSettings194$Editor;

    const/4 p3, 0x3

    invoke-virtual {p2, p3}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result p2

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3, p3, p3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 353
    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 354
    invoke-static {p1}, Le/e/a/Revision196;->centered(Landroid/widget/TextView;)V

    return-object p1
.end method
