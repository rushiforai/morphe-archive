.class final Le/e/a/DragRows120;
.super Ljava/lang/Object;
.source "DragRows120.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/DragRows120$Drop;,
        Le/e/a/DragRows120$Token;
    }
.end annotation


# instance fields
.field dragging:Z

.field final drop:Le/e/a/DragRows120$Drop;

.field final scope:Ljava/lang/Object;

.field final scroll:Landroid/widget/ScrollView;


# direct methods
.method constructor <init>(Landroid/widget/ScrollView;Le/e/a/DragRows120$Drop;)V
    .registers 4

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Le/e/a/DragRows120;->scope:Ljava/lang/Object;

    .line 8
    iput-object p1, p0, Le/e/a/DragRows120;->scroll:Landroid/widget/ScrollView;

    iput-object p2, p0, Le/e/a/DragRows120;->drop:Le/e/a/DragRows120$Drop;

    return-void
.end method


# virtual methods
.method bind(Landroid/view/View;Landroid/view/View;I)V
    .registers 5

    .line 10
    new-instance v0, Le/e/a/DragRows120$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p3, p1}, Le/e/a/DragRows120$$ExternalSyntheticLambda0;-><init>(Le/e/a/DragRows120;ILandroid/view/View;)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    new-instance p2, Le/e/a/DragRows120$$ExternalSyntheticLambda1;

    invoke-direct {p2, p0, p3}, Le/e/a/DragRows120$$ExternalSyntheticLambda1;-><init>(Le/e/a/DragRows120;I)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnDragListener(Landroid/view/View$OnDragListener;)V

    return-void
.end method

.method handle(Landroid/content/Context;)Landroid/widget/TextView;
    .registers 4

    .line 9
    const-string v0, "\u2261"

    const/16 v1, 0x18

    invoke-static {p1, v0, v1}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    const/16 v0, 0x11

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    const-string v0, "\u4e26\u3073\u66ff\u3048"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-object p1
.end method

.method synthetic lambda$0$e-e-a-DragRows120(ILandroid/view/View;Landroid/view/View;)Z
    .registers 7

    .line 10
    new-instance p3, Le/e/a/DragRows120$Token;

    iget-object v0, p0, Le/e/a/DragRows120;->scope:Ljava/lang/Object;

    invoke-direct {p3, v0, p1}, Le/e/a/DragRows120$Token;-><init>(Ljava/lang/Object;I)V

    const-string p1, "nicoid-row"

    const-string v0, ""

    invoke-static {p1, v0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    const/4 v2, 0x0

    if-lt v0, v1, :cond_20

    new-instance v0, Landroid/view/View$DragShadowBuilder;

    invoke-direct {v0, p2}, Landroid/view/View$DragShadowBuilder;-><init>(Landroid/view/View;)V

    invoke-virtual {p2, p1, v0, p3, v2}, Landroid/view/View;->startDragAndDrop(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    move-result p1

    goto :goto_29

    :cond_20
    new-instance v0, Landroid/view/View$DragShadowBuilder;

    invoke-direct {v0, p2}, Landroid/view/View$DragShadowBuilder;-><init>(Landroid/view/View;)V

    invoke-virtual {p2, p1, v0, p3, v2}, Landroid/view/View;->startDrag(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    move-result p1

    :goto_29
    iput-boolean p1, p0, Le/e/a/DragRows120;->dragging:Z

    return p1
.end method

.method synthetic lambda$1$e-e-a-DragRows120(ILandroid/view/View;Landroid/view/DragEvent;)Z
    .registers 11

    .line 10
    invoke-virtual {p3}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Le/e/a/DragRows120$Token;

    const/4 v1, 0x0

    if-eqz v0, :cond_a6

    invoke-virtual {p3}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/DragRows120$Token;

    iget-object v0, v0, Le/e/a/DragRows120$Token;->scope:Ljava/lang/Object;

    iget-object v2, p0, Le/e/a/DragRows120;->scope:Ljava/lang/Object;

    if-eq v0, v2, :cond_17

    goto/16 :goto_a6

    :cond_17
    invoke-virtual {p3}, Landroid/view/DragEvent;->getAction()I

    move-result v0

    const/4 v2, 0x5

    if-ne v0, v2, :cond_30

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v2

    const v3, 0xffffff

    and-int/2addr v2, v3

    const/high16 v3, 0x22000000

    or-int/2addr v2, v3

    invoke-virtual {p2, v2}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_30
    const/4 v2, 0x6

    const/4 v3, 0x4

    if-eq v0, v2, :cond_36

    if-ne v0, v3, :cond_3d

    :cond_36
    invoke-virtual {p2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    if-ne v0, v3, :cond_3d

    iput-boolean v1, p0, Le/e/a/DragRows120;->dragging:Z

    :cond_3d
    const/4 v2, 0x1

    const/4 v3, 0x2

    if-ne v0, v3, :cond_7f

    new-array v4, v3, [I

    new-array v5, v3, [I

    invoke-virtual {p2, v4}, Landroid/view/View;->getLocationOnScreen([I)V

    iget-object v6, p0, Le/e/a/DragRows120;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v6, v5}, Landroid/widget/ScrollView;->getLocationOnScreen([I)V

    aget v4, v4, v2

    int-to-float v4, v4

    invoke-virtual {p3}, Landroid/view/DragEvent;->getY()F

    move-result v6

    add-float/2addr v4, v6

    aget v5, v5, v2

    int-to-float v5, v5

    sub-float/2addr v4, v5

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const/16 v6, 0x30

    invoke-static {v5, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    int-to-float v6, v5

    cmpg-float v6, v4, v6

    if-gez v6, :cond_70

    iget-object v4, p0, Le/e/a/DragRows120;->scroll:Landroid/widget/ScrollView;

    neg-int v5, v5

    :goto_6b
    div-int/2addr v5, v3

    invoke-virtual {v4, v1, v5}, Landroid/widget/ScrollView;->smoothScrollBy(II)V

    goto :goto_7f

    :cond_70
    iget-object v6, p0, Le/e/a/DragRows120;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v6}, Landroid/widget/ScrollView;->getHeight()I

    move-result v6

    sub-int/2addr v6, v5

    int-to-float v6, v6

    cmpl-float v4, v4, v6

    if-lez v4, :cond_7f

    iget-object v4, p0, Le/e/a/DragRows120;->scroll:Landroid/widget/ScrollView;

    goto :goto_6b

    :cond_7f
    :goto_7f
    const/4 v3, 0x3

    if-ne v0, v3, :cond_a5

    iput-boolean v1, p0, Le/e/a/DragRows120;->dragging:Z

    invoke-virtual {p2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v0, p0, Le/e/a/DragRows120;->drop:Le/e/a/DragRows120$Drop;

    invoke-virtual {p3}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/DragRows120$Token;

    iget v3, v3, Le/e/a/DragRows120$Token;->index:I

    invoke-virtual {p3}, Landroid/view/DragEvent;->getY()F

    move-result p3

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    int-to-float p2, p2

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr p2, v4

    cmpl-float p2, p3, p2

    if-lez p2, :cond_a2

    const/4 v1, 0x1

    :cond_a2
    invoke-interface {v0, v3, p1, v1}, Le/e/a/DragRows120$Drop;->move(IIZ)V

    :cond_a5
    return v2

    :cond_a6
    :goto_a6
    return v1
.end method
