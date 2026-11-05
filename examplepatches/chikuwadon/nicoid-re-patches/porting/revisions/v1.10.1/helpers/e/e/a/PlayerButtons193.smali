.class public final Le/e/a/PlayerButtons193;
.super Ljava/lang/Object;
.source "PlayerButtons193.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlayerButtons193$Binding;
    }
.end annotation


# static fields
.field static final BINDINGS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/ref/WeakReference<",
            "Le/e/a/PlayerButtons193$Binding;",
            ">;>;"
        }
    .end annotation
.end field

.field static final HIDDEN:Ljava/lang/String; = "player_buttons_hidden_v1"

.field static final IDS:[Ljava/lang/String;

.field static final KEY:Ljava/lang/String; = "player_button_order_v1"

.field static final LABELS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 6
    const-string v6, "comments"

    const-string v7, "fullscreen"

    const-string v0, "speed"

    const-string v1, "quality"

    const-string v2, "popup"

    const-string v3, "background"

    const-string v4, "mute"

    const-string v5, "repeat"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/PlayerButtons193;->IDS:[Ljava/lang/String;

    .line 7
    const-string v7, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a"

    const-string v8, "\u5168\u753b\u9762\u8868\u793a"

    const-string v1, "\u518d\u751f\u901f\u5ea6"

    const-string v2, "\u753b\u8cea"

    const-string v3, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    const-string v4, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    const-string v5, "\u30df\u30e5\u30fc\u30c8"

    const-string v6, "\u30ea\u30d4\u30fc\u30c8"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/PlayerButtons193;->LABELS:[Ljava/lang/String;

    .line 8
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlayerButtons193;->BINDINGS:Ljava/util/Map;

    sget-object v0, Le/e/a/PlayerButtons193;->IDS:[Ljava/lang/String;

    invoke-static {v0}, Le/e/a/PopupControl222;->ids([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/PlayerButtons193;->IDS:[Ljava/lang/String;

    sget-object v0, Le/e/a/PlayerButtons193;->LABELS:[Ljava/lang/String;

    invoke-static {v0}, Le/e/a/PopupControl222;->labels([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/PlayerButtons193;->LABELS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static action(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;
    .registers 5

    .line 30
    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0xd

    invoke-static {p0, p1, v0}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    const/16 v0, 0x11

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setSingleLine(Z)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-static {p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v1, 0x8

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {p1, v1, v0, v1, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    const/16 v0, 0x30

    invoke-static {p0, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setMinimumWidth(I)V

    new-instance p0, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda0;

    invoke-direct {p0, p2}, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1
.end method

.method public static apply(Ljava/lang/Object;Landroid/view/View;)V
    .registers 7

    .line 33
    const-string v0, "topmenulay"

    invoke-static {p1, v0}, Le/e/a/PlayerButtons193;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/LinearLayout;

    if-nez v1, :cond_b

    return-void

    :cond_b
    check-cast v0, Landroid/widget/LinearLayout;

    .line 34
    const-string v1, "background"

    invoke-static {p1, v1}, Le/e/a/PlayerButtons193;->button(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_3c

    new-instance v1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const-string v2, "player-background"

    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    const-string v2, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    const-string v2, "headphones"

    invoke-static {v1, v2}, Le/e/a/PlayerIcons;->symbol(Landroid/view/View;Ljava/lang/String;)V

    new-instance v2, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda7;

    invoke-direct {v2, p0, p1}, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda7;-><init>(Ljava/lang/Object;Landroid/view/View;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 35
    :cond_3c
    const-string v1, "mute"

    invoke-static {p1, v1}, Le/e/a/PlayerButtons193;->button(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_73

    new-instance v1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const-string v2, "player-mute"

    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    const-string v2, "\u30df\u30e5\u30fc\u30c8"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    const-string v2, "volume"

    invoke-static {v1, v2}, Le/e/a/PlayerIcons;->symbol(Landroid/view/View;Ljava/lang/String;)V

    const/4 v2, 0x1

    new-array v2, v2, [F

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    aput v3, v2, v4

    new-instance v3, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda8;

    invoke-direct {v3, p0, v1, v2}, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda8;-><init>(Ljava/lang/Object;Landroid/view/View;[F)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 36
    :cond_73
    sget-object p0, Le/e/a/PlayerButtons193;->BINDINGS:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/ref/WeakReference;

    if-nez p0, :cond_7f

    const/4 p0, 0x0

    goto :goto_85

    :cond_7f
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PlayerButtons193$Binding;

    :goto_85
    if-nez p0, :cond_9e

    new-instance p0, Le/e/a/PlayerButtons193$Binding;

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerButtons193$Binding;-><init>(Landroid/view/View;Landroid/widget/LinearLayout;)V

    sget-object v0, Le/e/a/PlayerButtons193;->BINDINGS:Ljava/util/Map;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-object p1, p0, Le/e/a/PlayerButtons193$Binding;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p1, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    :cond_9e
    invoke-virtual {p0}, Le/e/a/PlayerButtons193$Binding;->update()V

    .line 37
    return-void
.end method

.method static button(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 4

    .line 32
    const-string v0, "speed"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_64

    const-string v0, "quality"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_64

    :cond_11
    const-string v0, "background"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_50

    const-string v0, "mute"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    goto :goto_50

    :cond_22
    const-string v0, "fullscreen"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2d

    const-string p1, "fullscbutton"

    goto :goto_4b

    :cond_2d
    const-string v0, "comments"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    const-string p1, "commentbutton"

    goto :goto_4b

    :cond_38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, "button"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_4b
    invoke-static {p0, p1}, Le/e/a/PlayerButtons193;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_50
    :goto_50
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "player-"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_64
    :goto_64
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "modern-"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 2

    .line 31
    invoke-static {p0, p1}, Le/e/a/PlayerVisibility192;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static hidden(Landroid/content/SharedPreferences;)Ljava/util/Set;
    .registers 2

    invoke-static {p0}, Le/e/a/PopupControl222;->hidden(Landroid/content/SharedPreferences;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$0(Landroid/widget/LinearLayout;Ljava/util/List;Landroid/content/Context;Ljava/util/Set;[Ljava/lang/Runnable;)V
    .registers 15

    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_e

    .line 24
    return-void

    .line 19
    :cond_e
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Ljava/lang/String;

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-static {v1}, Le/e/a/Spacing195;->row(Landroid/view/View;)V

    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 20
    sget-object v3, Le/e/a/PlayerButtons193;->LABELS:[Ljava/lang/String;

    sget-object v4, Le/e/a/PlayerButtons193;->IDS:[Ljava/lang/String;

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v6}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v4

    aget-object v3, v3, v4

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xd

    invoke-static {p2, v3, v4}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x30

    invoke-static {p2, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    invoke-direct {v2, v9, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {v3, v6}, Le/e/a/PopupControl222;->caption(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 21
    new-instance v2, Landroid/widget/CheckBox;

    invoke-direct {v2, p2}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    invoke-static {v2}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/widget/CheckBox;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-interface {p3, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    xor-int/2addr v4, v7

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    new-instance v4, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda4;

    invoke-direct {v4, p3, v6}, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda4;-><init>(Ljava/util/Set;Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {p2, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {p2, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {v4, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    new-instance v4, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda5;

    invoke-direct {v4, v6, v1}, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda5;-><init>(Ljava/lang/String;Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 23
    new-instance v9, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda6;

    move-object v2, v9

    move-object v3, v1

    move-object v4, p2

    move-object v5, p1

    move-object v7, p0

    move-object v8, p4

    invoke-direct/range {v2 .. v8}, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda6;-><init>(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Landroid/widget/LinearLayout;[Ljava/lang/Runnable;)V

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->setOnDragListener(Landroid/view/View$OnDragListener;)V

    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_7
.end method

.method static synthetic lambda$1(Ljava/util/Set;Ljava/lang/String;Landroid/widget/CompoundButton;Z)V
    .registers 4

    .line 21
    if-eqz p3, :cond_6

    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_9

    :cond_6
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :goto_9
    return-void
.end method

.method static synthetic lambda$2(Ljava/lang/String;Landroid/widget/LinearLayout;Landroid/view/View;)Z
    .registers 7

    .line 22
    const-string p2, "player-button"

    invoke-static {p2, p0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p2

    new-instance v0, Landroid/view/View$DragShadowBuilder;

    invoke-direct {v0, p1}, Landroid/view/View$DragShadowBuilder;-><init>(Landroid/view/View;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    const/4 v3, 0x0

    if-lt v1, v2, :cond_17

    invoke-virtual {p1, p2, v0, p0, v3}, Landroid/widget/LinearLayout;->startDragAndDrop(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    move-result p0

    goto :goto_1b

    :cond_17
    invoke-virtual {p1, p2, v0, p0, v3}, Landroid/widget/LinearLayout;->startDrag(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    move-result p0

    :goto_1b
    return p0
.end method

.method static synthetic lambda$3(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Landroid/widget/LinearLayout;[Ljava/lang/Runnable;Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 10

    .line 23
    invoke-virtual {p7}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object p6

    instance-of p6, p6, Ljava/lang/String;

    const/4 v0, 0x0

    if-nez p6, :cond_a

    return v0

    :cond_a
    invoke-virtual {p7}, Landroid/view/DragEvent;->getAction()I

    move-result p6

    const/4 v1, 0x5

    if-ne p6, v1, :cond_1f

    invoke-static {p1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p1

    const v1, 0xffffff

    and-int/2addr p1, v1

    const/high16 v1, 0x22000000

    or-int/2addr p1, v1

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    :cond_1f
    const/4 p1, 0x6

    if-eq p6, p1, :cond_25

    const/4 p1, 0x4

    if-ne p6, p1, :cond_28

    :cond_25
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    :cond_28
    const/4 p0, 0x3

    if-ne p6, p0, :cond_54

    invoke-virtual {p7}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-interface {p2, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_54

    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_54

    invoke-interface {p2, p3}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    invoke-interface {p2, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p3

    invoke-static {p1, p3}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-interface {p2, p1, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    aget-object p0, p5, v0

    invoke-virtual {p4, p0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    :cond_54
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$4(Ljava/util/List;Ljava/util/Set;[Ljava/lang/Runnable;)V
    .registers 4

    .line 26
    invoke-interface {p0}, Ljava/util/List;->clear()V

    sget-object v0, Le/e/a/PlayerButtons193;->IDS:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    invoke-static {p1}, Le/e/a/PopupControl222;->reset(Ljava/util/Set;)V

    const/4 p0, 0x0

    aget-object p0, p2, p0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$6(Landroid/content/SharedPreferences;Ljava/util/List;Ljava/util/Set;Landroid/app/Dialog;)V
    .registers 4

    .line 28
    invoke-static {p0, p1, p2}, Le/e/a/PlayerButtons193;->save(Landroid/content/SharedPreferences;Ljava/util/List;Ljava/util/Set;)V

    invoke-virtual {p3}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method static synthetic lambda$7(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 30
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$8(Ljava/lang/Object;Landroid/view/View;Landroid/view/View;)V
    .registers 3

    .line 34
    invoke-static {p0, p1}, Le/e/a/PlayerButtons192;->background(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$9(Ljava/lang/Object;Landroid/view/View;[FLandroid/view/View;)V
    .registers 10

    .line 35
    :try_start_0
    const-string p3, "a0"

    invoke-static {p0, p3}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    move-result p3
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_a} :catch_5a

    const/4 v0, 0x1

    xor-int/2addr p3, v0

    const/4 v1, 0x0

    if-eqz p3, :cond_2b

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

    goto :goto_2b

    :catch_2a
    move-exception v2

    :cond_2b
    :goto_2b
    :try_start_2b
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "setVolume"

    new-array v4, v0, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v1

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v0, v0, [Ljava/lang/Object;

    if-eqz p3, :cond_41

    const/4 p2, 0x0

    goto :goto_43

    :cond_41
    aget p2, p2, v1

    :goto_43
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    aput-object p2, v0, v1

    invoke-virtual {v2, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1, p3}, Landroid/view/View;->setSelected(Z)V

    if-eqz p3, :cond_54

    const-string p0, "muted"

    goto :goto_56

    :cond_54
    const-string p0, "volume"

    :goto_56
    invoke-static {p1, p0}, Le/e/a/PlayerIcons;->symbol(Landroid/view/View;Ljava/lang/String;)V
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_59} :catch_5a

    goto :goto_62

    :catch_5a
    move-exception p0

    const-string p1, "nicoid-player"

    const-string p2, "Mute failed"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_62
    return-void
.end method

.method static order(Landroid/content/SharedPreferences;)Ljava/util/List;
    .registers 11
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

    .line 9
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

    sget-object v4, Le/e/a/PlayerButtons193;->IDS:[Ljava/lang/String;

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_34

    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_34

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_34} :catch_37

    :cond_34
    add-int/lit8 p0, p0, 0x1

    goto :goto_14

    :catch_37
    move-exception p0

    .line 10
    :goto_38
    const-string v8, "fullscreen"

    const-string v9, "repeat"

    const-string v2, "speed"

    const-string v3, "quality"

    const-string v4, "popup"

    const-string v5, "background"

    const-string v6, "mute"

    const-string v7, "comments"

    filled-new-array/range {v2 .. v9}, [Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_59

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 11
    :cond_59
    sget-object p0, Le/e/a/PlayerButtons193;->IDS:[Ljava/lang/String;

    array-length v2, p0

    :goto_5c
    if-lt v1, v2, :cond_5f

    return-object v0

    :cond_5f
    aget-object v3, p0, v1

    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6a

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6a
    add-int/lit8 v1, v1, 0x1

    goto :goto_5c
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

    .line 14
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

.method public static show(Landroid/app/Activity;)V
    .registers 18

    .line 16
    invoke-static/range {p0 .. p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiTheme191;->context(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static/range {p0 .. p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 17
    invoke-static {v7}, Le/e/a/PlayerButtons193;->order(Landroid/content/SharedPreferences;)Ljava/util/List;

    move-result-object v8

    invoke-static {v7}, Le/e/a/PlayerButtons193;->hidden(Landroid/content/SharedPreferences;)Ljava/util/Set;

    move-result-object v9

    new-instance v10, Landroid/app/Dialog;

    invoke-direct {v10, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const-string v1, "\u64cd\u4f5c\u30dc\u30bf\u30f3\u306e\u30ab\u30b9\u30bf\u30de\u30a4\u30ba"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 18
    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v11

    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x1

    const/4 v13, 0x0

    const/high16 v14, 0x3f800000    # 1.0f

    invoke-direct {v3, v12, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v11, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    const/4 v15, 0x1

    new-array v6, v15, [Ljava/lang/Runnable;

    new-instance v16, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda1;

    move-object/from16 v1, v16

    move-object v3, v8

    move-object v4, v0

    move-object v5, v9

    move-object/from16 p0, v6

    invoke-direct/range {v1 .. v6}, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda1;-><init>(Landroid/widget/LinearLayout;Ljava/util/List;Landroid/content/Context;Ljava/util/Set;[Ljava/lang/Runnable;)V

    move-object/from16 v1, p0

    aput-object v16, v1, v13

    .line 24
    aget-object v2, v1, v13

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 25
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-static {v0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v2, v3, v13, v3, v13}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 26
    new-instance v3, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda2;

    invoke-direct {v3, v8, v9, v1}, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda2;-><init>(Ljava/util/List;Ljava/util/Set;[Ljava/lang/Runnable;)V

    const-string v1, "\u521d\u671f\u72b6\u614b\u306b\u623b\u3059"

    invoke-static {v0, v1, v3}, Le/e/a/PlayerButtons193;->action(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v1

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0x30

    invoke-static {v0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    const/4 v6, -0x2

    invoke-direct {v3, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    new-instance v1, Landroid/view/View;

    invoke-direct {v1, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v13, v15, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda1;

    invoke-direct {v1, v10}, Le/e/a/CommentSettings193$Editor$$ExternalSyntheticLambda1;-><init>(Landroid/app/Dialog;)V

    const-string v3, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v0, v3, v1}, Le/e/a/PlayerButtons193;->action(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v1

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {v3, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    new-instance v1, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda3;

    invoke-direct {v1, v7, v8, v9, v10}, Le/e/a/PlayerButtons193$$ExternalSyntheticLambda3;-><init>(Landroid/content/SharedPreferences;Ljava/util/List;Ljava/util/Set;Landroid/app/Dialog;)V

    const-string v3, "OK"

    invoke-static {v0, v3, v1}, Le/e/a/PlayerButtons193;->action(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v1

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v3, v6, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v11, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v10, v11}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    invoke-static {v11}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    invoke-virtual {v10}, Landroid/app/Dialog;->show()V

    invoke-virtual {v10}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v1, :cond_ec

    invoke-virtual {v10}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x1e0

    invoke-static {v0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-virtual {v1, v12, v0}, Landroid/view/Window;->setLayout(II)V

    .line 29
    :cond_ec
    invoke-static {v10}, Le/e/a/Spacing195;->window(Landroid/app/Dialog;)V

    return-void
.end method
