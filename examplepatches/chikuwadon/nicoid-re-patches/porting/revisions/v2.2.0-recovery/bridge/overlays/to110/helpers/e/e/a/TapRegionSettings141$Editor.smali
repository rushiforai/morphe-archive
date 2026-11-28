.class final Le/e/a/TapRegionSettings141$Editor;
.super Ljava/lang/Object;
.source "TapRegionSettings141.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/TapRegionSettings141;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Editor"
.end annotation


# instance fields
.field final accent:I

.field final add:Landroid/widget/Button;

.field final adjustments:[Landroid/widget/LinearLayout;

.field final areaChevron:Landroid/widget/TextView;

.field final areaSelector:Landroid/widget/Button;

.field boundary:I

.field final context:Landroid/content/Context;

.field final coordinates:[Landroid/widget/TextView;

.field final edgeNames:[Ljava/lang/String;

.field final foreground:I

.field final minus:[Landroid/widget/Button;

.field mode:I

.field final openOnly:Landroid/widget/CheckBox;

.field final plus:[Landroid/widget/Button;

.field final presets:[Landroid/widget/Button;

.field final preview:Le/e/a/TapRegionSettings141$Preview;

.field final previewHeading:Landroid/widget/TextView;

.field final ranges:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "[I>;"
        }
    .end annotation
.end field

.field final remove:Landroid/widget/Button;

.field final scroll:Landroid/widget/ScrollView;

.field final secondary:I

.field selected:I


# direct methods
.method public static synthetic $r8$lambda$BkBYoP9hd9QxAAUg0gs8zo7pQas(Le/e/a/TapRegionSettings141$Editor;)V
    .registers 1

    invoke-direct {p0}, Le/e/a/TapRegionSettings141$Editor;->showAreas()V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Le/e/a/TapRegions141;Z)V
    .registers 24
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "current"    # Le/e/a/TapRegions141;
    .param p3, "openingOnly"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 127
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 117
    const/4 v2, 0x5

    new-array v2, v2, [Landroid/widget/Button;

    iput-object v2, v0, Le/e/a/TapRegionSettings141$Editor;->presets:[Landroid/widget/Button;

    .line 118
    const/4 v2, 0x4

    new-array v3, v2, [Landroid/widget/LinearLayout;

    iput-object v3, v0, Le/e/a/TapRegionSettings141$Editor;->adjustments:[Landroid/widget/LinearLayout;

    .line 119
    new-array v3, v2, [Landroid/widget/TextView;

    iput-object v3, v0, Le/e/a/TapRegionSettings141$Editor;->coordinates:[Landroid/widget/TextView;

    .line 120
    new-array v3, v2, [Landroid/widget/Button;

    iput-object v3, v0, Le/e/a/TapRegionSettings141$Editor;->minus:[Landroid/widget/Button;

    new-array v3, v2, [Landroid/widget/Button;

    iput-object v3, v0, Le/e/a/TapRegionSettings141$Editor;->plus:[Landroid/widget/Button;

    .line 124
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    .line 128
    iput-object v1, v0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    .line 129
    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Landroid/content/Context;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    new-array v5, v3, [Ljava/lang/Object;

    aput-object v1, v5, v6

    const-string v7, "e.e.a.UiDialogs"

    const-string v8, "accent"

    invoke-static {v7, v8, v4, v5}, Le/e/a/Dev112;->staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, v0, Le/e/a/TapRegionSettings141$Editor;->accent:I

    .line 130
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 131
    .local v4, "sample":Landroid/widget/TextView;
    invoke-virtual {v4}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v5

    iput v5, v0, Le/e/a/TapRegionSettings141$Editor;->foreground:I

    .line 132
    iget v5, v0, Le/e/a/TapRegionSettings141$Editor;->foreground:I

    const/16 v7, 0xb9

    invoke-static {v5, v7}, Le/e/a/TapRegionSettings141$Editor;->tint(II)I

    move-result v5

    iput v5, v0, Le/e/a/TapRegionSettings141$Editor;->secondary:I

    .line 133
    const-string v5, "\u5de6"

    const-string v7, "Left"

    invoke-virtual {v0, v5, v7, v5}, Le/e/a/TapRegionSettings141$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v7, "\u53f3"

    const-string v8, "Right"

    invoke-virtual {v0, v7, v8, v7}, Le/e/a/TapRegionSettings141$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 134
    const-string v8, "\u4e0a"

    const-string v9, "Top"

    invoke-virtual {v0, v8, v9, v8}, Le/e/a/TapRegionSettings141$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "\u4e0b"

    const-string v10, "Bottom"

    invoke-virtual {v0, v9, v10, v9}, Le/e/a/TapRegionSettings141$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    filled-new-array {v5, v7, v8, v9}, [Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Le/e/a/TapRegionSettings141$Editor;->edgeNames:[Ljava/lang/String;

    .line 135
    invoke-direct {v0}, Le/e/a/TapRegionSettings141$Editor;->column()Landroid/widget/LinearLayout;

    move-result-object v5

    .line 136
    .local v5, "body":Landroid/widget/LinearLayout;
    const/high16 v7, 0x41900000    # 18.0f

    invoke-virtual {v0, v7}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v8

    const/high16 v9, 0x40000000    # 2.0f

    invoke-virtual {v0, v9}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v10

    invoke-virtual {v0, v7}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v7

    const/high16 v11, 0x41000000    # 8.0f

    invoke-virtual {v0, v11}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v11

    invoke-virtual {v5, v8, v10, v7, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 137
    new-instance v7, Landroid/widget/ScrollView;

    invoke-direct {v7, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v7, v0, Le/e/a/TapRegionSettings141$Editor;->scroll:Landroid/widget/ScrollView;

    .line 138
    iget-object v7, v0, Le/e/a/TapRegionSettings141$Editor;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v7, v6}, Landroid/widget/ScrollView;->setClipToPadding(Z)V

    .line 139
    iget-object v7, v0, Le/e/a/TapRegionSettings141$Editor;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v7, v5}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 141
    const-string v7, "Presets"

    const-string v8, "\u5340\u57df\u9810\u8a2d"

    const-string/jumbo v10, "\u9818\u57df\u30d7\u30ea\u30bb\u30c3\u30c8"

    invoke-virtual {v0, v10, v7, v8}, Le/e/a/TapRegionSettings141$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "\u25a6"

    invoke-direct {v0, v5, v8, v7}, Le/e/a/TapRegionSettings141$Editor;->section(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/TextView;

    .line 142
    # invokes: Le/e/a/TapRegionSettings141;->names(Landroid/content/Context;)[Ljava/lang/String;
    invoke-static {v1}, Le/e/a/TapRegionSettings141;->access$000(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v7

    .line 143
    .local v7, "labels":[Ljava/lang/String;
    const-string v8, "\u2299"

    const-string v10, "\u25a3"

    const-string v11, "\u26f6"

    const-string v12, "\u2194"

    const-string v13, "\u2195"

    filled-new-array {v11, v12, v13, v8, v10}, [Ljava/lang/String;

    move-result-object v8

    .line 146
    .local v8, "symbols":[Ljava/lang/String;
    const/4 v10, 0x3

    const/4 v11, 0x2

    filled-new-array {v6, v2, v11, v10, v3}, [I

    move-result-object v2

    .line 148
    .local v2, "order":[I
    const/4 v10, 0x0

    .local v10, "line":I
    :goto_0
    if-ge v10, v11, :cond_4

    .line 149
    invoke-direct {v0, v5}, Le/e/a/TapRegionSettings141$Editor;->row(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v14

    .line 150
    .local v14, "presetRow":Landroid/widget/LinearLayout;
    invoke-virtual {v14}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v15

    check-cast v15, Landroid/widget/LinearLayout$LayoutParams;

    .line 151
    .local v15, "rowSize":Landroid/widget/LinearLayout$LayoutParams;
    if-nez v10, :cond_0

    const/16 v16, 0x0

    const/4 v3, 0x0

    goto :goto_1

    :cond_0
    const/high16 v3, 0x40000000    # 2.0f

    :goto_1
    const/16 v16, 0x1

    invoke-virtual {v0, v3}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v3

    iput v3, v15, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 152
    iput v6, v15, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 153
    invoke-virtual {v14, v15}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 154
    if-nez v10, :cond_1

    const/4 v3, 0x0

    goto :goto_2

    :cond_1
    const/4 v3, 0x2

    .line 155
    .local v3, "from":I
    :goto_2
    if-nez v10, :cond_2

    const/4 v9, 0x2

    goto :goto_3

    :cond_2
    array-length v9, v2

    .line 156
    .local v9, "until":I
    :goto_3
    move/from16 v17, v3

    move/from16 v11, v17

    .local v11, "i":I
    :goto_4
    if-ge v11, v9, :cond_3

    .line 157
    aget v6, v2, v11

    .line 158
    .local v6, "option":I
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v13, v8, v6

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "  "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    aget-object v13, v7, v6

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    new-instance v13, Le/e/a/TapRegionSettings141$Editor$1;

    invoke-direct {v13, v0, v6}, Le/e/a/TapRegionSettings141$Editor$1;-><init>(Le/e/a/TapRegionSettings141$Editor;I)V

    invoke-direct {v0, v14, v12, v13}, Le/e/a/TapRegionSettings141$Editor;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v12

    .line 160
    .local v12, "preset":Landroid/widget/Button;
    move-object/from16 v18, v2

    const/high16 v13, 0x42100000    # 36.0f

    .end local v2    # "order":[I
    .local v18, "order":[I
    invoke-virtual {v0, v13}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v2

    invoke-virtual {v12, v2}, Landroid/widget/Button;->setMinHeight(I)V

    .line 161
    aget-object v2, v7, v6

    invoke-virtual {v12, v2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 162
    invoke-virtual {v12}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 163
    .local v2, "buttonSize":Landroid/widget/LinearLayout$LayoutParams;
    move/from16 v19, v3

    const/high16 v13, 0x40400000    # 3.0f

    .end local v3    # "from":I
    .local v19, "from":I
    invoke-virtual {v0, v13}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 164
    invoke-virtual {v12, v2}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 165
    iget-object v3, v0, Le/e/a/TapRegionSettings141$Editor;->presets:[Landroid/widget/Button;

    aput-object v12, v3, v6

    .line 156
    .end local v2    # "buttonSize":Landroid/widget/LinearLayout$LayoutParams;
    .end local v6    # "option":I
    .end local v12    # "preset":Landroid/widget/Button;
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v2, v18

    move/from16 v3, v19

    const/4 v6, 0x0

    goto :goto_4

    .end local v18    # "order":[I
    .end local v19    # "from":I
    .local v2, "order":[I
    .restart local v3    # "from":I
    :cond_3
    move-object/from16 v18, v2

    move/from16 v19, v3

    .line 148
    .end local v2    # "order":[I
    .end local v3    # "from":I
    .end local v9    # "until":I
    .end local v11    # "i":I
    .end local v14    # "presetRow":Landroid/widget/LinearLayout;
    .end local v15    # "rowSize":Landroid/widget/LinearLayout$LayoutParams;
    .restart local v18    # "order":[I
    add-int/lit8 v10, v10, 0x1

    const/4 v3, 0x1

    const/4 v6, 0x0

    const/high16 v9, 0x40000000    # 2.0f

    const/4 v11, 0x2

    goto/16 :goto_0

    .end local v18    # "order":[I
    .restart local v2    # "order":[I
    :cond_4
    move-object/from16 v18, v2

    const/16 v16, 0x1

    .line 168
    .end local v2    # "order":[I
    .end local v10    # "line":I
    .restart local v18    # "order":[I
    new-instance v2, Landroid/widget/CheckBox;

    invoke-direct {v2, v1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iput-object v2, v0, Le/e/a/TapRegionSettings141$Editor;->openOnly:Landroid/widget/CheckBox;

    .line 169
    iget-object v2, v0, Le/e/a/TapRegionSettings141$Editor;->openOnly:Landroid/widget/CheckBox;

    const-string v3, "Limit area only when opening controls"

    const-string v6, "\u53ea\u5728\u958b\u555f\u63a7\u5236\u9805\u6642\u9650\u5236\u5340\u57df"

    const-string/jumbo v9, "\u64cd\u4f5c\u90e8\u3092\u958b\u304f\u3068\u304d\u3060\u3051\u9818\u57df\u3092\u5236\u9650"

    invoke-virtual {v0, v9, v3, v6}, Le/e/a/TapRegionSettings141$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 170
    iget-object v2, v0, Le/e/a/TapRegionSettings141$Editor;->openOnly:Landroid/widget/CheckBox;

    const/high16 v3, 0x41500000    # 13.0f

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setTextSize(F)V

    .line 171
    iget-object v2, v0, Le/e/a/TapRegionSettings141$Editor;->openOnly:Landroid/widget/CheckBox;

    move/from16 v3, p3

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 172
    iget-object v2, v0, Le/e/a/TapRegionSettings141$Editor;->openOnly:Landroid/widget/CheckBox;

    const/high16 v13, 0x42100000    # 36.0f

    invoke-virtual {v0, v13}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v6

    invoke-virtual {v2, v6}, Landroid/widget/CheckBox;->setMinHeight(I)V

    .line 173
    iget-object v2, v0, Le/e/a/TapRegionSettings141$Editor;->openOnly:Landroid/widget/CheckBox;

    const/4 v6, 0x0

    invoke-virtual {v2, v6, v6, v6, v6}, Landroid/widget/CheckBox;->setPadding(IIII)V

    .line 174
    iget-object v2, v0, Le/e/a/TapRegionSettings141$Editor;->openOnly:Landroid/widget/CheckBox;

    new-instance v9, Landroid/content/res/ColorStateList;

    new-array v10, v6, [I

    const/4 v11, 0x2

    new-array v12, v11, [[I

    const v11, 0x10100a0

    filled-new-array {v11}, [I

    move-result-object v11

    aput-object v11, v12, v6

    aput-object v10, v12, v16

    iget v6, v0, Le/e/a/TapRegionSettings141$Editor;->accent:I

    iget v10, v0, Le/e/a/TapRegionSettings141$Editor;->secondary:I

    filled-new-array {v6, v10}, [I

    move-result-object v6

    invoke-direct {v9, v12, v6}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v2, v9}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    .line 177
    iget-object v2, v0, Le/e/a/TapRegionSettings141$Editor;->openOnly:Landroid/widget/CheckBox;

    invoke-virtual {v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 178
    const-string v2, "\u25b1"

    const-string v6, ""

    invoke-direct {v0, v5, v2, v6}, Le/e/a/TapRegionSettings141$Editor;->section(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v2

    iput-object v2, v0, Le/e/a/TapRegionSettings141$Editor;->previewHeading:Landroid/widget/TextView;

    .line 179
    const-string v2, "Drag an area or its border to adjust it."

    const-string v9, "\u62d6\u66f3\u5340\u57df\u6216\u908a\u6846\u4ee5\u8abf\u6574\u3002"

    const-string/jumbo v10, "\u9818\u57df\u3084\u67a0\u306f\u30c9\u30e9\u30c3\u30b0\u3067\u8abf\u6574\u3067\u304d\u307e\u3059"

    invoke-virtual {v0, v10, v2, v9}, Le/e/a/TapRegionSettings141$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Le/e/a/TapRegionSettings141$Editor;->note(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 182
    new-instance v2, Le/e/a/TapRegionSettings141$Preview;

    invoke-direct {v2, v0}, Le/e/a/TapRegionSettings141$Preview;-><init>(Le/e/a/TapRegionSettings141$Editor;)V

    iput-object v2, v0, Le/e/a/TapRegionSettings141$Editor;->preview:Le/e/a/TapRegionSettings141$Preview;

    .line 183
    iget-object v2, v0, Le/e/a/TapRegionSettings141$Editor;->preview:Le/e/a/TapRegionSettings141$Preview;

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x43380000    # 184.0f

    invoke-virtual {v0, v10}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v10

    const/4 v11, -0x1

    invoke-direct {v9, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 185
    const-string v2, "Fine adjustment"

    const-string v9, "\u5fae\u8abf"

    const-string v10, "\u30af\u30a4\u30c3\u30af\u8abf\u6574"

    invoke-virtual {v0, v10, v2, v9}, Le/e/a/TapRegionSettings141$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v9, "\u2261"

    invoke-direct {v0, v5, v9, v2}, Le/e/a/TapRegionSettings141$Editor;->section(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/TextView;

    .line 186
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    iget-object v9, v0, Le/e/a/TapRegionSettings141$Editor;->adjustments:[Landroid/widget/LinearLayout;

    array-length v9, v9

    if-ge v2, v9, :cond_6

    .line 187
    invoke-direct {v0, v5}, Le/e/a/TapRegionSettings141$Editor;->row(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v9

    .line 188
    .local v9, "pair":Landroid/widget/LinearLayout;
    if-nez v2, :cond_5

    const/high16 v10, 0x3f800000    # 1.0f

    goto :goto_6

    :cond_5
    const/high16 v10, 0x40000000    # 2.0f

    :goto_6
    invoke-virtual {v0, v10}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v10

    const/4 v12, 0x0

    invoke-virtual {v9, v12, v10, v12, v12}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 189
    invoke-direct {v0, v9, v2}, Le/e/a/TapRegionSettings141$Editor;->addAdjustment(Landroid/widget/LinearLayout;I)V

    .line 190
    add-int/lit8 v10, v2, 0x1

    invoke-direct {v0, v9, v10}, Le/e/a/TapRegionSettings141$Editor;->addAdjustment(Landroid/widget/LinearLayout;I)V

    .line 186
    .end local v9    # "pair":Landroid/widget/LinearLayout;
    add-int/lit8 v2, v2, 0x2

    goto :goto_5

    .line 193
    .end local v2    # "i":I
    :cond_6
    const-string v2, "Areas"

    const-string v9, "\u5340\u57df"

    const-string/jumbo v12, "\u9818\u57df"

    invoke-virtual {v0, v12, v2, v9}, Le/e/a/TapRegionSettings141$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v9, "\u25a4"

    invoke-direct {v0, v5, v9, v2}, Le/e/a/TapRegionSettings141$Editor;->section(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/TextView;

    .line 194
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 195
    .local v2, "selector":Landroid/widget/FrameLayout;
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x2

    invoke-direct {v9, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 196
    .local v9, "selectorSize":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v13, 0x40000000    # 2.0f

    invoke-virtual {v0, v13}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v14

    invoke-virtual {v0, v13}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v15

    invoke-virtual {v0, v13}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v10

    const/high16 v13, 0x40400000    # 3.0f

    invoke-virtual {v0, v13}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v13

    invoke-virtual {v9, v14, v15, v10, v13}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 197
    invoke-virtual {v5, v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 198
    new-instance v10, Le/e/a/TapRegionSettings141$Editor$2;

    invoke-direct {v10, v0}, Le/e/a/TapRegionSettings141$Editor$2;-><init>(Le/e/a/TapRegionSettings141$Editor;)V

    invoke-direct {v0, v6, v10}, Le/e/a/TapRegionSettings141$Editor;->createButton(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v6

    iput-object v6, v0, Le/e/a/TapRegionSettings141$Editor;->areaSelector:Landroid/widget/Button;

    .line 199
    iget-object v6, v0, Le/e/a/TapRegionSettings141$Editor;->areaSelector:Landroid/widget/Button;

    const v10, 0x800013

    invoke-virtual {v6, v10}, Landroid/widget/Button;->setGravity(I)V

    .line 200
    iget-object v6, v0, Le/e/a/TapRegionSettings141$Editor;->areaSelector:Landroid/widget/Button;

    const/high16 v13, 0x41600000    # 14.0f

    invoke-virtual {v0, v13}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v14

    const/high16 v15, 0x40800000    # 4.0f

    invoke-virtual {v0, v15}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v10

    const/high16 v13, 0x42000000    # 32.0f

    invoke-virtual {v0, v13}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v13

    invoke-virtual {v0, v15}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v15

    invoke-virtual {v6, v14, v10, v13, v15}, Landroid/widget/Button;->setPadding(IIII)V

    .line 201
    iget-object v6, v0, Le/e/a/TapRegionSettings141$Editor;->areaSelector:Landroid/widget/Button;

    const/high16 v13, 0x42100000    # 36.0f

    invoke-virtual {v0, v13}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v10

    invoke-virtual {v6, v10}, Landroid/widget/Button;->setMinHeight(I)V

    .line 202
    iget-object v6, v0, Le/e/a/TapRegionSettings141$Editor;->areaSelector:Landroid/widget/Button;

    const/4 v10, 0x0

    invoke-direct {v0, v6, v10}, Le/e/a/TapRegionSettings141$Editor;->style(Landroid/widget/Button;Z)V

    .line 203
    iget-object v6, v0, Le/e/a/TapRegionSettings141$Editor;->areaSelector:Landroid/widget/Button;

    new-instance v10, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v10, v11, v12}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v6, v10}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 204
    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v6, v0, Le/e/a/TapRegionSettings141$Editor;->areaChevron:Landroid/widget/TextView;

    .line 205
    iget-object v6, v0, Le/e/a/TapRegionSettings141$Editor;->areaChevron:Landroid/widget/TextView;

    const-string v10, "\u25be"

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 206
    iget-object v6, v0, Le/e/a/TapRegionSettings141$Editor;->areaChevron:Landroid/widget/TextView;

    iget v10, v0, Le/e/a/TapRegionSettings141$Editor;->secondary:I

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 207
    iget-object v6, v0, Le/e/a/TapRegionSettings141$Editor;->areaChevron:Landroid/widget/TextView;

    const/4 v11, 0x2

    invoke-virtual {v6, v11}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    .line 208
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    const v10, 0x800015

    invoke-direct {v6, v12, v12, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 210
    .local v6, "chevron":Landroid/widget/FrameLayout$LayoutParams;
    const/high16 v10, 0x41600000    # 14.0f

    invoke-virtual {v0, v10}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v10

    invoke-virtual {v6, v10}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    .line 211
    iget-object v10, v0, Le/e/a/TapRegionSettings141$Editor;->areaChevron:Landroid/widget/TextView;

    invoke-virtual {v2, v10, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 212
    invoke-direct {v0, v5}, Le/e/a/TapRegionSettings141$Editor;->row(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v10

    .line 213
    .local v10, "actions":Landroid/widget/LinearLayout;
    const/high16 v13, 0x40000000    # 2.0f

    invoke-virtual {v0, v13}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v11

    const/4 v12, 0x0

    invoke-virtual {v10, v12, v12, v12, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 214
    const-string v11, "Delete area"

    const-string v12, "\u522a\u9664\u5340\u57df"

    const-string/jumbo v13, "\u9818\u57df\u3092\u524a\u9664"

    invoke-virtual {v0, v13, v11, v12}, Le/e/a/TapRegionSettings141$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Le/e/a/TapRegionSettings141$Editor$3;

    invoke-direct {v12, v0}, Le/e/a/TapRegionSettings141$Editor$3;-><init>(Le/e/a/TapRegionSettings141$Editor;)V

    invoke-direct {v0, v10, v11, v12}, Le/e/a/TapRegionSettings141$Editor;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v11

    iput-object v11, v0, Le/e/a/TapRegionSettings141$Editor;->remove:Landroid/widget/Button;

    .line 215
    const-string v11, "+ Add area"

    const-string/jumbo v12, "\uff0b \u65b0\u589e\u5340\u57df"

    const-string/jumbo v13, "\uff0b \u9818\u57df\u3092\u8ffd\u52a0"

    invoke-virtual {v0, v13, v11, v12}, Le/e/a/TapRegionSettings141$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Le/e/a/TapRegionSettings141$Editor$4;

    invoke-direct {v12, v0}, Le/e/a/TapRegionSettings141$Editor$4;-><init>(Le/e/a/TapRegionSettings141$Editor;)V

    invoke-direct {v0, v10, v11, v12}, Le/e/a/TapRegionSettings141$Editor;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v11

    iput-object v11, v0, Le/e/a/TapRegionSettings141$Editor;->add:Landroid/widget/Button;

    .line 216
    iget-object v11, v0, Le/e/a/TapRegionSettings141$Editor;->remove:Landroid/widget/Button;

    const/4 v12, 0x0

    invoke-direct {v0, v11, v12}, Le/e/a/TapRegionSettings141$Editor;->style(Landroid/widget/Button;Z)V

    .line 217
    iget-object v11, v0, Le/e/a/TapRegionSettings141$Editor;->add:Landroid/widget/Button;

    invoke-direct {v0, v11, v12}, Le/e/a/TapRegionSettings141$Editor;->style(Landroid/widget/Button;Z)V

    .line 218
    invoke-direct {v0, v5}, Le/e/a/TapRegionSettings141$Editor;->row(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v11

    .line 219
    .local v11, "resetRow":Landroid/widget/LinearLayout;
    const/high16 v13, 0x40000000    # 2.0f

    invoke-virtual {v0, v13}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v13

    const/high16 v14, 0x3f800000    # 1.0f

    invoke-virtual {v0, v14}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v14

    invoke-virtual {v11, v12, v13, v12, v14}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 220
    const-string v12, "Restore default"

    const-string v13, "\u6062\u5fa9\u9810\u8a2d"

    const-string v14, "\u521d\u671f\u5024\u306b\u623b\u3059"

    invoke-virtual {v0, v14, v12, v13}, Le/e/a/TapRegionSettings141$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    new-instance v13, Le/e/a/TapRegionSettings141$Editor$5;

    invoke-direct {v13, v0}, Le/e/a/TapRegionSettings141$Editor$5;-><init>(Le/e/a/TapRegionSettings141$Editor;)V

    invoke-direct {v0, v11, v12, v13}, Le/e/a/TapRegionSettings141$Editor;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v12

    .line 225
    .local v12, "reset":Landroid/widget/Button;
    const v13, 0x800013

    invoke-virtual {v12, v13}, Landroid/widget/Button;->setGravity(I)V

    .line 226
    iget v13, v0, Le/e/a/TapRegionSettings141$Editor;->accent:I

    invoke-virtual {v12, v13}, Landroid/widget/Button;->setTextColor(I)V

    .line 227
    move-object/from16 v13, p2

    invoke-virtual {v0, v13}, Le/e/a/TapRegionSettings141$Editor;->set(Le/e/a/TapRegions141;)V

    .line 228
    return-void
.end method

.method private addAdjustment(Landroid/widget/LinearLayout;I)V
    .registers 12
    .param p1, "pair"    # Landroid/widget/LinearLayout;
    .param p2, "edge"    # I

    .line 375
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 376
    .local v0, "setting":Landroid/widget/LinearLayout;
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 377
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, 0x0

    const/4 v3, -0x2

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 378
    .local v1, "size":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v5, 0x40000000    # 2.0f

    invoke-virtual {p0, v5}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v6

    invoke-virtual {p0, v4}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v7

    invoke-virtual {p0, v5}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v5

    invoke-virtual {p0, v4}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v8

    invoke-virtual {v1, v6, v7, v5, v8}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 379
    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 380
    iget-object v5, p0, Le/e/a/TapRegionSettings141$Editor;->adjustments:[Landroid/widget/LinearLayout;

    aput-object v0, v5, p2

    .line 381
    iget-object v5, p0, Le/e/a/TapRegionSettings141$Editor;->minus:[Landroid/widget/Button;

    const-string v6, "\u2212"

    const/4 v7, -0x1

    invoke-direct {p0, v0, v6, p2, v7}, Le/e/a/TapRegionSettings141$Editor;->stepButton(Landroid/widget/LinearLayout;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v6

    aput-object v6, v5, p2

    .line 382
    new-instance v5, Landroid/widget/TextView;

    iget-object v6, p0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    invoke-direct {v5, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 383
    .local v5, "coordinate":Landroid/widget/TextView;
    iget-object v6, p0, Le/e/a/TapRegionSettings141$Editor;->coordinates:[Landroid/widget/TextView;

    aput-object v5, v6, p2

    .line 384
    const/high16 v6, 0x41500000    # 13.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 385
    const/16 v6, 0x11

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 386
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 387
    iget-object v2, p0, Le/e/a/TapRegionSettings141$Editor;->plus:[Landroid/widget/Button;

    const-string v3, "+"

    const/4 v4, 0x1

    invoke-direct {p0, v0, v3, p2, v4}, Le/e/a/TapRegionSettings141$Editor;->stepButton(Landroid/widget/LinearLayout;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v3

    aput-object v3, v2, p2

    .line 388
    return-void
.end method

.method private adjustEnabled(Landroid/widget/Button;Z)V
    .registers 4
    .param p1, "button"    # Landroid/widget/Button;
    .param p2, "enabled"    # Z

    .line 512
    invoke-virtual {p1, p2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 513
    if-eqz p2, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    const v0, 0x3ed70a3d    # 0.42f

    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setAlpha(F)V

    .line 514
    return-void
.end method

.method private append(II)V
    .registers 8
    .param p1, "x"    # I
    .param p2, "y"    # I

    .line 464
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    add-int/lit8 v1, p1, -0xc

    add-int/lit8 v2, p1, 0xc

    add-int/lit8 v3, p2, -0xc

    add-int/lit8 v4, p2, 0xc

    filled-new-array {v1, v2, v3, v4}, [I

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 465
    const/4 v0, 0x4

    iput v0, p0, Le/e/a/TapRegionSettings141$Editor;->mode:I

    .line 466
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Le/e/a/TapRegionSettings141$Editor;->selected:I

    .line 467
    invoke-virtual {p0}, Le/e/a/TapRegionSettings141$Editor;->refresh()V

    .line 468
    return-void
.end method

.method private areaName(I)Ljava/lang/String;
    .registers 6
    .param p1, "index"    # I

    .line 289
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Area"

    const-string v2, "\u5340\u57df"

    const-string/jumbo v3, "\u9818\u57df"

    invoke-virtual {p0, v3, v1, v2}, Le/e/a/TapRegionSettings141$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .registers 10
    .param p1, "row"    # Landroid/widget/LinearLayout;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "action"    # Ljava/lang/Runnable;

    .line 367
    invoke-direct {p0, p2, p3}, Le/e/a/TapRegionSettings141$Editor;->createButton(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    .line 368
    .local v0, "button":Landroid/widget/Button;
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, 0x0

    const/4 v3, -0x2

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 369
    .local v1, "size":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v2, 0x40400000    # 3.0f

    invoke-virtual {p0, v2}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v3

    invoke-virtual {p0, v4}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v5

    invoke-virtual {p0, v2}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v2

    invoke-virtual {p0, v4}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v4

    invoke-virtual {v1, v3, v5, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 370
    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 371
    return-object v0
.end method

.method private column()Landroid/widget/LinearLayout;
    .registers 3

    .line 231
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 232
    .local v0, "layout":Landroid/widget/LinearLayout;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 233
    return-object v0
.end method

.method private createButton(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .registers 9
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "action"    # Ljava/lang/Runnable;

    .line 352
    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    const v2, 0x101032b

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 353
    .local v0, "button":Landroid/widget/Button;
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 354
    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 355
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 356
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 357
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinimumWidth(I)V

    .line 358
    const/high16 v2, 0x42080000    # 34.0f

    invoke-virtual {p0, v2}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setMinHeight(I)V

    .line 359
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 360
    const/high16 v1, 0x40800000    # 4.0f

    invoke-virtual {p0, v1}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v2

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {p0, v4}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v5

    invoke-virtual {p0, v1}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v1

    invoke-virtual {p0, v4}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v4

    invoke-virtual {v0, v2, v5, v1, v4}, Landroid/widget/Button;->setPadding(IIII)V

    .line 361
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 362
    new-instance v1, Le/e/a/TapRegionSettings141$Editor$0;

    invoke-direct {v1, p2}, Le/e/a/TapRegionSettings141$Editor$0;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 363
    return-object v0
.end method

.method private divider(Landroid/widget/LinearLayout;II)V
    .registers 9
    .param p1, "parent"    # Landroid/widget/LinearLayout;
    .param p2, "top"    # I
    .param p3, "bottom"    # I

    .line 260
    new-instance v0, Landroid/view/View;

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 261
    .local v0, "divider":Landroid/view/View;
    iget v1, p0, Le/e/a/TapRegionSettings141$Editor;->foreground:I

    const/16 v2, 0x1f

    invoke-static {v1, v2}, Le/e/a/TapRegionSettings141$Editor;->tint(II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 262
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {p0, v2}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v2

    const/4 v3, -0x1

    invoke-direct {v1, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 263
    .local v1, "line":Landroid/widget/LinearLayout$LayoutParams;
    int-to-float v2, p2

    invoke-virtual {p0, v2}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v2

    int-to-float v3, p3

    invoke-virtual {p0, v3}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 264
    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 265
    return-void
.end method

.method static synthetic lambda$createButton$3(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2
    .param p0, "action"    # Ljava/lang/Runnable;
    .param p1, "v"    # Landroid/view/View;

    .line 362
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method private note(Ljava/lang/String;)Landroid/widget/TextView;
    .registers 7
    .param p1, "text"    # Ljava/lang/String;

    .line 251
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 252
    .local v0, "label":Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 253
    const/high16 v1, 0x41500000    # 13.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 254
    iget v1, p0, Le/e/a/TapRegionSettings141$Editor;->secondary:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 255
    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {p0, v1}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v2

    invoke-virtual {p0, v1}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v1

    const/high16 v3, 0x40800000    # 4.0f

    invoke-virtual {p0, v3}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 256
    return-object v0
.end method

.method private row(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;
    .registers 4
    .param p1, "parent"    # Landroid/widget/LinearLayout;

    .line 237
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 238
    .local v0, "layout":Landroid/widget/LinearLayout;
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 239
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 240
    return-object v0
.end method

.method private section(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/TextView;
    .registers 11
    .param p1, "parent"    # Landroid/widget/LinearLayout;
    .param p2, "symbol"    # Ljava/lang/String;
    .param p3, "title"    # Ljava/lang/String;

    .line 268
    const/4 v0, 0x6

    const/4 v1, 0x5

    invoke-direct {p0, p1, v0, v1}, Le/e/a/TapRegionSettings141$Editor;->divider(Landroid/widget/LinearLayout;II)V

    .line 269
    invoke-direct {p0, p1}, Le/e/a/TapRegionSettings141$Editor;->row(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 270
    .local v0, "heading":Landroid/widget/LinearLayout;
    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 271
    .local v1, "icon":Landroid/widget/TextView;
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 272
    iget v2, p0, Le/e/a/TapRegionSettings141$Editor;->foreground:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 273
    const/high16 v2, 0x41880000    # 17.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 274
    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    .line 275
    const/high16 v2, 0x40000000    # 2.0f

    invoke-virtual {p0, v2}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v2

    const/high16 v3, 0x41000000    # 8.0f

    invoke-virtual {p0, v3}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v3

    const/high16 v4, 0x40800000    # 4.0f

    invoke-virtual {p0, v4}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual {v1, v2, v6, v3, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 276
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 277
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 278
    .local v2, "text":Landroid/widget/TextView;
    invoke-virtual {v2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 279
    const/high16 v3, 0x41700000    # 15.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 280
    iget v3, p0, Le/e/a/TapRegionSettings141$Editor;->foreground:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 281
    const/4 v3, 0x0

    const/4 v5, 0x1

    invoke-virtual {v2, v3, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 282
    invoke-virtual {p0, v4}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v3

    invoke-virtual {v2, v6, v6, v6, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 283
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1c

    if-lt v3, v4, :cond_0

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setAccessibilityHeading(Z)V

    .line 284
    :cond_0
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 285
    return-object v2
.end method

.method private showAreas()V
    .registers 17

    .line 297
    move-object/from16 v0, p0

    iget-object v1, v0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    return-void

    .line 298
    :cond_0
    invoke-direct {v0}, Le/e/a/TapRegionSettings141$Editor;->column()Landroid/widget/LinearLayout;

    move-result-object v1

    .line 299
    .local v1, "list":Landroid/widget/LinearLayout;
    const/high16 v3, 0x40000000    # 2.0f

    invoke-virtual {v0, v3}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v4

    const/high16 v5, 0x40800000    # 4.0f

    invoke-virtual {v0, v5}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v6

    invoke-virtual {v0, v3}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v3

    invoke-virtual {v0, v5}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v7

    invoke-virtual {v1, v4, v6, v3, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 300
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 301
    .local v3, "surface":Landroid/graphics/drawable/GradientDrawable;
    invoke-direct {v0}, Le/e/a/TapRegionSettings141$Editor;->surfaceColor()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 302
    const/high16 v4, 0x41200000    # 10.0f

    invoke-virtual {v0, v4}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v3, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 303
    new-instance v6, Landroid/widget/PopupWindow;

    iget-object v7, v0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    invoke-direct {v6, v7}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;)V

    .line 304
    .local v6, "popup":Landroid/widget/PopupWindow;
    invoke-virtual {v6, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 305
    const/high16 v7, 0x43580000    # 216.0f

    invoke-virtual {v0, v7}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v7

    const/high16 v8, 0x43200000    # 160.0f

    invoke-virtual {v0, v8}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v8

    iget-object v9, v0, Le/e/a/TapRegionSettings141$Editor;->areaSelector:Landroid/widget/Button;

    invoke-virtual {v9}, Landroid/widget/Button;->getWidth()I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 306
    const/4 v7, -0x2

    invoke-virtual {v6, v7}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 307
    invoke-virtual {v6, v3}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 308
    const/high16 v8, 0x40e00000    # 7.0f

    invoke-virtual {v0, v8}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v6, v8}, Landroid/widget/PopupWindow;->setElevation(F)V

    .line 309
    const/4 v8, 0x1

    invoke-virtual {v6, v8}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 310
    invoke-virtual {v6, v8}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 311
    invoke-virtual {v6, v2}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 312
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    iget-object v10, v0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v9, v10, :cond_3

    .line 313
    move v10, v9

    .line 314
    .local v10, "index":I
    new-instance v11, Landroid/widget/LinearLayout;

    iget-object v12, v0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    invoke-direct {v11, v12}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 315
    .local v11, "option":Landroid/widget/LinearLayout;
    const/16 v12, 0x10

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 316
    const/high16 v12, 0x41600000    # 14.0f

    invoke-virtual {v0, v12}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v12

    invoke-virtual {v0, v4}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v13

    const/4 v14, 0x0

    invoke-virtual {v11, v12, v14, v13, v14}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 317
    new-instance v12, Landroid/graphics/drawable/RippleDrawable;

    iget v13, v0, Le/e/a/TapRegionSettings141$Editor;->accent:I

    .line 318
    const/16 v15, 0x26

    invoke-static {v13, v15}, Le/e/a/TapRegionSettings141$Editor;->tint(II)I

    move-result v13

    invoke-static {v13}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v13

    const/4 v15, 0x0

    invoke-direct {v12, v13, v15, v15}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 317
    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 319
    new-instance v12, Landroid/widget/TextView;

    iget-object v13, v0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    invoke-direct {v12, v13}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 320
    .local v12, "name":Landroid/widget/TextView;
    invoke-direct {v0, v9}, Le/e/a/TapRegionSettings141$Editor;->areaName(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 321
    iget v13, v0, Le/e/a/TapRegionSettings141$Editor;->foreground:I

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setTextColor(I)V

    .line 322
    const/high16 v13, 0x41700000    # 15.0f

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setTextSize(F)V

    .line 323
    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-direct {v13, v14, v7, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v11, v12, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 324
    new-instance v13, Landroid/widget/RadioButton;

    iget-object v15, v0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    invoke-direct {v13, v15}, Landroid/widget/RadioButton;-><init>(Landroid/content/Context;)V

    .line 325
    .local v13, "indicator":Landroid/widget/RadioButton;
    nop

    .line 326
    iget v15, v0, Le/e/a/TapRegionSettings141$Editor;->selected:I

    if-ne v9, v15, :cond_1

    iget v15, v0, Le/e/a/TapRegionSettings141$Editor;->accent:I

    goto :goto_1

    :cond_1
    iget v15, v0, Le/e/a/TapRegionSettings141$Editor;->secondary:I

    .line 325
    :goto_1
    invoke-static {v15}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v15

    invoke-virtual {v13, v15}, Landroid/widget/RadioButton;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    .line 327
    iget v15, v0, Le/e/a/TapRegionSettings141$Editor;->selected:I

    if-ne v9, v15, :cond_2

    const/4 v15, 0x1

    goto :goto_2

    :cond_2
    const/4 v15, 0x0

    :goto_2
    invoke-virtual {v13, v15}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 328
    invoke-virtual {v13, v14}, Landroid/widget/RadioButton;->setClickable(Z)V

    .line 329
    invoke-virtual {v13, v14}, Landroid/widget/RadioButton;->setFocusable(Z)V

    .line 330
    invoke-virtual {v13, v2}, Landroid/widget/RadioButton;->setImportantForAccessibility(I)V

    .line 331
    invoke-virtual {v11, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 332
    invoke-direct {v0, v9}, Le/e/a/TapRegionSettings141$Editor;->areaName(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v14}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 333
    new-instance v14, Le/e/a/TapRegionSettings141$Editor$7;

    invoke-direct {v14, v0, v10, v6}, Le/e/a/TapRegionSettings141$Editor$7;-><init>(Le/e/a/TapRegionSettings141$Editor;ILandroid/widget/PopupWindow;)V

    invoke-virtual {v11, v14}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 337
    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v15, 0x42400000    # 48.0f

    invoke-virtual {v0, v15}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v15

    const/4 v2, -0x1

    invoke-direct {v14, v2, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v11, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 312
    .end local v10    # "index":I
    .end local v11    # "option":Landroid/widget/LinearLayout;
    .end local v12    # "name":Landroid/widget/TextView;
    .end local v13    # "indicator":Landroid/widget/RadioButton;
    add-int/lit8 v9, v9, 0x1

    const/4 v2, 0x2

    goto/16 :goto_0

    .line 339
    .end local v9    # "i":I
    :cond_3
    iget-object v2, v0, Le/e/a/TapRegionSettings141$Editor;->areaSelector:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v4

    invoke-virtual {v0, v5}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v5

    neg-int v5, v5

    const v7, 0x800003

    invoke-virtual {v6, v2, v4, v5, v7}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;III)V

    .line 340
    return-void
.end method

.method private step(II)V
    .registers 5
    .param p1, "edge"    # I
    .param p2, "delta"    # I

    .line 479
    iput p1, p0, Le/e/a/TapRegionSettings141$Editor;->boundary:I

    .line 480
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    iget v1, p0, Le/e/a/TapRegionSettings141$Editor;->selected:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    invoke-virtual {v0}, [I->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 481
    .local v0, "updated":[I
    aget v1, v0, p1

    add-int/2addr v1, p2

    invoke-static {v0, p1, v1}, Le/e/a/TapRegionSettings141;->changeEdge([III)V

    .line 482
    invoke-virtual {p0, v0}, Le/e/a/TapRegionSettings141$Editor;->edit([I)V

    .line 483
    return-void
.end method

.method private stepButton(Landroid/widget/LinearLayout;Ljava/lang/String;II)Landroid/widget/Button;
    .registers 11
    .param p1, "row"    # Landroid/widget/LinearLayout;
    .param p2, "symbol"    # Ljava/lang/String;
    .param p3, "edge"    # I
    .param p4, "delta"    # I

    .line 391
    new-instance v0, Le/e/a/TapRegionSettings141$Editor$6;

    invoke-direct {v0, p0, p3, p4}, Le/e/a/TapRegionSettings141$Editor$6;-><init>(Le/e/a/TapRegionSettings141$Editor;II)V

    invoke-direct {p0, p2, v0}, Le/e/a/TapRegionSettings141$Editor;->createButton(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    .line 392
    .local v0, "button":Landroid/widget/Button;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Le/e/a/TapRegionSettings141$Editor;->edgeNames:[Ljava/lang/String;

    aget-object v2, v2, p3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "1%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 393
    const/high16 v1, 0x41900000    # 18.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 394
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setGravity(I)V

    .line 395
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setIncludeFontPadding(Z)V

    .line 396
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 397
    const/high16 v1, 0x42180000    # 38.0f

    invoke-virtual {p0, v1}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setMinHeight(I)V

    .line 398
    invoke-virtual {p0, v1}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 399
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 400
    .local v2, "circle":Landroid/graphics/drawable/GradientDrawable;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 401
    iget v3, p0, Le/e/a/TapRegionSettings141$Editor;->foreground:I

    const/16 v4, 0xe

    invoke-static {v3, v4}, Le/e/a/TapRegionSettings141$Editor;->tint(II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 402
    new-instance v3, Landroid/graphics/drawable/RippleDrawable;

    iget v4, p0, Le/e/a/TapRegionSettings141$Editor;->accent:I

    .line 403
    const/16 v5, 0x28

    invoke-static {v4, v5}, Le/e/a/TapRegionSettings141$Editor;->tint(II)I

    move-result v4

    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {v3, v4, v2, v5}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 402
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 404
    iget v3, p0, Le/e/a/TapRegionSettings141$Editor;->foreground:I

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 405
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v1}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v4

    invoke-virtual {p0, v1}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v1

    invoke-direct {v3, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 406
    return-object v0
.end method

.method private style(Landroid/widget/Button;Z)V
    .registers 7
    .param p1, "button"    # Landroid/widget/Button;
    .param p2, "active"    # Z

    .line 410
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 411
    .local v0, "background":Landroid/graphics/drawable/GradientDrawable;
    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {p0, v1}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 412
    if-eqz p2, :cond_0

    iget v1, p0, Le/e/a/TapRegionSettings141$Editor;->accent:I

    const/16 v2, 0x3e

    goto :goto_0

    :cond_0
    iget v1, p0, Le/e/a/TapRegionSettings141$Editor;->foreground:I

    const/16 v2, 0xe

    :goto_0
    invoke-static {v1, v2}, Le/e/a/TapRegionSettings141$Editor;->tint(II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 413
    new-instance v1, Landroid/graphics/drawable/RippleDrawable;

    iget v2, p0, Le/e/a/TapRegionSettings141$Editor;->accent:I

    .line 414
    const/16 v3, 0x28

    invoke-static {v2, v3}, Le/e/a/TapRegionSettings141$Editor;->tint(II)I

    move-result v2

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v0, v3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 413
    invoke-virtual {p1, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 415
    invoke-virtual {p1, v3}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 416
    iget v1, p0, Le/e/a/TapRegionSettings141$Editor;->foreground:I

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 417
    invoke-virtual {p1, v3, p2}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 418
    invoke-virtual {p1, p2}, Landroid/widget/Button;->setSelected(Z)V

    .line 419
    return-void
.end method

.method private surfaceColor()Ljava/lang/Object;
    .registers 7

    .line 344
    :try_start_0
    const-string v0, "e.e.a.UiDialogs"

    const-string v1, "surface"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    iget-object v4, p0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v4, v2, v5

    invoke-static {v0, v1, v3, v2}, Le/e/a/Dev112;->staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 346
    :catch_0
    move-exception v0

    .line 347
    .local v0, "error":Ljava/lang/Exception;
    const v1, -0xe6e4e0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    return-object v1
.end method

.method private static tint(II)I
    .registers 4
    .param p0, "color"    # I
    .param p1, "alpha"    # I

    .line 247
    const v0, 0xffffff

    and-int/2addr v0, p0

    shl-int/lit8 v1, p1, 0x18

    or-int/2addr v0, v1

    return v0
.end method

.method private updateCoordinates()V
    .registers 8

    .line 495
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    iget v1, p0, Le/e/a/TapRegionSettings141$Editor;->selected:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 496
    .local v0, "range":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Le/e/a/TapRegionSettings141$Editor;->coordinates:[Landroid/widget/TextView;

    array-length v2, v2

    if-ge v1, v2, :cond_6

    .line 497
    iget-object v2, p0, Le/e/a/TapRegionSettings141$Editor;->coordinates:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Le/e/a/TapRegionSettings141$Editor;->edgeNames:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget v4, v0, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "%"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 498
    iget-object v2, p0, Le/e/a/TapRegionSettings141$Editor;->coordinates:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    iget v3, p0, Le/e/a/TapRegionSettings141$Editor;->boundary:I

    if-ne v1, v3, :cond_0

    iget v3, p0, Le/e/a/TapRegionSettings141$Editor;->accent:I

    goto :goto_1

    :cond_0
    iget v3, p0, Le/e/a/TapRegionSettings141$Editor;->foreground:I

    :goto_1
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 499
    iget v2, p0, Le/e/a/TapRegionSettings141$Editor;->boundary:I

    if-ne v1, v2, :cond_1

    .line 500
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 501
    .local v2, "selection":Landroid/graphics/drawable/GradientDrawable;
    iget v3, p0, Le/e/a/TapRegionSettings141$Editor;->accent:I

    const/16 v4, 0x19

    invoke-static {v3, v4}, Le/e/a/TapRegionSettings141$Editor;->tint(II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 502
    const/high16 v3, 0x41200000    # 10.0f

    invoke-virtual {p0, v3}, Le/e/a/TapRegionSettings141$Editor;->dp(F)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 503
    iget-object v3, p0, Le/e/a/TapRegionSettings141$Editor;->adjustments:[Landroid/widget/LinearLayout;

    aget-object v3, v3, v1

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 504
    .end local v2    # "selection":Landroid/graphics/drawable/GradientDrawable;
    goto :goto_2

    :cond_1
    iget-object v2, p0, Le/e/a/TapRegionSettings141$Editor;->adjustments:[Landroid/widget/LinearLayout;

    aget-object v2, v2, v1

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 505
    :goto_2
    iget-object v2, p0, Le/e/a/TapRegionSettings141$Editor;->minus:[Landroid/widget/Button;

    aget-object v2, v2, v1

    and-int/lit8 v3, v1, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-nez v3, :cond_2

    aget v3, v0, v1

    if-lez v3, :cond_3

    goto :goto_3

    :cond_2
    aget v3, v0, v1

    add-int/lit8 v6, v1, -0x1

    aget v6, v0, v6

    add-int/2addr v6, v5

    if-le v3, v6, :cond_3

    :goto_3
    const/4 v3, 0x1

    goto :goto_4

    :cond_3
    const/4 v3, 0x0

    :goto_4
    invoke-direct {p0, v2, v3}, Le/e/a/TapRegionSettings141$Editor;->adjustEnabled(Landroid/widget/Button;Z)V

    .line 506
    iget-object v2, p0, Le/e/a/TapRegionSettings141$Editor;->plus:[Landroid/widget/Button;

    aget-object v2, v2, v1

    and-int/lit8 v3, v1, 0x1

    if-nez v3, :cond_4

    aget v3, v0, v1

    add-int/lit8 v6, v1, 0x1

    aget v6, v0, v6

    sub-int/2addr v6, v5

    if-ge v3, v6, :cond_5

    goto :goto_5

    :cond_4
    aget v3, v0, v1

    const/16 v6, 0x64

    if-ge v3, v6, :cond_5

    :goto_5
    const/4 v4, 0x1

    :cond_5
    invoke-direct {p0, v2, v4}, Le/e/a/TapRegionSettings141$Editor;->adjustEnabled(Landroid/widget/Button;Z)V

    .line 496
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 508
    .end local v1    # "i":I
    :cond_6
    iget-object v1, p0, Le/e/a/TapRegionSettings141$Editor;->preview:Le/e/a/TapRegionSettings141$Preview;

    invoke-virtual {v1}, Le/e/a/TapRegionSettings141$Preview;->invalidate()V

    .line 509
    return-void
.end method


# virtual methods
.method addArea()V
    .registers 10

    .line 450
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    return-void

    .line 451
    :cond_0
    invoke-virtual {p0}, Le/e/a/TapRegionSettings141$Editor;->value()Le/e/a/TapRegions141;

    move-result-object v2

    .line 452
    .local v2, "active":Le/e/a/TapRegions141;
    const/16 v0, 0x14

    .local v0, "y":I
    :goto_0
    const/16 v1, 0x50

    if-gt v0, v1, :cond_3

    .line 453
    const/16 v3, 0x14

    move v8, v3

    .local v8, "x":I
    :goto_1
    if-gt v8, v1, :cond_2

    .line 454
    int-to-float v3, v8

    int-to-float v4, v0

    const/high16 v6, 0x42c80000    # 100.0f

    const/4 v7, 0x0

    const/high16 v5, 0x42c80000    # 100.0f

    invoke-virtual/range {v2 .. v7}, Le/e/a/TapRegions141;->contains(FFFFF)Z

    move-result v3

    if-nez v3, :cond_1

    .line 455
    invoke-direct {p0, v8, v0}, Le/e/a/TapRegionSettings141$Editor;->append(II)V

    .line 456
    return-void

    .line 453
    :cond_1
    add-int/lit8 v8, v8, 0x1e

    goto :goto_1

    .line 452
    .end local v8    # "x":I
    :cond_2
    add-int/lit8 v0, v0, 0x1e

    goto :goto_0

    .line 460
    .end local v0    # "y":I
    :cond_3
    const/16 v0, 0x32

    invoke-direct {p0, v0, v0}, Le/e/a/TapRegionSettings141$Editor;->append(II)V

    .line 461
    return-void
.end method

.method choose(I)V
    .registers 3
    .param p1, "option"    # I

    .line 430
    iget v0, p0, Le/e/a/TapRegionSettings141$Editor;->mode:I

    if-ne p1, v0, :cond_0

    return-void

    .line 431
    :cond_0
    const/4 v0, 0x4

    if-ne p1, v0, :cond_1

    .line 432
    iput p1, p0, Le/e/a/TapRegionSettings141$Editor;->mode:I

    .line 433
    invoke-virtual {p0}, Le/e/a/TapRegionSettings141$Editor;->refresh()V

    goto :goto_0

    .line 434
    :cond_1
    invoke-static {p1}, Le/e/a/TapRegions141;->preset(I)Le/e/a/TapRegions141;

    move-result-object v0

    invoke-virtual {p0, v0}, Le/e/a/TapRegionSettings141$Editor;->set(Le/e/a/TapRegions141;)V

    .line 435
    :goto_0
    return-void
.end method

.method dp(F)I
    .registers 3
    .param p1, "value"    # F

    .line 243
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float v0, v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method edit([I)V
    .registers 4
    .param p1, "range"    # [I

    .line 486
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    iget v1, p0, Le/e/a/TapRegionSettings141$Editor;->selected:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    invoke-static {p1, v0}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 487
    :cond_0
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    iget v1, p0, Le/e/a/TapRegionSettings141$Editor;->selected:I

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 488
    iget v0, p0, Le/e/a/TapRegionSettings141$Editor;->mode:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    .line 489
    iput v1, p0, Le/e/a/TapRegionSettings141$Editor;->mode:I

    .line 490
    invoke-virtual {p0}, Le/e/a/TapRegionSettings141$Editor;->refresh()V

    goto :goto_0

    .line 491
    :cond_1
    invoke-direct {p0}, Le/e/a/TapRegionSettings141$Editor;->updateCoordinates()V

    .line 492
    :goto_0
    return-void
.end method

.method synthetic lambda$new$0$e-e-a-TapRegionSettings141$Editor(I)V
    .registers 2
    .param p1, "option"    # I

    .line 159
    invoke-virtual {p0, p1}, Le/e/a/TapRegionSettings141$Editor;->choose(I)V

    return-void
.end method

.method synthetic lambda$new$1$e-e-a-TapRegionSettings141$Editor()V
    .registers 3

    .line 222
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->openOnly:Landroid/widget/CheckBox;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 223
    invoke-static {v1}, Le/e/a/TapRegions141;->preset(I)Le/e/a/TapRegions141;

    move-result-object v0

    invoke-virtual {p0, v0}, Le/e/a/TapRegionSettings141$Editor;->set(Le/e/a/TapRegions141;)V

    .line 224
    return-void
.end method

.method synthetic lambda$showAreas$2$e-e-a-TapRegionSettings141$Editor(ILandroid/widget/PopupWindow;Landroid/view/View;)V
    .registers 4
    .param p1, "index"    # I
    .param p2, "popup"    # Landroid/widget/PopupWindow;
    .param p3, "v"    # Landroid/view/View;

    .line 334
    invoke-virtual {p0, p1}, Le/e/a/TapRegionSettings141$Editor;->select(I)V

    .line 335
    invoke-virtual {p2}, Landroid/widget/PopupWindow;->dismiss()V

    .line 336
    return-void
.end method

.method synthetic lambda$stepButton$4$e-e-a-TapRegionSettings141$Editor(II)V
    .registers 3
    .param p1, "edge"    # I
    .param p2, "delta"    # I

    .line 391
    invoke-direct {p0, p1, p2}, Le/e/a/TapRegionSettings141$Editor;->step(II)V

    return-void
.end method

.method refresh()V
    .registers 8

    .line 517
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Le/e/a/TapRegionSettings141$Editor;->presets:[Landroid/widget/Button;

    array-length v1, v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Editor;->presets:[Landroid/widget/Button;

    aget-object v1, v1, v0

    iget v4, p0, Le/e/a/TapRegionSettings141$Editor;->mode:I

    if-ne v0, v4, :cond_0

    const/4 v2, 0x1

    :cond_0
    invoke-direct {p0, v1, v2}, Le/e/a/TapRegionSettings141$Editor;->style(Landroid/widget/Button;Z)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 518
    .end local v0    # "i":I
    :cond_1
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->previewHeading:Landroid/widget/TextView;

    iget v1, p0, Le/e/a/TapRegionSettings141$Editor;->mode:I

    const/4 v4, 0x4

    if-ne v1, v4, :cond_2

    .line 519
    const-string v1, "Custom area"

    const-string/jumbo v5, "\u81ea\u8a02\u5340\u57df"

    const-string v6, "\u30ab\u30b9\u30bf\u30e0\u9818\u57df"

    invoke-virtual {p0, v6, v1, v5}, Le/e/a/TapRegionSettings141$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 520
    :cond_2
    const-string v1, "Area preview"

    const-string v5, "\u5340\u57df\u9810\u89bd"

    const-string/jumbo v6, "\u9818\u57df\u30d7\u30ec\u30d3\u30e5\u30fc"

    invoke-virtual {p0, v6, v1, v5}, Le/e/a/TapRegionSettings141$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 518
    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 521
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->areaSelector:Landroid/widget/Button;

    iget v1, p0, Le/e/a/TapRegionSettings141$Editor;->selected:I

    invoke-direct {p0, v1}, Le/e/a/TapRegionSettings141$Editor;->areaName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 522
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->areaSelector:Landroid/widget/Button;

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, v3, :cond_3

    const/4 v1, 0x1

    goto :goto_2

    :cond_3
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 523
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->areaChevron:Landroid/widget/TextView;

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, v3, :cond_4

    const/4 v4, 0x0

    :cond_4
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 524
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->add:Landroid/widget/Button;

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v4, 0x3

    if-ge v1, v4, :cond_5

    const/4 v1, 0x1

    goto :goto_3

    :cond_5
    const/4 v1, 0x0

    :goto_3
    invoke-direct {p0, v0, v1}, Le/e/a/TapRegionSettings141$Editor;->adjustEnabled(Landroid/widget/Button;Z)V

    .line 525
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->remove:Landroid/widget/Button;

    iget-object v1, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, v3, :cond_6

    const/4 v2, 0x1

    :cond_6
    invoke-direct {p0, v0, v2}, Le/e/a/TapRegionSettings141$Editor;->adjustEnabled(Landroid/widget/Button;Z)V

    .line 526
    invoke-direct {p0}, Le/e/a/TapRegionSettings141$Editor;->updateCoordinates()V

    .line 527
    return-void
.end method

.method removeArea()V
    .registers 4

    .line 471
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    return-void

    .line 472
    :cond_0
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    iget v2, p0, Le/e/a/TapRegionSettings141$Editor;->selected:I

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 473
    const/4 v0, 0x4

    iput v0, p0, Le/e/a/TapRegionSettings141$Editor;->mode:I

    .line 474
    iget v0, p0, Le/e/a/TapRegionSettings141$Editor;->selected:I

    iget-object v2, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Le/e/a/TapRegionSettings141$Editor;->selected:I

    .line 475
    invoke-virtual {p0}, Le/e/a/TapRegionSettings141$Editor;->refresh()V

    .line 476
    return-void
.end method

.method select(I)V
    .registers 3
    .param p1, "index"    # I

    .line 443
    iget v0, p0, Le/e/a/TapRegionSettings141$Editor;->selected:I

    if-eq p1, v0, :cond_0

    .line 444
    iput p1, p0, Le/e/a/TapRegionSettings141$Editor;->selected:I

    .line 445
    invoke-virtual {p0}, Le/e/a/TapRegionSettings141$Editor;->refresh()V

    .line 447
    :cond_0
    return-void
.end method

.method set(Le/e/a/TapRegions141;)V
    .registers 9
    .param p1, "value"    # Le/e/a/TapRegions141;

    .line 422
    iget v0, p1, Le/e/a/TapRegions141;->mode:I

    iput v0, p0, Le/e/a/TapRegionSettings141$Editor;->mode:I

    .line 423
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 424
    iget-object v0, p1, Le/e/a/TapRegions141;->ranges:[[I

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    aget-object v4, v0, v3

    .local v4, "range":[I
    iget-object v5, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    invoke-virtual {v4}, [I->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [I

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .end local v4    # "range":[I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 425
    :cond_0
    iput v2, p0, Le/e/a/TapRegionSettings141$Editor;->boundary:I

    iput v2, p0, Le/e/a/TapRegionSettings141$Editor;->selected:I

    .line 426
    invoke-virtual {p0}, Le/e/a/TapRegionSettings141$Editor;->refresh()V

    .line 427
    return-void
.end method

.method tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "ja"    # Ljava/lang/String;
    .param p2, "en"    # Ljava/lang/String;
    .param p3, "zh"    # Ljava/lang/String;

    .line 244
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->context:Landroid/content/Context;

    invoke-static {v0, p1, p2, p3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method value()Le/e/a/TapRegions141;
    .registers 3

    .line 438
    iget v0, p0, Le/e/a/TapRegionSettings141$Editor;->mode:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 439
    iget-object v0, p0, Le/e/a/TapRegionSettings141$Editor;->ranges:Ljava/util/ArrayList;

    const/4 v1, 0x0

    new-array v1, v1, [[I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[I

    invoke-static {v0}, Le/e/a/TapRegions141;->custom([[I)Le/e/a/TapRegions141;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget v0, p0, Le/e/a/TapRegionSettings141$Editor;->mode:I

    invoke-static {v0}, Le/e/a/TapRegions141;->preset(I)Le/e/a/TapRegions141;

    move-result-object v0

    .line 438
    :goto_0
    return-object v0
.end method
