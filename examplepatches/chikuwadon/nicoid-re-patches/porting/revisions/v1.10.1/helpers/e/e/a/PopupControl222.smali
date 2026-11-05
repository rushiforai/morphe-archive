.class public final Le/e/a/PopupControl222;
.super Ljava/lang/Object;
.source "PopupControl222.java"


# static fields
.field public static final ID:Ljava/lang/String; = "popup_portrait"

.field public static final LABEL:Ljava/lang/String; = "\u901a\u5e38\u518d\u751f"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bind(Le/e/a/PopupControls193;)V
    .registers 6

    .line 16
    iget-object v0, p0, Le/e/a/PopupControls193;->owner:Ljava/lang/Object;

    iget-object v1, p0, Le/e/a/PopupControls193;->root:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "Normal playback"

    const-string v3, "\u4e00\u822c\u64ad\u653e"

    const-string v4, "\u901a\u5e38\u518d\u751f"

    invoke-static {v1, v4, v2, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/PopupControl222$1;

    invoke-direct {v3, v0}, Le/e/a/PopupControl222$1;-><init>(Ljava/lang/Object;)V

    const-string v0, "\u25af"

    invoke-static {v1, v0, v2, v3}, Le/e/a/PlaybackBar221;->button(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PopupReturnIcon223;->apply(Landroid/widget/Button;)V

    const-string v1, "popup-portrait-restore"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p0, p0, Le/e/a/PopupControls193;->buttons:Ljava/util/Map;

    const-string v1, "popup_portrait"

    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static caption(Landroid/widget/TextView;Ljava/lang/String;)V
    .registers 8

    .line 15
    const-string v0, "popup_portrait"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_9

    return-void

    :cond_9
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "Normal playback"

    const-string v1, "\u4e00\u822c\u64ad\u653e"

    const-string v2, "\u901a\u5e38\u518d\u751f"

    invoke-static {p1, v2, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Popup playback only"

    const-string v2, "\u50c5\u9650\u61f8\u6d6e\u64ad\u653e"

    const-string v3, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u6642\u306e\u307f"

    invoke-static {p1, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Landroid/text/SpannableString;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    new-instance v2, Landroid/text/style/RelativeSizeSpan;

    const v3, 0x3f4ccccd    # 0.8f

    invoke-direct {v2, v3}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v1}, Landroid/text/SpannableString;->length()I

    move-result v4

    const/16 v5, 0x21

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "\u3001"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static hidden(Landroid/content/SharedPreferences;)Ljava/util/Set;
    .registers 6
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
    const-string v0, "popup_portrait"

    new-instance v1, Ljava/util/HashSet;

    const-string v2, "player_buttons_hidden_v1"

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 11
    :try_start_11
    new-instance v2, Lorg/json/JSONArray;

    const-string v3, "player_button_order_v1"

    const-string v4, "[]"

    invoke-interface {p0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_1e} :catch_38

    const/4 p0, 0x0

    const/4 v3, 0x0

    :goto_20
    :try_start_20
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt p0, v4, :cond_27

    goto :goto_36

    :cond_27
    invoke-virtual {v2, p0}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_2f} :catch_35

    if-eqz v4, :cond_32

    const/4 v3, 0x1

    :cond_32
    add-int/lit8 p0, p0, 0x1

    goto :goto_20

    :catch_35
    nop

    :goto_36
    if-nez v3, :cond_3b

    .line 12
    :catch_38
    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_3b
    return-object v1
.end method

.method public static ids([Ljava/lang/String;)[Ljava/lang/String;
    .registers 3

    .line 7
    array-length v0, p0

    add-int/lit8 v0, v0, 0x1

    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    array-length p0, p0

    const-string v1, "popup_portrait"

    aput-object v1, v0, p0

    return-object v0
.end method

.method public static labels([Ljava/lang/String;)[Ljava/lang/String;
    .registers 3

    .line 8
    array-length v0, p0

    add-int/lit8 v0, v0, 0x1

    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    array-length p0, p0

    const-string v1, "\u901a\u5e38\u518d\u751f"

    aput-object v1, v0, p0

    return-object v0
.end method

.method public static reset(Ljava/util/Set;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 14
    const-string v0, "popup_portrait"

    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method
