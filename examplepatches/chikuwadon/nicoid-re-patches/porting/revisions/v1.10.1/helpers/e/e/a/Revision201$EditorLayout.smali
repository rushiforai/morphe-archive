.class final Le/e/a/Revision201$EditorLayout;
.super Ljava/lang/Object;
.source "Revision201.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Revision201;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "EditorLayout"
.end annotation


# instance fields
.field body:Landroid/widget/LinearLayout;

.field changing:Z

.field final controls:Landroid/view/View;

.field left:Landroid/widget/LinearLayout;

.field final preview:Landroid/view/View;

.field final root:Landroid/widget/LinearLayout;

.field final scroll:Landroid/widget/ScrollView;

.field wide:Z


# direct methods
.method constructor <init>(Landroid/widget/LinearLayout;Landroid/view/View;Landroid/view/View;)V
    .registers 4

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    iput-object p2, p0, Le/e/a/Revision201$EditorLayout;->preview:Landroid/view/View;

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result p2

    add-int/lit8 p2, p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Le/e/a/Revision201$EditorLayout;->controls:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/widget/ScrollView;

    iput-object p1, p0, Le/e/a/Revision201$EditorLayout;->scroll:Landroid/widget/ScrollView;

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 10

    .line 115
    invoke-virtual {p0}, Le/e/a/Revision201$EditorLayout;->run()V

    return-void
.end method

