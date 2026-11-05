.class public final Le/e/a/ListActions;
.super Ljava/lang/Object;
.source "ListActions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ListActions$Action;,
        Le/e/a/ListActions$Corner;,
        Le/e/a/ListActions$Hold;
    }
.end annotation


# static fields
.field static final ACTIONS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/util/List<",
            "Le/e/a/ListActions$Action;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final HISTORY_HEADERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/widget/ListView;",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/Spinner;",
            ">;>;"
        }
    .end annotation
.end field

.field static final LONG:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;

.field private static final POPUP_HOLD_MS:I = 0x1f4

.field private static final SUPER_LONG_EXTRA_MS:I = 0x3b6

.field private static activeHold:Le/e/a/ListActions$Hold;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 12
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Le/e/a/ListActions;->LONG:Ljava/util/Set;

    .line 13
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ListActions;->ACTIONS:Ljava/util/Map;

    .line 16
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/ListActions;->MAIN:Landroid/os/Handler;

    .line 110
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ListActions;->HISTORY_HEADERS:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Landroid/os/Handler;
    .registers 1

    .line 16
    sget-object v0, Le/e/a/ListActions;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Landroid/widget/AdapterView;)Z
    .registers 4

    .line 78
    invoke-static {p0, p1, p2, p3}, Le/e/a/ListActions;->dispatchSuperLong(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Landroid/widget/AdapterView;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$2(Le/e/a/ListActions$Hold;)V
    .registers 1

    .line 50
    sput-object p0, Le/e/a/ListActions;->activeHold:Le/e/a/ListActions$Hold;

    return-void
.end method

.method static synthetic access$3(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 86
    invoke-static {p0, p1, p2, p3, p4}, Le/e/a/ListActions;->showActions(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$4(Ljava/lang/Object;I)V
    .registers 2

    .line 115
    invoke-static {p0, p1}, Le/e/a/ListActions;->sortHistory(Ljava/lang/Object;I)V

    return-void
.end method

.method private static addExtra(Landroid/view/Menu;Ljava/util/List;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Object;I)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/Menu;",
            "Ljava/util/List<",
            "Le/e/a/ListActions$Action;",
            ">;",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "I)V"
        }
    .end annotation

    invoke-static {p2, p3, p4}, Le/e/a/FilterEditor110;->prepare(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V

    .line 92
    invoke-static {p2}, Le/e/a/AccountRemoval227;->kind(Landroid/app/Activity;)I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_31

    add-int/lit8 v0, p5, 0x5

    const-string v2, "Remove from mylist"

    const-string v3, "\u5f9e\u64ad\u653e\u6e05\u55ae\u79fb\u9664"

    const-string v4, "\u30de\u30a4\u30ea\u30b9\u30c8\u3092\u524a\u9664"

    invoke-static {p2, v4, v2, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x46b9

    invoke-interface {p0, v1, v3, v0, v2}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    new-instance v2, Le/e/a/ListActions$$ExternalSyntheticLambda5;

    invoke-direct {v2, p2, p4}, Le/e/a/ListActions$$ExternalSyntheticLambda5;-><init>(Landroid/app/Activity;Ljava/lang/Object;)V

    new-instance v3, Le/e/a/ListActions$$ExternalSyntheticLambda6;

    invoke-direct {v3, v2}, Le/e/a/ListActions$$ExternalSyntheticLambda6;-><init>(Ljava/lang/Runnable;)V

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    new-instance v3, Le/e/a/ListActions$Action;

    invoke-direct {v3, v0, v2}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_31
    invoke-static {p2}, Le/e/a/ListActions;->cacheList(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_3d

    invoke-static {p2}, Le/e/a/ListActions;->history(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_71

    :cond_3d
    invoke-static {p2}, Le/e/a/ListActions;->cacheList(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_4a

    const-string v0, "Delete cache"

    const-string v2, "\u522a\u9664\u5feb\u53d6"

    const-string v3, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664"

    goto :goto_50

    :cond_4a
    const-string v0, "Delete watch history"

    const-string v2, "\u522a\u9664\u89c0\u770b\u7d00\u9304"

    const-string v3, "\u8996\u8074\u5c65\u6b74\u3092\u524a\u9664"

    :goto_50
    invoke-static {p2, v3, v0, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v2, p5, 0x4

    const/16 v3, 0x46b8

    invoke-interface {p0, v1, v3, v2, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    new-instance v2, Le/e/a/ListActions$$ExternalSyntheticLambda7;

    invoke-direct {v2, p2, p4}, Le/e/a/ListActions$$ExternalSyntheticLambda7;-><init>(Landroid/app/Activity;Ljava/lang/Object;)V

    new-instance v3, Le/e/a/ListActions$$ExternalSyntheticLambda8;

    invoke-direct {v3, v2}, Le/e/a/ListActions$$ExternalSyntheticLambda8;-><init>(Ljava/lang/Runnable;)V

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    new-instance v3, Le/e/a/ListActions$Action;

    invoke-direct {v3, v0, v2}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_71
    const-string v0, "Add to playlist"

    const-string v2, "\u52a0\u5165\u64ad\u653e\u6e05\u55ae"

    const-string v3, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u306b\u8ffd\u52a0"

    invoke-static {p2, v3, v0, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x46b6

    invoke-interface {p0, v1, v2, p5, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    new-instance v2, Le/e/a/ListActions$$ExternalSyntheticLambda9;

    invoke-direct {v2, p2, p4}, Le/e/a/ListActions$$ExternalSyntheticLambda9;-><init>(Landroid/app/Activity;Ljava/lang/Object;)V

    new-instance v3, Le/e/a/ListActions$$ExternalSyntheticLambda10;

    invoke-direct {v3, v2}, Le/e/a/ListActions$$ExternalSyntheticLambda10;-><init>(Ljava/lang/Runnable;)V

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    new-instance v3, Le/e/a/ListActions$Action;

    invoke-direct {v3, v0, v2}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {p2}, Le/e/a/ListActions;->cacheList(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_bf

    add-int/lit8 v0, p5, 0x2

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u518d\u53d6\u5f97"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x46b7

    invoke-interface {p0, v1, v3, v0, v2}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    new-instance v2, Le/e/a/ListActions$$ExternalSyntheticLambda11;

    invoke-direct {v2, p2, p4}, Le/e/a/ListActions$$ExternalSyntheticLambda11;-><init>(Landroid/app/Activity;Ljava/lang/Object;)V

    new-instance p4, Le/e/a/ListActions$$ExternalSyntheticLambda12;

    invoke-direct {p4, v2}, Le/e/a/ListActions$$ExternalSyntheticLambda12;-><init>(Ljava/lang/Runnable;)V

    invoke-interface {v0, p4}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    new-instance p4, Le/e/a/ListActions$Action;

    invoke-direct {p4, v0, v2}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    invoke-interface {p1, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_bf
    add-int/lit8 p5, p5, 0x1

    const-string p4, "Block uploader"

    const-string v0, "\u5c01\u9396\u6295\u7a3f\u8005"

    const-string v2, "\u6295\u7a3f\u8005\u3092NG"

    invoke-static {p2, v2, p4, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    const/16 v0, 0x46b5

    invoke-interface {p0, v1, v0, p5, p4}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p0

    new-instance p4, Le/e/a/ListActions$$ExternalSyntheticLambda13;

    invoke-direct {p4, p2, p3}, Le/e/a/ListActions$$ExternalSyntheticLambda13;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    new-instance p2, Le/e/a/ListActions$$ExternalSyntheticLambda14;

    invoke-direct {p2, p4}, Le/e/a/ListActions$$ExternalSyntheticLambda14;-><init>(Ljava/lang/Runnable;)V

    invoke-interface {p0, p2}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    new-instance p2, Le/e/a/ListActions$Action;

    invoke-direct {p2, p0, p4}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static adjustHistoryMenu(Ljava/lang/Object;Landroid/view/Menu;)V
    .registers 18

    invoke-static/range {p0 .. p1}, Le/e/a/QueueMenu119;->install(Ljava/lang/Object;Landroid/view/Menu;)V

    invoke-static/range {p0 .. p1}, Le/e/a/ExistingMenu114;->install(Ljava/lang/Object;Landroid/view/Menu;)V

    invoke-static/range {p0 .. p1}, Le/e/a/DownloadUi115;->scheduleMenu(Ljava/lang/Object;Landroid/view/Menu;)V

    move-object/from16 v0, p1

    .line 97
    const-string v1, "continuous_play"

    :try_start_d
    move-object/from16 v2, p0

    check-cast v2, Landroid/app/Activity;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const v4, 0x7f0f0201

    invoke-interface {v0, v4}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v5

    if-nez v5, :cond_22

    invoke-static {v2, v0}, Le/e/a/MylistFollow190;->menu(Landroid/app/Activity;Landroid/view/Menu;)V

    return-void

    .line 98
    :cond_22
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "E"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v5

    const/4 v6, 0x4

    if-ne v5, v6, :cond_39

    const v7, 0x7f0f020a

    invoke-interface {v0, v7}, Landroid/view/Menu;->removeItem(I)V

    :cond_39
    const/16 v7, 0x8

    if-ne v5, v7, :cond_43

    const v8, 0x7f0f020b

    invoke-interface {v0, v8}, Landroid/view/Menu;->removeItem(I)V

    :cond_43
    const/16 v8, 0x46c8

    invoke-interface {v0, v8}, Landroid/view/Menu;->removeItem(I)V

    const/16 v9, 0x46c9

    invoke-interface {v0, v9}, Landroid/view/Menu;->removeItem(I)V

    .line 99
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_54
    invoke-interface/range {p1 .. p1}, Landroid/view/Menu;->size()I

    move-result v12

    if-lt v11, v12, :cond_116

    .line 100
    new-instance v11, Le/e/a/ListActions$$ExternalSyntheticLambda2;

    invoke-direct {v11}, Le/e/a/ListActions$$ExternalSyntheticLambda2;-><init>()V

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    invoke-interface/range {p1 .. p1}, Landroid/view/Menu;->clear()V

    .line 101
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    const/4 v11, 0x0

    :goto_6a
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-nez v12, :cond_7f

    if-eq v5, v6, :cond_74

    if-ne v5, v7, :cond_77

    .line 104
    :cond_74
    invoke-static {v2, v10}, Le/e/a/ListActions;->historyHeader(Landroid/app/Activity;I)V

    :cond_77
    invoke-static {v2}, Le/e/a/ListActions;->themeHeader(Landroid/app/Activity;)V

    invoke-static {v2, v0}, Le/e/a/MylistFollow190;->menu(Landroid/app/Activity;Landroid/view/Menu;)V

    goto/16 :goto_12a

    .line 101
    :cond_7f
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/view/MenuItem;

    invoke-interface {v12}, Landroid/view/MenuItem;->getGroupId()I

    move-result v13

    invoke-interface {v12}, Landroid/view/MenuItem;->getItemId()I

    move-result v14

    add-int/lit8 v15, v11, 0x1

    invoke-interface {v12}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v0, v13, v14, v11, v6}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v6

    invoke-interface {v12}, Landroid/view/MenuItem;->isCheckable()Z

    move-result v13

    invoke-interface {v6, v13}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    move-result-object v13

    invoke-interface {v12}, Landroid/view/MenuItem;->isChecked()Z

    move-result v14

    invoke-interface {v13, v14}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    move-result-object v13

    invoke-interface {v12}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v14

    invoke-interface {v13, v14}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v13

    invoke-interface {v12}, Landroid/view/MenuItem;->isVisible()Z

    move-result v14

    invoke-interface {v13, v14}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    invoke-interface {v12}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v13

    const/4 v14, 0x1

    if-eqz v13, :cond_c7

    invoke-interface {v12}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v13

    invoke-interface {v6, v13}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    invoke-interface {v6, v14}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 102
    :cond_c7
    invoke-interface {v12}, Landroid/view/MenuItem;->getItemId()I

    move-result v12

    if-ne v12, v4, :cond_112

    invoke-interface {v3, v1, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_de

    const-string v12, "continuous_play_mode"

    invoke-interface {v3, v12, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v12

    const/4 v13, 0x2

    if-ne v12, v13, :cond_de

    const/4 v12, 0x1

    goto :goto_df

    :cond_de
    const/4 v12, 0x0

    :goto_df
    if-nez v12, :cond_e9

    invoke-interface {v3, v1, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    if-eqz v13, :cond_e9

    const/4 v13, 0x1

    goto :goto_ea

    :cond_e9
    const/4 v13, 0x0

    :goto_ea
    invoke-interface {v6, v13}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    new-instance v13, Le/e/a/ListActions$$ExternalSyntheticLambda3;

    invoke-direct {v13, v2}, Le/e/a/ListActions$$ExternalSyntheticLambda3;-><init>(Landroid/app/Activity;)V

    invoke-interface {v6, v13}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    add-int/lit8 v11, v11, 0x3

    const-string v6, "\u30b7\u30e3\u30c3\u30d5\u30eb\u518d\u751f"

    invoke-static {v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v10, v8, v15, v6}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v6

    invoke-interface {v6, v14}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    move-result-object v6

    invoke-interface {v6, v12}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    move-result-object v6

    new-instance v12, Le/e/a/ListActions$$ExternalSyntheticLambda4;

    invoke-direct {v12, v2}, Le/e/a/ListActions$$ExternalSyntheticLambda4;-><init>(Landroid/app/Activity;)V

    invoke-interface {v6, v12}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    goto :goto_113

    :cond_112
    move v11, v15

    :goto_113
    const/4 v6, 0x4

    goto/16 :goto_6a

    .line 99
    :cond_116
    invoke-interface {v0, v11}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v6

    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_11d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_11d} :catch_122

    add-int/lit8 v11, v11, 0x1

    const/4 v6, 0x4

    goto/16 :goto_54

    :catch_122
    move-exception v0

    .line 105
    const-string v1, "nicoid-list"

    const-string v2, "Unable to update list options"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_12a
    return-void
.end method

.method public static bind(Landroid/view/View;Ljava/lang/Object;I)V
    .registers 6

    .line 41
    :try_start_0
    const-string v0, "b"

    invoke-static {p1, v0}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-ltz p2, :cond_52

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p2, v1, :cond_11

    goto :goto_52

    .line 42
    :cond_11
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    invoke-static {p0, p1, p2}, Le/e/a/VideoRows191;->bind(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p0, p1, p2}, Le/e/a/CacheProgress;->bind(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p0, p1, p2}, Le/e/a/BulkSelection;->bind(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    return-void

    :cond_22
    invoke-virtual {p0}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewOverlay;->clear()V

    const-string v0, "videourl"

    invoke-static {p2, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 43
    const-string v1, "https?://[^/]*nicovideo.jp/(?:watch|shorts)/.*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_38

    return-void

    .line 44
    :cond_38
    new-instance v1, Le/e/a/ListActions$$ExternalSyntheticLambda17;

    invoke-direct {v1}, Le/e/a/ListActions$$ExternalSyntheticLambda17;-><init>()V

    invoke-virtual {p0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    new-instance v1, Le/e/a/ListActions$Hold;

    const-string v2, "title"

    invoke-static {p2, v2}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p1, p2, v0, v2}, Le/e/a/ListActions$Hold;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    invoke-virtual {p0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_51} :catch_53

    goto :goto_5b

    :cond_52
    :goto_52
    return-void

    :catch_53
    move-exception p0

    .line 47
    const-string p1, "nicoid-menu"

    const-string p2, "Unable to bind video actions"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_5b
    return-void
.end method

.method static cacheList(Landroid/app/Activity;)Z
    .registers 2

    if-eqz p0, :cond_14

    .line 95
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "com.sauzask.nicoid.NicoidCacheManagerActivity"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public static corner(Landroid/view/View;)V
    .registers 2

    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    new-instance v0, Le/e/a/ListActions$Corner;

    invoke-direct {v0}, Le/e/a/ListActions$Corner;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method static counts(Ljava/lang/Object;)[J
    .registers 11

    .line 117
    const-string v0, "videoinfo"

    invoke-static {p0, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "<[^>]+>"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v3, 0x0

    if-ltz v1, :cond_1b

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_1b
    invoke-static {v0}, Le/e/a/VideoCountRules;->parse(Ljava/lang/CharSequence;)[J

    move-result-object v0

    const/4 v1, 0x3

    if-eqz v0, :cond_33

    aget-wide v4, v0, v3

    const/4 p0, 0x1

    aget-wide v6, v0, p0

    aget-wide v8, v0, v1

    new-array v0, v1, [J

    aput-wide v4, v0, v3

    aput-wide v6, v0, p0

    const/4 p0, 0x2

    aput-wide v8, v0, p0

    return-object v0

    :cond_33
    new-array v0, v1, [J

    const-string v4, "rawres"

    const-string v5, "rawmylis"

    const-string v6, "rawplay"

    filled-new-array {v6, v4, v5}, [Ljava/lang/String;

    move-result-object v4

    :goto_3f
    if-lt v3, v1, :cond_42

    return-object v0

    :cond_42
    :try_start_42
    aget-object v5, v4, v3

    invoke-static {p0, v5}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    aput-wide v5, v0, v3
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_54} :catch_55

    goto :goto_59

    :catch_55
    const-wide/16 v5, -0x1

    aput-wide v5, v0, v3

    :goto_59
    add-int/lit8 v3, v3, 0x1

    goto :goto_3f
.end method

.method private static dispatchSuperLong(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Landroid/widget/AdapterView;)Z
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Landroid/widget/AdapterView<",
            "*>;)Z"
        }
    .end annotation

    .line 79
    invoke-static {p1, p2}, Le/e/a/LocalPlaylists;->superLong(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    const/4 p0, 0x1

    return p0

    .line 80
    :cond_8
    invoke-virtual {p3}, Landroid/widget/AdapterView;->getOnItemLongClickListener()Landroid/widget/AdapterView$OnItemLongClickListener;

    move-result-object v0

    const/4 p1, 0x0

    if-nez v0, :cond_10

    return p1

    .line 81
    :cond_10
    invoke-virtual {p3, p0}, Landroid/widget/AdapterView;->getPositionForView(Landroid/view/View;)I

    move-result v3

    if-gez v3, :cond_17

    return p1

    .line 82
    :cond_17
    invoke-static {p3}, Le/e/a/BulkSelection;->owner(Landroid/widget/AdapterView;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2b

    :try_start_1d
    invoke-static {v1}, Le/e/a/BulkSelection;->rows(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p0

    invoke-static {v1, p0}, Le/e/a/BulkSelection;->enter(Ljava/lang/Object;I)Z

    move-result p0
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_29} :catch_2a

    return p0

    :catch_2a
    return p1

    .line 83
    :cond_2b
    :try_start_2b
    invoke-virtual {p3, v3}, Landroid/widget/AdapterView;->getItemIdAtPosition(I)J

    move-result-wide v4

    move-object v1, p3

    move-object v2, p0

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemLongClickListener;->onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z

    move-result p0
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_35} :catch_36

    return p0

    :catch_36
    move-exception p0

    .line 84
    const-string p2, "nicoid-menu"

    const-string p3, "Unable to enter selection mode"

    invoke-static {p2, p3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return p1
.end method

.method public static extra(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 91
    :try_start_4
    const-string v2, "e"

    invoke-static {v0, v2}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "d"

    invoke-static {v2, v3}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    const-string v4, "c"

    invoke-static {v0, v4}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const-string v5, "b"

    invoke-static {v2, v5}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    if-ltz v4, :cond_103

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lt v4, v5, :cond_30

    goto/16 :goto_103

    :cond_30
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    const-string v4, "y"

    invoke-static {v2, v4}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Ljava/lang/String;

    const-string v4, "a"

    invoke-static {v1, v4}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Landroid/view/Menu;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const/4 v12, 0x0

    const/4 v5, 0x0

    :goto_4d
    invoke-interface {v11}, Landroid/view/Menu;->size()I

    move-result v6

    if-lt v5, v6, :cond_f8

    const-string v5, "e.e.a.b0$a$a"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/4 v13, 0x1

    new-array v6, v13, [Ljava/lang/Class;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    aput-object v7, v6, v12

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    new-array v6, v13, [Ljava/lang/Object;

    aput-object v0, v6, v12

    invoke-virtual {v5, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v11}, Landroid/view/Menu;->clear()V

    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v15

    const/4 v4, 0x0

    const/4 v9, 0x0

    :cond_7c
    :goto_7c
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_93

    if-nez v4, :cond_8c

    move-object v4, v11

    move-object v5, v14

    move-object v6, v3

    move-object v7, v10

    move-object v8, v2

    invoke-static/range {v4 .. v9}, Le/e/a/ListActions;->addExtra(Landroid/view/Menu;Ljava/util/List;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Object;I)V

    :cond_8c
    sget-object v0, Le/e/a/ListActions;->ACTIONS:Ljava/util/Map;

    invoke-interface {v0, v1, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_10c

    :cond_93
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/MenuItem;

    invoke-static {v3}, Le/e/a/ListActions;->cacheList(Landroid/app/Activity;)Z

    move-result v6

    if-eqz v6, :cond_a7

    invoke-interface {v5}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    const/16 v7, 0xa

    if-eq v6, v7, :cond_7c

    :cond_a7
    invoke-interface {v5}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-static {v3, v6}, Le/e/a/AccountRemoval227;->skip(Landroid/app/Activity;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_b2

    goto :goto_7c

    :cond_b2
    invoke-interface {v5}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    add-int/lit8 v16, v9, 0x1

    invoke-interface {v5}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-interface {v11, v12, v6, v9, v7}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v6

    invoke-interface {v5}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v7

    invoke-interface {v6, v7}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    new-instance v7, Le/e/a/ListActions$$ExternalSyntheticLambda38;

    invoke-direct {v7, v0, v5}, Le/e/a/ListActions$$ExternalSyntheticLambda38;-><init>(Ljava/lang/Object;Landroid/view/MenuItem;)V

    new-instance v8, Le/e/a/ListActions$$ExternalSyntheticLambda39;

    invoke-direct {v8, v7}, Le/e/a/ListActions$$ExternalSyntheticLambda39;-><init>(Ljava/lang/Runnable;)V

    invoke-interface {v6, v8}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    new-instance v8, Le/e/a/ListActions$Action;

    invoke-direct {v8, v6, v7}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    invoke-interface {v14, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v5}, Landroid/view/MenuItem;->getOrder()I

    move-result v5

    const/4 v6, 0x5

    if-ne v5, v6, :cond_f5

    if-nez v4, :cond_f5

    move-object v4, v11

    move-object v5, v14

    move-object v6, v3

    move-object v7, v10

    move-object v8, v2

    move/from16 v17, v9

    move/from16 v9, v16

    invoke-static/range {v4 .. v9}, Le/e/a/ListActions;->addExtra(Landroid/view/Menu;Ljava/util/List;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Object;I)V

    add-int/lit8 v9, v17, 0x4

    const/4 v4, 0x1

    goto :goto_7c

    :cond_f5
    move/from16 v9, v16

    goto :goto_7c

    :cond_f8
    invoke-interface {v11, v5}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_ff
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_ff} :catch_104

    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_4d

    :cond_103
    :goto_103
    return-void

    :catch_104
    move-exception v0

    const-string v1, "nicoid-menu"

    const-string v2, "Unable to add video actions"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_10c
    return-void
.end method

.method static findList(Landroid/view/View;)Landroid/widget/AdapterView;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Landroid/widget/AdapterView<",
            "*>;"
        }
    .end annotation

    .line 77
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    :goto_4
    if-nez p0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    instance-of v0, p0, Landroid/widget/AdapterView;

    if-eqz v0, :cond_f

    check-cast p0, Landroid/widget/AdapterView;

    return-object p0

    :cond_f
    invoke-interface {p0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    goto :goto_4
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static handleHistoryShuffle(Ljava/lang/Object;Landroid/view/MenuItem;)Z
    .registers 5

    .line 107
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/16 v1, 0x46c8

    const/4 v2, 0x0

    if-eq v0, v1, :cond_a

    return v2

    :cond_a
    const/4 v0, 0x1

    :try_start_b
    check-cast p0, Landroid/app/Activity;

    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result p1

    xor-int/2addr p1, v0

    invoke-static {p0, p1, v0}, Le/e/a/ListActions;->playback(Landroid/app/Activity;ZZ)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_15} :catch_16

    goto :goto_1e

    :catch_16
    move-exception p0

    const-string p1, "nicoid-list"

    const-string v1, "Unable to change playback mode"

    invoke-static {p1, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1e
    return v0
.end method

.method private static heldPopup(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;Le/e/a/ListActions$Hold;Ljava/lang/Object;)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Le/e/a/ListActions$Action;",
            ">;",
            "Le/e/a/ListActions$Hold;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 76
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    const/16 v2, 0x14

    invoke-static {v0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const/16 v4, 0xc

    invoke-static {v0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {v0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v1, v3, v5, v6, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-static {v0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v3

    invoke-static {v0, v3, v2}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/16 v3, 0x10

    invoke-static {v0, p1, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    const/4 v4, 0x3

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    const/16 v4, 0x8

    invoke-static {v0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {p1, v5, v5, v5, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance p1, Landroid/widget/ScrollView;

    invoke-direct {p1, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x168

    invoke-static {v0, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->heightPixels:I

    div-int/lit8 v8, v8, 0x2

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    const/4 v8, -0x1

    invoke-direct {v6, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, p1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Landroid/widget/PopupWindow;

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->widthPixels:I

    const/16 v7, 0x20

    invoke-static {v0, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    sub-int/2addr v6, v7

    const/16 v7, 0x1a4

    invoke-static {v0, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    const/4 v7, -0x2

    invoke-direct {p1, v1, v6, v7, v5}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    iput-object p1, p3, Le/e/a/ListActions$Hold;->popup:Landroid/widget/PopupWindow;

    invoke-static {v0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v1

    invoke-static {v0, v1, v2}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/PopupWindow;->setElevation(F)V

    iget-boolean v1, p3, Le/e/a/ListActions$Hold;->down:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {p1, v1}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    iget-boolean v1, p3, Le/e/a/ListActions$Hold;->down:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {p1, v1}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    iget-boolean p3, p3, Le/e/a/ListActions$Hold;->down:Z

    xor-int/lit8 p3, p3, 0x1

    invoke-virtual {p1, p3}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_b7
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-nez p3, :cond_cb

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    const/16 p2, 0x11

    invoke-virtual {p1, p0, p2, v5, v5}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    return-void

    :cond_cb
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Le/e/a/ListActions$Action;

    iget-object v1, p3, Le/e/a/ListActions$Action;->title:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xf

    invoke-static {v0, v1, v2}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setGravity(I)V

    const/16 v2, 0x2e

    invoke-static {v0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMinHeight(I)V

    iget-boolean v2, p3, Le/e/a/ListActions$Action;->enabled:Z

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-boolean v2, p3, Le/e/a/ListActions$Action;->enabled:Z

    if-eqz v2, :cond_f5

    const/high16 v2, 0x3f800000    # 1.0f

    goto :goto_f8

    :cond_f5
    const v2, 0x3ecccccd    # 0.4f

    :goto_f8
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setAlpha(F)V

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Le/e/a/ListActions$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1, p3, p0, p4}, Le/e/a/ListActions$$ExternalSyntheticLambda0;-><init>(Landroid/widget/PopupWindow;Le/e/a/ListActions$Action;Landroid/app/Activity;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_b7
.end method

.method static history(Landroid/app/Activity;)Z
    .registers 4

    const/4 v0, 0x0

    .line 94
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "E"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p0
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_f} :catch_19

    const/4 v1, 0x4

    if-eq p0, v1, :cond_17

    const/16 v1, 0x8

    if-eq p0, v1, :cond_17

    return v0

    :cond_17
    const/4 p0, 0x1

    return p0

    :catch_19
    return v0
.end method

.method private static historyHeader(Landroid/app/Activity;I)V
    .registers 3

    .line 112
    :try_start_0
    const-string v0, "F"

    invoke-static {p0, v0}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0, v0, p1}, Le/e/a/ListActions;->historyHeader(Landroid/app/Activity;Ljava/lang/Object;I)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_9

    :catch_9
    return-void
.end method

.method private static historyHeader(Landroid/app/Activity;Ljava/lang/Object;I)V
    .registers 5

    .line 113
    sget-object v0, Le/e/a/ListActions;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/ListActions$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1, p2}, Le/e/a/ListActions$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;Ljava/lang/Object;I)V

    if-nez p2, :cond_b

    const/4 p0, 0x0

    goto :goto_d

    :cond_b
    const/16 p0, 0x32

    :goto_d
    int-to-long p0, p0

    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public static historyLoaded(Ljava/lang/Object;)V
    .registers 6

    .line 111
    :try_start_0
    const-string v0, "o0"

    invoke-static {p0, v0}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    const-string v1, "h0"

    invoke-static {p0, v1}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_1c

    const/16 v2, 0x8

    if-eq v1, v2, :cond_1c

    return-void

    :cond_1c
    const/4 v2, 0x0

    invoke-static {v0, p0, v2}, Le/e/a/ListActions;->historyHeader(Landroid/app/Activity;Ljava/lang/Object;I)V

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "history_sort_v2_"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {p0, v0}, Le/e/a/ListActions;->sortHistory(Ljava/lang/Object;I)V
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_39} :catch_3a

    goto :goto_42

    :catch_3a
    move-exception p0

    const-string v0, "nicoid-history"

    const-string v1, "Unable to refresh sorted history"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_42
    return-void
.end method

.method static synthetic lambda$0(Landroid/view/View;)V
    .registers 5

    .line 44
    invoke-static {p0}, Le/e/a/ListActions;->findList(Landroid/view/View;)Landroid/widget/AdapterView;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-virtual {v0, p0}, Landroid/widget/AdapterView;->getPositionForView(Landroid/view/View;)I

    move-result v1

    if-ltz v1, :cond_14

    invoke-virtual {v0, v1}, Landroid/widget/AdapterView;->getItemIdAtPosition(I)J

    move-result-wide v2

    invoke-virtual {v0, p0, v1, v2, v3}, Landroid/widget/AdapterView;->performItemClick(Landroid/view/View;IJ)Z

    :cond_14
    return-void
.end method

.method static synthetic lambda$1(Landroid/widget/PopupWindow;Le/e/a/ListActions$Action;Landroid/app/Activity;Ljava/lang/Object;Landroid/view/View;)V
    .registers 5

    .line 76
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    iget-boolean p0, p1, Le/e/a/ListActions$Action;->enabled:Z

    if-eqz p0, :cond_c

    iget-object p0, p1, Le/e/a/ListActions$Action;->run:Ljava/lang/Runnable;

    invoke-static {p2, p3, p0}, Le/e/a/LocalPlaylists;->withAdapterMode(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Runnable;)V

    :cond_c
    return-void
.end method

.method static synthetic lambda$10(Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 4

    .line 92
    const-string v0, "videourl"

    invoke-static {p1, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "title"

    invoke-static {p1, v1}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v0, p1}, Le/e/a/CacheRetry;->confirm(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$11(Ljava/lang/Runnable;Landroid/view/MenuItem;)Z
    .registers 2

    .line 92
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$12(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 2

    .line 92
    invoke-static {p0, p1}, Le/e/a/FilterEditor110;->confirm(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$13(Ljava/lang/Runnable;Landroid/view/MenuItem;)Z
    .registers 2

    .line 92
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$14(Ljava/util/List;Landroid/app/Activity;Ljava/lang/Object;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 93
    invoke-interface {p0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/ListActions$Action;

    iget-boolean p3, p0, Le/e/a/ListActions$Action;->enabled:Z

    if-eqz p3, :cond_22

    iget p3, p0, Le/e/a/ListActions$Action;->id:I

    const/16 p4, 0x46b5

    if-eq p3, p4, :cond_1d

    iget p3, p0, Le/e/a/ListActions$Action;->id:I

    const/16 p4, 0x46b6

    if-ne p3, p4, :cond_17

    goto :goto_1d

    :cond_17
    iget-object p0, p0, Le/e/a/ListActions$Action;->run:Ljava/lang/Runnable;

    invoke-static {p1, p2, p0}, Le/e/a/LocalPlaylists;->withAdapterMode(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Runnable;)V

    goto :goto_22

    :cond_1d
    :goto_1d
    iget-object p0, p0, Le/e/a/ListActions$Action;->run:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_22
    :goto_22
    return-void
.end method

.method static synthetic lambda$15(Landroid/view/MenuItem;Landroid/view/MenuItem;)I
    .registers 2

    .line 100
    invoke-interface {p0}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    invoke-static {p0}, Le/e/a/ListActions;->menuRank(I)I

    move-result p0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    invoke-static {p1}, Le/e/a/ListActions;->menuRank(I)I

    move-result p1

    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$16(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    .registers 4

    .line 102
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result p1

    const/4 v0, 0x1

    xor-int/2addr p1, v0

    const/4 v1, 0x0

    invoke-static {p0, p1, v1}, Le/e/a/ListActions;->playback(Landroid/app/Activity;ZZ)V

    return v0
.end method

.method static synthetic lambda$17(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    .registers 3

    .line 102
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result p1

    const/4 v0, 0x1

    xor-int/2addr p1, v0

    invoke-static {p0, p1, v0}, Le/e/a/ListActions;->playback(Landroid/app/Activity;ZZ)V

    return v0
.end method

.method static synthetic lambda$18(Landroid/app/Activity;Ljava/lang/Object;I)V
    .registers 14

    .line 113
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_d5

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_e

    goto/16 :goto_d5

    :cond_e
    const/4 v0, 0x1

    :try_start_f
    const-string v1, "g0"

    invoke-static {p1, v1}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    const/4 v2, 0x4

    const/16 v3, 0x8

    if-eq v1, v2, :cond_23

    if-eq v1, v3, :cond_23

    return-void

    :cond_23
    const-string v2, "b0"

    invoke-static {p1, v2}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    if-eqz v2, :cond_be

    sget-object v4, Le/e/a/ListActions;->HISTORY_HEADERS:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/ref/WeakReference;

    if-eqz v5, :cond_3e

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_3e

    return-void

    :cond_3e
    new-instance v5, Landroid/widget/Spinner;

    invoke-direct {v5, p0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    const-string v6, "nicoid_history_sort"

    invoke-virtual {v5, v6}, Landroid/widget/Spinner;->setTag(Ljava/lang/Object;)V

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v8, v7, v8}, Landroid/widget/Spinner;->setPadding(IIII)V

    new-instance v6, Landroid/widget/ArrayAdapter;

    if-ne v1, v3, :cond_5a

    const/4 v3, 0x1

    goto :goto_5b

    :cond_5a
    const/4 v3, 0x0

    :goto_5b
    invoke-static {v3}, Le/e/a/ListActions;->sortLabels(Z)[Ljava/lang/String;

    move-result-object v3

    const v7, 0x1090009

    invoke-direct {v6, p0, v7, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    invoke-virtual {v5, v6}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "history_sort_v2_"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v5, v3}, Landroid/widget/Spinner;->setSelection(I)V

    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v6, 0x5

    invoke-static {p0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {p0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-static {p0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-static {p0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v3, v7, v9, v10, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x2a

    invoke-static {p0, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    const/4 v9, -0x1

    invoke-direct {v6, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v6, 0x0

    invoke-virtual {v2, v3, v6, v8}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v5}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Le/e/a/ListActions$1;

    invoke-direct {v2, p0, v1, p1}, Le/e/a/ListActions$1;-><init>(Landroid/app/Activity;ILjava/lang/Object;)V

    invoke-virtual {v5, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    goto :goto_d5

    :cond_be
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1
    :try_end_c4
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_c4} :catch_c4

    :catch_c4
    move-exception v1

    const/16 v2, 0x28

    if-ge p2, v2, :cond_ce

    add-int/2addr p2, v0

    invoke-static {p0, p1, p2}, Le/e/a/ListActions;->historyHeader(Landroid/app/Activity;Ljava/lang/Object;I)V

    goto :goto_d5

    :cond_ce
    const-string p0, "nicoid-history"

    const-string p1, "Unable to install history sort header"

    invoke-static {p0, p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_d5
    :goto_d5
    return-void
.end method

.method static synthetic lambda$19(ILjava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 15

    const/4 v0, 0x4

    const/4 v1, 0x1

    if-ge p0, v0, :cond_39

    .line 116
    invoke-interface {p1, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Long;

    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {p1, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-interface {p2, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-interface {p2, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v7

    rem-int/lit8 p0, p0, 0x2

    if-ne p0, v1, :cond_32

    const/4 v8, 0x1

    goto :goto_34

    :cond_32
    const/4 v1, 0x0

    const/4 v8, 0x0

    :goto_34
    invoke-static/range {v2 .. v8}, Le/e/a/HistorySortRules;->compare(JJIIZ)I

    move-result p0

    return p0

    :cond_39
    const/4 v0, 0x6

    if-ge p0, v0, :cond_51

    invoke-interface {p3, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-interface {p3, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p1

    const/4 p3, 0x5

    if-ne p0, p3, :cond_7e

    neg-int p1, p1

    goto :goto_7e

    :cond_51
    invoke-interface {p1, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Long;

    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {p1, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long p1, v2, v6

    if-ltz p1, :cond_99

    cmp-long p3, v4, v6

    if-gez p3, :cond_70

    goto :goto_99

    :cond_70
    rem-int/lit8 p0, p0, 0x2

    if-nez p0, :cond_79

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    goto :goto_7d

    :cond_79
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    :goto_7d
    move p1, p0

    :cond_7e
    :goto_7e
    if-nez p1, :cond_98

    invoke-interface {p2, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-interface {p2, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    move-result p1

    :cond_98
    return p1

    :cond_99
    :goto_99
    if-ltz p1, :cond_9d

    const/4 p0, -0x1

    return p0

    :cond_9d
    cmp-long p0, v4, v6

    if-ltz p0, :cond_a2

    return v1

    :cond_a2
    invoke-interface {p2, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-interface {p2, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$2(Ljava/lang/Object;Landroid/view/MenuItem;)V
    .registers 8

    .line 91
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "onMenuItemClick"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/view/MenuItem;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p1, v1, v5

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_19} :catch_1a

    goto :goto_22

    :catch_1a
    move-exception p0

    const-string p1, "nicoid-menu"

    const-string v0, "Video action failed"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_22
    return-void
.end method

.method static synthetic lambda$3(Ljava/lang/Runnable;Landroid/view/MenuItem;)Z
    .registers 2

    .line 91
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$4(Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 2

    .line 92
    invoke-static {p0, p1}, Le/e/a/AccountRemoval227;->confirm(Landroid/app/Activity;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$5(Ljava/lang/Runnable;Landroid/view/MenuItem;)Z
    .registers 2

    .line 92
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$6(Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 2

    .line 92
    invoke-static {p0, p1}, Le/e/a/BulkSelection;->deleteOne(Landroid/app/Activity;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$7(Ljava/lang/Runnable;Landroid/view/MenuItem;)Z
    .registers 2

    .line 92
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$8(Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 2

    .line 92
    invoke-static {p0, p1}, Le/e/a/LocalPlaylists;->addRow(Landroid/content/Context;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$9(Ljava/lang/Runnable;Landroid/view/MenuItem;)Z
    .registers 2

    .line 92
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0
.end method

.method static length(Ljava/lang/Object;)J
    .registers 16

    const-wide/16 v0, -0x1

    .line 118
    :try_start_2
    const-string v2, "length"

    invoke-static {p0, v2}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v2, ":"

    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v2, p0

    const/4 v3, 0x2

    if-lt v2, v3, :cond_41

    array-length v2, p0

    const/4 v3, 0x3

    if-le v2, v3, :cond_17

    goto :goto_41

    :cond_17
    array-length v2, p0

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    move-wide v6, v3

    :goto_1c
    if-lt v5, v2, :cond_1f

    return-wide v6

    :cond_1f
    aget-object v8, p0, v5

    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    cmp-long v10, v8, v3

    if-gez v10, :cond_2a

    return-wide v0

    :cond_2a
    const-wide v10, 0x7fffffffffffffffL

    sub-long/2addr v10, v8

    const-wide/16 v12, 0x3c

    div-long/2addr v10, v12
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_33} :catch_41

    cmp-long v14, v6, v10

    if-lez v14, :cond_38

    return-wide v0

    :cond_38
    invoke-static {v6, v7}, Ljava/lang/Long;->signum(J)I

    mul-long v6, v6, v12

    add-long/2addr v6, v8

    add-int/lit8 v5, v5, 0x1

    goto :goto_1c

    :catch_41
    :cond_41
    :goto_41
    return-wide v0
.end method

.method private static menuRank(I)I
    .registers 2

    const v0, 0x7f0f0201

    if-ne p0, v0, :cond_7

    const/4 p0, 0x0

    goto :goto_14

    :cond_7
    const/4 v0, 0x1

    if-ne p0, v0, :cond_c

    const/4 p0, 0x1

    goto :goto_14

    :cond_c
    const v0, 0x7f0f0120

    if-ne p0, v0, :cond_13

    const/4 p0, 0x2

    goto :goto_14

    :cond_13
    const/4 p0, 0x3

    :goto_14
    return p0
.end method

.method private static playback(Landroid/app/Activity;ZZ)V
    .registers 8

    invoke-static {p0, p1, p2}, Le/e/a/TabPlayback110;->changed(Landroid/app/Activity;ZZ)V

    .line 108
    :try_start_3
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "continuous_play"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "continuous_play_mode"

    const/4 v2, 0x2

    const/4 v3, 0x0

    if-eqz p2, :cond_19

    const/4 v4, 0x2

    goto :goto_1a

    :cond_19
    const/4 v4, 0x0

    :goto_1a
    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const-string v0, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "I"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v4, 0x0

    invoke-virtual {v1, v4, p1}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    const-string p1, "J"

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    if-eqz p2, :cond_3a

    goto :goto_3b

    :cond_3a
    const/4 v2, 0x0

    :goto_3b
    invoke-virtual {p1, v4, v2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    invoke-virtual {p0}, Landroid/app/Activity;->invalidateOptionsMenu()V
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_41} :catch_42

    goto :goto_4a

    :catch_42
    move-exception p0

    const-string p1, "nicoid-list"

    const-string p2, "Unable to update playback mode"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_4a
    return-void
.end method

.method public static show(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 9

    invoke-static/range {p0 .. p1}, Le/e/a/DownloadActions116;->complete(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 93
    :try_start_3
    sget-object v0, Le/e/a/ListActions;->ACTIONS:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    sget-object v1, Le/e/a/ListActions;->LONG:Ljava/util/Set;

    invoke-interface {v1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_69

    if-nez v0, :cond_17

    goto :goto_69

    :cond_17
    const-string p1, "e"

    invoke-static {p0, p1}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string v1, "d"

    invoke-static {p1, v1}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v3

    const-string v4, "b"

    invoke-static {p0, v4}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v4, Le/e/a/ListActions;->activeHold:Le/e/a/ListActions$Hold;

    if-eqz v4, :cond_3b

    invoke-static {v1, p0, v0, v4, p1}, Le/e/a/ListActions;->heldPopup(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;Le/e/a/ListActions$Hold;Ljava/lang/Object;)V

    return-void

    :cond_3b
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    new-array v5, v4, [Ljava/lang/CharSequence;

    :goto_41
    if-lt v2, v4, :cond_5c

    invoke-static {v3}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    new-instance v2, Le/e/a/ListActions$$ExternalSyntheticLambda15;

    invoke-direct {v2, v0, v1, p1}, Le/e/a/ListActions$$ExternalSyntheticLambda15;-><init>(Ljava/util/List;Landroid/app/Activity;Ljava/lang/Object;)V

    invoke-virtual {p0, v5, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    goto :goto_83

    :cond_5c
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le/e/a/ListActions$Action;

    iget-object v6, v6, Le/e/a/ListActions$Action;->title:Ljava/lang/String;

    aput-object v6, v5, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_41

    :cond_69
    :goto_69
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v0, "a"

    new-array v1, v2, [Ljava/lang/Class;

    invoke-virtual {p0, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array v0, v2, [Ljava/lang/Object;

    invoke-virtual {p0, p1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7a
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_7a} :catch_7b

    return-void

    :catch_7b
    move-exception p0

    const-string p1, "nicoid-menu"

    const-string v0, "Unable to display video actions"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_83
    return-void
.end method

.method private static showActions(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .registers 15

    const/4 v0, 0x0

    .line 87
    :try_start_1
    const-string v1, "b"

    invoke-static {p1, v1}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p2

    if-gez p2, :cond_10

    return-void

    :cond_10
    const-string v1, "e.e.a.b0$a"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x5

    new-array v3, v2, [Ljava/lang/Class;

    const-string v4, "e.e.a.b0"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Ljava/lang/String;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    const-class v4, Ljava/lang/String;

    const/4 v7, 0x2

    aput-object v4, v3, v7

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v8, 0x3

    aput-object v4, v3, v8

    const-class v4, Ljava/lang/String;

    const/4 v9, 0x4

    aput-object v4, v3, v9

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v5

    aput-object p3, v2, v6

    aput-object p4, v2, v7

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v8

    invoke-static {p3}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, v9

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    sget-object p1, Le/e/a/ListActions;->LONG:Ljava/util/Set;

    invoke-interface {p1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-object p2, v0

    check-cast p2, Landroid/view/View$OnClickListener;

    invoke-interface {p2, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_5d} :catch_65
    .catchall {:try_start_1 .. :try_end_5d} :catchall_63

    if-eqz v0, :cond_74

    .line 88
    invoke-interface {p1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_74

    :catchall_63
    move-exception p0

    goto :goto_75

    :catch_65
    move-exception p0

    :try_start_66
    const-string p1, "nicoid-menu"

    const-string p2, "Unable to show video actions"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6d
    .catchall {:try_start_66 .. :try_end_6d} :catchall_63

    if-eqz v0, :cond_74

    sget-object p0, Le/e/a/ListActions;->LONG:Ljava/util/Set;

    invoke-interface {p0, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_74
    :goto_74
    return-void

    :goto_75
    if-eqz v0, :cond_7c

    sget-object p1, Le/e/a/ListActions;->LONG:Ljava/util/Set;

    invoke-interface {p1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_7c
    throw p0
.end method

.method private static sortHistory(Ljava/lang/Object;I)V
    .registers 4

    .line 115
    :try_start_0
    const-string v0, "a0"

    invoke-static {p0, v0}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    const-string v1, "p0"

    invoke-static {p0, v1}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    const/16 v1, 0xd

    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 v1, 0x0

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-static {v0, p1}, Le/e/a/ListActions;->sortRows(Ljava/util/List;I)V

    const-string p1, "b"

    invoke-static {p0, p1}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    if-eq p1, v0, :cond_2c

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_2c
    check-cast p0, Landroid/widget/BaseAdapter;

    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_31} :catch_32

    goto :goto_3a

    :catch_32
    move-exception p0

    const-string p1, "nicoid-list"

    const-string v0, "Unable to sort history"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3a
    return-void
.end method

.method static sortLabels(Z)[Ljava/lang/String;
    .registers 15

    .line 114
    const-string v12, "\u518d\u751f\u6642\u9593\u304c\u9577\u3044\u9806"

    const-string v13, "\u518d\u751f\u6642\u9593\u304c\u77ed\u3044\u9806"

    const-string v0, "\u8996\u8074\u65e5\u6642\u304c\u65b0\u3057\u3044\u9806"

    const-string v1, "\u8996\u8074\u65e5\u6642\u304c\u53e4\u3044\u9806"

    const-string v2, "\u65b0\u3057\u3044\u9806"

    const-string v3, "\u53e4\u3044\u9806"

    const-string v4, "\u30bf\u30a4\u30c8\u30eb\u6607\u9806"

    const-string v5, "\u30bf\u30a4\u30c8\u30eb\u964d\u9806"

    const-string v6, "\u518d\u751f\u6570\u304c\u591a\u3044\u9806"

    const-string v7, "\u518d\u751f\u6570\u304c\u5c11\u306a\u3044\u9806"

    const-string v8, "\u30b3\u30e1\u30f3\u30c8\u6570\u304c\u591a\u3044\u9806"

    const-string v9, "\u30b3\u30e1\u30f3\u30c8\u6570\u304c\u5c11\u306a\u3044\u9806"

    const-string v10, "\u30de\u30a4\u30ea\u30b9\u30c8\u6570\u304c\u591a\u3044\u9806"

    const-string v11, "\u30de\u30a4\u30ea\u30b9\u30c8\u6570\u304c\u5c11\u306a\u3044\u9806"

    filled-new-array/range {v0 .. v13}, [Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    :goto_21
    const/16 v1, 0xe

    if-lt v0, v1, :cond_26

    return-object p0

    :cond_26
    aget-object v1, p0, v0

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, p0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_21
.end method

.method static sortRows(Ljava/util/List;I)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;I)V"
        }
    .end annotation

    .line 116
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    new-instance v1, Ljava/util/IdentityHashMap;

    invoke-direct {v1}, Ljava/util/IdentityHashMap;-><init>()V

    new-instance v2, Ljava/util/IdentityHashMap;

    invoke-direct {v2}, Ljava/util/IdentityHashMap;-><init>()V

    const/4 v3, 0x0

    :goto_10
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    if-lt v3, v4, :cond_1f

    new-instance v3, Le/e/a/ListActions$$ExternalSyntheticLambda16;

    invoke-direct {v3, p1, v1, v0, v2}, Le/e/a/ListActions$$ExternalSyntheticLambda16;-><init>(ILjava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    invoke-static {p0, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-void

    :cond_1f
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v5, 0x2

    if-ge p1, v5, :cond_39

    invoke-static {v4}, Le/e/a/HistorySupport;->watched(Ljava/lang/Object;)J

    move-result-wide v5

    :goto_31
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_61

    :cond_39
    const/4 v6, 0x4

    if-ge p1, v6, :cond_41

    invoke-static {v4}, Le/e/a/HistorySupport;->posted(Ljava/lang/Object;)J

    move-result-wide v5

    goto :goto_31

    :cond_41
    const/4 v6, 0x6

    if-ge p1, v6, :cond_4e

    const-string v5, "title"

    invoke-static {v4, v5}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_61

    :cond_4e
    const/16 v6, 0xc

    if-ge p1, v6, :cond_5c

    invoke-static {v4}, Le/e/a/ListActions;->counts(Ljava/lang/Object;)[J

    move-result-object v6

    add-int/lit8 v7, p1, -0x6

    div-int/2addr v7, v5

    aget-wide v5, v6, v7

    goto :goto_31

    :cond_5c
    invoke-static {v4}, Le/e/a/ListActions;->length(Ljava/lang/Object;)J

    move-result-wide v5

    goto :goto_31

    :goto_61
    add-int/lit8 v3, v3, 0x1

    goto :goto_10
.end method

.method private static themeHeader(Landroid/app/Activity;)V
    .registers 5

    .line 109
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "description"

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_14

    const/4 v0, 0x0

    goto :goto_18

    :cond_14
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    :goto_18
    instance-of v1, v0, Landroid/widget/TextView;

    if-eqz v1, :cond_2d

    invoke-static {p0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundColor(I)V

    move-object p0, v0

    check-cast p0, Landroid/widget/TextView;

    invoke-static {v0}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_2d
    return-void
.end method

.method static value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .line 37
    const-string v0, ""

    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "a"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    aput-object p1, v2, v6

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_1f

    goto :goto_23

    :cond_1f
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_23} :catch_23

    :catch_23
    :goto_23
    return-object v0
.end method
