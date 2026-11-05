.class final Le/e/a/CommentSettings194$Editor;
.super Ljava/lang/Object;
.source "CommentSettings194.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentSettings194;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Editor"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CommentSettings194$Editor$Choice;
    }
.end annotation


# instance fields
.field final activity:Landroid/app/Activity;

.field applied:Z

.field final bars:[Landroid/widget/SeekBar;

.field final c:Landroid/content/Context;

.field choose:Landroid/widget/TextView;

.field closed:Z

.field customEnabled:Z

.field final dialog:Landroid/app/Dialog;

.field final draft:Le/e/a/CommentAppearance192;

.field face:Landroid/graphics/Typeface;

.field font:Landroid/widget/Spinner;

.field fontLabel:Ljava/lang/String;

.field fontName:Landroid/widget/TextView;

.field fontPath:Ljava/lang/String;

.field loading:Z

.field final names:[Ljava/lang/String;

.field final prefs:Landroid/content/SharedPreferences;

.field final preview:Le/e/a/CommentSettings194$Preview;

.field refreshing:Z

.field final root:Landroid/widget/LinearLayout;

.field final settings:Landroid/widget/LinearLayout;

.field shadow:Landroid/widget/Spinner;

.field staged:Ljava/io/File;

.field final values:[Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 18

    .line 75
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 67
    const/4 v2, 0x6

    new-array v3, v2, [Landroid/widget/SeekBar;

    iput-object v3, v0, Le/e/a/CommentSettings194$Editor;->bars:[Landroid/widget/SeekBar;

    .line 68
    new-array v3, v2, [Landroid/widget/TextView;

    iput-object v3, v0, Le/e/a/CommentSettings194$Editor;->values:[Landroid/widget/TextView;

    .line 69
    const-string v8, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a\u6642\u9593"

    const-string v9, "\u6700\u5927\u30b3\u30e1\u30f3\u30c8\u884c\u6570"

    const-string v4, "\u6587\u5b57\u30b5\u30a4\u30ba"

    const-string v5, "\u30d5\u30a9\u30f3\u30c8\u306e\u592a\u3055"

    const-string v6, "\u4e0d\u900f\u660e\u5ea6"

    const-string v7, "\u5f71\u306e\u5927\u304d\u3055"

    filled-new-array/range {v4 .. v9}, [Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Le/e/a/CommentSettings194$Editor;->names:[Ljava/lang/String;

    .line 76
    iput-object v1, v0, Le/e/a/CommentSettings194$Editor;->activity:Landroid/app/Activity;

    .line 77
    invoke-static/range {p1 .. p1}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Le/e/a/UiTheme191;->context(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v3

    iput-object v3, v0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    .line 78
    invoke-static/range {p1 .. p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    iput-object v3, v0, Le/e/a/CommentSettings194$Editor;->prefs:Landroid/content/SharedPreferences;

    .line 79
    new-instance v3, Le/e/a/CommentAppearance192;

    invoke-direct {v3, v1}, Le/e/a/CommentAppearance192;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Le/e/a/CommentSettings194$Editor;->draft:Le/e/a/CommentAppearance192;

    .line 80
    iget-object v1, v0, Le/e/a/CommentSettings194$Editor;->prefs:Landroid/content/SharedPreferences;

    const-string v3, "comment_font_file"

    const-string v4, ""

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Le/e/a/CommentSettings194$Editor;->fontPath:Ljava/lang/String;

    .line 81
    iget-object v1, v0, Le/e/a/CommentSettings194$Editor;->prefs:Landroid/content/SharedPreferences;

    const-string v3, "comment_font_name"

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Le/e/a/CommentSettings194$Editor;->fontLabel:Ljava/lang/String;

    .line 82
    iget-object v1, v0, Le/e/a/CommentSettings194$Editor;->prefs:Landroid/content/SharedPreferences;

    iget-object v3, v0, Le/e/a/CommentSettings194$Editor;->fontPath:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    const/4 v4, 0x1

    xor-int/2addr v3, v4

    const-string v5, "comment_font_enabled"

    invoke-interface {v1, v5, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, v0, Le/e/a/CommentSettings194$Editor;->customEnabled:Z

    .line 83
    iget-object v1, v0, Le/e/a/CommentSettings194$Editor;->fontPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le/e/a/CommentSettings194$Editor;->loadFace(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    iput-object v1, v0, Le/e/a/CommentSettings194$Editor;->face:Landroid/graphics/Typeface;

    .line 84
    new-instance v1, Landroid/app/Dialog;

    iget-object v3, v0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-direct {v1, v3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Le/e/a/CommentSettings194$Editor;->dialog:Landroid/app/Dialog;

    .line 85
    iget-object v1, v0, Le/e/a/CommentSettings194$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v1, v4}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 86
    iget-object v1, v0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    iput-object v1, v0, Le/e/a/CommentSettings194$Editor;->root:Landroid/widget/LinearLayout;

    .line 87
    iget-object v1, v0, Le/e/a/CommentSettings194$Editor;->root:Landroid/widget/LinearLayout;

    invoke-static {v1}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    .line 88
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Editor;->row()Landroid/widget/LinearLayout;

    move-result-object v1

    .line 89
    new-instance v3, Le/e/a/CommentSettings194$Editor$1;

    invoke-direct {v3, v0}, Le/e/a/CommentSettings194$Editor$1;-><init>(Le/e/a/CommentSettings194$Editor;)V

    const-string v5, "\u2039"

    invoke-virtual {v0, v5, v3}, Le/e/a/CommentSettings194$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v3

    invoke-static {v3}, Le/e/a/Revision196;->back(Landroid/widget/TextView;)V

    .line 94
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v6, 0x30

    invoke-virtual {v0, v6}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v7

    invoke-virtual {v0, v6}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v8

    invoke-direct {v5, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 89
    invoke-virtual {v1, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    const-string v3, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a\u8a2d\u5b9a"

    const/16 v5, 0x12

    invoke-virtual {v0, v3, v5}, Le/e/a/CommentSettings194$Editor;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0, v6}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v7

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v5, v8, v7, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 96
    iget-object v3, v0, Le/e/a/CommentSettings194$Editor;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 97
    new-instance v1, Le/e/a/CommentSettings194$Preview;

    iget-object v3, v0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    iget-object v5, v0, Le/e/a/CommentSettings194$Editor;->draft:Le/e/a/CommentAppearance192;

    invoke-direct {v1, v3, v5}, Le/e/a/CommentSettings194$Preview;-><init>(Landroid/content/Context;Le/e/a/CommentAppearance192;)V

    iput-object v1, v0, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    .line 98
    iget-object v1, v0, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    iget-boolean v3, v0, Le/e/a/CommentSettings194$Editor;->customEnabled:Z

    if-eqz v3, :cond_da

    iget-object v3, v0, Le/e/a/CommentSettings194$Editor;->face:Landroid/graphics/Typeface;

    goto :goto_db

    :cond_da
    const/4 v3, 0x0

    :goto_db
    iput-object v3, v1, Le/e/a/CommentSettings194$Preview;->face:Landroid/graphics/Typeface;

    .line 99
    iget-object v1, v0, Le/e/a/CommentSettings194$Editor;->root:Landroid/widget/LinearLayout;

    iget-object v3, v0, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    invoke-direct {v5, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Editor;->row()Landroid/widget/LinearLayout;

    move-result-object v1

    .line 101
    new-instance v3, Landroid/widget/CheckBox;

    iget-object v5, v0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-direct {v3, v5}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 102
    invoke-static {v3}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    .line 103
    const-string v5, "\u30b3\u30e1\u30f3\u30c8\u3092\u6d41\u3059"

    invoke-static {v5}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 104
    const/high16 v5, 0x41300000    # 11.0f

    invoke-virtual {v3, v5}, Landroid/widget/CheckBox;->setTextSize(F)V

    .line 105
    iget-object v5, v0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {v5}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {v3, v5}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 106
    new-instance v5, Le/e/a/CommentSettings194$Editor$2;

    invoke-direct {v5, v0}, Le/e/a/CommentSettings194$Editor$2;-><init>(Le/e/a/CommentSettings194$Editor;)V

    invoke-virtual {v3, v5}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 112
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0, v6}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v10

    const/4 v11, -0x2

    invoke-direct {v5, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 113
    new-instance v3, Le/e/a/CommentSettings194$Editor$$ExternalSyntheticLambda0;

    invoke-direct {v3, v0}, Le/e/a/CommentSettings194$Editor$$ExternalSyntheticLambda0;-><init>(Le/e/a/CommentSettings194$Editor;)V

    const-string v5, "\u24d8"

    invoke-virtual {v0, v5, v3}, Le/e/a/CommentSettings194$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v3

    .line 114
    const/high16 v5, 0x41880000    # 17.0f

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v3, v8, v8, v8, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 115
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v10, 0x20

    invoke-virtual {v0, v10}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v10

    invoke-virtual {v0, v6}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v12

    invoke-direct {v5, v10, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 116
    const-string v3, "\u5bc6\u5ea6"

    const/16 v5, 0xb

    invoke-virtual {v0, v3, v5}, Le/e/a/CommentSettings194$Editor;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0, v6}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v12

    invoke-direct {v10, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 117
    const-string v3, "\u901a\u5e38"

    const-string v10, "\u5bc6\u96c6"

    filled-new-array {v3, v10}, [Ljava/lang/String;

    move-result-object v3

    new-instance v10, Le/e/a/CommentSettings194$Editor$3;

    invoke-direct {v10, v0}, Le/e/a/CommentSettings194$Editor$3;-><init>(Le/e/a/CommentSettings194$Editor;)V

    invoke-virtual {v0, v3, v8, v10}, Le/e/a/CommentSettings194$Editor;->select([Ljava/lang/String;ILe/e/a/CommentSettings194$Editor$Choice;)Landroid/widget/Spinner;

    move-result-object v3

    .line 122
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0, v6}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v12

    invoke-direct {v10, v8, v12, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 117
    invoke-virtual {v1, v3, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 123
    const-string v3, "\u80cc\u666f"

    invoke-virtual {v0, v3, v5}, Le/e/a/CommentSettings194$Editor;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0, v6}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v10

    invoke-direct {v5, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 124
    const-string v3, "\u660e\u308b\u3044"

    const-string v5, "\u6620\u50cf\u98a8"

    const-string v10, "\u6697\u3044"

    filled-new-array {v10, v3, v5}, [Ljava/lang/String;

    move-result-object v3

    new-instance v5, Le/e/a/CommentSettings194$Editor$4;

    invoke-direct {v5, v0}, Le/e/a/CommentSettings194$Editor$4;-><init>(Le/e/a/CommentSettings194$Editor;)V

    invoke-virtual {v0, v3, v8, v5}, Le/e/a/CommentSettings194$Editor;->select([Ljava/lang/String;ILe/e/a/CommentSettings194$Editor$Choice;)Landroid/widget/Spinner;

    move-result-object v3

    .line 129
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0, v6}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v10

    const v12, 0x3f99999a    # 1.2f

    invoke-direct {v5, v8, v10, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 124
    invoke-virtual {v1, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 130
    invoke-static {v1}, Le/e/a/Revision197;->previewRow(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v1

    iget-object v3, v0, Le/e/a/CommentSettings194$Editor;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 131
    iget-object v1, v0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    iput-object v1, v0, Le/e/a/CommentSettings194$Editor;->settings:Landroid/widget/LinearLayout;

    .line 132
    iget-object v1, v0, Le/e/a/CommentSettings194$Editor;->settings:Landroid/widget/LinearLayout;

    const/16 v3, 0x10

    invoke-virtual {v0, v3}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v5

    invoke-virtual {v0, v3}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v10

    invoke-virtual {v1, v5, v8, v10, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 133
    new-instance v1, Landroid/widget/ScrollView;

    iget-object v5, v0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-direct {v1, v5}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 134
    iget-object v5, v0, Le/e/a/CommentSettings194$Editor;->settings:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v5}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 135
    iget-object v5, v0, Le/e/a/CommentSettings194$Editor;->root:Landroid/widget/LinearLayout;

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v10, v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v1, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 136
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Editor;->row()Landroid/widget/LinearLayout;

    move-result-object v1

    .line 137
    const-string v5, "\u30d5\u30a9\u30f3\u30c8"

    const/16 v10, 0xd

    invoke-virtual {v0, v5, v10}, Le/e/a/CommentSettings194$Editor;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v5

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v13, 0x2c

    invoke-virtual {v0, v13}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v14

    invoke-direct {v12, v8, v14, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v5, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 138
    const-string v5, "\u6a19\u6e96\u30d5\u30a9\u30f3\u30c8"

    const-string v12, "\u30ab\u30b9\u30bf\u30e0\u30d5\u30a9\u30f3\u30c8"

    filled-new-array {v5, v12}, [Ljava/lang/String;

    move-result-object v5

    iget-boolean v12, v0, Le/e/a/CommentSettings194$Editor;->customEnabled:Z

    new-instance v14, Le/e/a/CommentSettings194$Editor$5;

    invoke-direct {v14, v0}, Le/e/a/CommentSettings194$Editor$5;-><init>(Le/e/a/CommentSettings194$Editor;)V

    invoke-virtual {v0, v5, v12, v14}, Le/e/a/CommentSettings194$Editor;->select([Ljava/lang/String;ILe/e/a/CommentSettings194$Editor$Choice;)Landroid/widget/Spinner;

    move-result-object v5

    iput-object v5, v0, Le/e/a/CommentSettings194$Editor;->font:Landroid/widget/Spinner;

    .line 144
    iget-object v5, v0, Le/e/a/CommentSettings194$Editor;->font:Landroid/widget/Spinner;

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v14, 0xb0

    invoke-virtual {v0, v14}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v14

    invoke-virtual {v0, v13}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v15

    invoke-direct {v12, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v5, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 145
    iget-object v5, v0, Le/e/a/CommentSettings194$Editor;->settings:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 146
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Editor;->row()Landroid/widget/LinearLayout;

    move-result-object v1

    .line 147
    iget-object v5, v0, Le/e/a/CommentSettings194$Editor;->fontLabel:Ljava/lang/String;

    const/16 v12, 0xc

    invoke-virtual {v0, v5, v12}, Le/e/a/CommentSettings194$Editor;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v5

    iput-object v5, v0, Le/e/a/CommentSettings194$Editor;->fontName:Landroid/widget/TextView;

    .line 148
    iget-object v5, v0, Le/e/a/CommentSettings194$Editor;->fontName:Landroid/widget/TextView;

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 149
    iget-object v5, v0, Le/e/a/CommentSettings194$Editor;->fontName:Landroid/widget/TextView;

    sget-object v12, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v5, v12}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 150
    iget-object v5, v0, Le/e/a/CommentSettings194$Editor;->fontName:Landroid/widget/TextView;

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v14, 0x28

    invoke-virtual {v0, v14}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v14

    invoke-direct {v12, v8, v14, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v5, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 151
    new-instance v5, Le/e/a/CommentSettings194$Editor$6;

    invoke-direct {v5, v0}, Le/e/a/CommentSettings194$Editor$6;-><init>(Le/e/a/CommentSettings194$Editor;)V

    const-string v12, "\u30d5\u30a1\u30a4\u30eb\u3092\u9078\u629e"

    invoke-virtual {v0, v12, v5}, Le/e/a/CommentSettings194$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v5

    iput-object v5, v0, Le/e/a/CommentSettings194$Editor;->choose:Landroid/widget/TextView;

    .line 157
    iget-object v5, v0, Le/e/a/CommentSettings194$Editor;->choose:Landroid/widget/TextView;

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0, v6}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v14

    invoke-direct {v12, v11, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v5, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    iget-object v5, v0, Le/e/a/CommentSettings194$Editor;->settings:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 159
    nop

    .line 160
    const/4 v1, 0x0

    :goto_278
    if-lt v1, v2, :cond_308

    .line 183
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Editor;->row()Landroid/widget/LinearLayout;

    move-result-object v1

    .line 184
    invoke-virtual {v0, v3}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v2

    invoke-virtual {v0, v3}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v3

    invoke-virtual {v1, v2, v8, v3, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 185
    new-instance v2, Le/e/a/CommentSettings194$Editor$8;

    invoke-direct {v2, v0}, Le/e/a/CommentSettings194$Editor$8;-><init>(Le/e/a/CommentSettings194$Editor;)V

    const-string v3, "\u521d\u671f\u5024\u306b\u623b\u3059"

    invoke-virtual {v0, v3, v2}, Le/e/a/CommentSettings194$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v2

    .line 191
    const v3, 0x800013

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 192
    invoke-virtual {v2, v8, v8, v8, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 193
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0, v6}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v5

    invoke-direct {v3, v11, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 194
    new-instance v2, Landroid/view/View;

    iget-object v3, v0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v8, v4, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 195
    new-instance v2, Le/e/a/CommentSettings194$Editor$9;

    invoke-direct {v2, v0}, Le/e/a/CommentSettings194$Editor$9;-><init>(Le/e/a/CommentSettings194$Editor;)V

    const-string v3, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-virtual {v0, v3, v2}, Le/e/a/CommentSettings194$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v2

    .line 200
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0, v6}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v4

    invoke-direct {v3, v11, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 195
    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 201
    new-instance v2, Le/e/a/CommentSettings194$Editor$10;

    invoke-direct {v2, v0}, Le/e/a/CommentSettings194$Editor$10;-><init>(Le/e/a/CommentSettings194$Editor;)V

    const-string v3, "\u9069\u7528"

    invoke-virtual {v0, v3, v2}, Le/e/a/CommentSettings194$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v2

    .line 206
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0, v6}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v4

    invoke-direct {v3, v11, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 201
    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 207
    invoke-static {v1}, Le/e/a/SelectionUi191;->insets(Landroid/view/View;)V

    .line 208
    iget-object v2, v0, Le/e/a/CommentSettings194$Editor;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 209
    iget-object v1, v0, Le/e/a/CommentSettings194$Editor;->dialog:Landroid/app/Dialog;

    iget-object v2, v0, Le/e/a/CommentSettings194$Editor;->root:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v3, v7, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/app/Dialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 210
    iget-object v1, v0, Le/e/a/CommentSettings194$Editor;->dialog:Landroid/app/Dialog;

    new-instance v2, Le/e/a/CommentSettings194$Editor$11;

    invoke-direct {v2, v0}, Le/e/a/CommentSettings194$Editor$11;-><init>(Le/e/a/CommentSettings194$Editor;)V

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 216
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Editor;->refresh()V

    .line 217
    return-void

    .line 161
    :cond_308
    const/4 v5, 0x3

    if-ne v1, v5, :cond_361

    .line 162
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Editor;->row()Landroid/widget/LinearLayout;

    move-result-object v5

    .line 163
    const-string v12, "\u5f71\u306e\u7a2e\u985e"

    invoke-virtual {v0, v12, v10}, Le/e/a/CommentSettings194$Editor;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v12

    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0, v13}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v15

    invoke-direct {v14, v8, v15, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v12, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 164
    const-string v12, "\u7e01\u53d6\u308a"

    const-string v14, "\u307c\u304b\u3057"

    const-string v15, "\u306a\u3057"

    filled-new-array {v15, v12, v14}, [Ljava/lang/String;

    move-result-object v12

    .line 165
    nop

    .line 166
    iget-object v14, v0, Le/e/a/CommentSettings194$Editor;->draft:Le/e/a/CommentAppearance192;

    iget v14, v14, Le/e/a/CommentAppearance192;->shadow:I

    const/4 v15, 0x2

    if-ne v14, v15, :cond_336

    .line 167
    nop

    .line 168
    const/4 v15, 0x0

    goto :goto_33d

    :cond_336
    iget-object v14, v0, Le/e/a/CommentSettings194$Editor;->draft:Le/e/a/CommentAppearance192;

    iget v14, v14, Le/e/a/CommentAppearance192;->shadow:I

    if-nez v14, :cond_33d

    .line 169
    const/4 v15, 0x1

    .line 171
    :cond_33d
    :goto_33d
    new-instance v14, Le/e/a/CommentSettings194$Editor$7;

    invoke-direct {v14, v0}, Le/e/a/CommentSettings194$Editor$7;-><init>(Le/e/a/CommentSettings194$Editor;)V

    invoke-virtual {v0, v12, v15, v14}, Le/e/a/CommentSettings194$Editor;->select([Ljava/lang/String;ILe/e/a/CommentSettings194$Editor$Choice;)Landroid/widget/Spinner;

    move-result-object v12

    iput-object v12, v0, Le/e/a/CommentSettings194$Editor;->shadow:Landroid/widget/Spinner;

    .line 177
    iget-object v12, v0, Le/e/a/CommentSettings194$Editor;->shadow:Landroid/widget/Spinner;

    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v15, 0x80

    invoke-virtual {v0, v15}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v15

    invoke-virtual {v0, v13}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v2

    invoke-direct {v14, v15, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v12, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 178
    iget-object v2, v0, Le/e/a/CommentSettings194$Editor;->settings:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 180
    :cond_361
    invoke-virtual {v0, v1}, Le/e/a/CommentSettings194$Editor;->slider(I)V

    .line 181
    add-int/lit8 v1, v1, 0x1

    .line 160
    const/4 v2, 0x6

    goto/16 :goto_278
.end method


# virtual methods
.method action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;
    .registers 6

    .line 304
    const/16 v0, 0xd

    invoke-virtual {p0, p1, v0}, Le/e/a/CommentSettings194$Editor;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    .line 305
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 306
    const/16 v0, 0x11

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 307
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v0

    invoke-virtual {p1, v1, v2, v0, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 308
    const/16 v0, 0x30

    invoke-virtual {p0, v0}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 309
    new-instance v0, Le/e/a/CommentSettings194$Editor$13;

    invoke-direct {v0, p0, p2}, Le/e/a/CommentSettings194$Editor$13;-><init>(Le/e/a/CommentSettings194$Editor;Ljava/lang/Runnable;)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 315
    return-object p1
.end method

.method adjust(II)V
    .registers 5

    .line 542
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->bars:[Landroid/widget/SeekBar;

    aget-object v0, v0, p1

    iget-object v1, p0, Le/e/a/CommentSettings194$Editor;->bars:[Landroid/widget/SeekBar;

    aget-object p1, v1, p1

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    add-int/2addr p1, p2

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 543
    return-void
.end method

.method dp(I)I
    .registers 3

    .line 319
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {v0, p1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p1

    return p1
.end method

.method fontUi()V
    .registers 6

    .line 429
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->fontName:Landroid/widget/TextView;

    if-nez v0, :cond_5

    .line 430
    return-void

    .line 432
    :cond_5
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->font:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_10

    goto :goto_11

    :cond_10
    const/4 v1, 0x0

    .line 433
    :goto_11
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->fontName:Landroid/widget/TextView;

    iget-boolean v3, p0, Le/e/a/CommentSettings194$Editor;->loading:Z

    if-eqz v3, :cond_1e

    const-string v3, "\u30d5\u30a9\u30f3\u30c8\u3092\u8aad\u307f\u8fbc\u307f\u4e2d"

    invoke-static {v3}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_20

    :cond_1e
    iget-object v3, p0, Le/e/a/CommentSettings194$Editor;->fontLabel:Ljava/lang/String;

    :goto_20
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 434
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->fontName:Landroid/widget/TextView;

    const/16 v3, 0x8

    if-eqz v1, :cond_2b

    const/4 v4, 0x0

    goto :goto_2d

    :cond_2b
    const/16 v4, 0x8

    :goto_2d
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 435
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->choose:Landroid/widget/TextView;

    if-eqz v1, :cond_35

    goto :goto_37

    :cond_35
    const/16 v2, 0x8

    :goto_37
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 436
    return-void
.end method

.method label(I)V
    .registers 5

    .line 546
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->values:[Landroid/widget/TextView;

    aget-object v0, v0, p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u521d\u671f\u5024"

    invoke-static {v2}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

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

    iget-object v2, p0, Le/e/a/CommentSettings194$Editor;->draft:Le/e/a/CommentAppearance192;

    iget-object v2, v2, Le/e/a/CommentAppearance192;->values:[I

    aget v2, v2, p1

    invoke-static {p1, v2}, Le/e/a/CommentAppearance192;->value(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 547
    return-void
.end method

.method synthetic lambda$0$e-e-a-CommentSettings194$Editor()V
    .registers 4

    .line 113
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u30b3\u30e1\u30f3\u30c8\u3092\u6d41\u3059"

    invoke-static {v1}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "ON\u306e\u5834\u5408\u3001\u30d7\u30ec\u30d3\u30e5\u30fc\u306e\u30b3\u30e1\u30f3\u30c8\u309230fps\u3067\u30a2\u30cb\u30e1\u30fc\u30b7\u30e7\u30f3\u8868\u793a\u3057\u307e\u3059\u3002OFF\u306e\u5834\u5408\u306f\u9023\u7d9a\u63cf\u753b\u3092\u505c\u6b62\u3057\u307e\u3059\u3002"

    invoke-static {v1}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u9589\u3058\u308b"

    invoke-static {v1}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method loadFace(Ljava/lang/String;)Landroid/graphics/Typeface;
    .registers 4

    .line 299
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    return-object v1

    .line 300
    :cond_8
    :try_start_8
    invoke-static {p1}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p1
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_c} :catch_d

    return-object p1

    :catch_d
    move-exception p1

    return-object v1
.end method

.method m33lambda$0$eeaCommentSettings194$Editor()V
    .registers 2

    .line 221
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 222
    return-void
.end method

.method m34lambda$1$eeaCommentSettings194$Editor(Landroid/widget/CompoundButton;Z)V
    .registers 3

    .line 226
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    invoke-virtual {p1, p2}, Le/e/a/CommentSettings194$Preview;->moving(Z)V

    .line 227
    return-void
.end method

.method public m35lambda$10$eeaCommentSettings194$Editor()V
    .registers 4

    .line 441
    iget-boolean v0, p0, Le/e/a/CommentSettings194$Editor;->loading:Z

    if-eqz v0, :cond_15

    .line 442
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    const-string v1, "\u8aad\u307f\u8fbc\u307f\u5b8c\u4e86\u5f8c\u306b\u9069\u7528\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {v1}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 443
    return-void

    .line 445
    :cond_15
    iget-boolean v0, p0, Le/e/a/CommentSettings194$Editor;->customEnabled:Z

    if-eqz v0, :cond_1c

    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->fontPath:Ljava/lang/String;

    goto :goto_1e

    :cond_1c
    const-string v0, ""

    :goto_1e
    iget-boolean v1, p0, Le/e/a/CommentSettings194$Editor;->customEnabled:Z

    if-eqz v1, :cond_25

    iget-object v1, p0, Le/e/a/CommentSettings194$Editor;->face:Landroid/graphics/Typeface;

    goto :goto_26

    :cond_25
    const/4 v1, 0x0

    :goto_26
    invoke-static {v0, v1}, Le/e/a/CommentFonts194;->prime(Ljava/lang/String;Landroid/graphics/Typeface;)V

    .line 446
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "comment_font_file"

    iget-object v2, p0, Le/e/a/CommentSettings194$Editor;->fontPath:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "comment_font_name"

    iget-object v2, p0, Le/e/a/CommentSettings194$Editor;->fontLabel:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "comment_font_enabled"

    iget-boolean v2, p0, Le/e/a/CommentSettings194$Editor;->customEnabled:Z

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 447
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->draft:Le/e/a/CommentAppearance192;

    iget-object v1, p0, Le/e/a/CommentSettings194$Editor;->prefs:Landroid/content/SharedPreferences;

    invoke-virtual {v0, v1}, Le/e/a/CommentAppearance192;->apply(Landroid/content/SharedPreferences;)V

    .line 448
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CommentSettings194$Editor;->applied:Z

    .line 449
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 450
    return-void
.end method

.method m36lambda$11$eeaCommentSettings194$Editor(Landroid/content/DialogInterface;)V
    .registers 3

    .line 264
    const/4 p1, 0x1

    iput-boolean p1, p0, Le/e/a/CommentSettings194$Editor;->closed:Z

    .line 265
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings194$Preview;->stop()V

    .line 266
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->staged:Ljava/io/File;

    if-eqz p1, :cond_24

    .line 267
    iget-boolean p1, p0, Le/e/a/CommentSettings194$Editor;->applied:Z

    if-eqz p1, :cond_1f

    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->fontPath:Ljava/lang/String;

    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->staged:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1f

    .line 268
    return-void

    .line 270
    :cond_1f
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->staged:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 272
    :cond_24
    return-void
.end method

.method m37lambda$13$eeaCommentSettings194$Editor(Ljava/io/File;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V
    .registers 8

    .line 393
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/CommentSettings194$Editor;->loading:Z

    .line 394
    iget-boolean v1, p0, Le/e/a/CommentSettings194$Editor;->closed:Z

    if-eqz v1, :cond_e

    .line 395
    if-eqz p1, :cond_d

    .line 396
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 397
    return-void

    .line 399
    :cond_d
    return-void

    .line 401
    :cond_e
    iget-object v1, p0, Le/e/a/CommentSettings194$Editor;->choose:Landroid/widget/TextView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 402
    if-eqz p1, :cond_48

    .line 403
    iget-object p4, p0, Le/e/a/CommentSettings194$Editor;->staged:Ljava/io/File;

    if-eqz p4, :cond_1f

    .line 404
    iget-object p4, p0, Le/e/a/CommentSettings194$Editor;->staged:Ljava/io/File;

    invoke-virtual {p4}, Ljava/io/File;->delete()Z

    .line 406
    :cond_1f
    iput-object p1, p0, Le/e/a/CommentSettings194$Editor;->staged:Ljava/io/File;

    .line 407
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p4

    iput-object p4, p0, Le/e/a/CommentSettings194$Editor;->fontPath:Ljava/lang/String;

    .line 408
    iput-object p2, p0, Le/e/a/CommentSettings194$Editor;->fontLabel:Ljava/lang/String;

    .line 409
    iput-object p3, p0, Le/e/a/CommentSettings194$Editor;->face:Landroid/graphics/Typeface;

    .line 410
    iput-boolean v2, p0, Le/e/a/CommentSettings194$Editor;->customEnabled:Z

    .line 411
    iget-object p2, p0, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    iget-boolean p3, p0, Le/e/a/CommentSettings194$Editor;->customEnabled:Z

    if-eqz p3, :cond_36

    iget-object p3, p0, Le/e/a/CommentSettings194$Editor;->face:Landroid/graphics/Typeface;

    goto :goto_37

    :cond_36
    const/4 p3, 0x0

    :goto_37
    iput-object p3, p2, Le/e/a/CommentSettings194$Preview;->face:Landroid/graphics/Typeface;

    .line 412
    iput-boolean v2, p0, Le/e/a/CommentSettings194$Editor;->refreshing:Z

    .line 413
    iget-object p2, p0, Le/e/a/CommentSettings194$Editor;->font:Landroid/widget/Spinner;

    invoke-virtual {p2, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 414
    iput-boolean v0, p0, Le/e/a/CommentSettings194$Editor;->refreshing:Z

    .line 415
    iget-object p2, p0, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    invoke-virtual {p2}, Le/e/a/CommentSettings194$Preview;->changed()V

    goto :goto_5c

    .line 416
    :cond_48
    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_5c

    .line 417
    iget-object p2, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {p4}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3, v2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p2

    invoke-virtual {p2}, Landroid/widget/Toast;->show()V

    goto :goto_5d

    .line 416
    :cond_5c
    :goto_5c
    nop

    .line 419
    :goto_5d
    if-nez p1, :cond_72

    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->fontPath:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_72

    .line 420
    iput-boolean v2, p0, Le/e/a/CommentSettings194$Editor;->refreshing:Z

    .line 421
    iput-boolean v0, p0, Le/e/a/CommentSettings194$Editor;->customEnabled:Z

    .line 422
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->font:Landroid/widget/Spinner;

    invoke-virtual {p1, v0}, Landroid/widget/Spinner;->setSelection(I)V

    .line 423
    iput-boolean v0, p0, Le/e/a/CommentSettings194$Editor;->refreshing:Z

    .line 425
    :cond_72
    invoke-virtual {p0}, Le/e/a/CommentSettings194$Editor;->fontUi()V

    .line 426
    return-void
.end method

.method m38lambda$14$eeaCommentSettings194$Editor()V
    .registers 4

    .line 454
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u30d5\u30a9\u30f3\u30c8\u306e\u592a\u3055"

    invoke-static {v1}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u30d5\u30a9\u30f3\u30c8\u306b\u3088\u3063\u3066\u306f\u592a\u3055\u3092\u5909\u66f4\u3057\u3066\u3082\u898b\u305f\u76ee\u304c\u5909\u308f\u3089\u306a\u3044\u5834\u5408\u304c\u3042\u308a\u307e\u3059\u3002\u5bfe\u5fdc\u3059\u308b\u30a6\u30a7\u30a4\u30c8\u3084Android\u306e\u30d0\u30fc\u30b8\u30e7\u30f3\u306b\u3088\u3063\u3066\u8868\u793a\u304c\u7570\u306a\u308b\u305f\u3081\u3001\u30d7\u30ec\u30d3\u30e5\u30fc\u3067\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static {v1}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u9589\u3058\u308b"

    invoke-static {v1}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    .line 455
    return-void
.end method

.method m39lambda$15$eeaCommentSettings194$Editor(I)V
    .registers 3

    .line 459
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Le/e/a/CommentSettings194$Editor;->adjust(II)V

    .line 460
    return-void
.end method

.method m40lambda$16$eeaCommentSettings194$Editor(I)V
    .registers 3

    .line 464
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Le/e/a/CommentSettings194$Editor;->adjust(II)V

    .line 465
    return-void
.end method

.method m41lambda$2$eeaCommentSettings194$Editor(I)V
    .registers 4

    .line 231
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    const/4 v1, 0x1

    if-ne p1, v1, :cond_6

    goto :goto_7

    :cond_6
    const/4 v1, 0x0

    :goto_7
    iput-boolean v1, v0, Le/e/a/CommentSettings194$Preview;->dense:Z

    .line 232
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings194$Preview;->changed()V

    .line 233
    return-void
.end method

.method m42lambda$3$eeaCommentSettings194$Editor(I)V
    .registers 3

    .line 237
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    iput p1, v0, Le/e/a/CommentSettings194$Preview;->background:I

    .line 238
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings194$Preview;->changed()V

    .line 239
    return-void
.end method

.method m43lambda$4$eeaCommentSettings194$Editor(I)V
    .registers 3

    .line 243
    iget-boolean v0, p0, Le/e/a/CommentSettings194$Editor;->refreshing:Z

    if-eqz v0, :cond_5

    .line 244
    return-void

    .line 246
    :cond_5
    const/4 v0, 0x1

    if-ne p1, v0, :cond_9

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    iput-boolean v0, p0, Le/e/a/CommentSettings194$Editor;->customEnabled:Z

    .line 247
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    iget-boolean v0, p0, Le/e/a/CommentSettings194$Editor;->customEnabled:Z

    if-eqz v0, :cond_15

    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->face:Landroid/graphics/Typeface;

    goto :goto_16

    :cond_15
    const/4 v0, 0x0

    :goto_16
    iput-object v0, p1, Le/e/a/CommentSettings194$Preview;->face:Landroid/graphics/Typeface;

    .line 248
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings194$Preview;->changed()V

    .line 249
    iget-boolean p1, p0, Le/e/a/CommentSettings194$Editor;->customEnabled:Z

    if-eqz p1, :cond_30

    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->fontPath:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_30

    iget-boolean p1, p0, Le/e/a/CommentSettings194$Editor;->loading:Z

    if-nez p1, :cond_30

    invoke-virtual {p0}, Le/e/a/CommentSettings194$Editor;->m44lambda$5$eeaCommentSettings194$Editor()V

    .line 250
    :cond_30
    invoke-virtual {p0}, Le/e/a/CommentSettings194$Editor;->fontUi()V

    .line 251
    return-void
.end method

.method public m44lambda$5$eeaCommentSettings194$Editor()V
    .registers 3

    .line 377
    iget-boolean v0, p0, Le/e/a/CommentSettings194$Editor;->loading:Z

    if-nez v0, :cond_28

    iget-boolean v0, p0, Le/e/a/CommentSettings194$Editor;->closed:Z

    if-eqz v0, :cond_9

    goto :goto_28

    .line 380
    :cond_9
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CommentSettings194$Editor;->loading:Z

    .line 381
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->fontName:Landroid/widget/TextView;

    const-string v1, "\u30d5\u30a9\u30f3\u30c8\u3092\u8aad\u307f\u8fbc\u307f\u4e2d"

    invoke-static {v1}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 382
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->choose:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 383
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->activity:Landroid/app/Activity;

    new-instance v1, Le/e/a/CommentSettings194$Editor$16;

    invoke-direct {v1, p0}, Le/e/a/CommentSettings194$Editor$16;-><init>(Le/e/a/CommentSettings194$Editor;)V

    invoke-static {v0, v1}, Le/e/a/CommentFonts194;->choose(Landroid/app/Activity;Le/e/a/CommentFonts194$Result;)V

    .line 389
    return-void

    .line 378
    :cond_28
    :goto_28
    return-void
.end method

.method m45lambda$6$eeaCommentSettings194$Editor(I)V
    .registers 4

    .line 255
    iget-boolean v0, p0, Le/e/a/CommentSettings194$Editor;->refreshing:Z

    if-eqz v0, :cond_5

    .line 256
    return-void

    .line 258
    :cond_5
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->draft:Le/e/a/CommentAppearance192;

    if-nez p1, :cond_b

    const/4 p1, 0x2

    goto :goto_11

    :cond_b
    const/4 v1, 0x1

    if-ne p1, v1, :cond_10

    const/4 p1, 0x0

    goto :goto_11

    :cond_10
    const/4 p1, 0x1

    :goto_11
    iput p1, v0, Le/e/a/CommentAppearance192;->shadow:I

    .line 259
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings194$Preview;->changed()V

    .line 260
    return-void
.end method

.method m46lambda$7$eeaCommentSettings194$Editor()V
    .registers 4

    .line 276
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u521d\u671f\u5024\u306b\u623b\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {v1}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u9069\u7528\u3059\u308b\u307e\u3067\u306f\u4fdd\u5b58\u3055\u308c\u307e\u305b\u3093"

    invoke-static {v1}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u623b\u3059"

    invoke-static {v1}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/CommentSettings194$Editor$12;

    invoke-direct {v2, p0}, Le/e/a/CommentSettings194$Editor$12;-><init>(Le/e/a/CommentSettings194$Editor;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 281
    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v1}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 276
    invoke-static {v0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    .line 282
    return-void
.end method

.method m47lambda$8$eeaCommentSettings194$Editor(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 286
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->draft:Le/e/a/CommentAppearance192;

    invoke-virtual {p1}, Le/e/a/CommentAppearance192;->reset()V

    .line 287
    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/CommentSettings194$Editor;->customEnabled:Z

    .line 288
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    const/4 p2, 0x0

    iput-object p2, p1, Le/e/a/CommentSettings194$Preview;->face:Landroid/graphics/Typeface;

    .line 289
    invoke-virtual {p0}, Le/e/a/CommentSettings194$Editor;->refresh()V

    .line 290
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->preview:Le/e/a/CommentSettings194$Preview;

    invoke-virtual {p1}, Le/e/a/CommentSettings194$Preview;->changed()V

    .line 291
    return-void
.end method

.method m48lambda$9$eeaCommentSettings194$Editor()V
    .registers 2

    .line 295
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 296
    return-void
.end method

.method refresh()V
    .registers 7

    .line 550
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CommentSettings194$Editor;->refreshing:Z

    .line 551
    nop

    .line 552
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_6
    const/4 v3, 0x6

    if-lt v2, v3, :cond_2e

    .line 557
    iget-object v2, p0, Le/e/a/CommentSettings194$Editor;->shadow:Landroid/widget/Spinner;

    .line 558
    nop

    .line 559
    iget-object v3, p0, Le/e/a/CommentSettings194$Editor;->draft:Le/e/a/CommentAppearance192;

    iget v3, v3, Le/e/a/CommentAppearance192;->shadow:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_16

    .line 560
    nop

    .line 561
    const/4 v0, 0x0

    goto :goto_1e

    :cond_16
    iget-object v3, p0, Le/e/a/CommentSettings194$Editor;->draft:Le/e/a/CommentAppearance192;

    iget v3, v3, Le/e/a/CommentAppearance192;->shadow:I

    if-nez v3, :cond_1d

    .line 562
    goto :goto_1e

    .line 561
    :cond_1d
    const/4 v0, 0x2

    .line 564
    :goto_1e
    invoke-virtual {v2, v0}, Landroid/widget/Spinner;->setSelection(I)V

    .line 565
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->font:Landroid/widget/Spinner;

    iget-boolean v2, p0, Le/e/a/CommentSettings194$Editor;->customEnabled:Z

    invoke-virtual {v0, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 566
    iput-boolean v1, p0, Le/e/a/CommentSettings194$Editor;->refreshing:Z

    .line 567
    invoke-virtual {p0}, Le/e/a/CommentSettings194$Editor;->fontUi()V

    .line 568
    return-void

    .line 553
    :cond_2e
    iget-object v3, p0, Le/e/a/CommentSettings194$Editor;->bars:[Landroid/widget/SeekBar;

    aget-object v3, v3, v2

    iget-object v4, p0, Le/e/a/CommentSettings194$Editor;->draft:Le/e/a/CommentAppearance192;

    iget-object v4, v4, Le/e/a/CommentAppearance192;->values:[I

    aget v4, v4, v2

    sget-object v5, Le/e/a/CommentAppearance192;->MIN:[I

    aget v5, v5, v2

    sub-int/2addr v4, v5

    if-ne v2, v0, :cond_42

    const/16 v5, 0x64

    goto :goto_43

    :cond_42
    const/4 v5, 0x1

    :goto_43
    div-int/2addr v4, v5

    invoke-virtual {v3, v4}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 554
    invoke-virtual {p0, v2}, Le/e/a/CommentSettings194$Editor;->label(I)V

    .line 555
    add-int/lit8 v2, v2, 0x1

    goto :goto_6
.end method

.method row()Landroid/widget/LinearLayout;
    .registers 3

    .line 323
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 324
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 325
    return-object v0
.end method

.method select([Ljava/lang/String;ILe/e/a/CommentSettings194$Editor$Choice;)Landroid/widget/Spinner;
    .registers 8

    .line 336
    new-instance v0, Landroid/widget/Spinner;

    iget-object v1, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;I)V

    .line 337
    new-instance v1, Le/e/a/CommentSettings194$Editor$14;

    iget-object v2, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    const v3, 0x1090008

    invoke-direct {v1, p0, v2, v3, p1}, Le/e/a/CommentSettings194$Editor$14;-><init>(Le/e/a/CommentSettings194$Editor;Landroid/content/Context;I[Ljava/lang/String;)V

    .line 357
    const p1, 0x1090009

    invoke-virtual {v1, p1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 358
    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 359
    const/4 p1, 0x0

    invoke-virtual {v0, p2, p1}, Landroid/widget/Spinner;->setSelection(IZ)V

    .line 360
    iget-object p1, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {p1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/Spinner;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 361
    new-instance p1, Le/e/a/CommentSettings194$Editor$15;

    invoke-direct {p1, p0, p3}, Le/e/a/CommentSettings194$Editor$15;-><init>(Le/e/a/CommentSettings194$Editor;Le/e/a/CommentSettings194$Editor$Choice;)V

    invoke-virtual {v0, p1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 371
    return-object v0
.end method

.method show()V
    .registers 4

    .line 571
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 572
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, -0x1

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setLayout(II)V

    .line 573
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 574
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->root:Landroid/widget/LinearLayout;

    invoke-static {v0}, Le/e/a/FlatUi191;->tree(Landroid/view/View;)V

    .line 575
    invoke-static {p0}, Le/e/a/Revision201;->editor(Ljava/lang/Object;)V

    return-void
.end method

.method slider(I)V
    .registers 14

    .line 468
    invoke-virtual {p0}, Le/e/a/CommentSettings194$Editor;->row()Landroid/widget/LinearLayout;

    move-result-object v0

    .line 469
    iget-object v1, p0, Le/e/a/CommentSettings194$Editor;->names:[Ljava/lang/String;

    aget-object v1, v1, p1

    const/16 v2, 0xd

    invoke-virtual {p0, v1, v2}, Le/e/a/CommentSettings194$Editor;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v3, 0x28

    invoke-virtual {p0, v3}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v4

    const/4 v5, -0x2

    invoke-direct {v2, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 470
    const/16 v1, 0x30

    const/4 v2, 0x0

    const/4 v4, 0x1

    if-ne p1, v4, :cond_46

    .line 471
    new-instance v6, Le/e/a/CommentSettings194$Editor$17;

    invoke-direct {v6, p0}, Le/e/a/CommentSettings194$Editor$17;-><init>(Le/e/a/CommentSettings194$Editor;)V

    const-string v7, "\u24d8"

    invoke-virtual {p0, v7, v6}, Le/e/a/CommentSettings194$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v6

    .line 477
    const/high16 v7, 0x41900000    # 18.0f

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 478
    invoke-virtual {v6, v2, v2, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 479
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v3}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v8

    invoke-virtual {p0, v1}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v9

    invoke-direct {v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 481
    :cond_46
    new-instance v6, Landroid/view/View;

    iget-object v7, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-direct {v6, v7}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v7, v2, v4, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 482
    iget-object v6, p0, Le/e/a/CommentSettings194$Editor;->values:[Landroid/widget/TextView;

    const-string v7, ""

    const/16 v9, 0xb

    invoke-virtual {p0, v7, v9}, Le/e/a/CommentSettings194$Editor;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v7

    aput-object v7, v6, p1

    .line 483
    iget-object v6, p0, Le/e/a/CommentSettings194$Editor;->values:[Landroid/widget/TextView;

    aget-object v6, v6, p1

    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 484
    iget-object v6, p0, Le/e/a/CommentSettings194$Editor;->values:[Landroid/widget/TextView;

    aget-object v6, v6, p1

    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    .line 485
    iget-object v6, p0, Le/e/a/CommentSettings194$Editor;->values:[Landroid/widget/TextView;

    aget-object v6, v6, p1

    sget-object v7, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 486
    iget-object v6, p0, Le/e/a/CommentSettings194$Editor;->values:[Landroid/widget/TextView;

    aget-object v6, v6, p1

    const v7, 0x800013

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 487
    iget-object v6, p0, Le/e/a/CommentSettings194$Editor;->values:[Landroid/widget/TextView;

    aget-object v6, v6, p1

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v3}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v3

    invoke-direct {v7, v5, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 488
    iget-object v3, p0, Le/e/a/CommentSettings194$Editor;->settings:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 489
    invoke-virtual {p0}, Le/e/a/CommentSettings194$Editor;->row()Landroid/widget/LinearLayout;

    move-result-object v0

    .line 490
    new-instance v3, Le/e/a/CommentSettings194$Editor$18;

    invoke-direct {v3, p0, p1}, Le/e/a/CommentSettings194$Editor$18;-><init>(Le/e/a/CommentSettings194$Editor;I)V

    const-string v5, "\u2212"

    invoke-virtual {p0, v5, v3}, Le/e/a/CommentSettings194$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v3

    .line 496
    new-instance v5, Le/e/a/CommentSettings194$Editor$19;

    invoke-direct {v5, p0, p1}, Le/e/a/CommentSettings194$Editor$19;-><init>(Le/e/a/CommentSettings194$Editor;I)V

    const-string v6, "\uff0b"

    invoke-virtual {p0, v6, v5}, Le/e/a/CommentSettings194$Editor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v5

    .line 502
    const/high16 v6, 0x41b00000    # 22.0f

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 503
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 504
    new-instance v6, Ljava/lang/StringBuilder;

    iget-object v7, p0, Le/e/a/CommentSettings194$Editor;->names:[Ljava/lang/String;

    aget-object v7, v7, p1

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "\u3092\u6e1b\u3089\u3059"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 505
    new-instance v6, Ljava/lang/StringBuilder;

    iget-object v7, p0, Le/e/a/CommentSettings194$Editor;->names:[Ljava/lang/String;

    aget-object v7, v7, p1

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "\u3092\u5897\u3084\u3059"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 506
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v1}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v7

    invoke-virtual {p0, v1}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v9

    invoke-direct {v6, v7, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 507
    if-ne p1, v4, :cond_114

    const/16 v3, 0x64

    goto :goto_115

    :cond_114
    const/4 v3, 0x1

    .line 508
    :goto_115
    new-instance v6, Le/e/a/CommentSettings194$SnapSeek;

    iget-object v7, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    sget-object v9, Le/e/a/CommentAppearance192;->DEFAULT:[I

    aget v9, v9, p1

    sget-object v10, Le/e/a/CommentAppearance192;->MIN:[I

    aget v10, v10, p1

    sub-int/2addr v9, v10

    div-int/2addr v9, v3

    sget-object v10, Le/e/a/CommentAppearance192;->MAX:[I

    aget v10, v10, p1

    sget-object v11, Le/e/a/CommentAppearance192;->MIN:[I

    aget v11, v11, p1

    sub-int/2addr v10, v11

    div-int/2addr v10, v3

    invoke-direct {v6, v7, v9, v10}, Le/e/a/CommentSettings194$SnapSeek;-><init>(Landroid/content/Context;II)V

    .line 509
    iget-object v7, p0, Le/e/a/CommentSettings194$Editor;->bars:[Landroid/widget/SeekBar;

    aput-object v6, v7, p1

    .line 510
    iget-object v7, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {v7}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v7

    invoke-static {v7}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v7

    invoke-virtual {v6, v7}, Le/e/a/CommentSettings194$SnapSeek;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    .line 511
    iget-object v7, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {v7}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v7

    invoke-static {v7}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v7

    invoke-virtual {v6, v7}, Le/e/a/CommentSettings194$SnapSeek;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    .line 512
    new-instance v7, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v7}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 513
    invoke-virtual {v7, v4}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 514
    iget-object v4, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {v4}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v4

    invoke-virtual {v7, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 515
    const/16 v4, 0x18

    invoke-virtual {p0, v4}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v9

    invoke-virtual {p0, v4}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v4

    invoke-virtual {v7, v9, v4}, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V

    .line 516
    invoke-virtual {v6, v7}, Le/e/a/CommentSettings194$SnapSeek;->setThumb(Landroid/graphics/drawable/Drawable;)V

    .line 517
    const/16 v4, 0xc

    invoke-virtual {p0, v4}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v7

    invoke-virtual {v6, v7}, Le/e/a/CommentSettings194$SnapSeek;->setThumbOffset(I)V

    .line 518
    invoke-virtual {v6, v2}, Le/e/a/CommentSettings194$SnapSeek;->setSplitTrack(Z)V

    .line 519
    invoke-virtual {p0, v4}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v7

    invoke-virtual {p0, v4}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v4

    invoke-virtual {v6, v7, v2, v4, v2}, Le/e/a/CommentSettings194$SnapSeek;->setPadding(IIII)V

    .line 520
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v1}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v7

    invoke-direct {v4, v2, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v6, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 521
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v1}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v4

    invoke-virtual {p0, v1}, Le/e/a/CommentSettings194$Editor;->dp(I)I

    move-result v1

    invoke-direct {v2, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 522
    iget-object v1, p0, Le/e/a/CommentSettings194$Editor;->settings:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 523
    new-instance v0, Le/e/a/CommentSettings194$Editor$20;

    invoke-direct {v0, p0, p1, v3}, Le/e/a/CommentSettings194$Editor$20;-><init>(Le/e/a/CommentSettings194$Editor;II)V

    invoke-virtual {v6, v0}, Le/e/a/CommentSettings194$SnapSeek;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 539
    return-void
.end method

.method text(Ljava/lang/String;I)Landroid/widget/TextView;
    .registers 4

    .line 329
    iget-object v0, p0, Le/e/a/CommentSettings194$Editor;->c:Landroid/content/Context;

    invoke-static {p1}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, p2}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    .line 330
    const/4 p2, 0x0

    invoke-virtual {p1, p2, p2, p2, p2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 331
    const/16 p2, 0x10

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setGravity(I)V

    .line 332
    return-object p1
.end method
