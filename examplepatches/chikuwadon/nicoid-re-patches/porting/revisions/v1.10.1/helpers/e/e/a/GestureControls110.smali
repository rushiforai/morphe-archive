.class public final Le/e/a/GestureControls110;
.super Ljava/lang/Object;
.source "GestureControls110.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/GestureControls110$Chosen;,
        Le/e/a/GestureControls110$State;,
        Le/e/a/GestureControls110$Trace;
    }
.end annotation


# static fields
.field static final ACTIONS:[Ljava/lang/String;

.field static final CONFIGS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Landroid/app/AlertDialog;",
            ">;"
        }
    .end annotation
.end field

.field static final DISPLAY:Ljava/lang/String; = "list_gestures_display"

.field static final ENABLE:Ljava/lang/String; = "list_gestures_enabled"

.field static final MAP:Ljava/lang/String; = "list_gestures_map"

.field static final STATES:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Le/e/a/GestureControls110$State;",
            ">;"
        }
    .end annotation
.end field

.field static cachedMap:Lorg/json/JSONObject;

.field static cachedRaw:Ljava/lang/String;

.field static closed:Le/e/a/SavedTabs227$Tab;

.field static closedAt:I


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/GestureControls110;->STATES:Ljava/util/WeakHashMap;

    const-string v7, "lefttab"

    const-string v8, "righttab"

    const-string v1, "close"

    const-string v2, "undo"

    const-string v3, "refresh"

    const-string v4, "top"

    const-string v5, "bottom"

    const-string v6, "search"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/GestureControls110;->ACTIONS:[Ljava/lang/String;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/GestureControls110;->CONFIGS:Ljava/util/WeakHashMap;

    .line 7
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static action(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 11
    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "gesture_disabled_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1d

    const-string p0, ""

    goto :goto_25

    :cond_1d
    invoke-static {p0}, Le/e/a/GestureControls110;->mappings(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_25
    return-object p0
.end method

.method static choose(Landroid/app/Activity;Le/e/a/GestureControls110$Chosen;)V
    .registers 7

    .line 15
    sget-object v0, Le/e/a/GestureControls110;->ACTIONS:[Ljava/lang/String;

    array-length v0, v0

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    :goto_6
    if-lt v2, v0, :cond_36

    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "Choose action"

    const-string v3, "\u9078\u64c7\u52d5\u4f5c"

    const-string v4, "\u64cd\u4f5c\u3092\u9078\u629e"

    invoke-static {p0, v4, v2, v3}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    new-instance v0, Le/e/a/GestureControls110$$ExternalSyntheticLambda20;

    invoke-direct {v0, p1}, Le/e/a/GestureControls110$$ExternalSyntheticLambda20;-><init>(Le/e/a/GestureControls110$Chosen;)V

    invoke-virtual {p0, v1, v0}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void

    :cond_36
    sget-object v3, Le/e/a/GestureControls110;->ACTIONS:[Ljava/lang/String;

    aget-object v3, v3, v2

    invoke-static {p0, v3}, Le/e/a/GestureControls110;->name(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_6
.end method

.method static clear(Landroid/app/Activity;)V
    .registers 2

    .line 25
    sget-object v0, Le/e/a/GestureControls110;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/GestureControls110$State;

    if-eqz v0, :cond_d

    invoke-static {p0, v0}, Le/e/a/GestureControls110;->discard(Landroid/app/Activity;Le/e/a/GestureControls110$State;)V

    :cond_d
    if-eqz v0, :cond_2a

    iget-object p0, v0, Le/e/a/GestureControls110$State;->trace:Le/e/a/GestureControls110$Trace;

    if-eqz p0, :cond_2a

    iget-object p0, v0, Le/e/a/GestureControls110$State;->trace:Le/e/a/GestureControls110$Trace;

    invoke-virtual {p0}, Le/e/a/GestureControls110$Trace;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of p0, p0, Landroid/view/ViewGroup;

    if-eqz p0, :cond_2a

    iget-object p0, v0, Le/e/a/GestureControls110$State;->trace:Le/e/a/GestureControls110$Trace;

    invoke-virtual {p0}, Le/e/a/GestureControls110$Trace;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    iget-object v0, v0, Le/e/a/GestureControls110$State;->trace:Le/e/a/GestureControls110$Trace;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_2a
    return-void
.end method

.method static configure(Landroid/app/Activity;)V
    .registers 11

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_188

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_e

    goto/16 :goto_188

    :cond_e
    sget-object v0, Le/e/a/GestureControls110;->CONFIGS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlertDialog;

    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_1b
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->insetContent(Landroid/view/View;)V

    new-instance v2, Landroid/widget/CheckBox;

    invoke-direct {v2, v0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    new-instance v3, Landroid/widget/CheckBox;

    invoke-direct {v3, v0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v4, "Enable gestures"

    const-string v5, "\u555f\u7528\u624b\u52e2"

    const-string v6, "\u30b8\u30a7\u30b9\u30c1\u30e3\u30fc\u3092\u4f7f\u7528"

    invoke-static {v0, v6, v4, v5}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "list_gestures_enabled"

    const/4 v6, 0x0

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    new-instance v4, Le/e/a/GestureControls110$$ExternalSyntheticLambda31;

    invoke-direct {v4, p0}, Le/e/a/GestureControls110$$ExternalSyntheticLambda31;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    const-string v4, "Show trace and action"

    const-string v5, "\u986f\u793a\u8ecc\u8de1\u8207\u52d5\u4f5c"

    const-string v7, "\u64cd\u4f5c\u4e2d\u306e\u8ecc\u8de1\u3068\u30a2\u30af\u30b7\u30e7\u30f3\u3092\u8868\u793a"

    invoke-static {v0, v7, v4, v5}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "list_gestures_display"

    const/4 v7, 0x1

    invoke-interface {v4, v5, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    new-instance v4, Le/e/a/GestureControls110$$ExternalSyntheticLambda32;

    invoke-direct {v4, p0}, Le/e/a/GestureControls110$$ExternalSyntheticLambda32;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    invoke-static {v2}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    invoke-static {v3}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v2, ""

    const/16 v3, 0xe

    invoke-static {v0, v2, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    new-instance v3, Landroid/widget/SeekBar;

    invoke-direct {v3, v0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    const/16 v4, 0x63

    invoke-virtual {v3, v4}, Landroid/widget/SeekBar;->setMax(I)V

    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    const-string v8, "gesture_sensitivity"

    const/16 v9, 0x32

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    sub-int/2addr v5, v7

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/SeekBar;->setProgress(I)V

    new-instance v4, Le/e/a/GestureControls110$$ExternalSyntheticLambda33;

    invoke-direct {v4, v2, v0, v3}, Le/e/a/GestureControls110$$ExternalSyntheticLambda33;-><init>(Landroid/widget/TextView;Landroid/content/Context;Landroid/widget/SeekBar;)V

    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    invoke-static {v0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v5

    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/SeekBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    invoke-static {v0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v5

    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    new-instance v5, Le/e/a/GestureControls110$1;

    invoke-direct {v5, p0, v4}, Le/e/a/GestureControls110$1;-><init>(Landroid/app/Activity;Ljava/lang/Runnable;)V

    invoke-virtual {v3, v5}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v2, "Draw a turn on a list, then release. Return to the starting point or touch with another finger to cancel. Straight strokes keep their usual behavior."

    const-string v3, "\u5728\u5217\u8868\u756b\u51fa\u8f49\u5411\u5f8c\u653e\u958b\u5373\u53ef\u57f7\u884c\u3002\u8fd4\u56de\u8d77\u9ede\u6216\u4ee5\u53e6\u4e00\u96bb\u624b\u6307\u89f8\u78b0\u5373\u53ef\u53d6\u6d88\u3002\u76f4\u7dda\u7dad\u6301\u539f\u672c\u64cd\u4f5c\u3002"

    const-string v4, "\u4e00\u89a7\u5185\u3067\u65b9\u5411\u3092\u5909\u3048\u3066\u63cf\u304d\u3001\u6307\u3092\u96e2\u3059\u3068\u5b9f\u884c\u3057\u307e\u3059\u3002\u958b\u59cb\u4f4d\u7f6e\u3078\u623b\u3059\u304b\u3001\u3082\u30461\u672c\u306e\u6307\u3092\u89e6\u308c\u308b\u3068\u30ad\u30e3\u30f3\u30bb\u30eb\u3057\u307e\u3059\u3002\u76f4\u7dda\u306f\u30b9\u30af\u30ed\u30fc\u30eb/\u30bf\u30d6\u5207\u308a\u66ff\u3048\u306e\u307e\u307e\u3067\u3059\u3002"

    invoke-static {v0, v4, v2, v3}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xd

    invoke-static {v0, v2, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Le/e/a/GestureControls110$$ExternalSyntheticLambda34;

    invoke-direct {v3, v2, p0, v0}, Le/e/a/GestureControls110$$ExternalSyntheticLambda34;-><init>(Landroid/widget/LinearLayout;Landroid/app/Activity;Landroid/content/Context;)V

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    const-string v2, "\uff0b Add assignment"

    const-string v3, "\uff0b \u65b0\u589e\u8a2d\u5b9a"

    const-string v4, "\uff0b \u5272\u308a\u5f53\u3066\u3092\u8ffd\u52a0"

    invoke-static {v0, v4, v2, v3}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    const-string v3, "Practice without executing actions"

    const-string v4, "\u7df4\u7fd2\u8fa8\u8b58\uff08\u4e0d\u57f7\u884c\u52d5\u4f5c\uff09"

    const-string v5, "\u8a8d\u8b58\u3092\u8a66\u3059\uff08\u64cd\u4f5c\u306f\u5b9f\u884c\u3057\u307e\u305b\u3093\uff09"

    invoke-static {v0, v5, v3, v4}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v4, "Restore defaults"

    const-string v5, "\u9084\u539f\u9810\u8a2d\u503c"

    const-string v6, "\u521d\u671f\u5024\u306b\u623b\u3059"

    invoke-static {v0, v6, v4, v5}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v5, Le/e/a/GestureControls110$$ExternalSyntheticLambda35;

    invoke-direct {v5, p0}, Le/e/a/GestureControls110$$ExternalSyntheticLambda35;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v4, Landroid/widget/ScrollView;

    invoke-direct {v4, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v5, "Gestures"

    const-string v6, "\u624b\u52e2"

    const-string v7, "\u30b8\u30a7\u30b9\u30c1\u30e3\u30fc"

    invoke-static {v0, v7, v5, v6}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x104000a

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    invoke-virtual {p0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    new-instance v1, Le/e/a/GestureControls110$$ExternalSyntheticLambda36;

    invoke-direct {v1, p0}, Le/e/a/GestureControls110$$ExternalSyntheticLambda36;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Le/e/a/GestureControls110$$ExternalSyntheticLambda37;

    invoke-direct {v1, p0}, Le/e/a/GestureControls110$$ExternalSyntheticLambda37;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v3, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget-object v1, Le/e/a/GestureControls110;->CONFIGS:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Le/e/a/GestureControls110$$ExternalSyntheticLambda38;

    invoke-direct {v1, p0, v0}, Le/e/a/GestureControls110$$ExternalSyntheticLambda38;-><init>(Landroid/app/Activity;Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-static {v0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    :cond_188
    :goto_188
    return-void
.end method

.method static defaults()Lorg/json/JSONObject;
    .registers 2

    .line 8
    new-instance v0, Lorg/json/JSONObject;

    invoke-static {}, Le/e/a/GestureDefaults113;->mapping()Ljava/util/Map;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method static discard(Landroid/app/Activity;Le/e/a/GestureControls110$State;)V
    .registers 3

    .line 23
    iget-object p0, p1, Le/e/a/GestureControls110$State;->replay:Ljava/lang/Runnable;

    if-eqz p0, :cond_e

    iget-object p0, p1, Le/e/a/GestureControls110$State;->list:Landroid/widget/ListView;

    iget-object v0, p1, Le/e/a/GestureControls110$State;->replay:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/widget/ListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 p0, 0x0

    iput-object p0, p1, Le/e/a/GestureControls110$State;->replay:Ljava/lang/Runnable;

    :cond_e
    iget-object p0, p1, Le/e/a/GestureControls110$State;->deferred:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_14
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_20

    iget-object p0, p1, Le/e/a/GestureControls110$State;->deferred:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void

    :cond_20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MotionEvent;

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    goto :goto_14
.end method

.method static dispose(Landroid/app/Activity;)V
    .registers 2

    .line 22
    invoke-static {p0}, Le/e/a/GestureControls110;->clear(Landroid/app/Activity;)V

    sget-object v0, Le/e/a/GestureControls110;->CONFIGS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/AlertDialog;

    if-eqz p0, :cond_18

    :try_start_d
    invoke-virtual {p0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Landroid/app/AlertDialog;->dismiss()V
    :try_end_16
    .catch Ljava/lang/IllegalArgumentException; {:try_start_d .. :try_end_16} :catch_17

    goto :goto_18

    :catch_17
    move-exception p0

    :cond_18
    :goto_18
    return-void
.end method

.method static drawDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 17
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Le/e/a/GestureControls110;->drawDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static drawDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 15

    .line 17
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->insetContent(Landroid/view/View;)V

    if-nez p1, :cond_18

    const-string v1, "Draw to test recognition"

    const-string v2, "\u7e6a\u88fd\u4ee5\u6e2c\u8a66\u8fa8\u8b58"

    const-string v4, "\u63cf\u3044\u3066\u8a8d\u8b58\u3092\u78ba\u8a8d\u3067\u304d\u307e\u3059"

    invoke-static {v3, v4, v1, v2}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_3d

    :cond_18
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v3, p1}, Le/e/a/GestureControls110;->name(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Draw the same pattern twice"

    const-string v4, "\u7e6a\u88fd\u76f8\u540c\u5f62\u72c0\u5169\u6b21\u4ee5\u767b\u9304"

    const-string v5, "\u540c\u3058\u5f62\u30922\u56de\u63cf\u3044\u3066\u767b\u9332"

    invoke-static {v3, v5, v2, v4}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_3d
    const/16 v2, 0xe

    invoke-static {v3, v1, v2}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    filled-new-array {p3}, [Ljava/lang/String;

    move-result-object v7

    new-instance p3, Le/e/a/GestureControls110$Trace;

    invoke-direct {p3, v3}, Le/e/a/GestureControls110$Trace;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x104

    invoke-static {v3, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {p3, v1}, Le/e/a/GestureControls110$Trace;->setMinimumHeight(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0x118

    invoke-static {v3, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const/4 v5, -0x1

    invoke-direct {v1, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {v3}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v4, "Register / practice gesture"

    const-string v5, "\u767b\u9304/\u7df4\u7fd2\u624b\u52e2"

    const-string v6, "\u30b8\u30a7\u30b9\u30c1\u30e3\u30fc\u306e\u767b\u9332\u30fb\u7df4\u7fd2"

    invoke-static {v3, v6, v4, v5}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v9

    new-instance v10, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;

    move-object v0, v10

    move-object v1, p3

    move-object v4, p1

    move-object v5, p0

    move-object v6, p2

    move-object v8, v9

    invoke-direct/range {v0 .. v8}, Le/e/a/GestureControls110$$ExternalSyntheticLambda30;-><init>(Le/e/a/GestureControls110$Trace;Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;Landroid/app/AlertDialog;)V

    invoke-virtual {p3, v10}, Le/e/a/GestureControls110$Trace;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-static {v9}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method static excluded(Landroid/view/View;FF)Z
    .registers 8

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    return v1

    :cond_8
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v2

    if-eqz v2, :cond_6f

    float-to-int v2, p1

    float-to-int v3, p2

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    if-nez v0, :cond_1c

    goto :goto_6f

    :cond_1c
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v2, p0, Landroid/widget/EditText;

    const/4 v3, 0x1

    if-nez v2, :cond_6e

    instance-of v2, p0, Landroid/widget/Button;

    if-nez v2, :cond_6e

    instance-of v2, p0, Landroid/widget/SeekBar;

    if-nez v2, :cond_6e

    instance-of v2, p0, Landroid/widget/Spinner;

    if-nez v2, :cond_6e

    instance-of v2, p0, Landroid/widget/CheckBox;

    if-nez v2, :cond_6e

    if-eqz v0, :cond_50

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v4, "mini"

    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6e

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "nicoid-video-tabs"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_50

    goto :goto_6e

    :cond_50
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_6d

    const/4 v0, 0x0

    :goto_55
    move-object v2, p0

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-lt v0, v4, :cond_5f

    goto :goto_6d

    :cond_5f
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2, p1, p2}, Le/e/a/GestureControls110;->excluded(Landroid/view/View;FF)Z

    move-result v2

    if-eqz v2, :cond_6a

    return v3

    :cond_6a
    add-int/lit8 v0, v0, 0x1

    goto :goto_55

    :cond_6d
    :goto_6d
    return v1

    :cond_6e
    :goto_6e
    return v3

    :cond_6f
    :goto_6f
    return v1
.end method

.method static flush(Landroid/app/Activity;Le/e/a/GestureControls110$State;)V
    .registers 5

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p1, Le/e/a/GestureControls110$State;->candidate:Z

    iget-object v0, p1, Le/e/a/GestureControls110$State;->replay:Ljava/lang/Runnable;

    if-eqz v0, :cond_11

    iget-object v0, p1, Le/e/a/GestureControls110$State;->list:Landroid/widget/ListView;

    iget-object v1, p1, Le/e/a/GestureControls110$State;->replay:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    iput-object v0, p1, Le/e/a/GestureControls110$State;->replay:Ljava/lang/Runnable;

    :cond_11
    iget-object v0, p1, Le/e/a/GestureControls110$State;->deferred:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_17
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_23

    iget-object p0, p1, Le/e/a/GestureControls110$State;->deferred:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void

    :cond_23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/MotionEvent;

    :try_start_29
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_38

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_38

    invoke-virtual {p0, v1}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_38
    .catchall {:try_start_29 .. :try_end_38} :catchall_3c

    :cond_38
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    goto :goto_17

    :catchall_3c
    move-exception p0

    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    throw p0
.end method

.method static synthetic lambda$0(Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 10
    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p1}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_14
    :goto_14
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_47

    invoke-static {}, Le/e/a/GestureControls110;->defaults()Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "list_gestures_map"

    invoke-interface {p2, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "gesture_defaults_v3"

    const/4 v0, 0x1

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "gesture_sensitivity"

    const/16 v1, 0x32

    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "list_gestures_display"

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/4 p1, 0x0

    sput-object p1, Le/e/a/GestureControls110;->cachedMap:Lorg/json/JSONObject;

    invoke-static {p0}, Le/e/a/GestureControls110;->configure(Landroid/app/Activity;)V

    return-void

    :cond_47
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "gesture_disabled_"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-interface {p2, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_14
.end method

.method static synthetic lambda$1(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 2

    .line 13
    invoke-static {p0}, Le/e/a/GestureControls110;->configure(Landroid/app/Activity;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$10(Landroid/app/Activity;Landroid/view/View;)V
    .registers 2

    .line 14
    invoke-static {p0}, Le/e/a/GestureControls110;->reset(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic lambda$11(Landroid/app/Activity;Landroid/view/View;)V
    .registers 2

    .line 14
    new-instance p1, Le/e/a/GestureControls110$$ExternalSyntheticLambda29;

    invoke-direct {p1, p0}, Le/e/a/GestureControls110$$ExternalSyntheticLambda29;-><init>(Landroid/app/Activity;)V

    invoke-static {p0, p1}, Le/e/a/GestureControls110;->choose(Landroid/app/Activity;Le/e/a/GestureControls110$Chosen;)V

    return-void
.end method

.method static synthetic lambda$12(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3

    .line 14
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/GestureControls110;->register(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$13(Landroid/app/Activity;Landroid/view/View;)V
    .registers 2

    .line 14
    const/4 p1, 0x0

    invoke-static {p0, p1, p1}, Le/e/a/GestureControls110;->drawDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$14(Landroid/app/Activity;Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .registers 3

    .line 14
    sget-object p2, Le/e/a/GestureControls110;->CONFIGS:Ljava/util/WeakHashMap;

    invoke-virtual {p2, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, p1, :cond_d

    sget-object p1, Le/e/a/GestureControls110;->CONFIGS:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d
    return-void
.end method

.method static synthetic lambda$15(Le/e/a/GestureControls110$Chosen;Landroid/content/DialogInterface;I)V
    .registers 3

    .line 15
    sget-object p1, Le/e/a/GestureControls110;->ACTIONS:[Ljava/lang/String;

    aget-object p1, p1, p2

    invoke-interface {p0, p1}, Le/e/a/GestureControls110$Chosen;->choose(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$16(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .registers 16

    .line 16
    if-nez p5, :cond_6

    invoke-static {p0, p1, p2}, Le/e/a/GestureControls110;->drawDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4e

    :cond_6
    const-string v8, "URD"

    const-string v9, "ULD"

    const-string v0, "DR"

    const-string v1, "DL"

    const-string v2, "RU"

    const-string v3, "RD"

    const-string v4, "LU"

    const-string v5, "LD"

    const-string v6, "UR"

    const-string v7, "UL"

    filled-new-array/range {v0 .. v9}, [Ljava/lang/String;

    move-result-object p4

    const/16 p5, 0xa

    new-array v0, p5, [Ljava/lang/String;

    const/4 v1, 0x0

    :goto_23
    if-lt v1, p5, :cond_4f

    invoke-static {p3}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p5

    const-string v1, "Choose pattern"

    const-string v2, "\u9078\u64c7\u5f62\u72c0"

    const-string v3, "\u5f62\u3092\u9078\u629e"

    invoke-static {p3, v3, v1, v2}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p5, p3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p3

    new-instance p5, Le/e/a/GestureControls110$$ExternalSyntheticLambda25;

    invoke-direct {p5, p0, p1, p2, p4}, Le/e/a/GestureControls110$$ExternalSyntheticLambda25;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {p3, v0, p5}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    :goto_4e
    return-void

    :cond_4f
    aget-object v2, p4, v1

    invoke-static {v2}, Le/e/a/GestureRules110;->arrows(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_23
.end method

.method static synthetic lambda$17(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 6

    .line 16
    aget-object p3, p3, p5

    invoke-static {p0, p1, p2, p3}, Le/e/a/GestureControls110;->drawDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$18(Le/e/a/GestureControls110$Trace;Landroid/widget/TextView;Landroid/content/Context;Ljava/lang/String;Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;Landroid/app/AlertDialog;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 14

    .line 17
    invoke-virtual {p0, p9}, Le/e/a/GestureControls110$Trace;->feed(Landroid/view/MotionEvent;)V

    invoke-virtual {p9}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p8

    const/4 p9, 0x1

    if-ne p8, p9, :cond_f5

    iget-object p8, p0, Le/e/a/GestureControls110$Trace;->rules:Le/e/a/GestureRules110;

    iget-object p8, p8, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    iget-object v0, p0, Le/e/a/GestureControls110$Trace;->rules:Le/e/a/GestureRules110;

    iget-object v1, p0, Le/e/a/GestureControls110$Trace;->rules:Le/e/a/GestureRules110;

    iget v1, v1, Le/e/a/GestureRules110;->x:F

    iget-object v2, p0, Le/e/a/GestureControls110$Trace;->rules:Le/e/a/GestureRules110;

    iget v2, v2, Le/e/a/GestureRules110;->y:F

    invoke-virtual {v0, v1, v2}, Le/e/a/GestureRules110;->cancelled(FF)Z

    move-result v0

    if-eqz v0, :cond_2c

    const-string p0, "Returning to the start cancels a gesture"

    const-string p3, "\u8fd4\u56de\u8d77\u9ede\u6703\u53d6\u6d88\u624b\u52e2"

    const-string p4, "\u958b\u59cb\u4f4d\u7f6e\u3078\u623b\u3059\u5f62\u306f\u30ad\u30e3\u30f3\u30bb\u30eb\u64cd\u4f5c\u3067\u3059"

    invoke-static {p2, p4, p0, p3}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return p9

    :cond_2c
    iget-object p0, p0, Le/e/a/GestureControls110$Trace;->rules:Le/e/a/GestureRules110;

    invoke-virtual {p0}, Le/e/a/GestureRules110;->valid()Z

    move-result p0

    if-nez p0, :cond_42

    const-string p0, "Use two or three clear directions"

    const-string p3, "\u8acb\u4f7f\u75282\u81f33\u500b\u660e\u78ba\u65b9\u5411"

    const-string p4, "2\u301c3\u65b9\u5411\u3067\u3001\u306f\u3063\u304d\u308a\u5411\u304d\u3092\u5909\u3048\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p2, p4, p0, p3}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return p9

    :cond_42
    const-string p0, "\n"

    if-nez p3, :cond_6b

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-static {p8}, Le/e/a/GestureRules110;->arrows(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    invoke-static {p5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p5

    invoke-direct {p3, p5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {p4, p8}, Le/e/a/GestureControls110;->action(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Le/e/a/GestureControls110;->name(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return p9

    :cond_6b
    invoke-static {p4}, Le/e/a/GestureControls110;->mappings(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, p8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v1, :cond_8d

    invoke-virtual {p8, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8d

    const-string p0, "Pattern already assigned. Draw another."

    const-string p3, "\u6b64\u5f62\u72c0\u5df2\u4f7f\u7528\uff0c\u8acb\u7e6a\u88fd\u5176\u4ed6\u5f62\u72c0"

    const-string p4, "\u3053\u306e\u5f62\u306f\u767b\u9332\u6e08\u307f\u3067\u3059\u3002\u5225\u306e\u5f62\u3092\u63cf\u3044\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p2, p4, p0, p3}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    aput-object v2, p6, v3

    return p9

    :cond_8d
    aget-object v1, p6, v3

    if-nez v1, :cond_ba

    aput-object p8, p6, v3

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-static {p8}, Le/e/a/GestureRules110;->arrows(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p4

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p3, "Draw it once more"

    const-string p4, "\u8acb\u518d\u7e6a\u88fd\u4e00\u6b21"

    const-string p5, "\u3082\u3046\u4e00\u5ea6\u540c\u3058\u5f62\u3092\u63cf\u3044\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p2, p5, p3, p4}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_b6
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_f5

    :cond_ba
    aget-object p0, p6, v3

    invoke-virtual {p0, p8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_e8

    if-eqz p5, :cond_c7

    :try_start_c4
    invoke-virtual {v0, p5}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    :cond_c7
    invoke-virtual {v0, p8, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {p4}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "list_gestures_map"

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p7}, Landroid/app/AlertDialog;->dismiss()V

    invoke-static {p4}, Le/e/a/GestureControls110;->configure(Landroid/app/Activity;)V
    :try_end_e5
    .catch Ljava/lang/Exception; {:try_start_c4 .. :try_end_e5} :catch_e6

    goto :goto_f5

    :catch_e6
    move-exception p0

    goto :goto_f5

    :cond_e8
    aput-object v2, p6, v3

    const-string p0, "Patterns differ. Try again."

    const-string p3, "\u5f62\u72c0\u4e0d\u540c\uff0c\u8acb\u91cd\u65b0\u958b\u59cb"

    const-string p4, "\u5f62\u304c\u9055\u3044\u307e\u3059\u3002\u6700\u521d\u304b\u3089\u63cf\u304d\u76f4\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p2, p4, p0, p3}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_b6

    :cond_f5
    :goto_f5
    return p9
.end method

.method static synthetic lambda$19(Landroid/app/Activity;Le/e/a/GestureControls110$State;)V
    .registers 2

    .line 21
    invoke-static {p0, p1}, Le/e/a/GestureControls110;->flush(Landroid/app/Activity;Le/e/a/GestureControls110$State;)V

    return-void
.end method

.method static synthetic lambda$2(Landroid/app/Activity;Landroid/widget/CompoundButton;Z)V
    .registers 3

    .line 14
    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "list_gestures_enabled"

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static synthetic lambda$3(Landroid/app/Activity;Landroid/widget/CompoundButton;Z)V
    .registers 3

    .line 14
    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "list_gestures_display"

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static synthetic lambda$4(Landroid/widget/TextView;Landroid/content/Context;Landroid/widget/SeekBar;)V
    .registers 7

    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Recognition sensitivity"

    const-string v2, "\u8fa8\u8b58\u9748\u654f\u5ea6"

    const-string v3, "\u8a8d\u8b58\u611f\u5ea6"

    invoke-static {p1, v3, v1, v2}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Landroid/widget/SeekBar;->getProgress()I

    move-result p2

    add-int/lit8 p2, p2, 0x1

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " / 100\n"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "Lower values require larger strokes"

    const-string v1, "\u6578\u503c\u8d8a\u4f4e\uff0c\u6240\u9700\u7b46\u5283\u8d8a\u9577"

    const-string v2, "\u4f4e\u3044\u307b\u3069\u5927\u304d\u304f\u63cf\u304f\u5fc5\u8981\u304c\u3042\u308a\u307e\u3059"

    invoke-static {p1, v2, v0, v1}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$5(Landroid/widget/LinearLayout;Landroid/app/Activity;Landroid/content/Context;)V
    .registers 13

    .line 14
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-static {p1}, Le/e/a/GestureControls110;->mappings(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_12

    return-void

    :cond_12
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v7}, Le/e/a/GestureRules110;->arrows(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p2, v8}, Le/e/a/GestureControls110;->name(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p2, v2}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v4, Landroid/widget/CheckBox;

    invoke-direct {v4, p2}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    invoke-static {p1}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v9, "gesture_disabled_"

    invoke-direct {v6, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v9, 0x0

    invoke-interface {v5, v6, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    xor-int/lit8 v5, v5, 0x1

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-static {v4}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    invoke-static {p2, v8}, Le/e/a/GestureControls110;->name(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v5, Le/e/a/GestureControls110$$ExternalSyntheticLambda22;

    invoke-direct {v5, p1, v7}, Le/e/a/GestureControls110$$ExternalSyntheticLambda22;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v4, v9, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v9, Le/e/a/GestureControls110$$ExternalSyntheticLambda23;

    move-object v3, v9

    move-object v4, p2

    move-object v5, v2

    move-object v6, p1

    invoke-direct/range {v3 .. v8}, Le/e/a/GestureControls110$$ExternalSyntheticLambda23;-><init>(Landroid/content/Context;Landroid/widget/Button;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v9}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_b
.end method

.method static synthetic lambda$6(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/CompoundButton;Z)V
    .registers 5

    .line 14
    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "gesture_disabled_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    xor-int/lit8 p2, p3, 0x1

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static synthetic lambda$7(Landroid/content/Context;Landroid/widget/Button;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .registers 10

    .line 14
    const-string p5, "Change action"

    const-string v0, "\u8b8a\u66f4\u52d5\u4f5c"

    const-string v1, "\u64cd\u4f5c\u3092\u5909\u66f4"

    invoke-static {p0, v1, p5, v0}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    const-string v0, "Redraw"

    const-string v1, "\u91cd\u65b0\u7e6a\u88fd"

    const-string v2, "\u63cf\u304d\u76f4\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Delete"

    const-string v2, "\u522a\u9664"

    const-string v3, "\u524a\u9664"

    invoke-static {p0, v3, v1, v2}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {p5, v0, v1}, [Ljava/lang/String;

    move-result-object p5

    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p1}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    new-instance p1, Le/e/a/GestureControls110$$ExternalSyntheticLambda27;

    invoke-direct {p1, p2, p3, p4}, Le/e/a/GestureControls110$$ExternalSyntheticLambda27;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p5, p1}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method static synthetic lambda$8(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 14
    if-nez p4, :cond_b

    new-instance p2, Le/e/a/GestureControls110$$ExternalSyntheticLambda21;

    invoke-direct {p2, p0, p1}, Le/e/a/GestureControls110$$ExternalSyntheticLambda21;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-static {p0, p2}, Le/e/a/GestureControls110;->choose(Landroid/app/Activity;Le/e/a/GestureControls110$Chosen;)V

    goto :goto_31

    :cond_b
    const/4 p3, 0x1

    if-ne p4, p3, :cond_12

    invoke-static {p0, p2, p1}, Le/e/a/GestureControls110;->register(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_31

    :cond_12
    invoke-static {p0}, Le/e/a/GestureControls110;->mappings(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object p2

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p3, "list_gestures_map"

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p3, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {p0}, Le/e/a/GestureControls110;->configure(Landroid/app/Activity;)V

    :goto_31
    return-void
.end method

.method static synthetic lambda$9(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 14
    invoke-static {p0}, Le/e/a/GestureControls110;->mappings(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v0

    :try_start_4
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_7} :catch_8

    goto :goto_9

    :catch_8
    move-exception p1

    :goto_9
    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "list_gestures_map"

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {p0}, Le/e/a/GestureControls110;->configure(Landroid/app/Activity;)V

    return-void
.end method

.method static list(Landroid/view/View;)Landroid/widget/ListView;
    .registers 5

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    return-object v1

    :cond_8
    instance-of v0, p0, Landroid/widget/ListView;

    if-eqz v0, :cond_f

    check-cast p0, Landroid/widget/ListView;

    return-object p0

    :cond_f
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2c

    const/4 v0, 0x0

    :goto_14
    move-object v2, p0

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-lt v0, v3, :cond_1e

    goto :goto_2c

    :cond_1e
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Le/e/a/GestureControls110;->list(Landroid/view/View;)Landroid/widget/ListView;

    move-result-object v2

    if-eqz v2, :cond_29

    return-object v2

    :cond_29
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    :cond_2c
    :goto_2c
    return-object v1
.end method

.method static mappings(Landroid/content/Context;)Lorg/json/JSONObject;
    .registers 15

    .line 9
    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "list_gestures_map"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "gesture_defaults_v3"

    const/4 v4, 0x0

    invoke-interface {p0, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_87

    if-nez v2, :cond_1b

    :try_start_16
    invoke-static {}, Le/e/a/GestureControls110;->defaults()Lorg/json/JSONObject;

    move-result-object v2

    goto :goto_21

    :cond_1b
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    move-object v2, v5

    :goto_21
    const-string v5, "UR"

    const-string v6, "righttab"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "UL"

    const-string v7, "lefttab"

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x2

    new-array v8, v7, [[Ljava/lang/String;

    aput-object v5, v8, v4

    const/4 v5, 0x1

    aput-object v6, v8, v5

    const/4 v6, 0x0

    :goto_3a
    if-lt v6, v7, :cond_50

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v3, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_87

    :cond_50
    aget-object v9, v8, v6

    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v10

    const/4 v11, 0x0

    :cond_57
    :goto_57
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-nez v12, :cond_71

    if-nez v11, :cond_6e

    aget-object v10, v9, v4

    invoke-virtual {v2, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_6e

    aget-object v10, v9, v4

    aget-object v9, v9, v5

    invoke-virtual {v2, v10, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_6e
    add-int/lit8 v6, v6, 0x1

    goto :goto_3a

    :cond_71
    aget-object v12, v9, v5

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-virtual {v2, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12
    :try_end_81
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_81} :catch_85

    if-eqz v12, :cond_57

    const/4 v11, 0x1

    goto :goto_57

    :catch_85
    move-exception p0

    goto :goto_88

    :cond_87
    :goto_87
    move-object v1, v2

    :goto_88
    sget-object p0, Le/e/a/GestureControls110;->cachedMap:Lorg/json/JSONObject;

    if-eqz p0, :cond_97

    sget-object p0, Le/e/a/GestureControls110;->cachedRaw:Ljava/lang/String;

    invoke-static {p0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_97

    :goto_94
    sget-object p0, Le/e/a/GestureControls110;->cachedMap:Lorg/json/JSONObject;

    return-object p0

    :cond_97
    sput-object v1, Le/e/a/GestureControls110;->cachedRaw:Ljava/lang/String;

    if-nez v1, :cond_a0

    :try_start_9b
    invoke-static {}, Le/e/a/GestureControls110;->defaults()Lorg/json/JSONObject;

    move-result-object p0

    goto :goto_a5

    :cond_a0
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    :goto_a5
    sput-object p0, Le/e/a/GestureControls110;->cachedMap:Lorg/json/JSONObject;
    :try_end_a7
    .catch Ljava/lang/Exception; {:try_start_9b .. :try_end_a7} :catch_a8

    goto :goto_94

    :catch_a8
    move-exception p0

    invoke-static {}, Le/e/a/GestureControls110;->defaults()Lorg/json/JSONObject;

    move-result-object p0

    sput-object p0, Le/e/a/GestureControls110;->cachedMap:Lorg/json/JSONObject;

    goto :goto_94
.end method

.method static name(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 12

    .line 12
    sget-object v0, Le/e/a/GestureControls110;->ACTIONS:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const-string v6, "\u5de6\u306e\u30bf\u30d6\u3078\u79fb\u52d5"

    const-string v7, "\u53f3\u306e\u30bf\u30d6\u3078\u79fb\u52d5"

    const-string v0, "\u73fe\u5728\u306e\u30bf\u30d6\u3092\u9589\u3058\u308b"

    const-string v1, "\u9589\u3058\u305f\u30bf\u30d6\u3092\u5fa9\u5143"

    const-string v2, "\u4e00\u89a7\u3092\u66f4\u65b0"

    const-string v3, "\u4e00\u89a7\u306e\u5148\u982d\u3078"

    const-string v4, "\u8aad\u307f\u8fbc\u307f\u6e08\u307f\u306e\u672b\u5c3e\u3078"

    const-string v5, "\u691c\u7d22"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    const-string v7, "Move to left tab"

    const-string v8, "Move to right tab"

    const-string v1, "Close current tab"

    const-string v2, "Restore closed tab"

    const-string v3, "Refresh list"

    const-string v4, "Go to top"

    const-string v5, "Go to loaded bottom"

    const-string v6, "Search"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v1

    const-string v8, "\u79fb\u81f3\u5de6\u5074\u5206\u9801"

    const-string v9, "\u79fb\u81f3\u53f3\u5074\u5206\u9801"

    const-string v2, "\u95dc\u9589\u76ee\u524d\u5206\u9801"

    const-string v3, "\u5fa9\u539f\u5206\u9801"

    const-string v4, "\u91cd\u65b0\u6574\u7406"

    const-string v5, "\u79fb\u81f3\u9802\u7aef"

    const-string v6, "\u79fb\u81f3\u5df2\u8f09\u5165\u5e95\u7aef"

    const-string v7, "\u641c\u5c0b"

    filled-new-array/range {v2 .. v9}, [Ljava/lang/String;

    move-result-object v2

    if-gez p1, :cond_53

    const-string p1, "Unassigned"

    const-string v0, "\u672a\u6307\u5b9a"

    const-string v1, "\u5272\u308a\u5f53\u3066\u306a\u3057"

    invoke-static {p0, v1, p1, v0}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_5d

    :cond_53
    aget-object v0, v0, p1

    aget-object v1, v1, p1

    aget-object p1, v2, p1

    invoke-static {p0, v0, v1, p1}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_5d
    return-object p0
.end method

.method static perform(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 7

    .line 26
    sget-object v0, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/MultiTabs227$Host;

    if-nez v0, :cond_b

    return-void

    :cond_b
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v1

    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v1

    const-string v2, "close"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31

    if-eqz v1, :cond_31

    sput-object v1, Le/e/a/GestureControls110;->closed:Le/e/a/SavedTabs227$Tab;

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object p0

    iget-object p0, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p0

    sput p0, Le/e/a/GestureControls110;->closedAt:I

    invoke-virtual {v0, v1}, Le/e/a/MultiTabs227$Host;->close(Le/e/a/SavedTabs227$Tab;)V

    return-void

    :cond_31
    const-string v2, "undo"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_82

    sget-object p0, Le/e/a/GestureControls110;->closed:Le/e/a/SavedTabs227$Tab;

    if-eqz p0, :cond_81

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object p0

    sget-object p1, Le/e/a/GestureControls110;->closed:Le/e/a/SavedTabs227$Tab;

    iget-object p1, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object p0

    if-nez p0, :cond_81

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object p0

    iget-object p0, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/16 p1, 0x40

    if-ge p0, p1, :cond_81

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object p0

    iget-object p0, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    sget p1, Le/e/a/GestureControls110;->closedAt:I

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v1

    iget-object v1, v1, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    sget-object v1, Le/e/a/GestureControls110;->closed:Le/e/a/SavedTabs227$Tab;

    invoke-virtual {p0, p1, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-static {}, Le/e/a/MultiTabs227;->save()V

    sget-object p0, Le/e/a/GestureControls110;->closed:Le/e/a/SavedTabs227$Tab;

    iget-object p0, p0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v0, p0}, Le/e/a/MultiTabs227$Host;->select(Ljava/lang/String;)V

    invoke-virtual {v0}, Le/e/a/MultiTabs227$Host;->bar()V

    :cond_81
    return-void

    :cond_82
    const-string v2, "lefttab"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    const-string v4, "righttab"

    if-nez v2, :cond_e9

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_94

    goto :goto_e9

    :cond_94
    const-string v1, "refresh"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a0

    invoke-static {p0}, Le/e/a/TabRecovery244;->refresh(Landroid/app/Activity;)V

    return-void

    :cond_a0
    const-string v1, "search"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ad

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Le/e/a/MultiTabs227$Host;->query(Le/e/a/SavedTabs227$Tab;)V

    return-void

    :cond_ad
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/GestureControls110;->list(Landroid/view/View;)Landroid/widget/ListView;

    move-result-object v0

    if-eqz v0, :cond_e8

    const-string v1, "top"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_c8

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setSelection(I)V

    goto :goto_dc

    :cond_c8
    const-string v1, "bottom"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e8

    invoke-virtual {v0}, Landroid/widget/ListView;->getCount()I

    move-result v1

    sub-int/2addr v1, v3

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    :goto_dc
    invoke-static {p0, p1}, Le/e/a/GestureControls110;->name(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    nop

    :cond_e8
    return-void

    :cond_e9
    :goto_e9
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object p0

    iget-object p0, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p0

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_fa

    goto :goto_fb

    :cond_fa
    const/4 v3, -0x1

    :goto_fb
    add-int/2addr v3, p0

    if-ltz p0, :cond_11d

    if-ltz v3, :cond_11d

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object p0

    iget-object p0, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ge v3, p0, :cond_11d

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object p0

    iget-object p0, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/SavedTabs227$Tab;

    iget-object p0, p0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v0, p0}, Le/e/a/MultiTabs227$Host;->select(Ljava/lang/String;)V

    :cond_11d
    return-void
.end method

.method static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 6
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method static register(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    .line 16
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-static {v0, p1}, Le/e/a/GestureControls110;->name(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Draw a gesture"

    const-string v3, "\u81ea\u884c\u7e6a\u88fd"

    const-string v4, "\u81ea\u5206\u3067\u63cf\u304f"

    invoke-static {v0, v4, v2, v3}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Choose a pattern"

    const-string v4, "\u9078\u64c7\u5f62\u72c0"

    const-string v5, "\u5019\u88dc\u304b\u3089\u9078\u3076"

    invoke-static {v0, v5, v3, v4}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/GestureControls110$$ExternalSyntheticLambda19;

    invoke-direct {v3, p0, p1, p2, v0}, Le/e/a/GestureControls110$$ExternalSyntheticLambda19;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method static reset(Landroid/app/Activity;)V
    .registers 6

    .line 10
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Restore defaults"

    const-string v3, "\u9084\u539f\u9810\u8a2d\u503c"

    const-string v4, "\u521d\u671f\u5024\u306b\u623b\u3059"

    invoke-static {v0, v4, v2, v3}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Reset assignments, sensitivity and display. Keep gestures enabled or disabled as currently set."

    const-string v3, "\u91cd\u8a2d\u624b\u52e2\u3001\u9748\u654f\u5ea6\u8207\u986f\u793a\uff0c\u4fdd\u7559\u555f\u7528\u72c0\u614b\u3002"

    const-string v4, "\u5272\u308a\u5f53\u3066\u30fb\u611f\u5ea6\u30fb\u8868\u793a\u3092\u521d\u671f\u5024\u306b\u623b\u3057\u307e\u3059\u3002\u30b8\u30a7\u30b9\u30c1\u30e3\u30fc\u306e\u6709\u52b9/\u7121\u52b9\u306f\u7dad\u6301\u3057\u307e\u3059\u3002"

    invoke-static {v0, v4, v2, v3}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Le/e/a/GestureControls110$$ExternalSyntheticLambda26;

    invoke-direct {v1, p0}, Le/e/a/GestureControls110$$ExternalSyntheticLambda26;-><init>(Landroid/app/Activity;)V

    const p0, 0x104000a

    invoke-virtual {v0, p0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 7

    move-object v5, p0

    const-string v0, "list_gestures_enabled"

    invoke-virtual {v5, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_a

    return-void

    :cond_a
    const-string v1, "setting_whole"

    invoke-virtual {v5, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    instance-of v2, v2, Landroid/preference/PreferenceGroup;

    if-eqz v2, :cond_1b

    invoke-virtual {v5, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/PreferenceGroup;

    goto :goto_1f

    :cond_1b
    invoke-virtual {v5}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    :goto_1f
    if-nez v1, :cond_22

    return-void

    :cond_22
    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, v5}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v0, "Gestures"

    const-string v3, "\u624b\u52e2"

    const-string v4, "\u30b8\u30a7\u30b9\u30c1\u30e3\u30fc"

    invoke-static {v5, v4, v0, v3}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v0, "Customize gestures on lists"

    const-string v3, "\u81ea\u8a02\u5217\u8868\u624b\u52e2"

    const-string v4, "\u4e00\u89a7\u4e0a\u306e\u64cd\u4f5c\u3068\u30b8\u30a7\u30b9\u30c1\u30e3\u30fc\u3092\u8a2d\u5b9a\u3057\u307e\u3059"

    invoke-static {v5, v4, v0, v3}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/GestureControls110$$ExternalSyntheticLambda24;

    invoke-direct {v0, v5}, Le/e/a/GestureControls110$$ExternalSyntheticLambda24;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    new-instance v2, Landroid/preference/CheckBoxPreference;

    invoke-direct {v2, v5}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    const/16 p0, 0x13

    new-array p0, p0, [C

    fill-array-data p0, :array_c6

    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    const/16 p0, 0x13

    new-array p0, p0, [C

    fill-array-data p0, :array_de

    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([C)V

    const/16 p0, 0x6

    new-array p0, p0, [C

    fill-array-data p0, :array_f6

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p0}, Ljava/lang/String;-><init>([C)V

    const/16 p0, 0xd

    new-array p0, p0, [C

    fill-array-data p0, :array_100

    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, p0}, Ljava/lang/String;-><init>([C)V

    invoke-static {v5, v4, v0, v3}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    const/16 p0, 0x42

    new-array p0, p0, [C

    fill-array-data p0, :array_112

    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([C)V

    const/16 p0, 0x1a

    new-array p0, p0, [C

    fill-array-data p0, :array_158

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p0}, Ljava/lang/String;-><init>([C)V

    const/16 p0, 0x29

    new-array p0, p0, [C

    fill-array-data p0, :array_176

    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, p0}, Ljava/lang/String;-><init>([C)V

    invoke-static {v5, v4, v0, v3}, Le/e/a/GestureControls110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void

    nop

    :array_c6
    .array-data 2
        0x74s
        0x61s
        0x62s
        0x5fs
        0x73s
        0x77s
        0x69s
        0x70s
        0x65s
        0x5fs
        0x61s
        0x6es
        0x69s
        0x6ds
        0x61s
        0x74s
        0x69s
        0x6fs
        0x6es
    .end array-data

    nop

    :array_de
    .array-data 2
        0x54s
        0x61s
        0x62s
        0x20s
        0x73s
        0x77s
        0x69s
        0x70s
        0x65s
        0x20s
        0x61s
        0x6es
        0x69s
        0x6ds
        0x61s
        0x74s
        0x69s
        0x6fs
        0x6es
    .end array-data

    nop

    :array_f6
    .array-data 2
        0x5206s
        -0x67ffs
        0x6ed1s
        0x52d5s
        0x52d5s
        0x756bs
    .end array-data

    :array_100
    .array-data 2
        0x30bfs
        0x30d6s
        0x5207s
        0x308as
        0x66ffs
        0x3048s
        0x30a2s
        0x30cbs
        0x30e1s
        0x30fcs
        0x30b7s
        0x30e7s
        0x30f3s
    .end array-data

    nop

    :array_112
    .array-data 2
        0x4fs
        0x6es
        0x3as
        0x20s
        0x73s
        0x6cs
        0x69s
        0x64s
        0x65s
        0x20s
        0x77s
        0x69s
        0x74s
        0x68s
        0x20s
        0x79s
        0x6fs
        0x75s
        0x72s
        0x20s
        0x66s
        0x69s
        0x6es
        0x67s
        0x65s
        0x72s
        0x2es
        0x20s
        0x4fs
        0x66s
        0x66s
        0x3as
        0x20s
        0x73s
        0x77s
        0x69s
        0x74s
        0x63s
        0x68s
        0x20s
        0x69s
        0x6es
        0x73s
        0x74s
        0x61s
        0x6es
        0x74s
        0x6cs
        0x79s
        0x20s
        0x61s
        0x66s
        0x74s
        0x65s
        0x72s
        0x20s
        0x74s
        0x68s
        0x65s
        0x20s
        0x73s
        0x77s
        0x69s
        0x70s
        0x65s
        0x2es
    .end array-data

    :array_158
    .array-data 2
        -0x6a75s
        0x555fs
        0x6642s
        0x756bs
        -0x689es
        -0x7221s
        -0x6958s
        0x624bs
        0x6307s
        0x6ed1s
        0x52d5s
        -0xf4s
        -0x6a24s
        -0x6a77s
        0x6642s
        0x5728s
        0x6ed1s
        0x52d5s
        0x5b8cs
        0x6210s
        0x5f8cs
        0x7acbs
        0x5373s
        0x5207s
        0x63dbs
        0x3002s
    .end array-data

    :array_176
    .array-data 2
        0x30aas
        0x30f3s
        0x3067s
        0x306fs
        0x6307s
        0x306es
        0x52d5s
        0x304ds
        0x306bs
        0x5408s
        0x308fs
        0x305bs
        0x3066s
        0x30b9s
        0x30e9s
        0x30a4s
        0x30c9s
        0x3057s
        0x3001s
        0x30aas
        0x30d5s
        0x3067s
        0x306fs
        0x30b9s
        0x30efs
        0x30a4s
        0x30d7s
        0x78bas
        0x5b9as
        0x5f8cs
        0x306bs
        0x3059s
        0x3050s
        0x5207s
        0x308as
        0x66ffs
        0x308fs
        0x308as
        0x307es
        0x3059s
        0x3002s
    .end array-data
.end method

.method public static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 14

    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "list_gestures_enabled"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_290

    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v0

    if-nez v0, :cond_15

    goto/16 :goto_290

    :cond_15
    sget-object v0, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/MultiTabs227$Host;

    if-nez v0, :cond_20

    return v2

    :cond_20
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    sget-object v3, Le/e/a/GestureControls110;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v3, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/GestureControls110$State;

    const v4, 0x1020002

    const/4 v5, 0x1

    if-nez v0, :cond_ff

    invoke-static {p0}, Le/e/a/GestureControls110;->clear(Landroid/app/Activity;)V

    new-instance v0, Le/e/a/GestureControls110$State;

    invoke-direct {v0}, Le/e/a/GestureControls110$State;-><init>()V

    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v6, "list_gestures_display"

    invoke-interface {v3, v6, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, v0, Le/e/a/GestureControls110$State;->display:Z

    iget-object v3, v0, Le/e/a/GestureControls110$State;->rules:Le/e/a/GestureRules110;

    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    const-string v7, "gesture_sensitivity"

    const/16 v8, 0x32

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    invoke-static {v6}, Le/e/a/GestureRules110;->threshold(I)F

    move-result v6

    iput v6, v3, Le/e/a/GestureRules110;->distance:F

    iget-object v3, v0, Le/e/a/GestureControls110$State;->rules:Le/e/a/GestureRules110;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    div-float/2addr v6, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v7

    div-float/2addr v7, v1

    invoke-virtual {v3, v6, v7}, Le/e/a/GestureRules110;->down(FF)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/GestureControls110;->list(Landroid/view/View;)Landroid/widget/ListView;

    move-result-object v3

    iput-object v3, v0, Le/e/a/GestureControls110$State;->list:Landroid/widget/ListView;

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iget-object v6, v0, Le/e/a/GestureControls110$State;->list:Landroid/widget/ListView;

    if-eqz v6, :cond_b2

    iget-object v6, v0, Le/e/a/GestureControls110$State;->list:Landroid/widget/ListView;

    invoke-virtual {v6, v3}, Landroid/widget/ListView;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v6

    if-eqz v6, :cond_b2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v7

    float-to-int v7, v7

    invoke-virtual {v3, v6, v7}, Landroid/graphics/Rect;->contains(II)Z

    move-result v3

    if-eqz v3, :cond_b2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v6

    invoke-static {v1, v3, v6}, Le/e/a/GestureControls110;->excluded(Landroid/view/View;FF)Z

    move-result v1

    if-nez v1, :cond_b2

    const/4 v1, 0x1

    goto :goto_b3

    :cond_b2
    const/4 v1, 0x0

    :goto_b3
    iput-boolean v1, v0, Le/e/a/GestureControls110$State;->candidate:Z

    iget-boolean v1, v0, Le/e/a/GestureControls110$State;->candidate:Z

    if-eqz v1, :cond_d7

    iget-object v1, v0, Le/e/a/GestureControls110$State;->list:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v1

    iput v1, v0, Le/e/a/GestureControls110$State;->first:I

    iget-object v1, v0, Le/e/a/GestureControls110$State;->list:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getChildCount()I

    move-result v1

    if-lez v1, :cond_d4

    iget-object v1, v0, Le/e/a/GestureControls110$State;->list:Landroid/widget/ListView;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    goto :goto_d5

    :cond_d4
    const/4 v1, 0x0

    :goto_d5
    iput v1, v0, Le/e/a/GestureControls110$State;->top:I

    :cond_d7
    invoke-virtual {p0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v3, v0, Le/e/a/GestureControls110$State;->origin:[I

    invoke-virtual {v1, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    iget-object v1, v0, Le/e/a/GestureControls110$State;->path:Landroid/graphics/Path;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    iget-object v4, v0, Le/e/a/GestureControls110$State;->origin:[I

    aget v4, v4, v2

    int-to-float v4, v4

    sub-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    iget-object v4, v0, Le/e/a/GestureControls110$State;->origin:[I

    aget v4, v4, v5

    int-to-float v4, v4

    sub-float/2addr p1, v4

    invoke-virtual {v1, v3, p1}, Landroid/graphics/Path;->moveTo(FF)V

    sget-object p1, Le/e/a/GestureControls110;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v2

    :cond_ff
    if-eqz v3, :cond_290

    iget-boolean v6, v3, Le/e/a/GestureControls110$State;->candidate:Z

    if-nez v6, :cond_107

    goto/16 :goto_290

    :cond_107
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v6

    if-gt v6, v5, :cond_285

    const/4 v6, 0x3

    if-ne v0, v6, :cond_112

    goto/16 :goto_285

    :cond_112
    const/4 v7, 0x2

    if-ne v0, v7, :cond_24b

    iget-object v0, v3, Le/e/a/GestureControls110$State;->path:Landroid/graphics/Path;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    iget-object v9, v3, Le/e/a/GestureControls110$State;->origin:[I

    aget v9, v9, v2

    int-to-float v9, v9

    sub-float/2addr v8, v9

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v9

    iget-object v10, v3, Le/e/a/GestureControls110$State;->origin:[I

    aget v10, v10, v5

    int-to-float v10, v10

    sub-float/2addr v9, v10

    invoke-virtual {v0, v8, v9}, Landroid/graphics/Path;->lineTo(FF)V

    iget-boolean v0, v3, Le/e/a/GestureControls110$State;->claimed:Z

    if-nez v0, :cond_151

    iget-object v0, v3, Le/e/a/GestureControls110$State;->rules:Le/e/a/GestureRules110;

    iget-object v0, v0, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_151

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v10

    sub-long/2addr v8, v10

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v0

    int-to-long v10, v0

    cmp-long v0, v8, v10

    if-lez v0, :cond_151

    iput-boolean v2, v3, Le/e/a/GestureControls110$State;->candidate:Z

    return v2

    :cond_151
    iget-object v0, v3, Le/e/a/GestureControls110$State;->rules:Le/e/a/GestureRules110;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    div-float/2addr v8, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v9

    div-float/2addr v9, v1

    invoke-virtual {v0, v8, v9}, Le/e/a/GestureRules110;->move(FF)V

    iget-object v0, v3, Le/e/a/GestureControls110$State;->rules:Le/e/a/GestureRules110;

    iget-object v0, v0, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v7, :cond_1b1

    iget-boolean v0, v3, Le/e/a/GestureControls110$State;->claimed:Z

    if-nez v0, :cond_1b1

    iput-boolean v5, v3, Le/e/a/GestureControls110$State;->claimed:Z

    invoke-static {p0, v3}, Le/e/a/GestureControls110;->discard(Landroid/app/Activity;Le/e/a/GestureControls110$State;)V

    nop

    nop

    nop

    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/view/MotionEvent;->setAction(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v6

    invoke-virtual {v6, v0}, Landroid/view/Window;->superDispatchTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    iget-boolean v0, v3, Le/e/a/GestureControls110$State;->display:Z

    if-eqz v0, :cond_1b1

    new-instance v0, Le/e/a/GestureControls110$Trace;

    invoke-direct {v0, p0}, Le/e/a/GestureControls110$Trace;-><init>(Landroid/content/Context;)V

    iput-object v0, v3, Le/e/a/GestureControls110$State;->trace:Le/e/a/GestureControls110$Trace;

    iget-object v0, v3, Le/e/a/GestureControls110$State;->trace:Le/e/a/GestureControls110$Trace;

    invoke-virtual {v0, v2}, Le/e/a/GestureControls110$Trace;->setClickable(Z)V

    invoke-virtual {p0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v2, v3, Le/e/a/GestureControls110$State;->trace:Le/e/a/GestureControls110$Trace;

    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    const/4 v6, -0x1

    invoke-direct {v4, v6, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1b1
    iget-object v0, v3, Le/e/a/GestureControls110$State;->trace:Le/e/a/GestureControls110$Trace;

    if-eqz v0, :cond_21b

    iget-object v0, v3, Le/e/a/GestureControls110$State;->trace:Le/e/a/GestureControls110$Trace;

    iget-object v0, v0, Le/e/a/GestureControls110$Trace;->path:Landroid/graphics/Path;

    iget-object v2, v3, Le/e/a/GestureControls110$State;->path:Landroid/graphics/Path;

    invoke-virtual {v0, v2}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    iget-object v0, v3, Le/e/a/GestureControls110$State;->trace:Le/e/a/GestureControls110$Trace;

    iget-object v2, v3, Le/e/a/GestureControls110$State;->rules:Le/e/a/GestureRules110;

    iput-object v2, v0, Le/e/a/GestureControls110$Trace;->rules:Le/e/a/GestureRules110;

    iget-object v0, v3, Le/e/a/GestureControls110$State;->rules:Le/e/a/GestureRules110;

    iget-object v0, v0, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    iget-object v2, v3, Le/e/a/GestureControls110$State;->lastPattern:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v2, ""

    if-nez v0, :cond_1f7

    iget-object v0, v3, Le/e/a/GestureControls110$State;->rules:Le/e/a/GestureRules110;

    iget-object v0, v0, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    iput-object v0, v3, Le/e/a/GestureControls110$State;->lastPattern:Ljava/lang/String;

    iget-object v0, v3, Le/e/a/GestureControls110$State;->lastPattern:Ljava/lang/String;

    invoke-static {p0, v0}, Le/e/a/GestureControls110;->action(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v3, Le/e/a/GestureControls110$State;->lastAction:Ljava/lang/String;

    iget-object v0, v3, Le/e/a/GestureControls110$State;->lastAction:Ljava/lang/String;

    if-eqz v0, :cond_1f4

    iget-object v0, v3, Le/e/a/GestureControls110$State;->lastAction:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1ed

    goto :goto_1f4

    :cond_1ed
    iget-object v0, v3, Le/e/a/GestureControls110$State;->lastAction:Ljava/lang/String;

    invoke-static {p0, v0}, Le/e/a/GestureControls110;->name(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1f5

    :cond_1f4
    :goto_1f4
    move-object v0, v2

    :goto_1f5
    iput-object v0, v3, Le/e/a/GestureControls110$State;->lastLabel:Ljava/lang/String;

    :cond_1f7
    iget-object v0, v3, Le/e/a/GestureControls110$State;->trace:Le/e/a/GestureControls110$Trace;

    iget-object v4, v3, Le/e/a/GestureControls110$State;->rules:Le/e/a/GestureRules110;

    iget-boolean v4, v4, Le/e/a/GestureRules110;->invalid:Z

    if-nez v4, :cond_214

    iget-object v4, v3, Le/e/a/GestureControls110$State;->rules:Le/e/a/GestureRules110;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    div-float/2addr v6, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v7

    div-float/2addr v7, v1

    invoke-virtual {v4, v6, v7}, Le/e/a/GestureRules110;->cancelled(FF)Z

    move-result v1

    if-eqz v1, :cond_212

    goto :goto_214

    :cond_212
    iget-object v2, v3, Le/e/a/GestureControls110$State;->lastLabel:Ljava/lang/String;

    :cond_214
    :goto_214
    iput-object v2, v0, Le/e/a/GestureControls110$Trace;->message:Ljava/lang/String;

    iget-object v0, v3, Le/e/a/GestureControls110$State;->trace:Le/e/a/GestureControls110$Trace;

    invoke-virtual {v0}, Le/e/a/GestureControls110$Trace;->invalidate()V

    :cond_21b
    iget-boolean v0, v3, Le/e/a/GestureControls110$State;->claimed:Z

    if-eqz v0, :cond_220

    return v5

    :cond_220
    return v0

    nop

    :goto_222
    invoke-static {p0, v4}, Le/e/a/GestureControls110;->action(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Le/e/a/GestureControls110;->ACTIONS:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_243

    invoke-static {p0}, Le/e/a/TabPager233;->destroy(Landroid/app/Activity;)V

    iget-object v0, v3, Le/e/a/GestureControls110$State;->list:Landroid/widget/ListView;

    iget v6, v3, Le/e/a/GestureControls110$State;->first:I

    iget v7, v3, Le/e/a/GestureControls110$State;->top:I

    invoke-virtual {v0, v6, v7}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    invoke-static {p0, p1}, Le/e/a/GestureControls110;->perform(Landroid/app/Activity;Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0

    :cond_243
    iget-boolean v0, v3, Le/e/a/GestureControls110$State;->claimed:Z

    return v0

    nop

    nop

    nop

    nop

    nop

    :cond_24b
    if-ne v0, v5, :cond_282

    iget-boolean v0, v3, Le/e/a/GestureControls110$State;->claimed:Z

    if-nez v0, :cond_254

    invoke-static {p0, v3}, Le/e/a/GestureControls110;->flush(Landroid/app/Activity;Le/e/a/GestureControls110$State;)V

    :cond_254
    iget-object v4, v3, Le/e/a/GestureControls110$State;->rules:Le/e/a/GestureRules110;

    iget-object v4, v4, Le/e/a/GestureRules110;->pattern:Ljava/lang/String;

    if-eqz v0, :cond_275

    iget-object v6, v3, Le/e/a/GestureControls110$State;->rules:Le/e/a/GestureRules110;

    invoke-virtual {v6}, Le/e/a/GestureRules110;->valid()Z

    move-result v6

    if-eqz v6, :cond_275

    iget-object v8, v3, Le/e/a/GestureControls110$State;->rules:Le/e/a/GestureRules110;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    div-float/2addr v6, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    div-float/2addr p1, v1

    invoke-virtual {v8, v6, p1}, Le/e/a/GestureRules110;->cancelled(FF)Z

    move-result p1

    if-nez p1, :cond_275

    const/4 v2, 0x1

    :cond_275
    invoke-static {p0}, Le/e/a/GestureControls110;->clear(Landroid/app/Activity;)V

    if-eqz v2, :cond_281

    goto/16 :goto_222

    nop

    nop

    nop

    nop

    nop

    :cond_281
    nop

    :cond_282
    iget-boolean p0, v3, Le/e/a/GestureControls110$State;->claimed:Z

    return p0

    :cond_285
    :goto_285
    iget-boolean p1, v3, Le/e/a/GestureControls110$State;->claimed:Z

    if-nez p1, :cond_28c

    invoke-static {p0, v3}, Le/e/a/GestureControls110;->flush(Landroid/app/Activity;Le/e/a/GestureControls110$State;)V

    :cond_28c
    invoke-static {p0}, Le/e/a/GestureControls110;->clear(Landroid/app/Activity;)V

    return p1

    :cond_290
    :goto_290
    return v2
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 6
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
