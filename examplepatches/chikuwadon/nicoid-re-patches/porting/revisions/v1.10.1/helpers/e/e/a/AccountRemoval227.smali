.class public final Le/e/a/AccountRemoval227;
.super Ljava/lang/Object;
.source "AccountRemoval227.java"


# static fields
.field static final BUSY:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field static final MAIN:Landroid/os/Handler;

.field static final MEMBER_IDS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/AccountRemoval227;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/AccountRemoval227;->MAIN:Landroid/os/Handler;

    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Le/e/a/AccountRemoval227;->BUSY:Ljava/util/Set;

    .line 6
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/AccountRemoval227;->MEMBER_IDS:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static capture(Ljava/lang/Object;Lorg/json/JSONObject;)V
    .registers 4

    .line 7
    const-string v0, "itemId"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "[0-9]+"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_15

    sget-object v0, Le/e/a/AccountRemoval227;->MEMBER_IDS:Ljava/util/Map;

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_15
    return-void
.end method

.method static confirm(Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 7

    .line 24
    :try_start_0
    const-string v0, "F"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_6} :catch_3a

    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Remove video from this list?"

    const-string v3, "\u5f9e\u6b64\u6e05\u55ae\u79fb\u9664\u5f71\u7247\uff1f"

    const-string v4, "\u3053\u306e\u30ea\u30b9\u30c8\u304b\u3089\u52d5\u753b\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {p0, v4, v2, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string v1, "\u524a\u9664"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/AccountRemoval227$$ExternalSyntheticLambda4;

    invoke-direct {v2, p1, v0}, Le/e/a/AccountRemoval227$$ExternalSyntheticLambda4;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void

    :catch_3a
    move-exception p0

    return-void
.end method

.method public static delete(Ljava/lang/Object;Ljava/util/ArrayList;)Z
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "*>;)Z"
        }
    .end annotation

    .line 18
    const/4 v0, 0x0

    :try_start_1
    const-string v1, "o0"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/app/Activity;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_a} :catch_56

    :try_start_a
    const-string v1, "g0"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_16} :catch_54

    const/16 v2, 0x9

    const/4 v3, 0x2

    const/4 v8, 0x1

    if-ne v1, v2, :cond_1e

    move v1, v3

    goto :goto_24

    :cond_1e
    const/4 v2, 0x5

    if-ne v1, v2, :cond_23

    move v1, v8

    goto :goto_24

    :cond_23
    move v1, v0

    :goto_24
    if-nez v1, :cond_27

    return v0

    :cond_27
    if-ne v1, v3, :cond_2b

    move v4, v8

    goto :goto_2c

    :cond_2b
    move v4, v0

    :goto_2c
    :try_start_2c
    const-string v1, "d0"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_36} :catch_56

    .line 19
    sget-object v0, Le/e/a/AccountRemoval227;->BUSY:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3f

    return v8

    :cond_3f
    invoke-static {v7}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sget-object p1, Le/e/a/AccountRemoval227;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Le/e/a/AccountRemoval227$$ExternalSyntheticLambda5;

    move-object v2, v0

    move-object v6, p0

    invoke-direct/range {v2 .. v7}, Le/e/a/AccountRemoval227$$ExternalSyntheticLambda5;-><init>(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/Object;Landroid/app/Activity;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 22
    return v8

    .line 18
    :catch_54
    move-exception p0

    return v0

    :catch_56
    move-exception p0

    return v0
.end method

.method static error(Ljava/lang/Exception;)Ljava/lang/String;
    .registers 3

    .line 9
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_f

    const-string v1, "HTTP [0-9]{3}( [A-Z][A-Z0-9_]{1,47}(/[A-Z][A-Z0-9_]{1,47})?)?"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f

    goto :goto_17

    :cond_f
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    :goto_17
    return-object v0
.end method

.method static kind(Landroid/app/Activity;)I
    .registers 4

    .line 10
    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "E"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p0
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_f} :catch_1a

    const/16 v1, 0x9

    if-ne p0, v1, :cond_15

    const/4 v0, 0x2

    goto :goto_19

    :cond_15
    const/4 v1, 0x5

    if-ne p0, v1, :cond_19

    const/4 v0, 0x1

    :cond_19
    :goto_19
    return v0

    :catch_1a
    move-exception p0

    return v0
.end method

