.class public final Le/e/a/MenuOptions119;
.super Ljava/lang/Object;
.source "MenuOptions119.java"


# static fields
.field static final APPEND:I = 0x46dd

.field static final LABELS:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final NEXT:I = 0x46dc

.field static final QUEUE:I = 0x46de


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 6
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    .line 7
    sget-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u52d5\u753b\u518d\u751f"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u52d5\u753b\u60c5\u5831"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u30de\u30a4\u30ea\u30b9\u30c8\u306b\u8ffd\u52a0"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    const/16 v1, 0x46e0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u30de\u30a4\u30ea\u30b9\u30c8\u304b\u3089\u524a\u9664"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    const/16 v1, 0x46dc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u6b21\u306b\u518d\u751f"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    const/16 v1, 0x46dd

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u30ad\u30e5\u30fc\u306b\u8ffd\u52a0"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    const/16 v1, 0x46d2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "MP4\u3067\u4fdd\u5b58"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    const/16 v1, 0x46b6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u306b\u8ffd\u52a0"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    const/16 v1, 0x46b5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u6295\u7a3f\u8005\u3092NG"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    const/16 v1, 0x46b7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u518d\u53d6\u5f97"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    const/16 v1, 0x46b8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "\u5c65\u6b74\u30fb\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static canonical(Landroid/view/Menu;Ljava/util/List;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/Menu;",
            "Ljava/util/List<",
            "Le/e/a/ListActions$Action;",
            ">;)V"
        }
    .end annotation

    .line 10
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-lt v1, v2, :cond_9

    return-void

    :cond_9
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/ListActions$Action;

    iget v3, v2, Le/e/a/ListActions$Action;->id:I

    const/16 v4, 0x9

    if-eq v3, v4, :cond_16

    :cond_15
    :goto_15
    goto :goto_46

    :cond_16
    :try_start_16
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "order119"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v3

    const/4 v4, 0x5

    if-ne v3, v4, :cond_15

    iget-object v3, v2, Le/e/a/ListActions$Action;->title:Ljava/lang/String;

    const/16 v5, 0x46e0

    invoke-interface {p0, v0, v5, v4, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v3

    iget-boolean v4, v2, Le/e/a/ListActions$Action;->enabled:Z

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v3

    new-instance v4, Le/e/a/ListActions$Action;

    iget-object v2, v2, Le/e/a/ListActions$Action;->run:Ljava/lang/Runnable;

    invoke-direct {v4, v3, v2}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    invoke-interface {p1, v1, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_43} :catch_44

    goto :goto_15

    :catch_44
    move-exception v2

    goto :goto_15

    :goto_46
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method static finish(Landroid/view/Menu;Ljava/util/List;Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/Menu;",
            "Ljava/util/List<",
            "Le/e/a/ListActions$Action;",
            ">;",
            "Landroid/app/Activity;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 12
    new-instance v0, Le/e/a/MenuOptions119$$ExternalSyntheticLambda15;

    invoke-direct {v0}, Le/e/a/MenuOptions119$$ExternalSyntheticLambda15;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->removeIf(Ljava/util/function/Predicate;)Z

    const/16 v0, 0x46dc

    const/16 v1, 0x46dd

    filled-new-array {v0, v1}, [I

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_12
    const/4 v3, 0x2

    if-lt v2, v3, :cond_5c

    .line 13
    invoke-static {p1, p2}, Le/e/a/MenuEditor120;->sort(Ljava/util/List;Landroid/content/Context;)V

    invoke-interface {p0}, Landroid/view/Menu;->clear()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 p1, 0x0

    :goto_20
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-nez p3, :cond_27

    .line 14
    return-void

    .line 13
    :cond_27
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Le/e/a/ListActions$Action;

    invoke-static {p2}, Le/e/a/MenuOptions119;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iget v2, p3, Le/e/a/ListActions$Action;->id:I

    invoke-static {v2}, Le/e/a/MenuOptions119;->key(I)Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x1

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_42

    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_20

    :cond_42
    iget v0, p3, Le/e/a/ListActions$Action;->id:I

    add-int/lit8 v2, p1, 0x1

    iget-object v4, p3, Le/e/a/ListActions$Action;->title:Ljava/lang/String;

    invoke-interface {p0, v1, v0, p1, v4}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    iget-boolean v0, p3, Le/e/a/ListActions$Action;->enabled:Z

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object p1

    new-instance v0, Le/e/a/MenuOptions119$$ExternalSyntheticLambda17;

    invoke-direct {v0, p3}, Le/e/a/MenuOptions119$$ExternalSyntheticLambda17;-><init>(Le/e/a/ListActions$Action;)V

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    move p1, v2

    goto :goto_20

    .line 12
    :cond_5c
    aget v3, v0, v2

    sget-object v4, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p0, v1, v3, v1, v4}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v4

    new-instance v5, Le/e/a/MenuOptions119$$ExternalSyntheticLambda16;

    invoke-direct {v5, p2, p3, v3}, Le/e/a/MenuOptions119$$ExternalSyntheticLambda16;-><init>(Landroid/app/Activity;Ljava/lang/Object;I)V

    new-instance v3, Le/e/a/ListActions$Action;

    invoke-direct {v3, v4, v5}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_12
.end method

.method static key(I)Ljava/lang/String;
    .registers 3

    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "video_menu_visible_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Le/e/a/ListActions$Action;)Z
    .registers 3

    .line 12
    iget v0, p0, Le/e/a/ListActions$Action;->id:I

    const/16 v1, 0x46dc

    if-eq v0, v1, :cond_e

    iget p0, p0, Le/e/a/ListActions$Action;->id:I

    const/16 v0, 0x46dd

    if-eq p0, v0, :cond_e

    const/4 p0, 0x0

    goto :goto_f

    :cond_e
    const/4 p0, 0x1

    :goto_f
    return p0
.end method

.method static synthetic lambda$1(Landroid/app/Activity;Ljava/lang/Object;I)V
    .registers 4

    .line 12
    const/16 v0, 0x46dc

    if-ne p2, v0, :cond_6

    const/4 p2, 0x1

    goto :goto_7

    :cond_6
    const/4 p2, 0x0

    :goto_7
    invoke-static {p0, p1, p2}, Le/e/a/ManualQueue119;->add(Landroid/app/Activity;Ljava/lang/Object;Z)V

    return-void
.end method

.method static synthetic lambda$2(Le/e/a/ListActions$Action;Landroid/view/MenuItem;)Z
    .registers 2

    .line 13
    iget-object p0, p0, Le/e/a/ListActions$Action;->run:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$3(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    .registers 2

    .line 15
    invoke-static {p0}, Le/e/a/ManualQueue119;->show(Landroid/app/Activity;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$4(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 2

    .line 16
    invoke-static {p0}, Le/e/a/MenuOptions119;->show(Landroid/app/Activity;)V

    const/4 p0, 0x1

    return p0
.end method

.method public static menu(Landroid/app/Activity;Landroid/view/Menu;)V
    .registers 6

    .line 15
    const/16 v0, 0x46d3

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    if-nez v0, :cond_a

    const/4 v0, 0x3

    goto :goto_e

    :cond_a
    invoke-interface {v0}, Landroid/view/MenuItem;->getOrder()I

    move-result v0

    :goto_e
    const/16 v1, 0x46de

    invoke-interface {p1, v1}, Landroid/view/Menu;->removeItem(I)V

    const-string v2, "\u518d\u751f\u30ad\u30e5\u30fc"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {p1, v3, v1, v0, v2}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    new-instance v0, Le/e/a/MenuOptions119$$ExternalSyntheticLambda19;

    invoke-direct {v0, p0}, Le/e/a/MenuOptions119$$ExternalSyntheticLambda19;-><init>(Landroid/app/Activity;)V

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p0, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    return-void
.end method

.method static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 8
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method static settings(Landroid/preference/PreferenceActivity;)V
    .registers 4

    .line 16
    const-string v0, "video_menu_options"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_9

    return-void

    :cond_9
    const-string v1, "setting_whole"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-nez v2, :cond_14

    return-void

    :cond_14
    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v0, "\u52d5\u753b\u30e1\u30cb\u30e5\u30fc\u306e\u8868\u793a\u9805\u76ee"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    const-string v0, "\u9577\u62bc\u3057\u30fb\u4e09\u89d2\u30e1\u30cb\u30e5\u30fc\u306e\u8868\u793a\u9805\u76ee\u3068\u9806\u756a"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    const/16 v0, 0x136

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setOrder(I)V

    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    new-instance v0, Le/e/a/MenuOptions119$$ExternalSyntheticLambda18;

    invoke-direct {v0, p0}, Le/e/a/MenuOptions119$$ExternalSyntheticLambda18;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    return-void
.end method

.method static show(Landroid/app/Activity;)V
    .registers 1

    .line 17
    invoke-static {p0}, Le/e/a/MenuEditor120;->show(Landroid/app/Activity;)V

    return-void
.end method
