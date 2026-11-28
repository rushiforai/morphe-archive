.class final Le/e/a/GestureAxisOptions;
.super Ljava/lang/Object;
.source "GestureAxisOptions.java"


# static fields
.field private static final HORIZONTAL:Ljava/lang/String; = "gesture_horizontal_reversal_enabled"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addOption(Landroid/widget/LinearLayout;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .registers 10

    .line 48
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 49
    invoke-static {v0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 50
    invoke-static {v0}, Le/e/a/NicoliveUi;->row(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    .line 51
    new-instance v3, Landroid/widget/CheckBox;

    invoke-direct {v3, v0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 52
    invoke-virtual {v3, p3}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 53
    invoke-interface {v1, p1, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    invoke-virtual {v3, p2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 54
    new-instance p2, Le/e/a/GestureAxisOptions$0;

    invoke-direct {p2, v1, p1}, Le/e/a/GestureAxisOptions$0;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    invoke-virtual {v3, p2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 56
    invoke-static {v3}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    .line 57
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, -0x2

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    invoke-direct {p1, v4, p2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v3, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p2, "\u306e\u8aac\u660e"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "About "

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "\u7684\u8aaa\u660e"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 59
    invoke-static {v0, p1, p2, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "note"

    invoke-static {v0, p2, p1}, Le/e/a/NicoliveUi;->icon(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/ImageButton;

    move-result-object p1

    .line 61
    new-instance p2, Le/e/a/GestureAxisOptions$1;

    invoke-direct {p2, v0, p3, p4}, Le/e/a/GestureAxisOptions$1;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/16 p2, 0x2c

    .line 64
    invoke-static {v0, p2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p2

    .line 65
    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p3, p2, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, p1, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method static allowHorizontalClaim(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 6

    const/4 v0, 0x1

    if-eqz p1, :cond_2

    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_2

    const/4 v1, 0x0

    .line 16
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 20
    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string p1, "gesture_horizontal_reversal_enabled"

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0

    .line 17
    :cond_0
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x4c

    if-eq v2, v3, :cond_1

    const/16 v3, 0x52

    if-eq v2, v3, :cond_1

    return v0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method static install(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 6

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 28
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-nez p0, :cond_0

    .line 29
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    .line 32
    const-string v0, "Recognize vertical-only gestures"

    const-string/jumbo v1, "\u8fa8\u8b58\u50c5\u4e0a\u4e0b\u65b9\u5411\u7684\u624b\u52e2"

    .line 31
    const-string v2, "\u4e0a\u4e0b\u65b9\u5411\u306e\u307f\u306e\u30b8\u30a7\u30b9\u30c1\u30e3\u30fc\u3092\u8a8d\u8b58"

    invoke-static {p0, v2, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 35
    const-string v1, "When off, vertical-only movements such as \u2191\u2193 allow scrolling to continue"

    .line 36
    const-string/jumbo v2, "\u95dc\u9589\u5f8c\uff0c\u2191\u2193 \u7b49\u50c5\u4e0a\u4e0b\u7684\u52d5\u4f5c\u6703\u7e7c\u7e8c\u6372\u52d5"

    .line 33
    const-string v3, "OFF\u306b\u3059\u308b\u3068\u3001\u2191\u2193\u306a\u3069\u306e\u4e0a\u4e0b\u3060\u3051\u306e\u52d5\u304d\u3067\u306f\u30b8\u30a7\u30b9\u30c1\u30e3\u30fc\u304c\u767a\u52d5\u305b\u305a\u3001\u30b9\u30af\u30ed\u30fc\u30eb\u3092\u7d9a\u3051\u3089\u308c\u307e\u3059"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 30
    const-string v2, "gesture_vertical_reversal_enabled"

    const/4 v3, 0x0

    invoke-static {p1, v2, v3, v0, v1}, Le/e/a/GestureAxisOptions;->addOption(Landroid/widget/LinearLayout;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 39
    const-string v0, "Recognize horizontal-only gestures"

    const-string/jumbo v1, "\u8fa8\u8b58\u50c5\u5de6\u53f3\u65b9\u5411\u7684\u624b\u52e2"

    .line 38
    const-string v2, "\u5de6\u53f3\u65b9\u5411\u306e\u307f\u306e\u30b8\u30a7\u30b9\u30c1\u30e3\u30fc\u3092\u8a8d\u8b58"

    invoke-static {p0, v2, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 42
    const-string v1, "When off, horizontal-only movements such as \u2190\u2192 allow normal horizontal swipes to continue"

    .line 43
    const-string/jumbo v2, "\u95dc\u9589\u5f8c\uff0c\u2190\u2192 \u7b49\u50c5\u5de6\u53f3\u7684\u52d5\u4f5c\u6703\u7e7c\u7e8c\u4e00\u822c\u7684\u6a6b\u5411\u6ed1\u52d5"

    .line 40
    const-string v3, "OFF\u306b\u3059\u308b\u3068\u3001\u2190\u2192\u306a\u3069\u306e\u5de6\u53f3\u3060\u3051\u306e\u52d5\u304d\u3067\u306f\u30b8\u30a7\u30b9\u30c1\u30e3\u30fc\u304c\u767a\u52d5\u305b\u305a\u3001\u901a\u5e38\u306e\u6a2a\u30b9\u30ef\u30a4\u30d7\u64cd\u4f5c\u3092\u7d9a\u3051\u3089\u308c\u307e\u3059"

    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 37
    const-string v1, "gesture_horizontal_reversal_enabled"

    const/4 v2, 0x1

    invoke-static {p1, v1, v2, v0, p0}, Le/e/a/GestureAxisOptions;->addOption(Landroid/widget/LinearLayout;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$0(Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/widget/CompoundButton;Z)V
    .registers 4

    .line 55
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, p1, p3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static synthetic lambda$1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .registers 4

    .line 61
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 62
    invoke-virtual {p0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const p1, 0x104000a

    const/4 p2, 0x0

    .line 63
    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 61
    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method static reset(Landroid/content/Context;)V
    .registers 2

    .line 24
    invoke-static {p0}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "gesture_vertical_reversal_enabled"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "gesture_horizontal_reversal_enabled"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
