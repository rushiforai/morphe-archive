.class final Le/e/a/AmbientSettings$Editor;
.super Ljava/lang/Object;
.source "AmbientSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/AmbientSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Editor"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/AmbientSettings$Editor$Preview;
    }
.end annotation


# instance fields
.field final bars:[Landroid/widget/SeekBar;

.field final c:Landroid/content/Context;

.field final captions:[Landroid/widget/TextView;

.field final column:Landroid/widget/LinearLayout;

.field final enabled:Landroid/widget/CheckBox;

.field fullSpread:Landroid/widget/CheckBox;

.field final modes:[Landroid/widget/CheckBox;

.field final presets:Landroid/widget/Spinner;

.field final preview:Le/e/a/AmbientSettings$Editor$Preview;

.field final scroll:Landroid/widget/ScrollView;

.field selection:I

.field final sides:[Landroid/widget/CheckBox;

.field final tint:Landroid/content/res/ColorStateList;

.field final values:[I


# direct methods
.method constructor <init>(Landroid/preference/PreferenceActivity;Landroid/content/Context;Landroid/content/SharedPreferences;)V
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    .line 112
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/4 v3, 0x3

    .line 105
    new-array v4, v3, [Landroid/widget/CheckBox;

    iput-object v4, v0, Le/e/a/AmbientSettings$Editor;->modes:[Landroid/widget/CheckBox;

    const/4 v5, 0x4

    new-array v5, v5, [Landroid/widget/CheckBox;

    iput-object v5, v0, Le/e/a/AmbientSettings$Editor;->sides:[Landroid/widget/CheckBox;

    .line 106
    # getter for: Le/e/a/AmbientSettings;->LABELS:[Ljava/lang/String;
    invoke-static {}, Le/e/a/AmbientSettings;->access$0()[Ljava/lang/String;

    move-result-object v5

    array-length v5, v5

    new-array v5, v5, [Landroid/widget/SeekBar;

    iput-object v5, v0, Le/e/a/AmbientSettings$Editor;->bars:[Landroid/widget/SeekBar;

    .line 107
    # getter for: Le/e/a/AmbientSettings;->LABELS:[Ljava/lang/String;
    invoke-static {}, Le/e/a/AmbientSettings;->access$0()[Ljava/lang/String;

    move-result-object v5

    array-length v5, v5

    new-array v5, v5, [Landroid/widget/TextView;

    iput-object v5, v0, Le/e/a/AmbientSettings$Editor;->captions:[Landroid/widget/TextView;

    .line 113
    iput-object v1, v0, Le/e/a/AmbientSettings$Editor;->c:Landroid/content/Context;

    .line 114
    invoke-static {v1}, Le/e/a/AmbientLight;->accent(Landroid/content/Context;)I

    move-result v5

    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    iput-object v5, v0, Le/e/a/AmbientSettings$Editor;->tint:Landroid/content/res/ColorStateList;

    .line 115
    invoke-static {v2}, Le/e/a/AmbientLight;->values(Landroid/content/SharedPreferences;)[I

    move-result-object v5

    iput-object v5, v0, Le/e/a/AmbientSettings$Editor;->values:[I

    .line 116
    invoke-virtual {v0}, Le/e/a/AmbientSettings$Editor;->preset()I

    move-result v5

    iput v5, v0, Le/e/a/AmbientSettings$Editor;->selection:I

    .line 117
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v5, v0, Le/e/a/AmbientSettings$Editor;->column:Landroid/widget/LinearLayout;

    const/4 v6, 0x1

    .line 118
    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v7, 0x14

    .line 119
    invoke-virtual {v0, v7}, Le/e/a/AmbientSettings$Editor;->dp(I)I

    move-result v8

    invoke-virtual {v0, v7}, Le/e/a/AmbientSettings$Editor;->dp(I)I

    move-result v7

    const/16 v9, 0xc

    invoke-virtual {v0, v9}, Le/e/a/AmbientSettings$Editor;->dp(I)I

    move-result v9

    const/4 v10, 0x0

    invoke-virtual {v5, v8, v10, v7, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 120
    new-instance v7, Landroid/widget/ScrollView;

    invoke-direct {v7, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v7, v0, Le/e/a/AmbientSettings$Editor;->scroll:Landroid/widget/ScrollView;

    .line 121
    invoke-virtual {v7, v5}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 122
    const-string v7, "Enable ambient mode"

    const-string v8, "\u555f\u7528\u74b0\u5883\u5149"

    const-string v9, "\u30a2\u30f3\u30d3\u30a8\u30f3\u30c8\u30e2\u30fc\u30c9\u3092\u4f7f\u7528"

    invoke-virtual {v0, v9, v7, v8}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 123
    invoke-static {v2}, Le/e/a/AmbientLight;->enabled(Landroid/content/SharedPreferences;)Z

    move-result v8

    .line 122
    invoke-virtual {v0, v5, v7, v8}, Le/e/a/AmbientSettings$Editor;->check(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v7

    iput-object v7, v0, Le/e/a/AmbientSettings$Editor;->enabled:Landroid/widget/CheckBox;

    .line 124
    new-instance v7, Le/e/a/AmbientSettings$Editor$Preview;

    invoke-direct {v7, v0, v1}, Le/e/a/AmbientSettings$Editor$Preview;-><init>(Le/e/a/AmbientSettings$Editor;Landroid/content/Context;)V

    iput-object v7, v0, Le/e/a/AmbientSettings$Editor;->preview:Le/e/a/AmbientSettings$Editor$Preview;

    .line 125
    const-string v8, "Light preview"

    const-string v9, "\u5149\u6548\u9810\u89bd"

    const-string v11, "\u5149\u306e\u30d7\u30ec\u30d3\u30e5\u30fc"

    invoke-virtual {v0, v11, v8, v9}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Le/e/a/AmbientSettings$Editor$Preview;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 126
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v9, 0x7e

    invoke-virtual {v0, v9}, Le/e/a/AmbientSettings$Editor;->dp(I)I

    move-result v9

    const/4 v11, -0x1

    invoke-direct {v8, v11, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 127
    const-string v7, "Preset"

    const-string/jumbo v8, "\u9810\u8a2d"

    const-string v9, "\u30d7\u30ea\u30bb\u30c3\u30c8"

    invoke-virtual {v0, v9, v7, v8}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v5, v7}, Le/e/a/AmbientSettings$Editor;->label(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 128
    new-instance v7, Landroid/widget/Spinner;

    invoke-direct {v7, v1}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    iput-object v7, v0, Le/e/a/AmbientSettings$Editor;->presets:Landroid/widget/Spinner;

    .line 129
    const-string v8, "Power saving"

    const-string/jumbo v9, "\u7701\u96fb"

    const-string/jumbo v12, "\u7701\u96fb\u529b"

    invoke-virtual {v0, v12, v8, v9}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v8, "Subtle"

    const-string/jumbo v9, "\u67d4\u548c"

    const-string/jumbo v12, "\u63a7\u3048\u3081"

    invoke-virtual {v0, v12, v8, v9}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 130
    const-string/jumbo v8, "\u6a19\u6e96"

    const-string v9, "Standard"

    invoke-virtual {v0, v8, v9, v8}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    const-string v8, "Vivid"

    const-string/jumbo v9, "\u9bae\u8c54"

    const-string/jumbo v12, "\u9bae\u3084\u304b"

    invoke-virtual {v0, v12, v8, v9}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 131
    const-string v8, "\u5f37\u70c8"

    const-string v9, "Intense"

    invoke-virtual {v0, v8, v9, v8}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    const-string v8, "Custom"

    const-string/jumbo v9, "\u81ea\u8a02"

    const-string v12, "\u30ab\u30b9\u30bf\u30e0"

    invoke-virtual {v0, v12, v8, v9}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    filled-new-array/range {v13 .. v18}, [Ljava/lang/String;

    move-result-object v8

    .line 132
    new-instance v9, Landroid/widget/ArrayAdapter;

    const v12, 0x1090008

    invoke-direct {v9, v1, v12, v8}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const v8, 0x1090009

    .line 133
    invoke-virtual {v9, v8}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 134
    invoke-virtual {v7, v9}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 135
    iget v8, v0, Le/e/a/AmbientSettings$Editor;->selection:I

    invoke-virtual {v7, v8, v10}, Landroid/widget/Spinner;->setSelection(IZ)V

    .line 136
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x2

    invoke-direct {v8, v11, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 137
    const-string v7, "Playback modes"

    const-string/jumbo v8, "\u64ad\u653e\u6a21\u5f0f"

    const-string/jumbo v9, "\u9069\u7528\u3059\u308b\u518d\u751f\u30e2\u30fc\u30c9"

    invoke-virtual {v0, v9, v7, v8}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v5, v7}, Le/e/a/AmbientSettings$Editor;->label(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 138
    const-string v7, "Normal"

    const-string v8, "\u4e00\u822c"

    const-string/jumbo v9, "\u901a\u5e38\u518d\u751f"

    invoke-virtual {v0, v9, v7, v8}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "Fullscreen"

    const-string v9, "\u5168\u87a2\u5e55"

    const-string v11, "\u5168\u753b\u9762"

    invoke-virtual {v0, v11, v8, v9}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 139
    const-string v9, "Popup"

    const-string v11, "\u5f48\u51fa\u8996\u7a97"

    const-string v12, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7"

    invoke-virtual {v0, v12, v9, v11}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    filled-new-array {v7, v8, v9}, [Ljava/lang/String;

    move-result-object v7

    .line 140
    invoke-virtual {v0, v5}, Le/e/a/AmbientSettings$Editor;->row(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v8

    .line 141
    aget-object v9, v7, v10

    invoke-static {v2, v10}, Le/e/a/AmbientLight;->appliesTo(Landroid/content/SharedPreferences;I)Z

    move-result v11

    invoke-virtual {v0, v8, v9, v11}, Le/e/a/AmbientSettings$Editor;->option(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v9

    aput-object v9, v4, v10

    .line 142
    aget-object v9, v7, v6

    invoke-static {v2, v6}, Le/e/a/AmbientLight;->appliesTo(Landroid/content/SharedPreferences;I)Z

    move-result v11

    invoke-virtual {v0, v8, v9, v11}, Le/e/a/AmbientSettings$Editor;->option(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v8

    aput-object v8, v4, v6

    .line 143
    invoke-virtual {v0, v5}, Le/e/a/AmbientSettings$Editor;->row(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v5

    const/4 v8, 0x2

    .line 144
    aget-object v9, v7, v8

    invoke-static {v2, v8}, Le/e/a/AmbientLight;->appliesTo(Landroid/content/SharedPreferences;I)Z

    move-result v11

    invoke-virtual {v0, v5, v9, v11}, Le/e/a/AmbientSettings$Editor;->check(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v9

    aput-object v9, v4, v8

    .line 145
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 146
    const-string v8, "\u24d8"

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v8, 0x41900000    # 18.0f

    .line 147
    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 148
    invoke-static {v1}, Le/e/a/AmbientLight;->accent(Landroid/content/Context;)I

    move-result v8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v8, 0x11

    .line 149
    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setGravity(I)V

    .line 150
    const-string v8, "About the popup light"

    const-string/jumbo v9, "\u95dc\u65bc\u5f48\u51fa\u8996\u7a97\u5149\u6548"

    const-string v11, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u306e\u63cf\u753b\u306b\u3064\u3044\u3066"

    invoke-virtual {v0, v11, v8, v9}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 151
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 152
    new-instance v8, Le/e/a/AmbientSettings$Editor$6;

    move-object/from16 v9, p1

    invoke-direct {v8, v0, v9, v7}, Le/e/a/AmbientSettings$Editor$6;-><init>(Le/e/a/AmbientSettings$Editor;Landroid/preference/PreferenceActivity;[Ljava/lang/String;)V

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 158
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v8, 0x2c

    invoke-virtual {v0, v8}, Le/e/a/AmbientSettings$Editor;->dp(I)I

    move-result v9

    invoke-virtual {v0, v8}, Le/e/a/AmbientSettings$Editor;->dp(I)I

    move-result v8

    invoke-direct {v7, v9, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v4, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move v4, v10

    .line 159
    :goto_0
    iget-object v5, v0, Le/e/a/AmbientSettings$Editor;->column:Landroid/widget/LinearLayout;

    if-lt v4, v3, :cond_3

    .line 160
    const-string v4, "Show advanced settings"

    const-string/jumbo v7, "\u986f\u793a\u9032\u968e\u8a2d\u5b9a"

    const-string/jumbo v8, "\u8a73\u7d30\u8a2d\u5b9a\u3092\u8868\u793a"

    invoke-virtual {v0, v8, v4, v7}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v5, v4, v10}, Le/e/a/AmbientSettings$Editor;->check(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v4

    .line 161
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 162
    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 163
    iget-object v1, v0, Le/e/a/AmbientSettings$Editor;->column:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/16 v1, 0x8

    .line 164
    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 165
    new-instance v1, Le/e/a/AmbientSettings$Editor$7;

    invoke-direct {v1, v7}, Le/e/a/AmbientSettings$Editor$7;-><init>(Landroid/widget/LinearLayout;)V

    invoke-virtual {v4, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 166
    :goto_1
    # getter for: Le/e/a/AmbientSettings;->LABELS:[Ljava/lang/String;
    invoke-static {}, Le/e/a/AmbientSettings;->access$0()[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    if-lt v3, v1, :cond_2

    .line 167
    const-string v1, "Light directions"

    const-string v3, "\u5149\u6548\u65b9\u5411"

    const-string v4, "\u5149\u3092\u8868\u793a\u3059\u308b\u65b9\u5411"

    invoke-virtual {v0, v4, v1, v3}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v7, v1}, Le/e/a/AmbientSettings$Editor;->label(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    .line 168
    const-string v1, "Top"

    const-string v3, "\u4e0a"

    invoke-virtual {v0, v3, v1, v3}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "Bottom"

    const-string v4, "\u4e0b"

    invoke-virtual {v0, v4, v3, v4}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 169
    const-string v4, "Left"

    const-string v5, "\u5de6"

    invoke-virtual {v0, v5, v4, v5}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Right"

    const-string v8, "\u53f3"

    invoke-virtual {v0, v8, v5, v8}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v1, v3, v4, v5}, [Ljava/lang/String;

    move-result-object v1

    .line 170
    const-string v3, "nicoid_ambient_sides"

    const/16 v4, 0xf

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 171
    invoke-virtual {v0, v7}, Le/e/a/AmbientSettings$Editor;->row(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    move-result-object v5

    move v2, v10

    .line 172
    :goto_2
    iget-object v3, v0, Le/e/a/AmbientSettings$Editor;->sides:[Landroid/widget/CheckBox;

    array-length v7, v3

    if-lt v2, v7, :cond_0

    .line 176
    iget-object v1, v0, Le/e/a/AmbientSettings$Editor;->enabled:Landroid/widget/CheckBox;

    new-instance v2, Le/e/a/AmbientSettings$Editor$9;

    invoke-direct {v2, v0}, Le/e/a/AmbientSettings$Editor$9;-><init>(Le/e/a/AmbientSettings$Editor;)V

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 177
    iget-object v1, v0, Le/e/a/AmbientSettings$Editor;->presets:Landroid/widget/Spinner;

    new-instance v2, Le/e/a/AmbientSettings$Editor$1;

    invoke-direct {v2, v0}, Le/e/a/AmbientSettings$Editor$1;-><init>(Le/e/a/AmbientSettings$Editor;)V

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    return-void

    .line 173
    :cond_0
    aget-object v7, v1, v2

    shl-int v8, v6, v2

    and-int/2addr v8, v4

    if-eqz v8, :cond_1

    move v8, v6

    goto :goto_3

    :cond_1
    move v8, v10

    :goto_3
    invoke-virtual {v0, v5, v7, v8}, Le/e/a/AmbientSettings$Editor;->option(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v7

    aput-object v7, v3, v2

    .line 174
    iget-object v3, v0, Le/e/a/AmbientSettings$Editor;->sides:[Landroid/widget/CheckBox;

    aget-object v3, v3, v2

    new-instance v7, Le/e/a/AmbientSettings$Editor$8;

    invoke-direct {v7, v0}, Le/e/a/AmbientSettings$Editor$8;-><init>(Le/e/a/AmbientSettings$Editor;)V

    invoke-virtual {v3, v7}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 166
    :cond_2
    invoke-virtual {v0, v7, v3}, Le/e/a/AmbientSettings$Editor;->slider(Landroid/widget/LinearLayout;I)V

    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1

    .line 159
    :cond_3
    invoke-virtual {v0, v5, v4}, Le/e/a/AmbientSettings$Editor;->slider(Landroid/widget/LinearLayout;I)V

    const/4 v8, 0x1

    if-ne v4, v8, :cond_4

    iget-object v7, v0, Le/e/a/AmbientSettings$Editor;->preview:Le/e/a/AmbientSettings$Editor$Preview;

    invoke-static {v5, v2, v7}, Le/e/a/PlaybackDisplayOptions;->ambient(Landroid/widget/LinearLayout;Landroid/content/SharedPreferences;Landroid/view/View;)Landroid/widget/CheckBox;

    move-result-object v7

    iput-object v7, v0, Le/e/a/AmbientSettings$Editor;->fullSpread:Landroid/widget/CheckBox;

    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0
.end method

.method static synthetic lambda$1(Landroid/widget/LinearLayout;Landroid/widget/CompoundButton;Z)V
    .registers 3

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    .line 165
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method caption(I)V
    .registers 7

    .line 239
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Le/e/a/AmbientSettings$Editor;->values:[I

    aget v1, v1, p1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    const-string v1, " dp"

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    if-ne p1, v1, :cond_1

    const-string v1, " fps"

    goto :goto_0

    :cond_1
    const/16 v1, 0x9

    if-ne p1, v1, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, " \u00d7 "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Le/e/a/AmbientSettings$Editor;->values:[I

    aget v2, v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " px"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_2
    const-string v1, "%"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 240
    # getter for: Le/e/a/AmbientSettings;->LABELS:[Ljava/lang/String;
    invoke-static {}, Le/e/a/AmbientSettings;->access$0()[Ljava/lang/String;

    move-result-object v1

    aget-object v1, v1, p1

    # getter for: Le/e/a/AmbientSettings;->EN:[Ljava/lang/String;
    invoke-static {}, Le/e/a/AmbientSettings;->access$1()[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, p1

    # getter for: Le/e/a/AmbientSettings;->ZH:[Ljava/lang/String;
    invoke-static {}, Le/e/a/AmbientSettings;->access$2()[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, p1

    invoke-virtual {p0, v1, v2, v3}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 241
    iget-object v2, p0, Le/e/a/AmbientSettings$Editor;->captions:[Landroid/widget/TextView;

    aget-object v2, v2, p1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 242
    iget-object p0, p0, Le/e/a/AmbientSettings$Editor;->bars:[Landroid/widget/SeekBar;

    aget-object p0, p0, p1

    if-eqz p0, :cond_3

    invoke-virtual {p0, v1}, Landroid/widget/SeekBar;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_3
    return-void
.end method

.method check(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;
    .registers 6

    .line 259
    new-instance v0, Landroid/widget/CheckBox;

    iget-object v1, p0, Le/e/a/AmbientSettings$Editor;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 260
    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 261
    iget-object p0, p0, Le/e/a/AmbientSettings$Editor;->tint:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, p0}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    .line 262
    invoke-virtual {v0, p3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 263
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method dp(I)I
    .registers 2

    .line 276
    iget-object p0, p0, Le/e/a/AmbientSettings$Editor;->c:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    int-to-float p1, p1

    mul-float/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method label(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;
    .registers 5

    .line 268
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Le/e/a/AmbientSettings$Editor;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 269
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 p2, 0x8

    .line 270
    invoke-virtual {p0, p2}, Le/e/a/AmbientSettings$Editor;->dp(I)I

    move-result p2

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Le/e/a/AmbientSettings$Editor;->dp(I)I

    move-result p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2, v1, p0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 271
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method synthetic lambda$0$e-e-a-AmbientSettings$Editor(Landroid/preference/PreferenceActivity;[Ljava/lang/String;Landroid/view/View;)V
    .registers 5

    .line 152
    invoke-static {p1}, Le/e/a/Dev112;->builder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/4 p3, 0x2

    .line 153
    aget-object p2, p2, p3

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 155
    const-string p2, "The light appears along the inside edge of the popup. It stays within the window, so its spread is limited."

    .line 156
    const-string p3, "\u5149\u6548\u986f\u793a\u5728\u5f48\u51fa\u8996\u7a97\u7684\u5167\u5074\u908a\u7de3\uff0c\u4e0d\u6703\u64f4\u6563\u5230\u8996\u7a97\u4e4b\u5916\uff0c\u64f4\u6563\u5e45\u5ea6\u4e5f\u6703\u53d7\u5230\u9650\u5236\u3002"

    .line 154
    const-string v0, "\u5149\u306f\u5c0f\u7a93\u306e\u5185\u5074\u306e\u7e01\u306b\u8868\u793a\u3057\u307e\u3059\u3002\u7a93\u306e\u5916\u5074\u306b\u306f\u5e83\u304c\u3089\u305a\u3001\u5e83\u304c\u308a\u306e\u8a2d\u5b9a\u3082\u5c0f\u7a93\u306b\u5408\u308f\u305b\u3066\u6291\u3048\u3089\u308c\u307e\u3059\u3002"

    invoke-virtual {p0, v0, p2, p3}, Le/e/a/AmbientSettings$Editor;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const p1, 0x104000a

    const/4 p2, 0x0

    .line 157
    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 152
    invoke-static {p0}, Le/e/a/Dev112;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$2$e-e-a-AmbientSettings$Editor(Landroid/widget/CompoundButton;Z)V
    .registers 3

    .line 174
    iget-object p0, p0, Le/e/a/AmbientSettings$Editor;->preview:Le/e/a/AmbientSettings$Editor$Preview;

    invoke-virtual {p0}, Le/e/a/AmbientSettings$Editor$Preview;->invalidate()V

    return-void
.end method

.method synthetic lambda$3$e-e-a-AmbientSettings$Editor(Landroid/widget/CompoundButton;Z)V
    .registers 3

    .line 176
    iget-object p0, p0, Le/e/a/AmbientSettings$Editor;->preview:Le/e/a/AmbientSettings$Editor$Preview;

    invoke-virtual {p0}, Le/e/a/AmbientSettings$Editor$Preview;->invalidate()V

    return-void
.end method

.method mask()I
    .registers 5

    const/4 v0, 0x0

    move v1, v0

    .line 209
    :goto_0
    iget-object v2, p0, Le/e/a/AmbientSettings$Editor;->sides:[Landroid/widget/CheckBox;

    array-length v3, v2

    if-lt v0, v3, :cond_0

    return v1

    :cond_0
    aget-object v2, v2, v0

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    shl-int/2addr v2, v0

    or-int/2addr v1, v2

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method option(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;
    .registers 5

    .line 253
    invoke-virtual {p0, p1, p2, p3}, Le/e/a/AmbientSettings$Editor;->check(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object p0

    .line 254
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, -0x2

    const/high16 p3, 0x3f800000    # 1.0f

    const/4 v0, 0x0

    invoke-direct {p1, v0, p2, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p0, p1}, Landroid/widget/CheckBox;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method preset()I
    .registers 4

    const/4 v0, 0x0

    .line 194
    :goto_0
    sget-object v1, Le/e/a/AmbientLight;->PRESETS:[[I

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 196
    sget-object p0, Le/e/a/AmbientLight;->PRESETS:[[I

    array-length p0, p0

    return p0

    .line 195
    :cond_0
    iget-object v1, p0, Le/e/a/AmbientSettings$Editor;->values:[I

    sget-object v2, Le/e/a/AmbientLight;->PRESETS:[[I

    aget-object v2, v2, v0

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v1

    if-eqz v1, :cond_1

    return v0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method row(Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;
    .registers 5

    .line 246
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object p0, p0, Le/e/a/AmbientSettings$Editor;->c:Landroid/content/Context;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 p0, 0x10

    .line 247
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 248
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {p0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method save(Landroid/content/SharedPreferences;)V
    .registers 6

    .line 200
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object v0, p0, Le/e/a/AmbientSettings$Editor;->enabled:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    const-string v1, "nicoid_ambient_enabled"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 201
    const-string v0, "nicoid_ambient_sides"

    invoke-virtual {p0}, Le/e/a/AmbientSettings$Editor;->mask()I

    move-result v1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const/4 v0, 0x0

    move v1, v0

    .line 202
    :goto_0
    iget-object v2, p0, Le/e/a/AmbientSettings$Editor;->modes:[Landroid/widget/CheckBox;

    array-length v2, v2

    if-lt v1, v2, :cond_1

    .line 203
    :goto_1
    iget-object v1, p0, Le/e/a/AmbientSettings$Editor;->values:[I

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 204
    iget-object v0, p0, Le/e/a/AmbientSettings$Editor;->fullSpread:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    const-string v1, "nicoid_ambient_full_spread"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    .line 203
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "nicoid_ambient_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Le/e/a/AmbientLight;->KEYS:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Le/e/a/AmbientSettings$Editor;->values:[I

    aget v2, v2, v0

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 202
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "nicoid_ambient_mode_"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Le/e/a/AmbientSettings$Editor;->modes:[Landroid/widget/CheckBox;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    invoke-interface {p1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method slider(Landroid/widget/LinearLayout;I)V
    .registers 6

    .line 214
    iget-object v0, p0, Le/e/a/AmbientSettings$Editor;->captions:[Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {p0, p1, v1}, Le/e/a/AmbientSettings$Editor;->label(Landroid/widget/LinearLayout;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    aput-object v1, v0, p2

    .line 215
    invoke-virtual {p0, p2}, Le/e/a/AmbientSettings$Editor;->caption(I)V

    .line 216
    new-instance v0, Landroid/widget/SeekBar;

    iget-object v1, p0, Le/e/a/AmbientSettings$Editor;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 217
    const-string v1, "nicoid-managed-input"

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setTag(Ljava/lang/Object;)V

    .line 218
    iget-object v1, p0, Le/e/a/AmbientSettings$Editor;->tint:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    .line 219
    iget-object v1, p0, Le/e/a/AmbientSettings$Editor;->tint:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    .line 220
    sget-object v1, Le/e/a/AmbientLight;->MAX:[I

    aget v1, v1, p2

    sget-object v2, Le/e/a/AmbientLight;->MIN:[I

    aget v2, v2, p2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 221
    iget-object v1, p0, Le/e/a/AmbientSettings$Editor;->values:[I

    aget v1, v1, p2

    sget-object v2, Le/e/a/AmbientLight;->MIN:[I

    aget v2, v2, p2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 222
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 223
    iget-object p1, p0, Le/e/a/AmbientSettings$Editor;->bars:[Landroid/widget/SeekBar;

    aput-object v0, p1, p2

    .line 224
    new-instance p1, Le/e/a/AmbientSettings$Editor$2;

    invoke-direct {p1, p0, p2}, Le/e/a/AmbientSettings$Editor$2;-><init>(Le/e/a/AmbientSettings$Editor;I)V

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method

.method tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 275
    iget-object p0, p0, Le/e/a/AmbientSettings$Editor;->c:Landroid/content/Context;

    invoke-static {p0, p1, p2, p3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
