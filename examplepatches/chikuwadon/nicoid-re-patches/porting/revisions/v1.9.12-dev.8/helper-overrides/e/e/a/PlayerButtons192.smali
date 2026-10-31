.class public final Le/e/a/PlayerButtons192;
.super Ljava/lang/Object;
.source "PlayerButtons192.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlayerButtons192$Binding;
    }
.end annotation


# static fields
.field static final BINDINGS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/ref/WeakReference<",
            "Le/e/a/PlayerButtons192$Binding;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final HIDDEN:Ljava/lang/String; = "player_buttons_hidden_v1"

.field static final IDS:[Ljava/lang/String;

.field public static final KEY:Ljava/lang/String; = "player_button_order_v1"

.field static final LABELS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 6
    const-string v6, "fullscreen"

    const-string v7, "repeat"

    const-string v0, "speed"

    const-string v1, "quality"

    const-string v2, "popup"

    const-string v3, "background"

    const-string v4, "mute"

    const-string v5, "comments"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/PlayerButtons192;->IDS:[Ljava/lang/String;

    .line 7
    const-string v7, "\u5168\u753b\u9762\u8868\u793a"

    const-string v8, "\u30ea\u30d4\u30fc\u30c8"

    const-string v1, "\u518d\u751f\u901f\u5ea6"

    const-string v2, "\u753b\u8cea"

    const-string v3, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    const-string v4, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    const-string v5, "\u30df\u30e5\u30fc\u30c8"

    const-string v6, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/PlayerButtons192;->LABELS:[Ljava/lang/String;

    .line 14
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlayerButtons192;->BINDINGS:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Ljava/lang/Object;Landroid/view/View;)V
    .registers 2

    invoke-static {p0, p1}, Le/e/a/PlayerControls194;->apply(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method

.method static background(Ljava/lang/Object;Landroid/view/View;)V
    .locals 0
    invoke-static {p0, p1}, Le/e/a/PopupVisibility246;->background(Ljava/lang/Object;Landroid/view/View;)V
    return-void
.end method

.method static button(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 3

    .line 13
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_80

    :goto_7
    goto/16 :goto_79

    :sswitch_9
    const-string v0, "quality"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_12

    goto :goto_7

    :cond_12
    const-string p1, "modern-quality"

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :sswitch_19
    const-string v0, "speed"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_22

    goto :goto_7

    :cond_22
    const-string p1, "modern-speed"

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :sswitch_29
    const-string v0, "popup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_32

    goto :goto_7

    :cond_32
    const-string p1, "popupbutton"

    invoke-static {p0, p1}, Le/e/a/PlayerVisibility192;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :sswitch_39
    const-string v0, "mute"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_42

    goto :goto_7

    :cond_42
    const-string p1, "player-mute"

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :sswitch_49
    const-string v0, "comments"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_52

    goto :goto_7

    :cond_52
    const-string p1, "commentbutton"

    invoke-static {p0, p1}, Le/e/a/PlayerVisibility192;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :sswitch_59
    const-string v0, "repeat"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_62

    goto :goto_7

    :cond_62
    const-string p1, "repeatbutton"

    invoke-static {p0, p1}, Le/e/a/PlayerVisibility192;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :sswitch_69
    const-string v0, "background"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_72

    goto :goto_7

    :cond_72
    const-string p1, "player-background"

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :goto_79
    const-string p1, "fullscbutton"

    invoke-static {p0, p1}, Le/e/a/PlayerVisibility192;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :sswitch_data_80
    .sparse-switch
        -0x4f67aad2 -> :sswitch_69
        -0x37b3d265 -> :sswitch_59
        -0x23e8220c -> :sswitch_49
        0x335219 -> :sswitch_39
        0x65e70ac -> :sswitch_29
        0x6890047 -> :sswitch_19
        0x26d0c0ff -> :sswitch_9
    .end sparse-switch
.end method

.method static hidden(Landroid/content/SharedPreferences;)Ljava/util/Set;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 9
    new-instance v0, Ljava/util/HashSet;

    const-string v1, "player_buttons_hidden_v1"

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method static host(Landroid/view/View;)Landroid/view/View;
    .registers 2

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/HorizontalScrollView;

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    :cond_e
    return-object p0
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 2

    .line 11
    invoke-static {p0}, Le/e/a/PlayerButtons192;->show(Landroid/app/Activity;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$1(Landroid/widget/LinearLayout;Ljava/util/List;Landroid/content/Context;Ljava/util/Set;Landroid/content/SharedPreferences;[Ljava/lang/Runnable;)V
    .registers 22

    .line 12
    move-object/from16 v9, p2

    move-object/from16 v10, p3

    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_b
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_12

    return-void

    :cond_12
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    new-instance v12, Landroid/widget/LinearLayout;

    invoke-direct {v12, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v12, v3}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/16 v0, 0x10

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    sget-object v0, Le/e/a/PlayerButtons192;->LABELS:[Ljava/lang/String;

    sget-object v1, Le/e/a/PlayerButtons192;->IDS:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v3}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    aget-object v0, v0, v1

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xd

    invoke-static {v9, v0, v1}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0x30

    invoke-static {v9, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    invoke-direct {v2, v7, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v12, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/CheckBox;

    invoke-direct {v2, v9}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    invoke-static {v2}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/CheckBox;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-interface {v10, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    xor-int/2addr v1, v5

    invoke-virtual {v2, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v9, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {v9, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v1, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v12, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda0;

    move-object/from16 v13, p1

    move-object/from16 v14, p4

    invoke-direct {v1, v10, v3, v14, v13}, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda0;-><init>(Ljava/util/Set;Ljava/lang/String;Landroid/content/SharedPreferences;Ljava/util/List;)V

    invoke-virtual {v2, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    const-string v1, "\u2261"

    const/16 v2, 0x18

    invoke-static {v9, v1, v2}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    const/16 v2, 0x11

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\uff1a"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\u4e26\u3073\u66ff\u3048"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v9, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {v9, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v0, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v12, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda1;

    invoke-direct {v0, v3, v12}, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    new-instance v15, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda2;

    move-object v0, v15

    move-object v1, v12

    move-object/from16 v2, p2

    move-object/from16 v4, p1

    move-object/from16 v5, p4

    move-object/from16 v6, p3

    move-object/from16 v7, p0

    move-object/from16 v8, p5

    invoke-direct/range {v0 .. v8}, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda2;-><init>(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/lang/String;Ljava/util/List;Landroid/content/SharedPreferences;Ljava/util/Set;Landroid/widget/LinearLayout;[Ljava/lang/Runnable;)V

    invoke-virtual {v12, v15}, Landroid/widget/LinearLayout;->setOnDragListener(Landroid/view/View$OnDragListener;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_b
.end method

.method static synthetic lambda$2(Ljava/util/Set;Ljava/lang/String;Landroid/content/SharedPreferences;Ljava/util/List;Landroid/widget/CompoundButton;Z)V
    .registers 6

    .line 12
    if-eqz p5, :cond_6

    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_9

    :cond_6
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :goto_9
    invoke-static {p2, p3, p0}, Le/e/a/PlayerButtons192;->save(Landroid/content/SharedPreferences;Ljava/util/List;Ljava/util/Set;)V

    return-void
.end method

.method static synthetic lambda$3(Ljava/lang/String;Landroid/widget/LinearLayout;Landroid/view/View;)Z
    .registers 6

    .line 12
    const-string p2, "player-button"

    invoke-static {p2, p0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    const/4 v2, 0x0

    if-lt v0, v1, :cond_17

    new-instance v0, Landroid/view/View$DragShadowBuilder;

    invoke-direct {v0, p1}, Landroid/view/View$DragShadowBuilder;-><init>(Landroid/view/View;)V

    invoke-virtual {p1, p2, v0, p0, v2}, Landroid/widget/LinearLayout;->startDragAndDrop(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    move-result p0

    goto :goto_20

    :cond_17
    new-instance v0, Landroid/view/View$DragShadowBuilder;

    invoke-direct {v0, p1}, Landroid/view/View$DragShadowBuilder;-><init>(Landroid/view/View;)V

    invoke-virtual {p1, p2, v0, p0, v2}, Landroid/widget/LinearLayout;->startDrag(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    move-result p0

    :goto_20
    return p0
.end method

.method static synthetic lambda$4(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/lang/String;Ljava/util/List;Landroid/content/SharedPreferences;Ljava/util/Set;Landroid/widget/LinearLayout;[Ljava/lang/Runnable;Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 12

    .line 12
    invoke-virtual {p9}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object p8

    instance-of p8, p8, Ljava/lang/String;

    const/4 v0, 0x0

    if-nez p8, :cond_a

    return v0

    :cond_a
    invoke-virtual {p9}, Landroid/view/DragEvent;->getAction()I

    move-result p8

    const/4 v1, 0x5

    if-ne p8, v1, :cond_1f

    invoke-static {p1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p1

    const v1, 0xffffff

    and-int/2addr p1, v1

    const/high16 v1, 0x22000000

    or-int/2addr p1, v1

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    :cond_1f
    const/4 p1, 0x6

    if-eq p8, p1, :cond_25

    const/4 p1, 0x4

    if-ne p8, p1, :cond_28

    :cond_25
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    :cond_28
    const/4 p0, 0x3

    if-ne p8, p0, :cond_57

    invoke-virtual {p9}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_57

    invoke-interface {p3, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_57

    invoke-interface {p3, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    invoke-interface {p3, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-interface {p3, p1, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    invoke-static {p4, p3, p5}, Le/e/a/PlayerButtons192;->save(Landroid/content/SharedPreferences;Ljava/util/List;Ljava/util/Set;)V

    aget-object p0, p7, v0

    invoke-virtual {p6, p0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    :cond_57
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$5(Ljava/util/List;Ljava/util/Set;Landroid/content/SharedPreferences;[Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 5

    .line 12
    invoke-interface {p0}, Ljava/util/List;->clear()V

    sget-object p4, Le/e/a/PlayerButtons192;->IDS:[Ljava/lang/String;

    invoke-static {p4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p4

    invoke-interface {p0, p4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    invoke-static {p2, p0, p1}, Le/e/a/PlayerButtons192;->save(Landroid/content/SharedPreferences;Ljava/util/List;Ljava/util/Set;)V

    const/4 p0, 0x0

    aget-object p0, p3, p0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$6(Ljava/lang/Object;Landroid/view/View;Landroid/view/View;)V
    .registers 3

    .line 15
    invoke-static {p0, p1}, Le/e/a/PlayerButtons192;->background(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$7(Ljava/lang/Object;Landroid/view/View;[FLandroid/view/View;)V
    .registers 10

    .line 15
    :try_start_0
    const-string p3, "a0"

    invoke-static {p0, p3}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    move-result p3
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_a} :catch_5e

    const/4 v0, 0x1

    xor-int/2addr p3, v0

    const/4 v1, 0x0

    if-eqz p3, :cond_2f

    :try_start_f
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "getVolume"

    new-array v4, v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, v1, [Ljava/lang/Object;

    invoke-virtual {v2, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    aput v2, p2, v1
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_29} :catch_2a

    goto :goto_2f

    :catch_2a
    move-exception v2

    const/high16 v2, 0x3f800000    # 1.0f

    :try_start_2d
    aput v2, p2, v1

    :cond_2f
    :goto_2f
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "setVolume"

    new-array v4, v0, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v1

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v0, v0, [Ljava/lang/Object;

    if-eqz p3, :cond_45

    const/4 p2, 0x0

    goto :goto_47

    :cond_45
    aget p2, p2, v1

    :goto_47
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    aput-object p2, v0, v1

    invoke-virtual {v2, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1, p3}, Landroid/view/View;->setSelected(Z)V

    if-eqz p3, :cond_58

    const-string p0, "muted"

    goto :goto_5a

    :cond_58
    const-string p0, "volume"

    :goto_5a
    invoke-static {p1, p0}, Le/e/a/PlayerIcons;->symbol(Landroid/view/View;Ljava/lang/String;)V
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_5d} :catch_5e

    goto :goto_66

    :catch_5e
    move-exception p0

    const-string p1, "nicoid-player"

    const-string p2, "Unable to change mute"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_66
    return-void
.end method

.method static order(Landroid/content/SharedPreferences;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :try_start_6
    new-instance v2, Lorg/json/JSONArray;

    const-string v3, "player_button_order_v1"

    const-string v4, "[]"

    invoke-interface {p0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x0

    :goto_14
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt p0, v3, :cond_1b

    goto :goto_38

    :cond_1b
    invoke-virtual {v2, p0}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Le/e/a/PlayerButtons192;->IDS:[Ljava/lang/String;

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_34

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_34

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_34} :catch_37

    :cond_34
    add-int/lit8 p0, p0, 0x1

    goto :goto_14

    :catch_37
    move-exception p0

    :goto_38
    sget-object p0, Le/e/a/PlayerButtons192;->IDS:[Ljava/lang/String;

    array-length v2, p0

    :goto_3b
    if-lt v1, v2, :cond_3e

    return-object v0

    :cond_3e
    aget-object v3, p0, v1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_49

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_49
    add-int/lit8 v1, v1, 0x1

    goto :goto_3b
.end method

.method static save(Landroid/content/SharedPreferences;Ljava/util/List;Ljava/util/Set;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 10
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p1}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "player_button_order_v1"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    const-string p2, "player_buttons_hidden_v1"

    invoke-interface {p0, p2, p1}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static settings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 4

    .line 11
    const-string v0, "player_button_customization"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_9

    return-void

    :cond_9
    new-instance v1, Landroid/preference/Preference;

    invoke-direct {v1, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v0, "\u64cd\u4f5c\u30dc\u30bf\u30f3\u306e\u30ab\u30b9\u30bf\u30de\u30a4\u30ba"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    invoke-static {v1, v0}, Le/e/a/Revision196;->summary(Landroid/preference/Preference;Z)V

    new-instance v0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0}, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda7;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    invoke-static {p0, p1}, Le/e/a/Revision196;->popupInfoSettings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V

    return-void
.end method

.method static show(Landroid/app/Activity;)V
    .registers 1

    invoke-static {p0}, Le/e/a/PlayerButtons193;->show(Landroid/app/Activity;)V

    return-void
.end method

.method static wrap(Landroid/widget/LinearLayout;)Landroid/widget/HorizontalScrollView;
    .registers 8

    .line 17
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/HorizontalScrollView;

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/widget/HorizontalScrollView;

    return-object p0

    :cond_f
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/HorizontalScrollView;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    const-string v4, "player-buttons-strip"

    invoke-virtual {v3, v4}, Landroid/widget/HorizontalScrollView;->setTag(Ljava/lang/Object;)V

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Landroid/widget/HorizontalScrollView;->setOverScrollMode(I)V

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    const/16 v6, 0x30

    invoke-static {v5, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    const/4 v6, -0x2

    invoke-direct {v4, v6, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, p0, v4}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0, v3, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-object v3
.end method
