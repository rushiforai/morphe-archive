.class final Le/e/a/CommentSettings193$Editor;
.super Ljava/lang/Object;
.source "CommentSettings193.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentSettings193;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Editor"
.end annotation


# instance fields
.field final activity:Landroid/app/Activity;

.field final bars:[Landroid/widget/SeekBar;

.field final c:Landroid/content/Context;

.field final dialog:Landroid/app/Dialog;

.field final draft:Le/e/a/CommentAppearance192;

.field final labels:[Landroid/widget/TextView;

.field final names:[Ljava/lang/String;

.field final preview:Le/e/a/CommentSettings193$Preview;

.field final root:Landroid/widget/LinearLayout;

.field final settings:Landroid/widget/LinearLayout;

.field shadow:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 16

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const/4 v0, 0x6

    new-array v1, v0, [Landroid/widget/SeekBar;

    iput-object v1, p0, Le/e/a/CommentSettings193$Editor;->bars:[Landroid/widget/SeekBar;

    new-array v1, v0, [Landroid/widget/TextView;

    iput-object v1, p0, Le/e/a/CommentSettings193$Editor;->labels:[Landroid/widget/TextView;

    .line 9
    const-string v6, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a\u6642\u9593"

    const-string v7, "\u6700\u5927\u30b3\u30e1\u30f3\u30c8\u884c\u6570"

    const-string v2, "\u6587\u5b57\u30b5\u30a4\u30ba"

    const-string v3, "\u30d5\u30a9\u30f3\u30c8\u306e\u592a\u3055"

    const-string v4, "\u4e0d\u900f\u660e\u5ea6"

    const-string v5, "\u5f71\u306e\u5927\u304d\u3055"

    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Le/e/a/CommentSettings193$Editor;->names:[Ljava/lang/String;

    .line 10
    iput-object p1, p0, Le/e/a/CommentSettings193$Editor;->activity:Landroid/app/Activity;

    invoke-static {p1}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiTheme191;->context(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    new-instance v1, Le/e/a/CommentAppearance192;

    invoke-direct {v1, p1}, Le/e/a/CommentAppearance192;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le/e/a/CommentSettings193$Editor;->draft:Le/e/a/CommentAppearance192;

    new-instance v1, Landroid/app/Dialog;

    iget-object v2, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le/e/a/CommentSettings193$Editor;->dialog:Landroid/app/Dialog;

    iget-object v1, p0, Le/e/a/CommentSettings193$Editor;->dialog:Landroid/app/Dialog;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    iget-object v1, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    iput-object v1, p0, Le/e/a/CommentSettings193$Editor;->root:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/CommentSettings193$Editor;->root:Landroid/widget/LinearLayout;

    invoke-static {v1}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    .line 11
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v3, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-direct {v1, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v3, 0x10

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v4, p0, Le/e/a/CommentSettings193$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda1;

    invoke-direct {v5, v4}, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda1;-><init>(Landroid/app/Dialog;)V

    const-string v4, "\u2039"

    invoke-virtual {p0, v4, v5}, Le/e/a/CommentSettings193$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v4

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v6, 0x30

    invoke-virtual {p0, v6}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v7

    invoke-virtual {p0, v6}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v8

    invoke-direct {v5, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v4, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    const-string v5, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a\u8a2d\u5b9a"

    invoke-static {v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/16 v7, 0x12

    invoke-static {v4, v5, v7}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v6}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v7

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v5, v8, v7, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v4, p0, Le/e/a/CommentSettings193$Editor;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 12
    new-instance v1, Le/e/a/CommentSettings193$Preview;

    iget-object v4, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    iget-object v5, p0, Le/e/a/CommentSettings193$Editor;->draft:Le/e/a/CommentAppearance192;

    invoke-direct {v1, v4, v5}, Le/e/a/CommentSettings193$Preview;-><init>(Landroid/content/Context;Le/e/a/CommentAppearance192;)V

    iput-object v1, p0, Le/e/a/CommentSettings193$Editor;->preview:Le/e/a/CommentSettings193$Preview;

    iget-object v1, p0, Le/e/a/CommentSettings193$Editor;->root:Landroid/widget/LinearLayout;

    iget-object v4, p0, Le/e/a/CommentSettings193$Editor;->preview:Le/e/a/CommentSettings193$Preview;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    invoke-direct {v5, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 13
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v4, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-direct {v1, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v4, Landroid/widget/CheckBox;

    iget-object v5, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-direct {v4, v5}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    invoke-static {v4}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    const-string v5, "\u30b3\u30e1\u30f3\u30c8\u3092\u6d41\u3059"

    invoke-static {v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    const/high16 v5, 0x41400000    # 12.0f

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setTextSize(F)V

    invoke-virtual {v4, v8}, Landroid/widget/CheckBox;->setChecked(Z)V

    new-instance v10, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda3;

    invoke-direct {v10, p0}, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda3;-><init>(Le/e/a/CommentSettings193$Editor;)V

    invoke-virtual {v4, v10}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v11, 0x28

    invoke-virtual {p0, v11}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v12

    invoke-direct {v10, v8, v12, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v4, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 14
    new-instance v4, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda4;

    invoke-direct {v4}, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda4;-><init>()V

    const-string v10, "\u901a\u5e38"

    invoke-virtual {p0, v10, v4}, Le/e/a/CommentSettings193$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v10, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda5;

    invoke-direct {v10, p0, v4}, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda5;-><init>(Le/e/a/CommentSettings193$Editor;Landroid/widget/TextView;)V

    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v12, 0x38

    invoke-virtual {p0, v12}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v12

    invoke-virtual {p0, v11}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v13

    invoke-direct {v10, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 15
    new-instance v4, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda6;

    invoke-direct {v4}, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda6;-><init>()V

    const-string v10, "\u6697\u3044"

    invoke-virtual {p0, v10, v4}, Le/e/a/CommentSettings193$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v5, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda7;

    invoke-direct {v5, p0, v4}, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda7;-><init>(Le/e/a/CommentSettings193$Editor;Landroid/widget/TextView;)V

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v10, 0x40

    invoke-virtual {p0, v10}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v10

    invoke-virtual {p0, v11}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v12

    invoke-direct {v5, v10, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v4, p0, Le/e/a/CommentSettings193$Editor;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 16
    iget-object v1, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    iput-object v1, p0, Le/e/a/CommentSettings193$Editor;->settings:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/CommentSettings193$Editor;->settings:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v3}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v4

    invoke-virtual {p0, v3}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v5

    invoke-virtual {v1, v4, v8, v5, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v1, Landroid/widget/ScrollView;

    iget-object v4, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-direct {v1, v4}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iget-object v4, p0, Le/e/a/CommentSettings193$Editor;->settings:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v4}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    iget-object v4, p0, Le/e/a/CommentSettings193$Editor;->root:Landroid/widget/LinearLayout;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 17
    const/4 v1, 0x0

    :goto_174
    const/4 v4, -0x2

    if-lt v1, v0, :cond_20d

    .line 18
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {p0, v3}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v1

    invoke-virtual {p0, v3}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v3

    invoke-virtual {v0, v1, v8, v3, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 19
    new-instance v1, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda9;

    invoke-direct {v1, p0}, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda9;-><init>(Le/e/a/CommentSettings193$Editor;)V

    const-string v3, "\u521d\u671f\u5024\u306b\u623b\u3059"

    invoke-virtual {p0, v3, v1}, Le/e/a/CommentSettings193$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v1

    const v3, 0x800013

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v6}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/view/View;

    iget-object v3, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-direct {v1, v3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v8, v2, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Le/e/a/CommentSettings193$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda1;

    invoke-direct {v2, v1}, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda1;-><init>(Landroid/app/Dialog;)V

    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-virtual {p0, v1, v2}, Le/e/a/CommentSettings193$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v6}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v3

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda10;

    invoke-direct {v1, p0, p1}, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda10;-><init>(Le/e/a/CommentSettings193$Editor;Landroid/app/Activity;)V

    const-string p1, "\u9069\u7528"

    invoke-virtual {p0, p1, v1}, Le/e/a/CommentSettings193$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object p1

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v6}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v2

    invoke-direct {v1, v4, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {v0}, Le/e/a/SelectionUi191;->insets(Landroid/view/View;)V

    iget-object p1, p0, Le/e/a/CommentSettings193$Editor;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 20
    iget-object p1, p0, Le/e/a/CommentSettings193$Editor;->dialog:Landroid/app/Dialog;

    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->root:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v7, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Le/e/a/CommentSettings193$Editor;->dialog:Landroid/app/Dialog;

    new-instance v0, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda2;-><init>(Le/e/a/CommentSettings193$Editor;)V

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-virtual {p0}, Le/e/a/CommentSettings193$Editor;->refresh()V

    .line 21
    return-void

    .line 17
    :cond_20d
    const/4 v5, 0x3

    if-ne v1, v5, :cond_254

    new-instance v5, Landroid/widget/LinearLayout;

    iget-object v10, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-direct {v5, v10}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v10, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    const-string v12, "\u5f71\u306e\u7a2e\u985e"

    invoke-static {v12}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const/16 v13, 0xd

    invoke-static {v10, v12, v13}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v10

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v11}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v13

    invoke-direct {v12, v8, v13, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v10, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v10, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda8;

    invoke-direct {v10, p0}, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda8;-><init>(Le/e/a/CommentSettings193$Editor;)V

    const-string v12, ""

    invoke-virtual {p0, v12, v10}, Le/e/a/CommentSettings193$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v10

    iput-object v10, p0, Le/e/a/CommentSettings193$Editor;->shadow:Landroid/widget/TextView;

    iget-object v10, p0, Le/e/a/CommentSettings193$Editor;->shadow:Landroid/widget/TextView;

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v11}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v13

    invoke-direct {v12, v4, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v10, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v4, p0, Le/e/a/CommentSettings193$Editor;->settings:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_254
    invoke-virtual {p0, v1}, Le/e/a/CommentSettings193$Editor;->slider(I)V

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_174
.end method

.method static synthetic lambda$2()V
    .registers 0

    .line 14
    return-void
.end method

.method static synthetic lambda$4()V
    .registers 0

    .line 15
    return-void
.end method


# virtual methods
.method action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;
    .registers 4

    .line 22
    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-static {v0, p1, p2}, Le/e/a/PlayerButtons193;->action(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object p1

    return-object p1
.end method

.method dp(I)I
    .registers 3

    .line 22
    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-static {v0, p1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    return p1
.end method

.method label(I)V
    .registers 5

    .line 30
    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->labels:[Landroid/widget/TextView;

    aget-object v0, v0, p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u521d\u671f\u5024"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Le/e/a/CommentAppearance192;->DEFAULT:[I

    aget v2, v2, p1

    invoke-static {p1, v2}, Le/e/a/CommentAppearance192;->value(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \uff5c "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Le/e/a/CommentSettings193$Editor;->draft:Le/e/a/CommentAppearance192;

    iget-object v2, v2, Le/e/a/CommentAppearance192;->values:[I

    aget v2, v2, p1

    invoke-static {p1, v2}, Le/e/a/CommentAppearance192;->value(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$1$e-e-a-CommentSettings193$Editor(Landroid/widget/CompoundButton;Z)V
    .registers 3

    .line 13
    iget-object p1, p0, Le/e/a/CommentSettings193$Editor;->preview:Le/e/a/CommentSettings193$Preview;

    invoke-virtual {p1, p2}, Le/e/a/CommentSettings193$Preview;->moving(Z)V

    return-void
.end method

.method synthetic lambda$10$e-e-a-CommentSettings193$Editor(Landroid/app/Activity;)V
    .registers 3

    .line 19
    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->draft:Le/e/a/CommentAppearance192;

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-virtual {v0, p1}, Le/e/a/CommentAppearance192;->apply(Landroid/content/SharedPreferences;)V

    iget-object p1, p0, Le/e/a/CommentSettings193$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method synthetic lambda$11$e-e-a-CommentSettings193$Editor(Landroid/content/DialogInterface;)V
    .registers 2

    .line 20
    iget-object p1, p0, Le/e/a/CommentSettings193$Editor;->preview:Le/e/a/CommentSettings193$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings193$Preview;->stop()V

    return-void
.end method

.method synthetic lambda$12$e-e-a-CommentSettings193$Editor()V
    .registers 4

    .line 24
    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u30d5\u30a9\u30f3\u30c8\u306e\u592a\u3055"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u30d5\u30a9\u30f3\u30c8\u306e\u7a2e\u985e\u3084Android\u306e\u30d0\u30fc\u30b8\u30e7\u30f3\u306b\u3088\u3063\u3066\u3001\u9078\u629e\u3067\u304d\u308b\u592a\u3055\u3084\u898b\u305f\u76ee\u304c\u7570\u306a\u308a\u307e\u3059\u3002\u96a3\u308a\u5408\u3046\u6bb5\u968e\u3067\u9055\u3044\u304c\u51fa\u306a\u3044\u5834\u5408\u304c\u3042\u308a\u307e\u3059\u3002\u30d7\u30ec\u30d3\u30e5\u30fc\u3067\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u9589\u3058\u308b"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$3$e-e-a-CommentSettings193$Editor(Landroid/widget/TextView;Landroid/view/View;)V
    .registers 4

    .line 14
    iget-object p2, p0, Le/e/a/CommentSettings193$Editor;->preview:Le/e/a/CommentSettings193$Preview;

    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->preview:Le/e/a/CommentSettings193$Preview;

    iget-boolean v0, v0, Le/e/a/CommentSettings193$Preview;->dense:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p2, Le/e/a/CommentSettings193$Preview;->dense:Z

    iget-object p2, p0, Le/e/a/CommentSettings193$Editor;->preview:Le/e/a/CommentSettings193$Preview;

    iget-boolean p2, p2, Le/e/a/CommentSettings193$Preview;->dense:Z

    if-eqz p2, :cond_13

    const-string p2, "\u5bc6\u96c6"

    goto :goto_15

    :cond_13
    const-string p2, "\u901a\u5e38"

    :goto_15
    invoke-static {p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Le/e/a/CommentSettings193$Editor;->preview:Le/e/a/CommentSettings193$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings193$Preview;->changed()V

    return-void
.end method

.method synthetic lambda$5$e-e-a-CommentSettings193$Editor(Landroid/widget/TextView;Landroid/view/View;)V
    .registers 5

    .line 15
    iget-object p2, p0, Le/e/a/CommentSettings193$Editor;->preview:Le/e/a/CommentSettings193$Preview;

    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->preview:Le/e/a/CommentSettings193$Preview;

    iget v0, v0, Le/e/a/CommentSettings193$Preview;->background:I

    add-int/lit8 v0, v0, 0x1

    rem-int/lit8 v0, v0, 0x3

    iput v0, p2, Le/e/a/CommentSettings193$Preview;->background:I

    const-string p2, "\u660e\u308b\u3044"

    const-string v0, "\u6620\u50cf\u98a8"

    const-string v1, "\u6697\u3044"

    filled-new-array {v1, p2, v0}, [Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->preview:Le/e/a/CommentSettings193$Preview;

    iget v0, v0, Le/e/a/CommentSettings193$Preview;->background:I

    aget-object p2, p2, v0

    invoke-static {p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Le/e/a/CommentSettings193$Editor;->preview:Le/e/a/CommentSettings193$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings193$Preview;->changed()V

    return-void
.end method

.method synthetic lambda$6$e-e-a-CommentSettings193$Editor()V
    .registers 3

    .line 17
    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->draft:Le/e/a/CommentAppearance192;

    iget-object v1, p0, Le/e/a/CommentSettings193$Editor;->draft:Le/e/a/CommentAppearance192;

    iget v1, v1, Le/e/a/CommentAppearance192;->shadow:I

    rsub-int/lit8 v1, v1, 0x1

    iput v1, v0, Le/e/a/CommentAppearance192;->shadow:I

    invoke-virtual {p0}, Le/e/a/CommentSettings193$Editor;->refreshShadow()V

    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->preview:Le/e/a/CommentSettings193$Preview;

    invoke-virtual {v0}, Le/e/a/CommentSettings193$Preview;->changed()V

    return-void
.end method

.method synthetic lambda$7$e-e-a-CommentSettings193$Editor()V
    .registers 4

    .line 19
    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u521d\u671f\u5024\u306b\u623b\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u9069\u7528\u3059\u308b\u307e\u3067\u306f\u4fdd\u5b58\u3055\u308c\u307e\u305b\u3093"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u623b\u3059"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda0;-><init>(Le/e/a/CommentSettings193$Editor;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$8$e-e-a-CommentSettings193$Editor(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 19
    iget-object p1, p0, Le/e/a/CommentSettings193$Editor;->draft:Le/e/a/CommentAppearance192;

    invoke-virtual {p1}, Le/e/a/CommentAppearance192;->reset()V

    invoke-virtual {p0}, Le/e/a/CommentSettings193$Editor;->refresh()V

    iget-object p1, p0, Le/e/a/CommentSettings193$Editor;->preview:Le/e/a/CommentSettings193$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings193$Preview;->changed()V

    return-void
.end method

.method refresh()V
    .registers 5

    .line 32
    const/4 v0, 0x0

    :goto_1
    const/4 v1, 0x6

    if-lt v0, v1, :cond_8

    invoke-virtual {p0}, Le/e/a/CommentSettings193$Editor;->refreshShadow()V

    return-void

    :cond_8
    iget-object v1, p0, Le/e/a/CommentSettings193$Editor;->bars:[Landroid/widget/SeekBar;

    aget-object v1, v1, v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1a

    iget-object v2, p0, Le/e/a/CommentSettings193$Editor;->draft:Le/e/a/CommentAppearance192;

    iget-object v2, v2, Le/e/a/CommentAppearance192;->values:[I

    aget v2, v2, v0

    add-int/lit16 v2, v2, -0x12c

    div-int/lit8 v2, v2, 0x64

    goto :goto_25

    :cond_1a
    iget-object v2, p0, Le/e/a/CommentSettings193$Editor;->draft:Le/e/a/CommentAppearance192;

    iget-object v2, v2, Le/e/a/CommentAppearance192;->values:[I

    aget v2, v2, v0

    sget-object v3, Le/e/a/CommentAppearance192;->MIN:[I

    aget v3, v3, v0

    sub-int/2addr v2, v3

    :goto_25
    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setProgress(I)V

    invoke-virtual {p0, v0}, Le/e/a/CommentSettings193$Editor;->label(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method refreshShadow()V
    .registers 3

    .line 31
    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->shadow:Landroid/widget/TextView;

    iget-object v1, p0, Le/e/a/CommentSettings193$Editor;->draft:Le/e/a/CommentAppearance192;

    iget v1, v1, Le/e/a/CommentAppearance192;->shadow:I

    if-nez v1, :cond_b

    const-string v1, "\u7e01\u53d6\u308a"

    goto :goto_d

    :cond_b
    const-string v1, "\u307c\u304b\u3057"

    :goto_d
    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method show()V
    .registers 4

    .line 33
    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_2b

    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, -0x1

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setLayout(II)V

    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_2b
    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->root:Landroid/widget/LinearLayout;

    invoke-static {v0}, Le/e/a/FlatUi191;->tree(Landroid/view/View;)V

    return-void
.end method

.method slider(I)V
    .registers 9

    .line 23
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v2, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    iget-object v3, p0, Le/e/a/CommentSettings193$Editor;->names:[Ljava/lang/String;

    aget-object v3, v3, p1

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xd

    invoke-static {v2, v3, v4}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v1, 0x1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v2, v3, v3, v3, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x24

    invoke-virtual {p0, v5}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v5

    const/4 v6, -0x2

    invoke-direct {v4, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    if-ne p1, v1, :cond_71

    new-instance v2, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda11;

    invoke-direct {v2, p0}, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda11;-><init>(Le/e/a/CommentSettings193$Editor;)V

    const-string v4, "\u24d8"

    invoke-virtual {p0, v4, v2}, Le/e/a/CommentSettings193$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v2

    const/high16 v4, 0x41880000    # 17.0f

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMinimumWidth(I)V

    invoke-virtual {v2, v3, v3, v3, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    const-string v4, "\u30d5\u30a9\u30f3\u30c8\u306e\u592a\u3055\u306e\u8aac\u660e"

    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x30

    invoke-virtual {p0, v5}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v6

    invoke-virtual {p0, v5}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v5

    invoke-direct {v4, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    :cond_71
    new-instance v2, Landroid/view/View;

    iget-object v4, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-direct {v2, v4}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v4, v3, v1, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Le/e/a/CommentSettings193$Editor;->labels:[Landroid/widget/TextView;

    iget-object v4, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    const-string v5, ""

    const/16 v6, 0xb

    invoke-static {v4, v5, v6}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    aput-object v4, v2, p1

    iget-object v2, p0, Le/e/a/CommentSettings193$Editor;->labels:[Landroid/widget/TextView;

    aget-object v2, v2, p1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v2, p0, Le/e/a/CommentSettings193$Editor;->labels:[Landroid/widget/TextView;

    aget-object v2, v2, p1

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    iget-object v2, p0, Le/e/a/CommentSettings193$Editor;->labels:[Landroid/widget/TextView;

    aget-object v2, v2, p1

    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v2, p0, Le/e/a/CommentSettings193$Editor;->labels:[Landroid/widget/TextView;

    aget-object v2, v2, p1

    invoke-virtual {v2, v3, v3, v3, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v2, p0, Le/e/a/CommentSettings193$Editor;->labels:[Landroid/widget/TextView;

    aget-object v2, v2, p1

    const v3, 0x800015

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v2, p0, Le/e/a/CommentSettings193$Editor;->labels:[Landroid/widget/TextView;

    aget-object v2, v2, p1

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v2, p0, Le/e/a/CommentSettings193$Editor;->settings:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 26
    if-ne p1, v1, :cond_c8

    const/4 v0, 0x4

    goto :goto_d1

    :cond_c8
    sget-object v0, Le/e/a/CommentAppearance192;->MAX:[I

    aget v0, v0, p1

    sget-object v2, Le/e/a/CommentAppearance192;->MIN:[I

    aget v2, v2, p1

    sub-int/2addr v0, v2

    :goto_d1
    if-ne p1, v1, :cond_d4

    goto :goto_dd

    :cond_d4
    sget-object v1, Le/e/a/CommentAppearance192;->DEFAULT:[I

    aget v1, v1, p1

    sget-object v2, Le/e/a/CommentAppearance192;->MIN:[I

    aget v2, v2, p1

    sub-int/2addr v1, v2

    .line 27
    :goto_dd
    new-instance v2, Le/e/a/CommentSettings193$SnapSeek;

    iget-object v3, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-direct {v2, v3, v1, v0}, Le/e/a/CommentSettings193$SnapSeek;-><init>(Landroid/content/Context;II)V

    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->bars:[Landroid/widget/SeekBar;

    aput-object v2, v0, p1

    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v2, v0}, Le/e/a/CommentSettings193$SnapSeek;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->c:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v2, v0}, Le/e/a/CommentSettings193$SnapSeek;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    iget-object v0, p0, Le/e/a/CommentSettings193$Editor;->settings:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v3, 0x28

    invoke-virtual {p0, v3}, Le/e/a/CommentSettings193$Editor;->dp(I)I

    move-result v3

    const/4 v4, -0x1

    invoke-direct {v1, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    new-instance v0, Le/e/a/CommentSettings193$Editor$1;

    invoke-direct {v0, p0, p1}, Le/e/a/CommentSettings193$Editor$1;-><init>(Le/e/a/CommentSettings193$Editor;I)V

    invoke-virtual {v2, v0}, Le/e/a/CommentSettings193$SnapSeek;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 29
    return-void
.end method
