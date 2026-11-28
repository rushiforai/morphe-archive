.class final Le/e/a/Dev132$TabAdapter;
.super Landroid/widget/BaseAdapter;
.source "Dev132.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Dev132;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TabAdapter"
.end annotation


# instance fields
.field final activity:Landroid/app/Activity;

.field final dialog:Landroid/app/AlertDialog;

.field final host:Ljava/lang/Object;

.field final items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final list:Landroid/widget/ListView;

.field final undo:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/Object;Landroid/app/AlertDialog;Landroid/widget/TextView;Landroid/widget/ListView;)V
    .registers 7
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "host"    # Ljava/lang/Object;
    .param p3, "dialog"    # Landroid/app/AlertDialog;
    .param p4, "undo"    # Landroid/widget/TextView;
    .param p5, "list"    # Landroid/widget/ListView;

    .line 249
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 248
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/Dev132$TabAdapter;->items:Ljava/util/ArrayList;

    .line 250
    iput-object p1, p0, Le/e/a/Dev132$TabAdapter;->activity:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/Dev132$TabAdapter;->host:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/Dev132$TabAdapter;->dialog:Landroid/app/AlertDialog;

    iput-object p4, p0, Le/e/a/Dev132$TabAdapter;->undo:Landroid/widget/TextView;

    iput-object p5, p0, Le/e/a/Dev132$TabAdapter;->list:Landroid/widget/ListView;

    invoke-virtual {p0}, Le/e/a/Dev132$TabAdapter;->reload()V

    .line 251
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .line 259
    iget-object v0, p0, Le/e/a/Dev132$TabAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "index"    # I

    .line 260
    iget-object v0, p0, Le/e/a/Dev132$TabAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "index"    # I

    .line 261
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 20
    .param p1, "index"    # I
    .param p2, "unused"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .line 263
    move-object/from16 v1, p0

    iget-object v2, v1, Le/e/a/Dev132$TabAdapter;->activity:Landroid/app/Activity;

    .local v2, "c":Landroid/content/Context;
    iget-object v0, v1, Le/e/a/Dev132$TabAdapter;->items:Ljava/util/ArrayList;

    move/from16 v3, p1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 264
    .local v4, "tab":Ljava/lang/Object;
    const-string v5, ""

    .local v5, "id":Ljava/lang/String;
    const-string v6, ""

    .line 265
    .local v6, "label":Ljava/lang/String;
    :try_start_0
    const-string v0, "id"

    # invokes: Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v4, v0}, Le/e/a/Dev132;->access$600(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v5, v0

    const-string v0, "label"

    # invokes: Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v4, v0}, Le/e/a/Dev132;->access$600(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v6, v0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 266
    :goto_0
    const/4 v7, 0x0

    .line 267
    .local v7, "active":Z
    :try_start_1
    # invokes: Le/e/a/Dev132;->model()Ljava/lang/Object;
    invoke-static {}, Le/e/a/Dev132;->access$200()Ljava/lang/Object;

    move-result-object v0

    const-string v8, "selected"

    # invokes: Le/e/a/Dev132;->text(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, v8}, Le/e/a/Dev132;->access$600(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move v7, v0

    goto :goto_1

    :catch_1
    move-exception v0

    .line 268
    :goto_1
    move-object v0, v5

    .line 269
    .local v0, "selectedId":Ljava/lang/String;
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 270
    .local v8, "row":Landroid/widget/LinearLayout;
    const/16 v9, 0x10

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 271
    const/high16 v10, 0x42500000    # 52.0f

    # invokes: Le/e/a/Dev132;->dp(Landroid/content/Context;F)I
    invoke-static {v2, v10}, Le/e/a/Dev132;->access$700(Landroid/content/Context;F)I

    move-result v10

    invoke-virtual {v8, v10}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 272
    if-eqz v7, :cond_0

    # invokes: Le/e/a/Dev132;->background(Landroid/content/Context;)I
    invoke-static {v2}, Le/e/a/Dev132;->access$800(Landroid/content/Context;)I

    move-result v10

    invoke-virtual {v8, v10}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 273
    :cond_0
    new-instance v10, Landroid/view/View;

    invoke-direct {v10, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 274
    .local v10, "stripe":Landroid/view/View;
    const/4 v11, 0x0

    if-eqz v7, :cond_1

    # invokes: Le/e/a/Dev132;->accent(Landroid/content/Context;)I
    invoke-static {v2}, Le/e/a/Dev132;->access$000(Landroid/content/Context;)I

    move-result v12

    goto :goto_2

    :cond_1
    const/4 v12, 0x0

    :goto_2
    invoke-virtual {v10, v12}, Landroid/view/View;->setBackgroundColor(I)V

    .line 275
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x40400000    # 3.0f

    # invokes: Le/e/a/Dev132;->dp(Landroid/content/Context;F)I
    invoke-static {v2, v13}, Le/e/a/Dev132;->access$700(Landroid/content/Context;F)I

    move-result v13

    const/high16 v14, 0x41f00000    # 30.0f

    # invokes: Le/e/a/Dev132;->dp(Landroid/content/Context;F)I
    invoke-static {v2, v14}, Le/e/a/Dev132;->access$700(Landroid/content/Context;F)I

    move-result v14

    invoke-direct {v12, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v10, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 276
    new-instance v12, Le/e/a/Dev132$Glyph;

    # invokes: Le/e/a/Dev132;->glyph(Ljava/lang/Object;)I
    invoke-static {v4}, Le/e/a/Dev132;->access$900(Ljava/lang/Object;)I

    move-result v13

    invoke-direct {v12, v2, v13}, Le/e/a/Dev132$Glyph;-><init>(Landroid/content/Context;I)V

    .line 277
    .local v12, "icon":Le/e/a/Dev132$Glyph;
    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v14, 0x41b00000    # 22.0f

    # invokes: Le/e/a/Dev132;->dp(Landroid/content/Context;F)I
    invoke-static {v2, v14}, Le/e/a/Dev132;->access$700(Landroid/content/Context;F)I

    move-result v15

    # invokes: Le/e/a/Dev132;->dp(Landroid/content/Context;F)I
    invoke-static {v2, v14}, Le/e/a/Dev132;->access$700(Landroid/content/Context;F)I

    move-result v14

    invoke-direct {v13, v15, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 278
    .local v13, "iconSize":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v14, 0x41400000    # 12.0f

    # invokes: Le/e/a/Dev132;->dp(Landroid/content/Context;F)I
    invoke-static {v2, v14}, Le/e/a/Dev132;->access$700(Landroid/content/Context;F)I

    move-result v14

    iput v14, v13, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    const/high16 v14, 0x41300000    # 11.0f

    # invokes: Le/e/a/Dev132;->dp(Landroid/content/Context;F)I
    invoke-static {v2, v14}, Le/e/a/Dev132;->access$700(Landroid/content/Context;F)I

    move-result v14

    iput v14, v13, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 279
    invoke-virtual {v8, v12, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 280
    new-instance v14, Landroid/widget/TextView;

    invoke-direct {v14, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 281
    .local v14, "title":Landroid/widget/TextView;
    invoke-virtual {v14, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    # invokes: Le/e/a/Dev132;->foreground(Landroid/content/Context;)I
    invoke-static {v2}, Le/e/a/Dev132;->access$1000(Landroid/content/Context;)I

    move-result v15

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setTextColor(I)V

    .line 282
    const/high16 v15, 0x41600000    # 14.0f

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setTextSize(F)V

    .line 283
    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v15, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 284
    sget-object v15, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    if-eqz v7, :cond_2

    const/4 v9, 0x1

    goto :goto_3

    :cond_2
    const/4 v9, 0x0

    :goto_3
    invoke-virtual {v14, v15, v9}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 285
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v15, 0x42400000    # 48.0f

    # invokes: Le/e/a/Dev132;->dp(Landroid/content/Context;F)I
    invoke-static {v2, v15}, Le/e/a/Dev132;->access$700(Landroid/content/Context;F)I

    move-result v3

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-direct {v9, v11, v3, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v14, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 286
    const/16 v3, 0x10

    invoke-virtual {v14, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 287
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 288
    .local v3, "close":Landroid/widget/TextView;
    const-string v9, "\u00d7"

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v9, 0x41b80000    # 23.0f

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setTextSize(F)V

    # invokes: Le/e/a/Dev132;->secondary(Landroid/content/Context;)I
    invoke-static {v2}, Le/e/a/Dev132;->access$100(Landroid/content/Context;)I

    move-result v9

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v9, 0x11

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setGravity(I)V

    .line 289
    const-string v9, "Close tab"

    const-string/jumbo v15, "\u95dc\u9589\u5206\u9801"

    const-string v11, "\u30bf\u30d6\u3092\u9589\u3058\u308b"

    # invokes: Le/e/a/Dev132;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v11, v9, v15}, Le/e/a/Dev132;->access$1100(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 290
    const/4 v9, 0x0

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setFocusable(Z)V

    const/4 v9, 0x1

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setClickable(Z)V

    .line 291
    new-instance v9, Le/e/a/Dev132$TabAdapter$0;

    invoke-direct {v9, v1, v4}, Le/e/a/Dev132$TabAdapter$0;-><init>(Le/e/a/Dev132$TabAdapter;Ljava/lang/Object;)V

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v3 .. v3}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 295
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v11, 0x42340000    # 45.0f

    # invokes: Le/e/a/Dev132;->dp(Landroid/content/Context;F)I
    invoke-static {v2, v11}, Le/e/a/Dev132;->access$700(Landroid/content/Context;F)I

    move-result v11

    const/high16 v15, 0x42400000    # 48.0f

    # invokes: Le/e/a/Dev132;->dp(Landroid/content/Context;F)I
    invoke-static {v2, v15}, Le/e/a/Dev132;->access$700(Landroid/content/Context;F)I

    move-result v15

    invoke-direct {v9, v11, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v3, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 296
    invoke-virtual {v8, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 297
    invoke-virtual {v8, v6}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 298
    return-object v8
.end method

.method synthetic lambda$getView$0$e-e-a-Dev132$TabAdapter(Ljava/lang/Object;Landroid/view/View;)V
    .registers 5
    .param p1, "tab"    # Ljava/lang/Object;
    .param p2, "v"    # Landroid/view/View;

    .line 292
    iget-object v0, p0, Le/e/a/Dev132$TabAdapter;->activity:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/Dev132$TabAdapter;->host:Ljava/lang/Object;

    # invokes: Le/e/a/Dev132;->close(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;)V
    invoke-static {v0, v1, p1}, Le/e/a/Dev132;->access$1200(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 293
    invoke-virtual {p0}, Le/e/a/Dev132$TabAdapter;->reload()V

    .line 294
    return-void
.end method

.method reload()V
    .registers 4

    .line 253
    iget-object v0, p0, Le/e/a/Dev132$TabAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 254
    :try_start_0
    iget-object v0, p0, Le/e/a/Dev132$TabAdapter;->items:Ljava/util/ArrayList;

    # invokes: Le/e/a/Dev132;->model()Ljava/lang/Object;
    invoke-static {}, Le/e/a/Dev132;->access$200()Ljava/lang/Object;

    move-result-object v1

    # invokes: Le/e/a/Dev132;->tabs(Ljava/lang/Object;)Ljava/util/ArrayList;
    invoke-static {v1}, Le/e/a/Dev132;->access$300(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 255
    :goto_0
    iget-object v0, p0, Le/e/a/Dev132$TabAdapter;->undo:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Le/e/a/Dev132$TabAdapter;->undo:Landroid/widget/TextView;

    # invokes: Le/e/a/Dev132;->canRestoreSafe()Z
    invoke-static {}, Le/e/a/Dev132;->access$400()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-object v0, p0, Le/e/a/Dev132$TabAdapter;->undo:Landroid/widget/TextView;

    iget-object v1, p0, Le/e/a/Dev132$TabAdapter;->undo:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_1

    :cond_0
    const v1, 0x3ecccccd    # 0.4f

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 256
    :cond_1
    iget-object v0, p0, Le/e/a/Dev132$TabAdapter;->activity:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/Dev132$TabAdapter;->list:Landroid/widget/ListView;

    iget-object v2, p0, Le/e/a/Dev132$TabAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    # invokes: Le/e/a/Dev132;->fitList(Landroid/app/Activity;Landroid/widget/ListView;I)V
    invoke-static {v0, v1, v2}, Le/e/a/Dev132;->access$500(Landroid/app/Activity;Landroid/widget/ListView;I)V

    .line 257
    invoke-virtual {p0}, Le/e/a/Dev132$TabAdapter;->notifyDataSetChanged()V

    .line 258
    return-void
.end method