.method public run()V
    .registers 11

    .line 111
    iget-boolean v0, p0, Le/e/a/Revision201$EditorLayout;->changing:Z

    if-nez v0, :cond_14b

    iget-object v0, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v0

    if-eqz v0, :cond_14b

    iget-object v0, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v0

    if-nez v0, :cond_16

    goto/16 :goto_14b

    :cond_16
    iget-object v0, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iget-object v1, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v0

    const/high16 v2, 0x44340000    # 720.0f

    const/4 v3, 0x1

    const/4 v4, 0x0

    cmpl-float v1, v1, v2

    if-gez v1, :cond_58

    iget-object v1, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v0

    const/high16 v0, 0x43f00000    # 480.0f

    cmpl-float v0, v1, v0

    if-ltz v0, :cond_56

    iget-object v0, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x3fa00000    # 1.25f

    mul-float v1, v1, v2

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_58

    :cond_56
    const/4 v0, 0x0

    goto :goto_59

    :cond_58
    const/4 v0, 0x1

    :goto_59
    iget-boolean v1, p0, Le/e/a/Revision201$EditorLayout;->wide:Z

    if-ne v0, v1, :cond_5e

    return-void

    :cond_5e
    iput-boolean v3, p0, Le/e/a/Revision201$EditorLayout;->changing:Z

    .line 112
    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, -0x2

    const/4 v5, -0x1

    if-eqz v0, :cond_f0

    :try_start_66
    iget-object v6, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    iget-object v7, p0, Le/e/a/Revision201$EditorLayout;->preview:Landroid/view/View;

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v6

    iget-object v7, p0, Le/e/a/Revision201$EditorLayout;->preview:Landroid/view/View;

    invoke-static {v7}, Le/e/a/Revision201;->detach(Landroid/view/View;)V

    iget-object v7, p0, Le/e/a/Revision201$EditorLayout;->controls:Landroid/view/View;

    invoke-static {v7}, Le/e/a/Revision201;->detach(Landroid/view/View;)V

    iget-object v7, p0, Le/e/a/Revision201$EditorLayout;->scroll:Landroid/widget/ScrollView;

    invoke-static {v7}, Le/e/a/Revision201;->detach(Landroid/view/View;)V

    new-instance v7, Landroid/widget/LinearLayout;

    iget-object v8, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v8}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Le/e/a/Revision201$EditorLayout;->body:Landroid/widget/LinearLayout;

    iget-object v7, p0, Le/e/a/Revision201$EditorLayout;->body:Landroid/widget/LinearLayout;

    const-string v8, "comment-editor-columns"

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    iget-object v7, p0, Le/e/a/Revision201$EditorLayout;->body:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v7, Landroid/widget/LinearLayout;

    iget-object v8, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v8}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Le/e/a/Revision201$EditorLayout;->left:Landroid/widget/LinearLayout;

    iget-object v7, p0, Le/e/a/Revision201$EditorLayout;->left:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v7, p0, Le/e/a/Revision201$EditorLayout;->left:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v3, p0, Le/e/a/Revision201$EditorLayout;->left:Landroid/widget/LinearLayout;

    iget-object v7, p0, Le/e/a/Revision201$EditorLayout;->preview:Landroid/view/View;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v5, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, p0, Le/e/a/Revision201$EditorLayout;->left:Landroid/widget/LinearLayout;

    iget-object v7, p0, Le/e/a/Revision201$EditorLayout;->controls:Landroid/view/View;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v5, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Le/e/a/Revision201$EditorLayout;->body:Landroid/widget/LinearLayout;

    iget-object v3, p0, Le/e/a/Revision201$EditorLayout;->left:Landroid/widget/LinearLayout;

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const v8, 0x3ee147ae    # 0.44f

    invoke-direct {v7, v4, v5, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Le/e/a/Revision201$EditorLayout;->body:Landroid/widget/LinearLayout;

    iget-object v3, p0, Le/e/a/Revision201$EditorLayout;->scroll:Landroid/widget/ScrollView;

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const v8, 0x3f0f5c29    # 0.56f

    invoke-direct {v7, v4, v5, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    iget-object v3, p0, Le/e/a/Revision201$EditorLayout;->body:Landroid/widget/LinearLayout;

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v5, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v3, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_13d

    .line 113
    :cond_f0
    iget-object v6, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    iget-object v7, p0, Le/e/a/Revision201$EditorLayout;->body:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v6

    iget-object v7, p0, Le/e/a/Revision201$EditorLayout;->preview:Landroid/view/View;

    invoke-static {v7}, Le/e/a/Revision201;->detach(Landroid/view/View;)V

    iget-object v7, p0, Le/e/a/Revision201$EditorLayout;->controls:Landroid/view/View;

    invoke-static {v7}, Le/e/a/Revision201;->detach(Landroid/view/View;)V

    iget-object v7, p0, Le/e/a/Revision201$EditorLayout;->scroll:Landroid/widget/ScrollView;

    invoke-static {v7}, Le/e/a/Revision201;->detach(Landroid/view/View;)V

    iget-object v7, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    iget-object v8, p0, Le/e/a/Revision201$EditorLayout;->body:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v5, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput v3, v7, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iget-object v3, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    iget-object v8, p0, Le/e/a/Revision201$EditorLayout;->preview:Landroid/view/View;

    invoke-virtual {v3, v8, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    iget-object v7, p0, Le/e/a/Revision201$EditorLayout;->controls:Landroid/view/View;

    add-int/lit8 v8, v6, 0x1

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v5, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v7, v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Le/e/a/Revision201$EditorLayout;->root:Landroid/widget/LinearLayout;

    iget-object v3, p0, Le/e/a/Revision201$EditorLayout;->scroll:Landroid/widget/ScrollView;

    add-int/lit8 v6, v6, 0x2

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v5, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v3, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    const/4 v1, 0x0

    iput-object v1, p0, Le/e/a/Revision201$EditorLayout;->body:Landroid/widget/LinearLayout;

    iput-object v1, p0, Le/e/a/Revision201$EditorLayout;->left:Landroid/widget/LinearLayout;

    :goto_13d
    iput-boolean v0, p0, Le/e/a/Revision201$EditorLayout;->wide:Z

    iget-object v0, p0, Le/e/a/Revision201$EditorLayout;->preview:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V
    :try_end_144
    .catchall {:try_start_66 .. :try_end_144} :catchall_147

    .line 114
    iput-boolean v4, p0, Le/e/a/Revision201$EditorLayout;->changing:Z

    return-void

    :catchall_147
    move-exception v0

    iput-boolean v4, p0, Le/e/a/Revision201$EditorLayout;->changing:Z

    throw v0

    .line 111
    :cond_14b
    :goto_14b
    return-void
.end method
