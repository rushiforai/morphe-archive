.class final Le/e/a/FilterUi110$Page;
.super Ljava/lang/Object;
.source "FilterUi110.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FilterUi110;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Page"
.end annotation


# instance fields
.field final a:Landroid/preference/PreferenceActivity;

.field final add:Landroid/widget/Button;

.field final c:Landroid/content/Context;

.field category:I

.field final close:Landroid/widget/Button;

.field final count:Landroid/widget/TextView;

.field final data:Lorg/json/JSONArray;

.field final dialog:Landroid/app/Dialog;

.field final items:Landroid/widget/LinearLayout;

.field final root:Landroid/widget/LinearLayout;

.field final selected:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field selecting:Z

.field final swipe:Le/e/a/Ui110$Swipe;

.field final tabs:Le/e/a/Ui110$Tabs;


# direct methods
.method constructor <init>(Landroid/preference/PreferenceActivity;)V
    .registers 16

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FilterUi110$Page;->selected:Ljava/util/Set;

    .line 12
    iput-object p1, p0, Le/e/a/FilterUi110$Page;->a:Landroid/preference/PreferenceActivity;

    invoke-static {p1}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {p1}, Le/e/a/ContentFilter;->stored(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FilterUi110$Page;->data:Lorg/json/JSONArray;

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FilterUi110$Page;->root:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->root:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const/16 v2, 0x10

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    iget-object v3, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const/16 v4, 0x8

    invoke-static {v3, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    iget-object v5, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v5, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    iget-object v6, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v6, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v0, v1, v3, v5, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 13
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v1, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const-string v3, "back"

    invoke-static {v1, v3}, Le/e/a/Ui110;->icon(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    const-string v3, "\u623b\u308b"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v5, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const/16 v6, 0x30

    invoke-static {v5, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    iget-object v7, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v7, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-direct {v3, v5, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    iget-object v5, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const-string v7, "NG list"

    const-string v8, "NG \u6e05\u55ae"

    const-string v9, "NG\u30ea\u30b9\u30c8"

    invoke-static {v5, v9, v7, v8}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/16 v7, 0x12

    invoke-static {v3, v5, v7}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, 0x0

    const/4 v8, -0x2

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v5, v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const-string v5, "menu"

    invoke-static {v3, v5}, Le/e/a/Ui110;->icon(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    const-string v5, "\u30e1\u30cb\u30e5\u30fc"

    invoke-static {v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v10, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v10, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    iget-object v11, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v11, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-direct {v5, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v5, p0, Le/e/a/FilterUi110$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 14
    new-instance v0, Le/e/a/Ui110$Tabs;

    iget-object v5, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    iget-object v10, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v10, v7}, Le/e/a/FilterUi110;->category(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const/4 v12, 0x1

    invoke-static {v11, v12}, Le/e/a/FilterUi110;->category(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v11

    filled-new-array {v10, v11}, [Ljava/lang/String;

    move-result-object v10

    new-instance v11, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda7;

    invoke-direct {v11, p0}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda7;-><init>(Le/e/a/FilterUi110$Page;)V

    invoke-direct {v0, v5, v10, v11}, Le/e/a/Ui110$Tabs;-><init>(Landroid/content/Context;[Ljava/lang/String;Ljava/util/function/IntConsumer;)V

    iput-object v0, p0, Le/e/a/FilterUi110$Page;->tabs:Le/e/a/Ui110$Tabs;

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->tabs:Le/e/a/Ui110$Tabs;

    iget-object v0, v0, Le/e/a/Ui110$Tabs;->labels:[Landroid/widget/TextView;

    array-length v5, v0

    const/4 v10, 0x0

    :goto_e5
    if-lt v10, v5, :cond_216

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->root:Landroid/widget/LinearLayout;

    iget-object v5, p0, Le/e/a/FilterUi110$Page;->tabs:Le/e/a/Ui110$Tabs;

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const-string v5, ""

    const/16 v10, 0xd

    invoke-static {v0, v5, v10}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Le/e/a/FilterUi110$Page;->count:Landroid/widget/TextView;

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->count:Landroid/widget/TextView;

    iget-object v5, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const/16 v10, 0xc

    invoke-static {v5, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    iget-object v10, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v10, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v7, v5, v7, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->root:Landroid/widget/LinearLayout;

    iget-object v4, p0, Le/e/a/FilterUi110$Page;->count:Landroid/widget/TextView;

    new-instance v5, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda8;

    invoke-direct {v5, p0}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda8;-><init>(Le/e/a/FilterUi110$Page;)V

    new-instance v10, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda9;

    invoke-direct {v10, p0}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda9;-><init>(Le/e/a/FilterUi110$Page;)V

    invoke-static {v4, v5, v10}, Le/e/a/SelectionUi191;->header(Landroid/widget/TextView;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/ScrollView;

    iget-object v4, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-direct {v0, v4}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v12}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    iget-object v4, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v4}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v4

    iput-object v4, p0, Le/e/a/FilterUi110$Page;->items:Landroid/widget/LinearLayout;

    iget-object v4, p0, Le/e/a/FilterUi110$Page;->items:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v4, Le/e/a/Ui110$Swipe;

    iget-object v5, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    new-instance v10, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda10;

    invoke-direct {v10, p0}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda10;-><init>(Le/e/a/FilterUi110$Page;)V

    const/4 v11, 0x2

    invoke-direct {v4, v5, v11, v10}, Le/e/a/Ui110$Swipe;-><init>(Landroid/content/Context;ILjava/util/function/IntConsumer;)V

    iput-object v4, p0, Le/e/a/FilterUi110$Page;->swipe:Le/e/a/Ui110$Swipe;

    iget-object v4, p0, Le/e/a/FilterUi110$Page;->swipe:Le/e/a/Ui110$Swipe;

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v10, -0x1

    invoke-direct {v5, v10, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v0, v5}, Le/e/a/Ui110$Swipe;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->root:Landroid/widget/LinearLayout;

    iget-object v4, p0, Le/e/a/FilterUi110$Page;->swipe:Le/e/a/Ui110$Swipe;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v10, v7, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 15
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v4, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-direct {v0, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v2, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    iget-object v4, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const-string v5, "\uff0b Add"

    const-string v11, "\uff0b \u65b0\u589e"

    const-string v13, "\uff0b \u8ffd\u52a0"

    invoke-static {v4, v13, v5, v11}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Le/e/a/FilterUi110$Page;->add:Landroid/widget/Button;

    iget-object v2, p0, Le/e/a/FilterUi110$Page;->add:Landroid/widget/Button;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v5, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v5, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {v4, v8, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/view/View;

    iget-object v4, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-direct {v2, v4}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v7, v12, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    iget-object v4, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const-string v5, "Close"

    const-string v7, "\u95dc\u9589"

    const-string v9, "\u9589\u3058\u308b"

    invoke-static {v4, v9, v5, v7}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Le/e/a/FilterUi110$Page;->close:Landroid/widget/Button;

    iget-object v2, p0, Le/e/a/FilterUi110$Page;->close:Landroid/widget/Button;

    invoke-static {v2}, Le/e/a/Ui110;->flat(Landroid/widget/Button;)V

    iget-object v2, p0, Le/e/a/FilterUi110$Page;->close:Landroid/widget/Button;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v5, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v5, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {v4, v8, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Le/e/a/FilterUi110$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {v0}, Le/e/a/SelectionUi191;->insets(Landroid/view/View;)V

    .line 16
    new-instance v0, Landroid/app/Dialog;

    iget-object v2, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le/e/a/FilterUi110$Page;->dialog:Landroid/app/Dialog;

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0, v12}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->dialog:Landroid/app/Dialog;

    iget-object v2, p0, Le/e/a/FilterUi110$Page;->root:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v4, v10, v10}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v4}, Landroid/app/Dialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda11;

    invoke-direct {v0, p0}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda11;-><init>(Le/e/a/FilterUi110$Page;)V

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->close:Landroid/widget/Button;

    new-instance v1, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda12;

    invoke-direct {v1, p0}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda12;-><init>(Le/e/a/FilterUi110$Page;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->add:Landroid/widget/Button;

    new-instance v1, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0, p1}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda13;-><init>(Le/e/a/FilterUi110$Page;Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda14;

    invoke-direct {v0, p0, v3}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda14;-><init>(Le/e/a/FilterUi110$Page;Landroid/widget/Button;)V

    invoke-virtual {v3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->dialog:Landroid/app/Dialog;

    new-instance v1, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda15;

    invoke-direct {v1, p0, p1}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda15;-><init>(Le/e/a/FilterUi110$Page;Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    return-void

    .line 14
    :cond_216
    aget-object v11, v0, v10

    const/high16 v13, 0x41400000    # 12.0f

    invoke-virtual {v11, v13}, Landroid/widget/TextView;->setTextSize(F)V

    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_e5
.end method


# virtual methods
.method categorySize()I
    .registers 5

    .line 24
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    iget-object v2, p0, Le/e/a/FilterUi110$Page;->data:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v0, v2, :cond_b

    return v1

    :cond_b
    iget-object v2, p0, Le/e/a/FilterUi110$Page;->data:Lorg/json/JSONArray;

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_1f

    const-string v3, "category"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    iget v3, p0, Le/e/a/FilterUi110$Page;->category:I

    if-ne v2, v3, :cond_1f

    add-int/lit8 v1, v1, 0x1

    :cond_1f
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method changeTab(I)V
    .registers 3

    .line 17
    iget-object v0, p0, Le/e/a/FilterUi110$Page;->swipe:Le/e/a/Ui110$Swipe;

    if-eqz v0, :cond_9

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->swipe:Le/e/a/Ui110$Swipe;

    invoke-virtual {v0, p1}, Le/e/a/Ui110$Swipe;->select(I)V

    :cond_9
    return-void
.end method

.method delete(Ljava/util/List;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;)V"
        }
    .end annotation

    .line 25
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1d

    iget-object v1, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const-string v3, "Delete this NG rule?"

    const-string v4, "\u522a\u9664\u6b64 NG \u898f\u5247\uff1f"

    const-string v5, "\u3053\u306eNG\u30ef\u30fc\u30c9\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    goto :goto_25

    :cond_1d
    iget-object v1, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const-string v3, "Delete rules?"

    const-string v4, "\u522a\u9664\u898f\u5247\uff1f"

    const-string v5, "\u9805\u76ee\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    :goto_25
    invoke-static {v1, v5, v3, v4}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v2, :cond_3f

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    invoke-static {v1}, Le/e/a/ContentFilterId193;->label(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    goto :goto_47

    :cond_3f
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    :goto_47
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const-string v2, "Delete"

    const-string v3, "\u522a\u9664"

    const-string v4, "\u524a\u9664"

    invoke-static {v1, v4, v2, v3}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda6;

    invoke-direct {v2, p0, p1}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda6;-><init>(Le/e/a/FilterUi110$Page;Ljava/util/List;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$0$e-e-a-FilterUi110$Page(I)V
    .registers 2

    .line 14
    invoke-virtual {p0, p1}, Le/e/a/FilterUi110$Page;->changeTab(I)V

    return-void
.end method

.method synthetic lambda$1$e-e-a-FilterUi110$Page()V
    .registers 5

    .line 14
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/FilterUi110$Page;->selecting:Z

    const/4 v0, 0x0

    :goto_4
    iget-object v1, p0, Le/e/a/FilterUi110$Page;->data:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lt v0, v1, :cond_10

    invoke-virtual {p0}, Le/e/a/FilterUi110$Page;->render()V

    return-void

    :cond_10
    iget-object v1, p0, Le/e/a/FilterUi110$Page;->data:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_27

    const-string v2, "category"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    iget v3, p0, Le/e/a/FilterUi110$Page;->category:I

    if-ne v2, v3, :cond_27

    iget-object v2, p0, Le/e/a/FilterUi110$Page;->selected:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_27
    add-int/lit8 v0, v0, 0x1

    goto :goto_4
.end method

.method synthetic lambda$10$e-e-a-FilterUi110$Page(Landroid/preference/PreferenceActivity;Landroid/content/DialogInterface;)V
    .registers 7

    .line 16
    const-string p2, "nicoid_filter_list"

    invoke-virtual {p1, p2}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    if-eqz p1, :cond_2e

    new-instance p2, Ljava/lang/StringBuilder;

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->data:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const-string v1, " rules: hide matching videos"

    const-string v2, "\u9805\uff1a\u96b1\u85cf\u7b26\u5408\u689d\u4ef6\u7684\u5f71\u7247"

    const-string v3, "\u4ef6\uff1a\u767b\u9332\u3057\u305f\u6761\u4ef6\u306b\u4e00\u81f4\u3059\u308b\u52d5\u753b\u3092\u975e\u8868\u793a"

    invoke-static {v0, v3, v1, v2}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    :cond_2e
    return-void
.end method

.method synthetic lambda$11$e-e-a-FilterUi110$Page(Lorg/json/JSONObject;Landroid/widget/CompoundButton;Z)V
    .registers 4

    .line 20
    :try_start_0
    iget-boolean p2, p0, Le/e/a/FilterUi110$Page;->selecting:Z

    if-eqz p2, :cond_31

    if-eqz p3, :cond_c

    iget-object p2, p0, Le/e/a/FilterUi110$Page;->selected:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_c
    iget-object p2, p0, Le/e/a/FilterUi110$Page;->selected:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :goto_11
    iget-object p1, p0, Le/e/a/FilterUi110$Page;->count:Landroid/widget/TextView;

    iget-object p2, p0, Le/e/a/FilterUi110$Page;->selected:Ljava/util/Set;

    invoke-interface {p2}, Ljava/util/Set;->size()I

    move-result p2

    invoke-virtual {p0}, Le/e/a/FilterUi110$Page;->categorySize()I

    move-result p3

    invoke-static {p1, p2, p3}, Le/e/a/SelectionUi191;->selection(Landroid/widget/TextView;II)V

    iget-object p1, p0, Le/e/a/FilterUi110$Page;->add:Landroid/widget/Button;

    iget-object p2, p0, Le/e/a/FilterUi110$Page;->selected:Ljava/util/Set;

    invoke-interface {p2}, Ljava/util/Set;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_2c

    const/4 p2, 0x0

    goto :goto_2d

    :cond_2c
    const/4 p2, 0x1

    :goto_2d
    invoke-virtual {p1, p2}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_42

    :cond_31
    const-string p2, "enabled"

    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    iget-object p1, p0, Le/e/a/FilterUi110$Page;->a:Landroid/preference/PreferenceActivity;

    iget-object p2, p0, Le/e/a/FilterUi110$Page;->data:Lorg/json/JSONArray;

    invoke-static {p1, p2}, Le/e/a/ContentFilter;->save(Landroid/content/Context;Lorg/json/JSONArray;)V

    invoke-virtual {p0}, Le/e/a/FilterUi110$Page;->render()V
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_40} :catch_41

    goto :goto_42

    :catch_41
    move-exception p1

    :goto_42
    return-void
.end method

.method synthetic lambda$12$e-e-a-FilterUi110$Page(Landroid/widget/CheckBox;Lorg/json/JSONObject;Landroid/view/View;)V
    .registers 6

    .line 21
    iget-boolean p3, p0, Le/e/a/FilterUi110$Page;->selecting:Z

    if-eqz p3, :cond_8

    invoke-virtual {p1}, Landroid/widget/CheckBox;->toggle()V

    goto :goto_16

    :cond_8
    iget-object p1, p0, Le/e/a/FilterUi110$Page;->a:Landroid/preference/PreferenceActivity;

    iget-object p3, p0, Le/e/a/FilterUi110$Page;->data:Lorg/json/JSONArray;

    iget v0, p0, Le/e/a/FilterUi110$Page;->category:I

    new-instance v1, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda5;-><init>(Le/e/a/FilterUi110$Page;)V

    invoke-static {p1, p3, p2, v0, v1}, Le/e/a/FilterUi110;->edit(Landroid/app/Activity;Lorg/json/JSONArray;Lorg/json/JSONObject;ILjava/lang/Runnable;)V

    :goto_16
    return-void
.end method

.method synthetic lambda$14$e-e-a-FilterUi110$Page(Lorg/json/JSONObject;Landroid/view/View;)Z
    .registers 3

    .line 21
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/FilterUi110$Page;->delete(Ljava/util/List;)V

    const/4 p1, 0x1

    return p1
.end method

.method synthetic lambda$15$e-e-a-FilterUi110$Page(Lorg/json/JSONObject;Landroid/view/View;)Z
    .registers 3

    .line 21
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/FilterUi110$Page;->delete(Ljava/util/List;)V

    const/4 p1, 0x1

    return p1
.end method

.method synthetic lambda$16$e-e-a-FilterUi110$Page(Ljava/util/List;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 25
    iget-object p2, p0, Le/e/a/FilterUi110$Page;->data:Lorg/json/JSONArray;

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    :goto_8
    if-gez p2, :cond_1d

    iget-object p1, p0, Le/e/a/FilterUi110$Page;->a:Landroid/preference/PreferenceActivity;

    iget-object p2, p0, Le/e/a/FilterUi110$Page;->data:Lorg/json/JSONArray;

    invoke-static {p1, p2}, Le/e/a/ContentFilter;->save(Landroid/content/Context;Lorg/json/JSONArray;)V

    iget-object p1, p0, Le/e/a/FilterUi110$Page;->selected:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/FilterUi110$Page;->selecting:Z

    invoke-virtual {p0}, Le/e/a/FilterUi110$Page;->render()V

    return-void

    :cond_1d
    iget-object p3, p0, Le/e/a/FilterUi110$Page;->data:Lorg/json/JSONArray;

    invoke-virtual {p3, p2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object p3

    invoke-interface {p1, p3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_2e

    iget-object p3, p0, Le/e/a/FilterUi110$Page;->data:Lorg/json/JSONArray;

    invoke-virtual {p3, p2}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    :cond_2e
    add-int/lit8 p2, p2, -0x1

    goto :goto_8
.end method

.method synthetic lambda$2$e-e-a-FilterUi110$Page()V
    .registers 2

    .line 14
    iget-object v0, p0, Le/e/a/FilterUi110$Page;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    invoke-virtual {p0}, Le/e/a/FilterUi110$Page;->render()V

    return-void
.end method

.method synthetic lambda$3$e-e-a-FilterUi110$Page(I)V
    .registers 2

    .line 14
    iput p1, p0, Le/e/a/FilterUi110$Page;->category:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/FilterUi110$Page;->selecting:Z

    iget-object p1, p0, Le/e/a/FilterUi110$Page;->selected:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    invoke-virtual {p0}, Le/e/a/FilterUi110$Page;->render()V

    return-void
.end method

.method synthetic lambda$4$e-e-a-FilterUi110$Page(Landroid/view/View;)V
    .registers 2

    .line 16
    iget-object p1, p0, Le/e/a/FilterUi110$Page;->dialog:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method synthetic lambda$5$e-e-a-FilterUi110$Page(Landroid/view/View;)V
    .registers 2

    .line 16
    iget-boolean p1, p0, Le/e/a/FilterUi110$Page;->selecting:Z

    if-eqz p1, :cond_10

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/FilterUi110$Page;->selecting:Z

    iget-object p1, p0, Le/e/a/FilterUi110$Page;->selected:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    invoke-virtual {p0}, Le/e/a/FilterUi110$Page;->render()V

    goto :goto_15

    :cond_10
    iget-object p1, p0, Le/e/a/FilterUi110$Page;->dialog:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    :goto_15
    return-void
.end method

.method synthetic lambda$6$e-e-a-FilterUi110$Page(Landroid/preference/PreferenceActivity;Landroid/view/View;)V
    .registers 6

    .line 16
    iget-boolean p2, p0, Le/e/a/FilterUi110$Page;->selecting:Z

    if-eqz p2, :cond_f

    new-instance p1, Ljava/util/ArrayList;

    iget-object p2, p0, Le/e/a/FilterUi110$Page;->selected:Ljava/util/Set;

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, p1}, Le/e/a/FilterUi110$Page;->delete(Ljava/util/List;)V

    goto :goto_1c

    :cond_f
    iget-object p2, p0, Le/e/a/FilterUi110$Page;->data:Lorg/json/JSONArray;

    iget v0, p0, Le/e/a/FilterUi110$Page;->category:I

    new-instance v1, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda5;-><init>(Le/e/a/FilterUi110$Page;)V

    const/4 v2, 0x0

    invoke-static {p1, p2, v2, v0, v1}, Le/e/a/FilterUi110;->edit(Landroid/app/Activity;Lorg/json/JSONArray;Lorg/json/JSONObject;ILjava/lang/Runnable;)V

    :goto_1c
    return-void
.end method

.method synthetic lambda$8$e-e-a-FilterUi110$Page(Landroid/widget/Button;Landroid/view/View;)V
    .registers 7

    .line 16
    new-instance p2, Landroid/widget/PopupMenu;

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/UiTheme191;->context(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    invoke-virtual {p2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object p1

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const-string v1, "Select multiple"

    const-string v2, "\u9078\u53d6\u591a\u500b"

    const-string v3, "\u8907\u6570\u9078\u629e"

    invoke-static {v0, v3, v1, v2}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    new-instance v0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda4;-><init>(Le/e/a/FilterUi110$Page;)V

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    invoke-virtual {p2}, Landroid/widget/PopupMenu;->show()V

    return-void
.end method

.method synthetic lambda$9$e-e-a-FilterUi110$Page(Landroid/view/MenuItem;)Z
    .registers 2

    .line 16
    const/4 p1, 0x1

    iput-boolean p1, p0, Le/e/a/FilterUi110$Page;->selecting:Z

    invoke-virtual {p0}, Le/e/a/FilterUi110$Page;->render()V

    return p1
.end method

.method render()V
    .registers 17

    .line 19
    move-object/from16 v0, p0

    iget-object v1, v0, Le/e/a/FilterUi110$Page;->items:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v1, v0, Le/e/a/FilterUi110$Page;->tabs:Le/e/a/Ui110$Tabs;

    iget v2, v0, Le/e/a/FilterUi110$Page;->category:I

    invoke-virtual {v1, v2}, Le/e/a/Ui110$Tabs;->select(I)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_12
    iget-object v5, v0, Le/e/a/FilterUi110$Page;->data:Lorg/json/JSONArray;

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v5

    const v6, 0x3f333333    # 0.7f

    const-string v7, "\u555f\u7528"

    const-string v8, "Enabled"

    const-string v9, "\u6709\u52b9"

    const/16 v10, 0x10

    const/16 v11, 0x8

    const/16 v12, 0x30

    const/4 v13, 0x1

    if-lt v2, v5, :cond_1a0

    .line 22
    iget-object v2, v0, Le/e/a/FilterUi110$Page;->count:Landroid/widget/TextView;

    iget-object v5, v0, Le/e/a/FilterUi110$Page;->selected:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->size()I

    move-result v5

    invoke-static {v2, v5, v3}, Le/e/a/SelectionUi191;->selection(Landroid/widget/TextView;II)V

    iget-object v2, v0, Le/e/a/FilterUi110$Page;->count:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v5, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    iget-boolean v14, v0, Le/e/a/FilterUi110$Page;->selecting:Z

    if-eqz v14, :cond_46

    const/16 v14, 0x30

    goto :goto_48

    :cond_46
    const/16 v14, 0x1c

    :goto_48
    invoke-static {v5, v14}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    iput v5, v2, Landroid/widget/LinearLayout$LayoutParams;->height:I

    iget-object v2, v0, Le/e/a/FilterUi110$Page;->count:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-virtual {v2, v13}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    iget-boolean v14, v0, Le/e/a/FilterUi110$Page;->selecting:Z

    if-eqz v14, :cond_60

    const/4 v14, 0x0

    goto :goto_62

    :cond_60
    const/16 v14, 0x8

    :goto_62
    invoke-virtual {v5, v14}, Landroid/view/View;->setVisibility(I)V

    const/4 v5, 0x2

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    iget-boolean v5, v0, Le/e/a/FilterUi110$Page;->selecting:Z

    if-eqz v5, :cond_6f

    const/4 v11, 0x0

    :cond_6f
    invoke-virtual {v2, v11}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, v0, Le/e/a/FilterUi110$Page;->count:Landroid/widget/TextView;

    iget-boolean v5, v0, Le/e/a/FilterUi110$Page;->selecting:Z

    if-eqz v5, :cond_94

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, v0, Le/e/a/FilterUi110$Page;->selected:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const-string v7, " selected"

    const-string v8, " \u9805\u5df2\u9078"

    const-string v9, "\u4ef6\u9078\u629e"

    invoke-static {v5, v9, v7, v8}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_af

    :cond_94
    new-instance v5, Ljava/lang/StringBuilder;

    iget-object v11, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v11, v9, v8, v7}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, " ("

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    :goto_af
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-nez v3, :cond_12a

    iget-object v2, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    const/16 v3, 0x11

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v4, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v4, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    iget-object v5, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v5, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v2, v1, v4, v1, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v4, Le/e/a/Ui110$Glyph;

    iget-object v5, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    iget-object v7, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v7}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v7

    invoke-static {v7}, Le/e/a/DialogColors;->muted(Z)I

    move-result v7

    const-string v8, "empty"

    invoke-direct {v4, v5, v8, v7}, Le/e/a/Ui110$Glyph;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v7, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const/16 v8, 0x38

    invoke-static {v7, v8}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    iget-object v9, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v9, v8}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-direct {v5, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v4, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    iget-object v5, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const-string v7, "No registered items"

    const-string v8, "\u5c1a\u7121\u5df2\u767b\u9304\u9805\u76ee"

    const-string v9, "\u767b\u9332\u3055\u308c\u305f\u9805\u76ee\u306f\u3042\u308a\u307e\u305b\u3093"

    invoke-static {v5, v9, v7, v8}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/16 v7, 0xe

    invoke-static {v4, v5, v7}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v3, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v3, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v4, v1, v3, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setAlpha(F)V

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v3, v0, Le/e/a/FilterUi110$Page;->items:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 23
    :cond_12a
    iget-object v2, v0, Le/e/a/FilterUi110$Page;->add:Landroid/widget/Button;

    iget-object v3, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    iget-boolean v4, v0, Le/e/a/FilterUi110$Page;->selecting:Z

    if-eqz v4, :cond_135

    const-string v4, "\u524a\u9664"

    goto :goto_137

    :cond_135
    const-string v4, "\uff0b \u8ffd\u52a0"

    :goto_137
    iget-boolean v5, v0, Le/e/a/FilterUi110$Page;->selecting:Z

    if-eqz v5, :cond_13e

    const-string v5, "Delete"

    goto :goto_140

    :cond_13e
    const-string v5, "\uff0b Add"

    :goto_140
    iget-boolean v6, v0, Le/e/a/FilterUi110$Page;->selecting:Z

    if-eqz v6, :cond_147

    const-string v6, "\u522a\u9664"

    goto :goto_149

    :cond_147
    const-string v6, "\uff0b \u65b0\u589e"

    :goto_149
    invoke-static {v3, v4, v5, v6}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, v0, Le/e/a/FilterUi110$Page;->add:Landroid/widget/Button;

    iget-boolean v3, v0, Le/e/a/FilterUi110$Page;->selecting:Z

    if-eqz v3, :cond_160

    iget-object v3, v0, Le/e/a/FilterUi110$Page;->selected:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_160

    const/4 v3, 0x0

    goto :goto_161

    :cond_160
    const/4 v3, 0x1

    :goto_161
    invoke-virtual {v2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v2, v0, Le/e/a/FilterUi110$Page;->add:Landroid/widget/Button;

    invoke-static {v2, v13}, Le/e/a/UiDialogs;->actionButton(Landroid/widget/Button;Z)V

    iget-object v2, v0, Le/e/a/FilterUi110$Page;->close:Landroid/widget/Button;

    invoke-static {v2, v1}, Le/e/a/UiDialogs;->actionButton(Landroid/widget/Button;Z)V

    iget-object v1, v0, Le/e/a/FilterUi110$Page;->close:Landroid/widget/Button;

    iget-object v2, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextColor(I)V

    iget-object v1, v0, Le/e/a/FilterUi110$Page;->close:Landroid/widget/Button;

    iget-object v2, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    iget-boolean v3, v0, Le/e/a/FilterUi110$Page;->selecting:Z

    if-eqz v3, :cond_184

    const-string v3, "\u5b8c\u4e86"

    goto :goto_186

    :cond_184
    const-string v3, "\u9589\u3058\u308b"

    :goto_186
    iget-boolean v4, v0, Le/e/a/FilterUi110$Page;->selecting:Z

    if-eqz v4, :cond_18d

    const-string v4, "Done"

    goto :goto_18f

    :cond_18d
    const-string v4, "Close"

    :goto_18f
    iget-boolean v5, v0, Le/e/a/FilterUi110$Page;->selecting:Z

    if-eqz v5, :cond_196

    const-string v5, "\u5b8c\u6210"

    goto :goto_198

    :cond_196
    const-string v5, "\u95dc\u9589"

    :goto_198
    invoke-static {v2, v3, v4, v5}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 19
    :cond_1a0
    iget-object v5, v0, Le/e/a/FilterUi110$Page;->data:Lorg/json/JSONArray;

    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :cond_2ba

    const-string v14, "category"

    invoke-virtual {v5, v14}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v14

    iget v15, v0, Le/e/a/FilterUi110$Page;->category:I

    if-eq v14, v15, :cond_1b4

    goto/16 :goto_2ba

    :cond_1b4
    add-int/lit8 v3, v3, 0x1

    const-string v14, "enabled"

    invoke-virtual {v5, v14, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v15

    if-eqz v15, :cond_1c0

    add-int/lit8 v4, v4, 0x1

    .line 20
    :cond_1c0
    new-instance v15, Landroid/widget/LinearLayout;

    iget-object v6, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-direct {v15, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v15, v10}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v6, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const/16 v10, 0x3c

    invoke-static {v6, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v15, v6}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    new-instance v6, Landroid/widget/CheckBox;

    iget-object v10, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-direct {v6, v10}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    invoke-static {v6}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    iget-object v10, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v10, v9, v8, v7}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/CheckBox;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-boolean v7, v0, Le/e/a/FilterUi110$Page;->selecting:Z

    if-eqz v7, :cond_1f3

    iget-object v7, v0, Le/e/a/FilterUi110$Page;->selected:Ljava/util/Set;

    invoke-interface {v7, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    goto :goto_1f7

    :cond_1f3
    invoke-virtual {v5, v14, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v7

    :goto_1f7
    invoke-virtual {v6, v7}, Landroid/widget/CheckBox;->setChecked(Z)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v8, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v8, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    iget-object v9, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v9, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v15, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v7, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda0;

    invoke-direct {v7, v0, v5}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda0;-><init>(Le/e/a/FilterUi110$Page;Lorg/json/JSONObject;)V

    invoke-virtual {v6, v7}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 21
    iget-object v7, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v7}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v7

    iget-object v8, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v8, v11}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    iget-object v9, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const/4 v10, 0x4

    invoke-static {v9, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    iget-object v11, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v11, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-virtual {v7, v8, v9, v1, v10}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v8, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-static {v5}, Le/e/a/ContentFilterId193;->label(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0xf

    invoke-static {v8, v9, v10}, Le/e/a/Ui110;->compact(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v8, Landroid/widget/LinearLayout;

    iget-object v9, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-direct {v8, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iget-object v9, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    iget-object v10, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const-string v11, "mode"

    const-string v12, "partial"

    invoke-virtual {v5, v11, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Le/e/a/FilterUi110;->mode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const/16 v11, 0xb

    invoke-static {v9, v10, v11}, Le/e/a/Ui110;->compact(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v9

    const v10, 0x3f333333    # 0.7f

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setAlpha(F)V

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v11, -0x2

    const/high16 v12, 0x3f800000    # 1.0f

    invoke-direct {v10, v1, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v9, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v9, v0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const-string v10, "date"

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v13

    invoke-static {v13, v14}, Le/e/a/FilterUi110;->date(J)Ljava/lang/String;

    move-result-object v10

    const/16 v13, 0xa

    invoke-static {v9, v10, v13}, Le/e/a/Ui110;->compact(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v9

    const v10, 0x3f266666    # 0.65f

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setAlpha(F)V

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v1, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v15, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v8, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda1;

    invoke-direct {v8, v0, v6, v5}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda1;-><init>(Le/e/a/FilterUi110$Page;Landroid/widget/CheckBox;Lorg/json/JSONObject;)V

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v15, v8}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v6, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda2;

    invoke-direct {v6, v0, v5}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda2;-><init>(Le/e/a/FilterUi110$Page;Lorg/json/JSONObject;)V

    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    new-instance v6, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda3;

    invoke-direct {v6, v0, v5}, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda3;-><init>(Le/e/a/FilterUi110$Page;Lorg/json/JSONObject;)V

    invoke-virtual {v15, v6}, Landroid/widget/LinearLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object v5, v0, Le/e/a/FilterUi110$Page;->items:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v5, v0, Le/e/a/FilterUi110$Page;->items:Landroid/widget/LinearLayout;

    invoke-static {v5}, Le/e/a/PanelUi;->divider(Landroid/widget/LinearLayout;)V

    .line 19
    :cond_2ba
    :goto_2ba
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_12
.end method

.method show()V
    .registers 5

    .line 18
    iget-object v0, p0, Le/e/a/FilterUi110$Page;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->dialog:Landroid/app/Dialog;

    invoke-static {v0}, Le/e/a/UiTheme191;->window(Landroid/app/Dialog;)V

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_4f

    iget-object v0, p0, Le/e/a/FilterUi110$Page;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    iget-object v1, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v2, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const/16 v3, 0x18

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    const/16 v3, 0x26c

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iget-object v2, p0, Le/e/a/FilterUi110$Page;->c:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v2, v2

    const v3, 0x3f6147ae    # 0.88f

    mul-float v2, v2, v3

    float-to-int v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setLayout(II)V

    :cond_4f
    invoke-virtual {p0}, Le/e/a/FilterUi110$Page;->render()V

    return-void
.end method
