.class public final Le/e/a/LocalPlaylists;
.super Ljava/lang/Object;
.source "LocalPlaylists.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/LocalPlaylists$Edit;,
        Le/e/a/LocalPlaylists$Page;
    }
.end annotation


# static fields
.field private static final ADAPTER_PAGES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Le/e/a/LocalPlaylists$Page;",
            ">;"
        }
    .end annotation
.end field

.field private static final KEY:Ljava/lang/String; = "nicoid_local_playlists_v1"

.field private static final MAIN:Landroid/os/Handler;

.field private static final PAGES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/Activity;",
            "Le/e/a/LocalPlaylists$Page;",
            ">;"
        }
    .end annotation
.end field

.field private static final WRITES:Ljava/util/concurrent/ExecutorService;

.field static readModel:Le/e/a/LocalPlaylistData;

.field static readSnapshot:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 6
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/LocalPlaylists;->PAGES:Ljava/util/Map;

    .line 7
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/LocalPlaylists;->ADAPTER_PAGES:Ljava/util/Map;

    .line 10
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/LocalPlaylists;->WRITES:Ljava/util/concurrent/ExecutorService;

    .line 11
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/LocalPlaylists;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static add(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11

    .line 18
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Le/e/a/LocalPlaylists;->add(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method private static add(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 14

    .line 20
    new-instance v7, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda39;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda39;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x0

    invoke-static {p0, p1, v7}, Le/e/a/LocalPlaylists;->choose(Landroid/content/Context;Ljava/lang/String;Ljava/util/function/Consumer;)V

    return-void
.end method

.method public static addRow(Landroid/content/Context;Ljava/lang/Object;)V
    .registers 9

    .line 19
    :try_start_0
    const-string v0, "y"

    invoke-static {p1, v0}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_a} :catch_b

    goto :goto_e

    :catch_b
    move-exception v0

    const-string v0, ""

    :goto_e
    move-object v4, v0

    const-string v0, "videourl"

    invoke-static {p1, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v0, "title"

    invoke-static {p1, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "thumbnail"

    invoke-static {p1, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v1, p0

    move-object v6, p1

    invoke-static/range {v1 .. v6}, Le/e/a/LocalPlaylists;->add(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public static back(Landroid/app/Activity;)Z
    .registers 5

    .line 29
    sget-object v0, Le/e/a/LocalPlaylists;->PAGES:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/LocalPlaylists$Page;

    const/4 v0, 0x0

    if-nez p0, :cond_c

    return v0

    :cond_c
    iget-boolean v1, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_1c

    iput-boolean v0, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->selectionChanged()V

    return v2

    :cond_1c
    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    const/4 v3, 0x0

    if-eqz v1, :cond_27

    iput-object v3, p0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return v2

    :cond_27
    iget-object v1, p0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    if-eqz v1, :cond_31

    iput-object v3, p0, Le/e/a/LocalPlaylists$Page;->group:Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    return v2

    :cond_31
    return v0
.end method

.method static change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Le/e/a/LocalPlaylists$Edit;",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 13
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Le/e/a/LocalPlaylists;->WRITES:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda20;

    invoke-direct {v2, v0, p1, p0, p2}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda20;-><init>(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Landroid/content/Context;Ljava/util/function/Consumer;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method static choose(Landroid/content/Context;Ljava/lang/String;Ljava/util/function/Consumer;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 15
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    :try_start_4
    invoke-static {p0}, Le/e/a/LocalPlaylists;->read(Landroid/content/Context;)Le/e/a/LocalPlaylistData;

    move-result-object v1
    :try_end_8
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_8} :catch_a0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const-string v4, ""

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2a

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v4, "Playlists"

    const-string v5, "\u64ad\u653e\u6e05\u55ae"

    const-string v6, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8"

    invoke-static {v0, v6, v4, v5}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2a
    const/4 v4, 0x0

    move v5, v4

    :goto_2c
    iget-object v6, v1, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lt v5, v6, :cond_7b

    const-string p1, "Create playlist"

    const-string v1, "\u5efa\u7acb\u64ad\u653e\u6e05\u55ae"

    const-string v5, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u3092\u4f5c\u6210"

    invoke-static {v0, v5, p1, v1}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v1, "Select playlist"

    const-string v5, "\u9078\u64c7\u64ad\u653e\u6e05\u55ae"

    const-string v6, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u3092\u9078\u629e"

    invoke-static {v0, v6, v1, v5}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-array v1, v4, [Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/CharSequence;

    new-instance v3, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda32;

    invoke-direct {v3, v2, p2, p0}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda32;-><init>(Ljava/util/ArrayList;Ljava/util/function/Consumer;Landroid/content/Context;)V

    invoke-virtual {p1, v1, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "Cancel"

    const-string p2, "\u53d6\u6d88"

    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v0, v1, p1, p2}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void

    :cond_7b
    iget-object v6, v1, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v6, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "id"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_9d

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v7, "name"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_9d
    add-int/lit8 v5, v5, 0x1

    goto :goto_2c

    :catch_a0
    move-exception p1

    const-string p1, "Unable to read playlists. Stored data has been retained."

    const-string p2, "\u7121\u6cd5\u8b80\u53d6\u64ad\u653e\u6e05\u55ae\uff0c\u539f\u6709\u8cc7\u6599\u5df2\u4fdd\u7559"

    const-string v0, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u3092\u8aad\u307f\u8fbc\u3081\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u4fdd\u5b58\u6e08\u307f\u306e\u30c7\u30fc\u30bf\u306f\u4fdd\u6301\u3057\u3066\u3044\u307e\u3059"

    invoke-static {p0, v0, p1, p2}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static confirmFolderDelete(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 9

    .line 16
    if-eqz p1, :cond_6d

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_6d

    :cond_9
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Delete playlist?"

    const-string v3, "\u522a\u9664\u64ad\u653e\u6e05\u55ae\uff1f"

    const-string v4, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {v0, v4, v2, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {v2, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p2, "\n"

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v2, "Videos in this folder will move to Unfiled."

    const-string v3, "\u8cc7\u6599\u593e\u4e2d\u7684\u5f71\u7247\u6703\u79fb\u81f3\u672a\u5206\u985e\u3002"

    const-string v4, "\u30ea\u30b9\u30c8\u5185\u306e\u52d5\u753b\u306f\u672a\u5206\u985e\u306b\u79fb\u52d5\u3057\u307e\u3059\u3002"

    invoke-static {v0, v4, v2, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const-string v1, "Delete"

    const-string v2, "\u522a\u9664"

    const-string v3, "\u524a\u9664"

    invoke-static {v0, v3, v1, v2}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda36;

    invoke-direct {v2, p0, p1, p3}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda36;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;)V

    invoke-virtual {p2, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "Cancel"

    const-string p2, "\u53d6\u6d88"

    const-string p3, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v0, p3, p1, p2}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    :cond_6d
    :goto_6d
    return-void
.end method

.method static create(Landroid/content/Context;Ljava/util/function/Consumer;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 17
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v2

    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setSingleLine(Z)V

    const-string v0, "Playlist name"

    const-string v3, "\u64ad\u653e\u6e05\u55ae\u540d\u7a31"

    const-string v4, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u540d"

    invoke-static {v2, v4, v0, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-static {v2}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v3, "Create playlist"

    const-string v4, "\u5efa\u7acb\u64ad\u653e\u6e05\u55ae"

    const-string v5, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u3092\u4f5c\u6210"

    invoke-static {v2, v5, v3, v4}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v3, "Create"

    const-string v4, "\u5efa\u7acb"

    const-string v5, "\u4f5c\u6210"

    invoke-static {v2, v5, v3, v4}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v3, "Cancel"

    const-string v5, "\u53d6\u6d88"

    const-string v6, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v2, v6, v3, v5}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    invoke-static {v3}, Le/e/a/PlaybackSession;->showForm(Landroid/app/AlertDialog;)V

    const/4 v0, -0x1

    invoke-virtual {v3, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v6

    new-instance v7, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda38;

    move-object v0, v7

    move-object v4, p0

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda38;-><init>(Landroid/widget/EditText;Landroid/content/Context;Landroid/app/AlertDialog;Landroid/content/Context;Ljava/util/function/Consumer;)V

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public static destroy(Landroid/app/Activity;)V
    .registers 3

    .line 23
    sget-object v0, Le/e/a/LocalPlaylists;->PAGES:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/LocalPlaylists;->ADAPTER_PAGES:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    new-instance v1, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda33;

    invoke-direct {v1, p0}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda33;-><init>(Landroid/app/Activity;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->removeIf(Ljava/util/function/Predicate;)Z

    return-void
.end method

.method static hasAdapter(Ljava/lang/Object;)Z
    .registers 2

    .line 25
    sget-object v0, Le/e/a/LocalPlaylists;->ADAPTER_PAGES:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static home(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    .registers 3

    .line 28
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x102002c

    if-ne p1, v0, :cond_11

    invoke-static {p0}, Le/e/a/LocalPlaylists;->back(Landroid/app/Activity;)Z

    move-result p0

    if-eqz p0, :cond_11

    const/4 p0, 0x1

    return p0

    :cond_11
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic lambda$0(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Landroid/content/Context;Ljava/util/function/Consumer;)V
    .registers 5

    .line 13
    :try_start_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    new-instance v0, Le/e/a/LocalPlaylists$1;

    invoke-direct {v0, p0}, Le/e/a/LocalPlaylists$1;-><init>(Landroid/content/SharedPreferences;)V

    invoke-static {v0, p1}, Le/e/a/PlaylistStorage;->update(Le/e/a/PlaylistStorage$Persistence;Le/e/a/PlaylistStorage$Edit;)Z

    move-result p0
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_d} :catch_e

    goto :goto_17

    :catch_e
    move-exception p0

    const-string p1, "nicoid-playlist"

    const-string v0, "Playlist update failed; original snapshot retained"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    :goto_17
    sget-object p1, Le/e/a/LocalPlaylists;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda37;

    invoke-direct {v0, p2, p0, p3}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda37;-><init>(Landroid/content/Context;ZLjava/util/function/Consumer;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$1(Landroid/content/Context;ZLjava/util/function/Consumer;)V
    .registers 6

    .line 13
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_14

    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_13

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_13
    return-void

    :cond_14
    if-nez p1, :cond_28

    const-string v0, "Unable to save. Stored data has been retained."

    const-string v1, "\u5132\u5b58\u5931\u6557\uff0c\u539f\u6709\u8cc7\u6599\u5df2\u4fdd\u7559"

    const-string v2, "\u4fdd\u5b58\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u4fdd\u5b58\u6e08\u307f\u306e\u30c7\u30fc\u30bf\u306f\u4fdd\u6301\u3057\u3066\u3044\u307e\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_28
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-interface {p2, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$10(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Le/e/a/LocalPlaylistData;)V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 20
    move-object v0, p6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Le/e/a/LocalPlaylistData;->add(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p1}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p5, :cond_79

    const/4 p2, 0x0

    move p3, p2

    :goto_11
    iget-object p4, p6, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {p4}, Lorg/json/JSONArray;->length()I

    move-result p4

    if-lt p3, p4, :cond_1a

    goto :goto_79

    :cond_1a
    iget-object p4, p6, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {p4, p3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p4

    const-string v0, "folder"

    invoke-virtual {p4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_76

    const-string v0, "videoId"

    invoke-virtual {p4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_76

    const-string v0, "length"

    const-string v1, "videoinfo"

    const-string v2, "posttime"

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    move v1, p2

    :goto_43
    const/4 v3, 0x3

    if-lt v1, v3, :cond_6a

    invoke-static {p5, p2}, Le/e/a/VideoRows191;->posted(Ljava/lang/Object;Z)J

    move-result-wide v0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-gtz v5, :cond_60

    invoke-static {p5, v2}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "\u6295\u7a3f"

    invoke-virtual {v2, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_60

    invoke-static {v2}, Le/e/a/VideoRows191;->millis(Ljava/lang/String;)J

    move-result-wide v0

    :cond_60
    cmp-long v2, v0, v3

    if-lez v2, :cond_76

    const-string v2, "postedAt"

    invoke-virtual {p4, v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto :goto_76

    :cond_6a
    aget-object v3, v0, v1

    invoke-static {p5, v3}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p4, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    add-int/lit8 v1, v1, 0x1

    goto :goto_43

    :cond_76
    :goto_76
    add-int/lit8 p3, p3, 0x1

    goto :goto_11

    :cond_79
    :goto_79
    return-void
.end method

.method static synthetic lambda$11(Landroid/content/Context;Ljava/lang/Boolean;)V
    .registers 4

    .line 20
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_18

    const-string p1, "Added to playlist"

    const-string v0, "\u5df2\u52a0\u5165\u64ad\u653e\u6e05\u55ae"

    const-string v1, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u306b\u8ffd\u52a0\u3057\u307e\u3057\u305f"

    invoke-static {p0, v1, p1, v0}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_18
    return-void
.end method

.method static synthetic lambda$12(Landroid/app/Activity;Ljava/util/Map$Entry;)Z
    .registers 2

    .line 23
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/LocalPlaylists$Page;

    iget-object p1, p1, Le/e/a/LocalPlaylists$Page;->a:Landroid/app/Activity;

    if-ne p1, p0, :cond_c

    const/4 p0, 0x1

    goto :goto_d

    :cond_c
    const/4 p0, 0x0

    :goto_d
    return p0
.end method

.method static synthetic lambda$13(Le/e/a/LocalPlaylists$Page;)V
    .registers 5

    .line 30
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_10

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->selectionChanged()V

    return-void

    :cond_10
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    const-string v3, "id"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_6
.end method

.method static synthetic lambda$14(Le/e/a/LocalPlaylists$Page;)V
    .registers 2

    .line 30
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->selectionChanged()V

    return-void
.end method

.method static synthetic lambda$16(Le/e/a/LocalPlaylists$Page;Landroid/view/MenuItem;)Z
    .registers 2

    .line 30
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Le/e/a/LocalPlaylists$Page;->createItem(Z)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$17(Le/e/a/LocalPlaylists$Page;Landroid/view/MenuItem;)Z
    .registers 2

    .line 30
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Le/e/a/LocalPlaylists$Page;->createItem(Z)V

    return p1
.end method

.method static synthetic lambda$18(Le/e/a/LocalPlaylists$Page;Landroid/view/MenuItem;)Z
    .registers 2

    .line 30
    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->deleteFolder()V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$19(Le/e/a/LocalPlaylists$Page;Landroid/view/MenuItem;)Z
    .registers 2

    .line 30
    const/4 p1, 0x1

    iput-boolean p1, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->selectionChanged()V

    return p1
.end method

.method static synthetic lambda$2(Ljava/util/ArrayList;Ljava/util/function/Consumer;Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 15
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-ge p4, p3, :cond_10

    invoke-virtual {p0, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-interface {p1, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    goto :goto_13

    :cond_10
    invoke-static {p2, p1}, Le/e/a/LocalPlaylists;->create(Landroid/content/Context;Ljava/util/function/Consumer;)V

    :goto_13
    return-void
.end method

.method static synthetic lambda$3(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 16
    new-instance p3, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda28;

    invoke-direct {p3, p1}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda28;-><init>(Ljava/lang/String;)V

    new-instance p1, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda29;

    invoke-direct {p1, p2}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda29;-><init>(Ljava/lang/Runnable;)V

    invoke-static {p0, p3, p1}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method static synthetic lambda$4(Ljava/lang/String;Le/e/a/LocalPlaylistData;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 16
    invoke-virtual {p1, p0}, Le/e/a/LocalPlaylistData;->removeFolder(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$5(Ljava/lang/Runnable;Ljava/lang/Boolean;)V
    .registers 2

    .line 16
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_9

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_9
    return-void
.end method

.method static synthetic lambda$6(Landroid/widget/EditText;Landroid/content/Context;Landroid/app/AlertDialog;Landroid/content/Context;Ljava/util/function/Consumer;Landroid/view/View;)V
    .registers 7

    .line 17
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_20

    const-string p2, "Enter a name"

    const-string p3, "\u8acb\u8f38\u5165\u540d\u7a31"

    const-string p4, "\u540d\u524d\u3092\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p1, p4, p2, p3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    :cond_20
    const/4 p0, -0x1

    invoke-virtual {p2, p0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    const/4 p0, 0x1

    new-array p0, p0, [Ljava/lang/String;

    new-instance p1, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda30;

    invoke-direct {p1, p0, p5}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda30;-><init>([Ljava/lang/String;Ljava/lang/String;)V

    new-instance p5, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda31;

    invoke-direct {p5, p2, p4, p0}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda31;-><init>(Landroid/app/AlertDialog;Ljava/util/function/Consumer;[Ljava/lang/String;)V

    invoke-static {p3, p1, p5}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method static synthetic lambda$7([Ljava/lang/String;Ljava/lang/String;Le/e/a/LocalPlaylistData;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 17
    const/4 v0, 0x0

    invoke-virtual {p2, p1}, Le/e/a/LocalPlaylistData;->folder(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, p0, v0

    return-void
.end method

.method static synthetic lambda$8(Landroid/app/AlertDialog;Ljava/util/function/Consumer;[Ljava/lang/String;Ljava/lang/Boolean;)V
    .registers 6

    .line 17
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    if-eqz p3, :cond_18

    invoke-virtual {p0}, Landroid/app/AlertDialog;->dismiss()V

    const/4 p0, 0x0

    aget-object p0, p2, p0

    invoke-interface {p1, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    :cond_18
    return-void
.end method

.method static synthetic lambda$9(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 15

    .line 20
    new-instance v7, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda34;

    move-object v0, v7

    move-object v1, p6

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda34;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p1, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda35;

    invoke-direct {p1, p0}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda35;-><init>(Landroid/content/Context;)V

    invoke-static {p0, v7, p1}, Le/e/a/LocalPlaylists;->change(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Ljava/util/function/Consumer;)V

    return-void
.end method

.method public static loadOrFeed(Landroid/app/Activity;)V
    .registers 6

    .line 32
    invoke-static {p0}, Le/e/a/LocalPlaylists;->open(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_32

    invoke-static {p0}, Le/e/a/ChannelPage;->open(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_32

    :cond_d
    :try_start_d
    const-string v0, "e.e.a.FollowFeed"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "load"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Landroid/app/Activity;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_29} :catch_2a

    goto :goto_32

    :catch_2a
    move-exception p0

    const-string v0, "nicoid-page"

    const-string v1, "Unable to open page"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_32
    :goto_32
    return-void
.end method

.method public static menu(Landroid/content/Context;Ljava/util/ArrayList;)V
    .registers 12

    .line 33
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-string v2, "\u8ffd\u8e64\u4e2d"

    const-string v3, "Following"

    const-string v4, "\u30d5\u30a9\u30ed\u30fc\u4e2d"

    const-string v5, "intent"

    const-string v6, "title"

    if-nez v1, :cond_b9

    const/4 v1, 0x0

    move v0, v1

    :goto_16
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lt v0, v7, :cond_1d

    return-void

    :cond_1d
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    instance-of v8, v7, Ljava/util/Map;

    if-nez v8, :cond_27

    :cond_25
    goto/16 :goto_b5

    :cond_27
    check-cast v7, Ljava/util/Map;

    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    const-string v9, "\u30d5\u30a9\u30ed\u30fc\u4e2d\u306e\u30e6\u30fc\u30b6\u30fc"

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3c

    invoke-static {p0, v4, v3, v2}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3c
    invoke-interface {v7, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    instance-of v8, v7, Landroid/content/Intent;

    if-eqz v8, :cond_25

    check-cast v7, Landroid/content/Intent;

    invoke-virtual {v7}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v8

    if-nez v8, :cond_4f

    const-string v8, ""

    goto :goto_57

    :cond_4f
    invoke-virtual {v7}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v8

    :goto_57
    const-string v9, "NicoidVideoListActivity"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_25

    const/4 v8, -0x1

    const-string v9, "type"

    invoke-virtual {v7, v9, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    const/16 v8, 0x8

    if-ne v7, v8, :cond_25

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v3, "Playlists"

    const-string v4, "\u64ad\u653e\u6e05\u55ae"

    const-string v7, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8"

    invoke-static {p0, v7, v3, v4}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "Video lists saved on this device"

    const-string v4, "\u5132\u5b58\u5728\u6b64\u88dd\u7f6e\u7684\u5f71\u7247\u6e05\u55ae"

    const-string v6, "\u672c\u4f53\u306b\u4fdd\u5b58\u3057\u305f\u52d5\u753b\u306e\u30ea\u30b9\u30c8"

    invoke-static {p0, v6, v3, v4}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "subtitle"

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "islabel"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v2, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v3, "com.sauzask.nicoid.NicoidNicorepoActivity"

    invoke-virtual {v1, p0, v3}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string v1, "nicoid_local_playlists"

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    invoke-interface {v2, v5, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/2addr v0, v3

    invoke-virtual {p1, v0, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    return-void

    :goto_b5
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_16

    :cond_b9
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    instance-of v7, v1, Ljava/util/Map;

    if-nez v7, :cond_c3

    goto/16 :goto_4

    :cond_c3
    check-cast v1, Ljava/util/Map;

    invoke-interface {v1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    instance-of v7, v5, Landroid/content/Intent;

    if-eqz v7, :cond_4

    check-cast v5, Landroid/content/Intent;

    invoke-virtual {v5}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v7

    if-eqz v7, :cond_4

    invoke-virtual {v5}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v5

    const-string v7, "NicoidFavUserActivity"

    invoke-virtual {v5, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-static {p0, v4, v3, v2}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_4
.end method

.method public static menuOrFeed(Landroid/app/Activity;Landroid/view/Menu;)Z
    .registers 8

    .line 31
    invoke-static {p0, p1}, Le/e/a/LocalPlaylists;->options(Landroid/app/Activity;Landroid/view/Menu;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    return v1

    :cond_8
    const/4 v0, 0x0

    :try_start_9
    const-string v2, "e.e.a.FollowFeed"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "menu"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const-class v5, Landroid/app/Activity;

    aput-object v5, v4, v0

    const-class v5, Landroid/view/Menu;

    aput-object v5, v4, v1

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {v1, p1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_2f} :catch_30

    return p0

    :catch_30
    move-exception p0

    return v0
.end method

.method public static open(Landroid/app/Activity;)Z
    .registers 6

    .line 22
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "nicoid_local_playlists"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_e

    return v2

    :cond_e
    sget-object v0, Le/e/a/LocalPlaylists;->PAGES:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/LocalPlaylists$Page;

    if-nez v0, :cond_22

    new-instance v0, Le/e/a/LocalPlaylists$Page;

    invoke-direct {v0, p0}, Le/e/a/LocalPlaylists$Page;-><init>(Landroid/app/Activity;)V

    sget-object v1, Le/e/a/LocalPlaylists;->PAGES:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_22
    const/4 v1, 0x1

    :try_start_23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "y"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    iget-object v4, v0, Le/e/a/LocalPlaylists$Page;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v3, p0, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "H"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, p0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "I"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0, v1}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_4c} :catch_4d

    goto :goto_55

    :catch_4d
    move-exception p0

    const-string v2, "nicoid-playlist"

    const-string v3, "Unable to prepare playlist page"

    invoke-static {v2, v3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_55
    invoke-virtual {v0}, Le/e/a/LocalPlaylists$Page;->render()V

    return v1
.end method

.method public static options(Landroid/app/Activity;Landroid/view/Menu;)Z
    .registers 7

    .line 30
    sget-object v0, Le/e/a/LocalPlaylists;->PAGES:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/LocalPlaylists$Page;

    if-nez v0, :cond_c

    const/4 p0, 0x0

    return p0

    :cond_c
    iget-boolean v1, v0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_27

    new-instance v1, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda21;

    invoke-direct {v1, v0}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda21;-><init>(Le/e/a/LocalPlaylists$Page;)V

    new-instance v3, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda22;

    invoke-direct {v3, v0}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda22;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda23;

    invoke-direct {v4, v0}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda23;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-static {p1, p0, v1, v3, v4}, Le/e/a/SelectionUi191;->menu(Landroid/view/Menu;Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    return v2

    :cond_27
    const-string v1, "Create playlist"

    const-string v3, "\u5efa\u7acb\u64ad\u653e\u6e05\u55ae"

    const-string v4, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u4f5c\u6210"

    invoke-static {p0, v4, v1, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v1

    new-instance v3, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda24;

    invoke-direct {v3, v0}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda24;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    const-string v1, "Create folder"

    const-string v3, "\u5efa\u7acb\u8cc7\u6599\u593e"

    const-string v4, "\u30d5\u30a9\u30eb\u30c0\u30fc\u4f5c\u6210"

    invoke-static {p0, v4, v1, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v1

    new-instance v3, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda25;

    invoke-direct {v3, v0}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda25;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    iget-object v1, v0, Le/e/a/LocalPlaylists$Page;->folder:Ljava/lang/String;

    if-eqz v1, :cond_83

    const-string v1, "Delete playlist"

    const-string v3, "\u522a\u9664\u64ad\u653e\u6e05\u55ae"

    const-string v4, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u3092\u524a\u9664"

    invoke-static {p0, v4, v1, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v1

    new-instance v3, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda26;

    invoke-direct {v3, v0}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda26;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    const-string v1, "Select multiple"

    const-string v3, "\u9078\u53d6\u591a\u500b"

    const-string v4, "\u8907\u6570\u9078\u629e"

    invoke-static {p0, v4, v1, v3}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p0

    new-instance p1, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda27;

    invoke-direct {p1, v0}, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda27;-><init>(Le/e/a/LocalPlaylists$Page;)V

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    :cond_83
    return v2
.end method

.method static read(Landroid/content/Context;)Le/e/a/LocalPlaylistData;
    .registers 3

    .line 9
    :try_start_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "nicoid_local_playlists_v1"

    const-string v1, "{}"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Le/e/a/LocalPlaylists;->readModel:Le/e/a/LocalPlaylistData;

    if-eqz v0, :cond_1b

    sget-object v0, Le/e/a/LocalPlaylists;->readSnapshot:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    sget-object p0, Le/e/a/LocalPlaylists;->readModel:Le/e/a/LocalPlaylistData;

    return-object p0

    :cond_1b
    new-instance v0, Le/e/a/LocalPlaylistData;

    invoke-direct {v0, p0}, Le/e/a/LocalPlaylistData;-><init>(Ljava/lang/String;)V

    sput-object p0, Le/e/a/LocalPlaylists;->readSnapshot:Ljava/lang/String;

    sput-object v0, Le/e/a/LocalPlaylists;->readModel:Le/e/a/LocalPlaylistData;
    :try_end_24
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_24} :catch_25

    return-object v0

    :catch_25
    move-exception p0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid local playlist store"

    invoke-direct {v0, v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method static registerAdapter(Ljava/lang/Object;Le/e/a/LocalPlaylists$Page;)V
    .registers 3

    .line 24
    sget-object v0, Le/e/a/LocalPlaylists;->ADAPTER_PAGES:Ljava/util/Map;

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static show(Landroid/content/Context;)V
    .registers 2

    .line 21
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_13

    sget-object v0, Le/e/a/LocalPlaylists;->PAGES:Ljava/util/Map;

    check-cast p0, Landroid/app/Activity;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/LocalPlaylists$Page;

    if-eqz p0, :cond_13

    invoke-virtual {p0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_13
    return-void
.end method

.method static superLong(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 7

    .line 26
    sget-object v0, Le/e/a/LocalPlaylists;->ADAPTER_PAGES:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/LocalPlaylists$Page;

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p0, :cond_42

    iget-boolean v2, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    if-eqz v2, :cond_11

    goto :goto_42

    :cond_11
    const-string v2, "videourl"

    invoke-static {p1, v2}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page;->visible:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_24

    return v0

    :cond_24
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    const-string v4, "url"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1d

    iput-boolean v1, p0, Le/e/a/LocalPlaylists$Page;->selecting:Z

    const-string p1, "id"

    invoke-virtual {v3, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/LocalPlaylists$Page;->toggle(Ljava/lang/String;)V

    return v1

    :cond_42
    :goto_42
    if-eqz p0, :cond_45

    return v1

    :cond_45
    return v0
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 8
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static withAdapterMode(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Runnable;)V
    .registers 10

    .line 27
    const-string p0, "Unable to restore folder playback mode"

    const-string v0, "nicoid-playlist"

    sget-object v1, Le/e/a/LocalPlaylists;->ADAPTER_PAGES:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/LocalPlaylists$Page;

    if-eqz p1, :cond_5a

    iget-boolean v1, p1, Le/e/a/LocalPlaylists$Page;->continuous:Z

    if-nez v1, :cond_17

    iget-boolean v1, p1, Le/e/a/LocalPlaylists$Page;->shuffle:Z

    if-nez v1, :cond_17

    goto :goto_5a

    :cond_17
    :try_start_17
    const-string v1, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "I"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const-string v3, "J"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v5

    const/4 v6, 0x1

    invoke-virtual {v2, v3, v6}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_36} :catch_54

    :try_start_36
    iget-boolean p1, p1, Le/e/a/LocalPlaylists$Page;->shuffle:Z

    invoke-static {p1, p2}, Le/e/a/PlaylistPlayback;->withMode(ZLjava/lang/Runnable;)V
    :try_end_3b
    .catchall {:try_start_36 .. :try_end_3b} :catchall_47

    :try_start_3b
    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    invoke-virtual {v1, v3, v5}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_41} :catch_42

    goto :goto_46

    :catch_42
    move-exception p1

    invoke-static {v0, p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_46
    return-void

    :catchall_47
    move-exception p1

    :try_start_48
    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    invoke-virtual {v1, v3, v5}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_4e} :catch_4f

    goto :goto_53

    :catch_4f
    move-exception p2

    invoke-static {v0, p0, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_53
    throw p1

    :catch_54
    move-exception p0

    const-string p1, "Unable to apply folder playback mode"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5a
    :goto_5a
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void
.end method
