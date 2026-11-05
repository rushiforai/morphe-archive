.class final Le/e/a/CommentSettings192$Editor;
.super Ljava/lang/Object;
.source "CommentSettings192.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentSettings192;
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

.field final preview:Le/e/a/CommentSettings192$Preview;

.field final root:Landroid/widget/LinearLayout;

.field final settings:Landroid/widget/LinearLayout;

.field shadow:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 15

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const/4 v0, 0x6

    new-array v1, v0, [Landroid/widget/SeekBar;

    iput-object v1, p0, Le/e/a/CommentSettings192$Editor;->bars:[Landroid/widget/SeekBar;

    new-array v1, v0, [Landroid/widget/TextView;

    iput-object v1, p0, Le/e/a/CommentSettings192$Editor;->labels:[Landroid/widget/TextView;

    const-string v6, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a\u6642\u9593"

    const-string v7, "\u6700\u5927\u30b3\u30e1\u30f3\u30c8\u884c\u6570"

    const-string v2, "\u6587\u5b57\u30b5\u30a4\u30ba"

    const-string v3, "\u30d5\u30a9\u30f3\u30c8\u306e\u592a\u3055"

    const-string v4, "\u4e0d\u900f\u660e\u5ea6"

    const-string v5, "\u5f71\u306e\u5927\u304d\u3055"

    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Le/e/a/CommentSettings192$Editor;->names:[Ljava/lang/String;

    .line 8
    iput-object p1, p0, Le/e/a/CommentSettings192$Editor;->activity:Landroid/app/Activity;

    invoke-static {p1}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiTheme191;->context(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    new-instance v1, Le/e/a/CommentAppearance192;

    invoke-direct {v1, p1}, Le/e/a/CommentAppearance192;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le/e/a/CommentSettings192$Editor;->draft:Le/e/a/CommentAppearance192;

    new-instance p1, Landroid/app/Dialog;

    iget-object v1, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-direct {p1, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Le/e/a/CommentSettings192$Editor;->dialog:Landroid/app/Dialog;

    iget-object p1, p0, Le/e/a/CommentSettings192$Editor;->dialog:Landroid/app/Dialog;

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    iget-object p1, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {p1}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object p1

    iput-object p1, p0, Le/e/a/CommentSettings192$Editor;->root:Landroid/widget/LinearLayout;

    iget-object p1, p0, Le/e/a/CommentSettings192$Editor;->root:Landroid/widget/LinearLayout;

    invoke-static {p1}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    new-instance p1, Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-direct {p1, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x10

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v2, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0}, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda3;-><init>(Le/e/a/CommentSettings192$Editor;)V

    const-string v3, "\u2039"

    invoke-virtual {p0, v3, v2}, Le/e/a/CommentSettings192$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v2

    const/high16 v3, 0x41c00000    # 24.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    const-string v3, "\u623b\u308b"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v4, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    const/16 v5, 0x30

    invoke-static {v4, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    iget-object v6, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v6, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v3, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    const-string v3, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a\u8a2d\u5b9a"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x12

    invoke-static {v2, v3, v4}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v4, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v4, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const/4 v6, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v3, v6, v4, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance p1, Le/e/a/CommentSettings192$Preview;

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    iget-object v3, p0, Le/e/a/CommentSettings192$Editor;->draft:Le/e/a/CommentAppearance192;

    invoke-direct {p1, v2, v3}, Le/e/a/CommentSettings192$Preview;-><init>(Landroid/content/Context;Le/e/a/CommentAppearance192;)V

    iput-object p1, p0, Le/e/a/CommentSettings192$Editor;->preview:Le/e/a/CommentSettings192$Preview;

    iget-object p1, p0, Le/e/a/CommentSettings192$Editor;->root:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->preview:Le/e/a/CommentSettings192$Preview;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v4, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    const/16 v8, 0x80

    invoke-static {v4, v8}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const/4 v8, -0x1

    invoke-direct {v3, v8, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 9
    new-instance p1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-direct {p1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v2, Landroid/widget/CheckBox;

    iget-object v3, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    invoke-static {v2}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    const-string v3, "\u30b3\u30e1\u30f3\u30c8\u3092\u6d41\u3059"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, 0x41400000    # 12.0f

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setTextSize(F)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v9, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    const/16 v10, 0x28

    invoke-static {v9, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v4, v6, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda6;

    invoke-direct {v4, p0}, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda6;-><init>(Le/e/a/CommentSettings192$Editor;)V

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    new-instance v2, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda7;

    invoke-direct {v2}, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda7;-><init>()V

    const-string v4, "\u901a\u5e38"

    invoke-virtual {p0, v4, v2}, Le/e/a/CommentSettings192$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v4, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda8;

    invoke-direct {v4, p0, v2}, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda8;-><init>(Le/e/a/CommentSettings192$Editor;Landroid/widget/TextView;)V

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v9, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    const/16 v11, 0x38

    invoke-static {v9, v11}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    iget-object v11, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v11, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-direct {v4, v9, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda9;

    invoke-direct {v2}, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda9;-><init>()V

    const-string v4, "\u6697\u3044"

    invoke-virtual {p0, v4, v2}, Le/e/a/CommentSettings192$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v4, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda10;

    invoke-direct {v4, p0, v2}, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda10;-><init>(Le/e/a/CommentSettings192$Editor;Landroid/widget/TextView;)V

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v9, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    const/16 v11, 0x40

    invoke-static {v9, v11}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    iget-object v11, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v11, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-direct {v4, v9, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 10
    new-instance p1, Landroid/widget/ScrollView;

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-direct {p1, v2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    iput-object v2, p0, Le/e/a/CommentSettings192$Editor;->settings:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->settings:Landroid/widget/LinearLayout;

    iget-object v4, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    const/16 v9, 0x8

    invoke-static {v4, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    iget-object v11, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v11, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v2, v4, v6, v9, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->settings:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->root:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v8, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, p1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, 0x0

    :goto_195
    const/4 v2, -0x2

    if-lt p1, v0, :cond_20f

    .line 11
    new-instance p1, Landroid/widget/LinearLayout;

    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-direct {p1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v0, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda13;

    invoke-direct {v0, p0}, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda13;-><init>(Le/e/a/CommentSettings192$Editor;)V

    const-string v1, "\u521d\u671f\u5024\u306b\u623b\u3059"

    invoke-virtual {p0, v1, v0}, Le/e/a/CommentSettings192$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v3, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v3, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-direct {v1, v6, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda14;

    invoke-direct {v0, p0}, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda14;-><init>(Le/e/a/CommentSettings192$Editor;)V

    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-virtual {p0, v1, v0}, Le/e/a/CommentSettings192$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v3, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v3, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda4;-><init>(Le/e/a/CommentSettings192$Editor;)V

    const-string v1, "\u9069\u7528"

    invoke-virtual {p0, v1, v0}, Le/e/a/CommentSettings192$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v3, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v3, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {p1}, Le/e/a/SelectionUi191;->insets(Landroid/view/View;)V

    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p1, p0, Le/e/a/CommentSettings192$Editor;->dialog:Landroid/app/Dialog;

    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->root:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v8, v8}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Le/e/a/CommentSettings192$Editor;->dialog:Landroid/app/Dialog;

    new-instance v0, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda5;-><init>(Le/e/a/CommentSettings192$Editor;)V

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-virtual {p0}, Le/e/a/CommentSettings192$Editor;->refresh()V

    .line 12
    return-void

    .line 10
    :cond_20f
    const/4 v4, 0x3

    if-ne p1, v4, :cond_269

    new-instance v4, Landroid/widget/LinearLayout;

    iget-object v9, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-direct {v4, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v9, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    const-string v11, "\u5f71\u306e\u7a2e\u985e"

    invoke-static {v11}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const/16 v12, 0xd

    invoke-static {v9, v11, v12}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v9

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v12, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v12, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-direct {v11, v6, v12, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v9, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v9, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda11;

    invoke-direct {v9}, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda11;-><init>()V

    const-string v11, ""

    invoke-virtual {p0, v11, v9}, Le/e/a/CommentSettings192$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v9

    iput-object v9, p0, Le/e/a/CommentSettings192$Editor;->shadow:Landroid/widget/TextView;

    iget-object v9, p0, Le/e/a/CommentSettings192$Editor;->shadow:Landroid/widget/TextView;

    invoke-virtual {v9, v3}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v9, p0, Le/e/a/CommentSettings192$Editor;->shadow:Landroid/widget/TextView;

    new-instance v11, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda12;

    invoke-direct {v11, p0}, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda12;-><init>(Le/e/a/CommentSettings192$Editor;)V

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v9, p0, Le/e/a/CommentSettings192$Editor;->shadow:Landroid/widget/TextView;

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v12, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v12, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-direct {v11, v2, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v9, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->settings:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_269
    invoke-virtual {p0, p1}, Le/e/a/CommentSettings192$Editor;->slider(I)V

    add-int/lit8 p1, p1, 0x1

    goto/16 :goto_195
.end method

.method static synthetic lambda$13(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 13
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$2()V
    .registers 0

    .line 9
    return-void
.end method

.method static synthetic lambda$4()V
    .registers 0

    .line 9
    return-void
.end method

.method static synthetic lambda$6()V
    .registers 0

    .line 10
    return-void
.end method


# virtual methods
.method action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;
    .registers 5

    .line 13
    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/16 v1, 0xd

    invoke-static {v0, p1, v1}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    const/16 v0, 0x11

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    const/16 v1, 0x30

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMinimumWidth(I)V

    new-instance v0, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda2;

    invoke-direct {v0, p2}, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda2;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1
.end method

.method label(I)V
    .registers 5

    .line 15
    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->labels:[Landroid/widget/TextView;

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

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->draft:Le/e/a/CommentAppearance192;

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

.method synthetic lambda$0$e-e-a-CommentSettings192$Editor()V
    .registers 2

    .line 8
    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method synthetic lambda$1$e-e-a-CommentSettings192$Editor(Landroid/widget/CompoundButton;Z)V
    .registers 3

    .line 9
    iget-object p1, p0, Le/e/a/CommentSettings192$Editor;->preview:Le/e/a/CommentSettings192$Preview;

    invoke-virtual {p1, p2}, Le/e/a/CommentSettings192$Preview;->moving(Z)V

    return-void
.end method

.method synthetic lambda$10$e-e-a-CommentSettings192$Editor()V
    .registers 2

    .line 11
    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method synthetic lambda$11$e-e-a-CommentSettings192$Editor()V
    .registers 3

    .line 11
    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->draft:Le/e/a/CommentAppearance192;

    iget-object v1, p0, Le/e/a/CommentSettings192$Editor;->activity:Landroid/app/Activity;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-virtual {v0, v1}, Le/e/a/CommentAppearance192;->apply(Landroid/content/SharedPreferences;)V

    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method synthetic lambda$12$e-e-a-CommentSettings192$Editor(Landroid/content/DialogInterface;)V
    .registers 2

    .line 11
    iget-object p1, p0, Le/e/a/CommentSettings192$Editor;->preview:Le/e/a/CommentSettings192$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings192$Preview;->stop()V

    return-void
.end method

.method synthetic lambda$14$e-e-a-CommentSettings192$Editor()V
    .registers 4

    .line 14
    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

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

.method synthetic lambda$3$e-e-a-CommentSettings192$Editor(Landroid/widget/TextView;Landroid/view/View;)V
    .registers 4

    .line 9
    iget-object p2, p0, Le/e/a/CommentSettings192$Editor;->preview:Le/e/a/CommentSettings192$Preview;

    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->preview:Le/e/a/CommentSettings192$Preview;

    iget-boolean v0, v0, Le/e/a/CommentSettings192$Preview;->dense:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p2, Le/e/a/CommentSettings192$Preview;->dense:Z

    iget-object p2, p0, Le/e/a/CommentSettings192$Editor;->preview:Le/e/a/CommentSettings192$Preview;

    iget-boolean p2, p2, Le/e/a/CommentSettings192$Preview;->dense:Z

    if-eqz p2, :cond_13

    const-string p2, "\u5bc6\u96c6"

    goto :goto_15

    :cond_13
    const-string p2, "\u901a\u5e38"

    :goto_15
    invoke-static {p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Le/e/a/CommentSettings192$Editor;->preview:Le/e/a/CommentSettings192$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings192$Preview;->changed()V

    return-void
.end method

.method synthetic lambda$5$e-e-a-CommentSettings192$Editor(Landroid/widget/TextView;Landroid/view/View;)V
    .registers 5

    .line 9
    iget-object p2, p0, Le/e/a/CommentSettings192$Editor;->preview:Le/e/a/CommentSettings192$Preview;

    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->preview:Le/e/a/CommentSettings192$Preview;

    iget v0, v0, Le/e/a/CommentSettings192$Preview;->background:I

    add-int/lit8 v0, v0, 0x1

    rem-int/lit8 v0, v0, 0x3

    iput v0, p2, Le/e/a/CommentSettings192$Preview;->background:I

    const-string p2, "\u660e\u308b\u3044"

    const-string v0, "\u6620\u50cf\u98a8"

    const-string v1, "\u6697\u3044"

    filled-new-array {v1, p2, v0}, [Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->preview:Le/e/a/CommentSettings192$Preview;

    iget v0, v0, Le/e/a/CommentSettings192$Preview;->background:I

    aget-object p2, p2, v0

    invoke-static {p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Le/e/a/CommentSettings192$Editor;->preview:Le/e/a/CommentSettings192$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings192$Preview;->changed()V

    return-void
.end method

.method synthetic lambda$7$e-e-a-CommentSettings192$Editor(Landroid/view/View;)V
    .registers 3

    .line 10
    iget-object p1, p0, Le/e/a/CommentSettings192$Editor;->draft:Le/e/a/CommentAppearance192;

    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->draft:Le/e/a/CommentAppearance192;

    iget v0, v0, Le/e/a/CommentAppearance192;->shadow:I

    rsub-int/lit8 v0, v0, 0x1

    iput v0, p1, Le/e/a/CommentAppearance192;->shadow:I

    invoke-virtual {p0}, Le/e/a/CommentSettings192$Editor;->shadowLabel()V

    iget-object p1, p0, Le/e/a/CommentSettings192$Editor;->preview:Le/e/a/CommentSettings192$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings192$Preview;->changed()V

    return-void
.end method

.method synthetic lambda$8$e-e-a-CommentSettings192$Editor()V
    .registers 4

    .line 11
    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

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

    new-instance v2, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda1;-><init>(Le/e/a/CommentSettings192$Editor;)V

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

.method synthetic lambda$9$e-e-a-CommentSettings192$Editor(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 11
    iget-object p1, p0, Le/e/a/CommentSettings192$Editor;->draft:Le/e/a/CommentAppearance192;

    invoke-virtual {p1}, Le/e/a/CommentAppearance192;->reset()V

    invoke-virtual {p0}, Le/e/a/CommentSettings192$Editor;->refresh()V

    iget-object p1, p0, Le/e/a/CommentSettings192$Editor;->preview:Le/e/a/CommentSettings192$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings192$Preview;->changed()V

    return-void
.end method

.method refresh()V
    .registers 5

    .line 17
    const/4 v0, 0x0

    :goto_1
    const/4 v1, 0x6

    if-lt v0, v1, :cond_8

    invoke-virtual {p0}, Le/e/a/CommentSettings192$Editor;->shadowLabel()V

    return-void

    :cond_8
    iget-object v1, p0, Le/e/a/CommentSettings192$Editor;->bars:[Landroid/widget/SeekBar;

    aget-object v1, v1, v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1a

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->draft:Le/e/a/CommentAppearance192;

    iget-object v2, v2, Le/e/a/CommentAppearance192;->values:[I

    aget v2, v2, v0

    add-int/lit16 v2, v2, -0x12c

    div-int/lit8 v2, v2, 0x64

    goto :goto_25

    :cond_1a
    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->draft:Le/e/a/CommentAppearance192;

    iget-object v2, v2, Le/e/a/CommentAppearance192;->values:[I

    aget v2, v2, v0

    sget-object v3, Le/e/a/CommentAppearance192;->MIN:[I

    aget v3, v3, v0

    sub-int/2addr v2, v3

    :goto_25
    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setProgress(I)V

    invoke-virtual {p0, v0}, Le/e/a/CommentSettings192$Editor;->label(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method shadowLabel()V
    .registers 3

    .line 16
    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->shadow:Landroid/widget/TextView;

    iget-object v1, p0, Le/e/a/CommentSettings192$Editor;->draft:Le/e/a/CommentAppearance192;

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

    .line 18
    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_2b

    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, -0x1

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setLayout(II)V

    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_2b
    iget-object v0, p0, Le/e/a/CommentSettings192$Editor;->root:Landroid/widget/LinearLayout;

    invoke-static {v0}, Le/e/a/FlatUi191;->tree(Landroid/view/View;)V

    return-void
.end method

.method slider(I)V
    .registers 9

    .line 14
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v1, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->names:[Ljava/lang/String;

    aget-object v2, v2, p1

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xd

    invoke-static {v1, v2, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    const/16 v3, 0x8

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    iget-object v4, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v4, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v5, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    const/16 v6, 0x1c

    invoke-static {v5, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v3, v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v1, 0x20

    if-ne p1, v2, :cond_73

    new-instance v3, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0}, Le/e/a/CommentSettings192$Editor$$ExternalSyntheticLambda0;-><init>(Le/e/a/CommentSettings192$Editor;)V

    const-string v5, "\u24d8"

    invoke-virtual {p0, v5, v3}, Le/e/a/CommentSettings192$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v3, v4, v4, v4, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    const-string v4, "\u30d5\u30a9\u30f3\u30c8\u306e\u592a\u3055\u306e\u8aac\u660e"

    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v5, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v5, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    iget-object v6, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v6, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_73
    iget-object v3, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    const-string v4, ""

    const/16 v5, 0xb

    invoke-static {v3, v4, v5}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v4, p0, Le/e/a/CommentSettings192$Editor;->labels:[Landroid/widget/TextView;

    aput-object v3, v4, p1

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v3, p0, Le/e/a/CommentSettings192$Editor;->settings:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Le/e/a/CommentSettings192$MarkSeek;

    iget-object v3, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-direct {v0, v3, p1}, Le/e/a/CommentSettings192$MarkSeek;-><init>(Landroid/content/Context;I)V

    iget-object v3, p0, Le/e/a/CommentSettings192$Editor;->bars:[Landroid/widget/SeekBar;

    aput-object v0, v3, p1

    if-ne p1, v2, :cond_9b

    const/4 v3, 0x4

    goto :goto_a4

    :cond_9b
    sget-object v3, Le/e/a/CommentAppearance192;->MAX:[I

    aget v3, v3, p1

    sget-object v4, Le/e/a/CommentAppearance192;->MIN:[I

    aget v4, v4, p1

    sub-int/2addr v3, v4

    :goto_a4
    invoke-virtual {v0, v3}, Le/e/a/CommentSettings192$MarkSeek;->setMax(I)V

    if-ne p1, v2, :cond_b4

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->draft:Le/e/a/CommentAppearance192;

    iget-object v2, v2, Le/e/a/CommentAppearance192;->values:[I

    aget v2, v2, p1

    add-int/lit16 v2, v2, -0x12c

    div-int/lit8 v2, v2, 0x64

    goto :goto_bf

    :cond_b4
    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->draft:Le/e/a/CommentAppearance192;

    iget-object v2, v2, Le/e/a/CommentAppearance192;->values:[I

    aget v2, v2, p1

    sget-object v3, Le/e/a/CommentAppearance192;->MIN:[I

    aget v3, v3, p1

    sub-int/2addr v2, v3

    :goto_bf
    invoke-virtual {v0, v2}, Le/e/a/CommentSettings192$MarkSeek;->setProgress(I)V

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v2

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v0, v2}, Le/e/a/CommentSettings192$MarkSeek;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v2

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v0, v2}, Le/e/a/CommentSettings192$MarkSeek;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    iget-object v2, p0, Le/e/a/CommentSettings192$Editor;->settings:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v4, p0, Le/e/a/CommentSettings192$Editor;->c:Landroid/content/Context;

    invoke-static {v4, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    const/4 v4, -0x1

    invoke-direct {v3, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Le/e/a/CommentSettings192$Editor$1;

    invoke-direct {v1, p0, p1}, Le/e/a/CommentSettings192$Editor$1;-><init>(Le/e/a/CommentSettings192$Editor;I)V

    invoke-virtual {v0, v1}, Le/e/a/CommentSettings192$MarkSeek;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method