.method static synthetic lambda$0(Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/Object;Landroid/app/Activity;)V
    .registers 14

    .line 20
    const-string v0, ""

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v6

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_24

    .line 21
    sget-object p1, Le/e/a/AccountRemoval227;->MAIN:Landroid/os/Handler;

    new-instance p2, Le/e/a/AccountRemoval227$$ExternalSyntheticLambda3;

    move-object v1, p2

    move-object v2, p3

    move-object v4, p4

    move-object v5, p0

    invoke-direct/range {v1 .. v6}, Le/e/a/AccountRemoval227$$ExternalSyntheticLambda3;-><init>(Ljava/lang/Object;Ljava/util/ArrayList;Landroid/app/Activity;Ljava/util/ArrayList;[Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 22
    return-void

    .line 20
    :cond_24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v4, 0x0

    if-eqz p1, :cond_34

    :try_start_2c
    invoke-static {v2, p2, v1}, Le/e/a/AccountRemoval227;->path(ZLjava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/WatchLater245;->remove(Ljava/lang/String;)V

    goto :goto_42

    :cond_34
    invoke-static {v4, p2, v1}, Le/e/a/AccountRemoval227;->path(ZLjava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const-string v7, "DELETE"

    new-instance v8, Le/e/a/NetworkTask;

    invoke-direct {v8}, Le/e/a/NetworkTask;-><init>()V

    invoke-static {v5, v7, v2, v8}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    :goto_42
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_45} :catch_46

    goto :goto_f

    :catch_46
    move-exception v1

    invoke-static {v1}, Le/e/a/AccountRemoval227;->error(Ljava/lang/Exception;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v6, v4

    new-instance v1, Ljava/lang/StringBuilder;

    if-eqz p1, :cond_54

    const-string v2, "Watch-later"

    goto :goto_56

    :cond_54
    const-string v2, "Mylist"

    :goto_56
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " membership delete failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget-object v2, v6, v4

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    const-string v2, "nicoid-mylist"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_f
.end method

.method static synthetic lambda$1(Ljava/lang/Object;Ljava/util/ArrayList;Landroid/app/Activity;Ljava/util/ArrayList;[Ljava/lang/String;)V
    .registers 6

    .line 21
    sget-object v0, Le/e/a/AccountRemoval227;->BUSY:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :try_start_5
    const-string v0, "a0"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    const-string v0, "p0"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    invoke-virtual {p2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_81

    invoke-static {p0}, Le/e/a/BulkSelection;->refresh(Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-ne p1, p3, :cond_32

    invoke-static {p0}, Le/e/a/BulkSelection;->done(Ljava/lang/Object;)V

    goto :goto_81

    :cond_32
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "\u524a\u9664\u3067\u304d\u306a\u304b\u3063\u305f\u52d5\u753b\u306f\u30ea\u30b9\u30c8\u306b\u6b8b\u3057\u3066\u3044\u307e\u3059"

    const-string p3, "Videos that could not be removed remain in the list"

    const-string v0, "\u672a\u80fd\u79fb\u9664\u7684\u5f71\u7247\u4ecd\u4fdd\u7559\u5728\u6e05\u55ae\u4e2d"

    invoke-static {p2, p1, p3, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    aget-object p3, p4, p1

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_51

    const-string p1, ""

    goto :goto_68

    :cond_51
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, " ("

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object p1, p4, p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, ")"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_68
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x1

    invoke-static {p2, p0, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_78
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_78} :catch_79

    goto :goto_81

    :catch_79
    move-exception p0

    const-string p1, "nicoid-mylist"

    const-string p2, "Cannot refresh membership deletion"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_81
    :goto_81
    return-void
.end method

.method static synthetic lambda$2(Ljava/lang/Object;Ljava/lang/Object;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 24
    :try_start_0
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p2, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {p1, p2}, Le/e/a/AccountRemoval227;->delete(Ljava/lang/Object;Ljava/util/ArrayList;)Z
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_b} :catch_c

    goto :goto_14

    :catch_c
    move-exception p0

    const-string p1, "nicoid-mylist"

    const-string p2, "Cannot select membership"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_14
    return-void
.end method

.method static membershipId(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    .line 8
    sget-object v0, Le/e/a/AccountRemoval227;->MEMBER_IDS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_b

    goto :goto_11

    :cond_b
    const-string v0, "item_id"

    invoke-static {p0, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_11
    return-object v0
.end method

.method static path(ZLjava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 13
    invoke-static {p2}, Le/e/a/AccountRemoval227;->membershipId(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 14
    const-string v0, "[0-9]+"

    invoke-virtual {p2, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4a

    if-nez p0, :cond_14

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4a

    .line 15
    :cond_14
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://nvapi.nicovideo.jp/v1/users/me/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p0, :cond_20

    const-string p0, "watch-later?itemIds="

    goto :goto_39

    :cond_20
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "mylists/"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "/items?itemIds="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_39
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {p2}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 14
    :cond_4a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Invalid membership identifier"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static skip(Landroid/app/Activity;Ljava/lang/CharSequence;)Z
    .registers 3

    .line 11
    invoke-static {p0}, Le/e/a/AccountRemoval227;->kind(Landroid/app/Activity;)I

    move-result p0

    if-lez p0, :cond_1e

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x2

    if-ne p0, v0, :cond_10

    const-string p0, "\u3068\u308a\u3042\u3048\u305a\u30de\u30a4\u30ea\u30b9\u30c8\u767b\u9332"

    goto :goto_12

    :cond_10
    const-string p0, "\u30de\u30a4\u30ea\u30b9\u30c8\u767b\u9332"

    :goto_12
    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1e

    const/4 p0, 0x1

    return p0

    :cond_1e
    const/4 p0, 0x0

    return p0
.end method
