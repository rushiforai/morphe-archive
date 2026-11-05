.class final Le/e/a/QueueUi120;
.super Ljava/lang/Object;
.source "QueueUi120.java"


# instance fields
.field final activity:Landroid/app/Activity;

.field closed:Z

.field final column:Landroid/widget/LinearLayout;

.field final context:Landroid/content/Context;

.field dialog:Landroid/app/AlertDialog;

.field final drag:Le/e/a/DragRows120;

.field final scroll:Landroid/widget/ScrollView;

.field final snapshot:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final tick:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 4

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/QueueUi120;->snapshot:Ljava/util/ArrayList;

    .line 9
    new-instance v0, Le/e/a/QueueUi120$1;

    invoke-direct {v0, p0}, Le/e/a/QueueUi120$1;-><init>(Le/e/a/QueueUi120;)V

    iput-object v0, p0, Le/e/a/QueueUi120;->tick:Ljava/lang/Runnable;

    .line 6
    iput-object p1, p0, Le/e/a/QueueUi120;->activity:Landroid/app/Activity;

    invoke-static {p1}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    iget-object p1, p0, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-static {p1}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object p1

    iput-object p1, p0, Le/e/a/QueueUi120;->column:Landroid/widget/LinearLayout;

    iget-object p1, p0, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    const/16 v0, 0xc

    invoke-static {p1, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    iget-object v0, p0, Le/e/a/QueueUi120;->column:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, p1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance p1, Landroid/widget/ScrollView;

    iget-object v0, p0, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-direct {p1, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Le/e/a/QueueUi120;->scroll:Landroid/widget/ScrollView;

    iget-object p1, p0, Le/e/a/QueueUi120;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {p1, v1}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    iget-object p1, p0, Le/e/a/QueueUi120;->scroll:Landroid/widget/ScrollView;

    iget-object v0, p0, Le/e/a/QueueUi120;->column:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance p1, Le/e/a/DragRows120;

    iget-object v0, p0, Le/e/a/QueueUi120;->scroll:Landroid/widget/ScrollView;

    new-instance v1, Le/e/a/QueueUi120$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Le/e/a/QueueUi120$$ExternalSyntheticLambda2;-><init>(Le/e/a/QueueUi120;)V

    invoke-direct {p1, v0, v1}, Le/e/a/DragRows120;-><init>(Landroid/widget/ScrollView;Le/e/a/DragRows120$Drop;)V

    iput-object p1, p0, Le/e/a/QueueUi120;->drag:Le/e/a/DragRows120;

    return-void
.end method

.method static varargs first(Ljava/lang/Object;[Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 11
    array-length v0, p1

    const/4 v1, 0x0

    :goto_2
    if-lt v1, v0, :cond_7

    const-string p0, ""

    return-object p0

    :cond_7
    aget-object v2, p1, v1

    invoke-static {p0, v2}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1c

    const-string v3, "null"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1c

    return-object v2

    :cond_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method static synthetic lambda$1(Le/e/a/QueueUi120;Landroid/content/DialogInterface;)V
    .registers 2

    .line 7
    const/4 p1, 0x1

    iput-boolean p1, p0, Le/e/a/QueueUi120;->closed:Z

    iget-object p1, p0, Le/e/a/QueueUi120;->scroll:Landroid/widget/ScrollView;

    iget-object p0, p0, Le/e/a/QueueUi120;->tick:Ljava/lang/Runnable;

    invoke-virtual {p1, p0}, Landroid/widget/ScrollView;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static show(Landroid/app/Activity;)V
    .registers 4

    .line 7
    new-instance v0, Le/e/a/QueueUi120;

    invoke-direct {v0, p0}, Le/e/a/QueueUi120;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0}, Le/e/a/QueueUi120;->render()V

    iget-object p0, v0, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-static {p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object p0

    iget-object v1, v0, Le/e/a/QueueUi120;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, v0, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u518d\u751f\u30ad\u30e5\u30fc"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string v1, "\u9589\u3058\u308b"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    iput-object p0, v0, Le/e/a/QueueUi120;->dialog:Landroid/app/AlertDialog;

    iget-object p0, v0, Le/e/a/QueueUi120;->dialog:Landroid/app/AlertDialog;

    new-instance v1, Le/e/a/QueueUi120$$ExternalSyntheticLambda3;

    invoke-direct {v1, v0}, Le/e/a/QueueUi120$$ExternalSyntheticLambda3;-><init>(Le/e/a/QueueUi120;)V

    invoke-virtual {p0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    iget-object p0, v0, Le/e/a/QueueUi120;->dialog:Landroid/app/AlertDialog;

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    iget-object p0, v0, Le/e/a/QueueUi120;->scroll:Landroid/widget/ScrollView;

    iget-object v0, v0, Le/e/a/QueueUi120;->tick:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method confirm(I)V
    .registers 6

    .line 12
    invoke-virtual {p0}, Le/e/a/QueueUi120;->current()Z

    move-result v0

    if-eqz v0, :cond_56

    if-ltz p1, :cond_56

    iget-object v0, p0, Le/e/a/QueueUi120;->snapshot:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_11

    goto :goto_56

    :cond_11
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/QueueUi120;->snapshot:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v1, p0, Le/e/a/QueueUi120;->snapshot:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "\u518d\u751f\u30ad\u30e5\u30fc\u304b\u3089\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "title"

    invoke-static {v1, v3}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u524a\u9664"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/QueueUi120$$ExternalSyntheticLambda4;

    invoke-direct {v3, p0, v0, p1}, Le/e/a/QueueUi120$$ExternalSyntheticLambda4;-><init>(Le/e/a/QueueUi120;Ljava/util/ArrayList;I)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void

    :cond_56
    :goto_56
    invoke-virtual {p0}, Le/e/a/QueueUi120;->render()V

    return-void
.end method

.method current()Z
    .registers 3

    .line 8
    iget-object v0, p0, Le/e/a/QueueUi120;->snapshot:Ljava/util/ArrayList;

    sget-object v1, Le/e/a/ManualQueue119;->pending:Ljava/util/ArrayList;

    invoke-static {v0, v1}, Le/e/a/ListOrder120;->same(Ljava/util/List;Ljava/util/List;)Z

    move-result v0

    return v0
.end method

.method synthetic lambda$0$e-e-a-QueueUi120(IIZ)V
    .registers 5

    .line 6
    invoke-virtual {p0}, Le/e/a/QueueUi120;->current()Z

    move-result v0

    if-eqz v0, :cond_f

    sget-object v0, Le/e/a/ManualQueue119;->pending:Ljava/util/ArrayList;

    invoke-static {v0, p1, p2, p3}, Le/e/a/ListOrder120;->move(Ljava/util/List;IIZ)Z

    move-result p1

    if-eqz p1, :cond_f

    goto :goto_15

    :cond_f
    invoke-virtual {p0}, Le/e/a/QueueUi120;->current()Z

    move-result p1

    if-nez p1, :cond_18

    :goto_15
    invoke-virtual {p0}, Le/e/a/QueueUi120;->render()V

    :cond_18
    return-void
.end method

.method synthetic lambda$2$e-e-a-QueueUi120(ILandroid/view/View;)Z
    .registers 3

    .line 10
    invoke-virtual {p0, p1}, Le/e/a/QueueUi120;->confirm(I)V

    const/4 p1, 0x1

    return p1
.end method

.method synthetic lambda$3$e-e-a-QueueUi120(I)V
    .registers 4

    .line 10
    iget-object v0, p0, Le/e/a/QueueUi120;->scroll:Landroid/widget/ScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Landroid/widget/ScrollView;->scrollTo(II)V

    return-void
.end method

.method synthetic lambda$4$e-e-a-QueueUi120(Ljava/util/ArrayList;ILandroid/content/DialogInterface;I)V
    .registers 5

    .line 12
    sget-object p3, Le/e/a/ManualQueue119;->pending:Ljava/util/ArrayList;

    invoke-static {p1, p3}, Le/e/a/ListOrder120;->same(Ljava/util/List;Ljava/util/List;)Z

    move-result p1

    if-eqz p1, :cond_10

    sget-object p1, Le/e/a/ManualQueue119;->pending:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-static {}, Le/e/a/ManualQueue119;->changed()V

    :cond_10
    invoke-virtual {p0}, Le/e/a/QueueUi120;->render()V

    return-void
.end method

.method render()V
    .registers 17

    .line 10
    move-object/from16 v1, p0

    iget-boolean v0, v1, Le/e/a/QueueUi120;->closed:Z

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, v1, Le/e/a/QueueUi120;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v2

    iget-object v0, v1, Le/e/a/QueueUi120;->snapshot:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, v1, Le/e/a/QueueUi120;->snapshot:Ljava/util/ArrayList;

    sget-object v3, Le/e/a/ManualQueue119;->pending:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v0, v1, Le/e/a/QueueUi120;->column:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v0, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    const/16 v3, 0x8

    invoke-static {v0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    iget-object v0, v1, Le/e/a/QueueUi120;->snapshot:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    const/16 v5, 0xe

    if-eqz v0, :cond_44

    iget-object v0, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    const-string v6, "\u518d\u751f\u5f85\u3061\u306e\u52d5\u753b\u306f\u3042\u308a\u307e\u305b\u3093"

    invoke-static {v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6, v5}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v4, v4, v4, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v6, v1, Le/e/a/QueueUi120;->column:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_44
    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_46
    iget-object v0, v1, Le/e/a/QueueUi120;->snapshot:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v8, -0x1

    if-lt v7, v0, :cond_96

    iget-object v0, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    const/16 v3, 0x21c

    invoke-static {v0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    iget-object v3, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    div-int/lit8 v3, v3, 0x2

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object v3, v1, Le/e/a/QueueUi120;->scroll:Landroid/widget/ScrollView;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v5, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    iget-object v6, v1, Le/e/a/QueueUi120;->snapshot:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    mul-int/lit8 v6, v6, 0x48

    const/16 v7, 0x40

    invoke-static {v7, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    invoke-static {v5, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {v0, v5}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-direct {v4, v8, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4}, Landroid/widget/ScrollView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, v1, Le/e/a/QueueUi120;->scroll:Landroid/widget/ScrollView;

    new-instance v3, Le/e/a/QueueUi120$$ExternalSyntheticLambda1;

    invoke-direct {v3, v1, v2}, Le/e/a/QueueUi120$$ExternalSyntheticLambda1;-><init>(Le/e/a/QueueUi120;I)V

    invoke-virtual {v0, v3}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_96
    iget-object v0, v1, Le/e/a/QueueUi120;->snapshot:Ljava/util/ArrayList;

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    new-instance v10, Landroid/widget/LinearLayout;

    iget-object v0, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-direct {v10, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v0, 0x10

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v10, v6, v4, v6, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v11, Landroid/widget/FrameLayout;

    iget-object v0, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-direct {v11, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iget-object v0, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v0

    iget-object v12, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-static {v12}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v12

    invoke-static {v0, v12}, Le/e/a/DialogColors;->secondary(IZ)I

    move-result v0

    invoke-virtual {v11, v0}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    new-instance v0, Le/e/a/QueueUi120$2;

    invoke-direct {v0, v1}, Le/e/a/QueueUi120$2;-><init>(Le/e/a/QueueUi120;)V

    invoke-virtual {v11, v0}, Landroid/widget/FrameLayout;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    new-instance v13, Landroid/widget/ImageView;

    iget-object v0, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-direct {v13, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v13, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v8, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v13, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v0, "thumbnailUrl"

    const-string v14, "thumbnail"

    const-string v15, "thumbnailurl"

    filled-new-array {v15, v0, v14}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v9, v0}, Le/e/a/QueueUi120;->first(Ljava/lang/Object;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_105

    :try_start_f9
    const-string v0, "c"

    invoke-static {v9, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14
    :try_end_103
    .catch Ljava/lang/Exception; {:try_start_f9 .. :try_end_103} :catch_104

    goto :goto_105

    :catch_104
    move-exception v0

    :cond_105
    :goto_105
    const-string v0, "http://"

    invoke-virtual {v14, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_121

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v15, "https://"

    invoke-direct {v0, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v15, 0x7

    invoke-virtual {v14, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    :cond_121
    const/4 v0, 0x0

    invoke-static {v14, v13, v0}, Le/e/a/ShortImages;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    const-string v0, "length"

    invoke-static {v9, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_13f

    :try_start_131
    const-string v0, "d"

    invoke-static {v9, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_13f

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13
    :try_end_13d
    .catch Ljava/lang/Exception; {:try_start_131 .. :try_end_13d} :catch_13e

    goto :goto_13f

    :catch_13e
    move-exception v0

    :cond_13f
    :goto_13f
    iget-object v0, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    const/16 v14, 0xb

    invoke-static {v0, v13, v14}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    const-string v14, "nicoid_duration"

    invoke-virtual {v0, v14}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    const v14, -0x111112

    invoke-virtual {v0, v14}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v14, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    const/4 v15, 0x3

    invoke-static {v14, v15}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v14

    iget-object v3, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-static {v3, v15}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v0, v14, v6, v3, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    const/high16 v3, -0x45000000    # -0.001953125f

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setBackgroundColor(I)V

    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_170

    const/16 v3, 0x8

    goto :goto_171

    :cond_170
    const/4 v3, 0x0

    :goto_171
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const v13, 0x800055

    const/4 v14, -0x2

    invoke-direct {v3, v14, v14, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    iget-object v13, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-static {v13, v15}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v13

    iget-object v8, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-static {v8, v15}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v3, v6, v6, v13, v8}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v11, v0, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v3, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    const/16 v8, 0x64

    invoke-static {v3, v8}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    iget-object v8, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    const/16 v13, 0x38

    invoke-static {v8, v13}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-direct {v0, v3, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v0, "title"

    invoke-static {v9, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1b7

    invoke-static {v9}, Le/e/a/ManualQueue119;->id(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :cond_1b7
    iget-object v3, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-static {v3, v0, v5}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v15}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v0, v4, v6, v6, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v3, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-static {v3}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v3, v4, v6, v6, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-virtual {v0, v6, v6, v6, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {v9}, Le/e/a/VideoRows191;->owner(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_1f4

    iget-object v8, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    const/16 v9, 0xc

    invoke-static {v8, v0, v9}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v12}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v8, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_1f4
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v0, v6, v14, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v10, v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, v1, Le/e/a/QueueUi120;->drag:Le/e/a/DragRows120;

    iget-object v3, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-virtual {v0, v3}, Le/e/a/DragRows120;->handle(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v8, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    const/16 v9, 0x30

    invoke-static {v8, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    iget-object v9, v1, Le/e/a/QueueUi120;->context:Landroid/content/Context;

    invoke-static {v9, v13}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v3, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, v1, Le/e/a/QueueUi120;->drag:Le/e/a/DragRows120;

    invoke-virtual {v3, v10, v0, v7}, Le/e/a/DragRows120;->bind(Landroid/view/View;Landroid/view/View;I)V

    new-instance v0, Le/e/a/QueueUi120$$ExternalSyntheticLambda0;

    invoke-direct {v0, v1, v7}, Le/e/a/QueueUi120$$ExternalSyntheticLambda0;-><init>(Le/e/a/QueueUi120;I)V

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object v0, v1, Le/e/a/QueueUi120;->column:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x1

    invoke-direct {v3, v8, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v10, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v7, v7, 0x1

    const/16 v3, 0x8

    goto/16 :goto_46
.end method
