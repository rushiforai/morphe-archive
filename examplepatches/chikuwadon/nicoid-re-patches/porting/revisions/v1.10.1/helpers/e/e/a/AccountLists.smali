.class public final Le/e/a/AccountLists;
.super Ljava/lang/Object;
.source "AccountLists.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/AccountLists$Created;
    }
.end annotation


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/AccountLists;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/AccountLists;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static create(Landroid/app/Activity;Le/e/a/AccountLists$Created;)V
    .registers 11

    .line 10
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->insetContent(Landroid/view/View;)V

    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setSingleLine(Z)V

    const-string v3, "Folder name"

    const-string v4, "\u8cc7\u6599\u593e\u540d\u7a31"

    const-string v5, "\u30d5\u30a9\u30eb\u30c0\u30fc\u540d"

    invoke-static {v2, v5, v3, v4}, Le/e/a/AccountLists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/CheckBox;

    invoke-direct {v3, v2}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v4, "Public"

    const-string v5, "\u516c\u958b"

    const-string v6, "\u516c\u958b\u3059\u308b"

    invoke-static {v2, v6, v4, v5}, Le/e/a/AccountLists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {v2}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const-string v5, "Create folder"

    const-string v6, "\u5efa\u7acb\u8cc7\u6599\u593e"

    const-string v7, "\u30d5\u30a9\u30eb\u30c0\u30fc\u3092\u4f5c\u6210"

    invoke-static {v2, v7, v5, v6}, Le/e/a/AccountLists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v4, "Create"

    const-string v5, "\u5efa\u7acb"

    const-string v6, "\u4f5c\u6210"

    invoke-static {v2, v6, v4, v5}, Le/e/a/AccountLists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v4, "Cancel"

    const-string v6, "\u53d6\u6d88"

    const-string v7, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v2, v7, v4, v6}, Le/e/a/AccountLists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    invoke-static {v4}, Le/e/a/PlaybackSession;->showForm(Landroid/app/AlertDialog;)V

    const/4 v0, -0x1

    invoke-virtual {v4, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v7

    new-instance v8, Le/e/a/AccountLists$$ExternalSyntheticLambda0;

    move-object v0, v8

    move-object v5, p0

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Le/e/a/AccountLists$$ExternalSyntheticLambda0;-><init>(Landroid/widget/EditText;Landroid/content/Context;Landroid/widget/CheckBox;Landroid/app/AlertDialog;Landroid/app/Activity;Le/e/a/AccountLists$Created;)V

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Object;Landroid/app/Activity;Ljava/lang/String;)V
    .registers 13

    .line 7
    const-string v0, "id"

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :try_start_8
    const-string v2, "https://nvapi.nicovideo.jp/v1/users/me/mylists?sampleItemCount=3"

    const-string v3, "GET"

    new-instance v4, Le/e/a/NetworkTask;

    invoke-direct {v4}, Le/e/a/NetworkTask;-><init>()V

    const/4 v6, 0x1

    invoke-static {v2, v3, v6, v4}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "data"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "mylists"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    const/4 v3, 0x0

    :goto_23
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v3, v4, :cond_2b

    const/4 v4, 0x1

    goto :goto_6a

    :cond_2b
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v0, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v8, "title"

    const-string v9, "name"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v7, v8, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_49} :catch_4c

    add-int/lit8 v3, v3, 0x1

    goto :goto_23

    :catch_4c
    move-exception v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unable to load mylists: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "nicoid-mylist"

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v4, 0x0

    :goto_6a
    sget-object v0, Le/e/a/AccountLists;->MAIN:Landroid/os/Handler;

    new-instance v7, Le/e/a/AccountLists$$ExternalSyntheticLambda1;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Le/e/a/AccountLists$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;Landroid/app/Activity;ZLjava/util/ArrayList;Ljava/lang/String;)V

    invoke-virtual {v0, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$1(Ljava/lang/Object;Landroid/app/Activity;ZLjava/util/ArrayList;Ljava/lang/String;)V
    .registers 7

    .line 7
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "f"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_f

    goto :goto_10

    :catch_f
    move-exception v0

    :goto_10
    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_17

    return-void

    :cond_17
    if-eqz p2, :cond_1d

    invoke-static {p0, p3, p4}, Le/e/a/AccountLists;->show(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/String;)V

    goto :goto_2f

    :cond_1d
    const-string p0, "Unable to load mylists"

    const-string p2, "\u7121\u6cd5\u8f09\u5165\u64ad\u653e\u6e05\u55ae"

    const-string p3, "\u30de\u30a4\u30ea\u30b9\u30c8\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p1, p3, p0, p2}, Le/e/a/AccountLists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x1

    invoke-static {p1, p0, p2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :goto_2f
    return-void
.end method

.method static synthetic lambda$2(Landroid/app/Activity;Ljava/util/ArrayList;Landroid/widget/ArrayAdapter;Landroid/widget/Spinner;Landroid/view/View;)V
    .registers 5

    .line 8
    new-instance p4, Le/e/a/AccountLists$$ExternalSyntheticLambda2;

    invoke-direct {p4, p1, p2, p3}, Le/e/a/AccountLists$$ExternalSyntheticLambda2;-><init>(Ljava/util/ArrayList;Landroid/widget/ArrayAdapter;Landroid/widget/Spinner;)V

    invoke-static {p0, p4}, Le/e/a/AccountLists;->create(Landroid/app/Activity;Le/e/a/AccountLists$Created;)V

    return-void
.end method

.method static synthetic lambda$3(Ljava/util/ArrayList;Landroid/widget/ArrayAdapter;Landroid/widget/Spinner;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    .line 8
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "id"

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "title"

    invoke-interface {v0, p3, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1, p4}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    invoke-virtual {p2, p0}, Landroid/widget/Spinner;->setSelection(I)V

    return-void
.end method

.method static synthetic lambda$4(Landroid/widget/Spinner;Ljava/util/ArrayList;Landroid/widget/EditText;Landroid/app/AlertDialog;Ljava/lang/String;Landroid/app/Activity;Landroid/view/View;)V
    .registers 13

    .line 8
    invoke-virtual {p0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p0

    if-ltz p0, :cond_3c

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p6

    if-lt p0, p6, :cond_d

    goto :goto_3c

    :cond_d
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    const-string p1, "id"

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 p0, -0x1

    invoke-virtual {p3, p0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    sget-object p0, Le/e/a/AccountLists;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance p1, Le/e/a/AccountLists$$ExternalSyntheticLambda4;

    move-object v0, p1

    move-object v2, p4

    move-object v4, p5

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Le/e/a/AccountLists$$ExternalSyntheticLambda4;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;Landroid/app/AlertDialog;)V

    invoke-interface {p0, p1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_3c
    :goto_3c
    return-void
.end method

.method static synthetic lambda$5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/Activity;Landroid/app/AlertDialog;)V
    .registers 7

    .line 8
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://nvapi.nicovideo.jp/v1/users/me/mylists/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "/items?itemId="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {p1}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "&description="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {p2}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "POST"

    new-instance p2, Le/e/a/NetworkTask;

    invoke-direct {p2}, Le/e/a/NetworkTask;-><init>()V

    const/4 v0, 0x1

    invoke-static {p0, p1, v0, p2}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3e} :catch_3f

    goto :goto_5d

    :catch_3f
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Unable to add mylist video: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "nicoid-mylist"

    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    :goto_5d
    sget-object p0, Le/e/a/AccountLists;->MAIN:Landroid/os/Handler;

    new-instance p1, Le/e/a/AccountLists$$ExternalSyntheticLambda7;

    invoke-direct {p1, p3, v0, p4}, Le/e/a/AccountLists$$ExternalSyntheticLambda7;-><init>(Landroid/app/Activity;ZLandroid/app/AlertDialog;)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$6(Landroid/app/Activity;ZLandroid/app/AlertDialog;)V
    .registers 5

    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x1

    if-eqz p1, :cond_e

    invoke-virtual {p2}, Landroid/app/AlertDialog;->dismiss()V

    goto :goto_16

    :cond_e
    const/4 v1, -0x1

    invoke-virtual {p2, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/widget/Button;->setEnabled(Z)V

    :goto_16
    if-eqz p1, :cond_1b

    const-string p2, "\u767b\u9332\u3057\u307e\u3057\u305f"

    goto :goto_1d

    :cond_1b
    const-string p2, "\u767b\u9332\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    :goto_1d
    if-eqz p1, :cond_22

    const-string v1, "Added"

    goto :goto_24

    :cond_22
    const-string v1, "Unable to add"

    :goto_24
    if-eqz p1, :cond_29

    const-string p1, "\u5df2\u65b0\u589e"

    goto :goto_2b

    :cond_29
    const-string p1, "\u7121\u6cd5\u65b0\u589e"

    :goto_2b
    invoke-static {p0, p2, v1, p1}, Le/e/a/AccountLists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$7(Landroid/widget/EditText;Landroid/content/Context;Landroid/widget/CheckBox;Landroid/app/AlertDialog;Landroid/app/Activity;Le/e/a/AccountLists$Created;Landroid/view/View;)V
    .registers 15

    .line 10
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p6

    invoke-virtual {p6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p6

    invoke-virtual {p6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result p6

    if-eqz p6, :cond_20

    const-string p2, "Enter a name"

    const-string p3, "\u8acb\u8f38\u5165\u540d\u7a31"

    const-string p4, "\u540d\u524d\u3092\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p1, p4, p2, p3}, Le/e/a/AccountLists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    :cond_20
    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    const/4 p2, -0x1

    invoke-virtual {p3, p2}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p2

    const/4 p6, 0x0

    invoke-virtual {p2, p6}, Landroid/widget/Button;->setEnabled(Z)V

    sget-object p2, Le/e/a/AccountLists;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance p6, Le/e/a/AccountLists$$ExternalSyntheticLambda5;

    move-object v0, p6

    move-object v3, p4

    move-object v4, p3

    move-object v5, p5

    move-object v6, p0

    move-object v7, p1

    invoke-direct/range {v0 .. v7}, Le/e/a/AccountLists$$ExternalSyntheticLambda5;-><init>(Ljava/lang/String;ZLandroid/app/Activity;Landroid/app/AlertDialog;Le/e/a/AccountLists$Created;Landroid/widget/EditText;Landroid/content/Context;)V

    invoke-interface {p2, p6}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$8(Ljava/lang/String;ZLandroid/app/Activity;Landroid/app/AlertDialog;Le/e/a/AccountLists$Created;Landroid/widget/EditText;Landroid/content/Context;)V
    .registers 16

    .line 10
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://nvapi.nicovideo.jp/v1/users/me/mylists?name="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&description=&isPublic="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "&defaultSortKey=addedAt&defaultSortOrder=desc"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "POST"

    new-instance v1, Le/e/a/NetworkTask;

    invoke-direct {v1}, Le/e/a/NetworkTask;-><init>()V

    const/4 v2, 0x1

    invoke-static {p1, v0, v2, v1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "data"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "mylistId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "[0-9]+"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_44

    goto :goto_69

    :cond_44
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1}, Ljava/io/IOException;-><init>()V

    throw p1
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4a} :catch_4a

    :catch_4a
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unable to create folder: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "nicoid-mylist"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, ""

    :goto_69
    move-object v2, p1

    sget-object p1, Le/e/a/AccountLists;->MAIN:Landroid/os/Handler;

    new-instance v8, Le/e/a/AccountLists$$ExternalSyntheticLambda3;

    move-object v0, v8

    move-object v1, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p0

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Le/e/a/AccountLists$$ExternalSyntheticLambda3;-><init>(Landroid/app/Activity;Ljava/lang/String;Landroid/app/AlertDialog;Le/e/a/AccountLists$Created;Ljava/lang/String;Landroid/widget/EditText;Landroid/content/Context;)V

    invoke-virtual {p1, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$9(Landroid/app/Activity;Ljava/lang/String;Landroid/app/AlertDialog;Le/e/a/AccountLists$Created;Ljava/lang/String;Landroid/widget/EditText;Landroid/content/Context;)V
    .registers 7

    .line 10
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-eqz p0, :cond_7

    return-void

    :cond_7
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_14

    invoke-virtual {p2}, Landroid/app/AlertDialog;->dismiss()V

    invoke-interface {p3, p1, p4}, Le/e/a/AccountLists$Created;->done(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2a

    :cond_14
    const/4 p0, -0x1

    invoke-virtual {p2, p0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    const-string p0, "Unable to create"

    const-string p1, "\u5efa\u7acb\u5931\u6557"

    const-string p2, "\u4f5c\u6210\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    invoke-static {p6, p2, p0, p1}, Le/e/a/AccountLists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p5, p0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_2a
    return-void
.end method

.method public static load(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5

    .line 7
    const-string v0, "f"

    :try_start_2
    const-string v1, "b"

    invoke-static {p0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    return-void

    :cond_19
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    invoke-static {v1}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    sget-object v0, Le/e/a/AccountLists;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Le/e/a/AccountLists$$ExternalSyntheticLambda6;

    invoke-direct {v2, p0, v1, p1}, Le/e/a/AccountLists$$ExternalSyntheticLambda6;-><init>(Ljava/lang/Object;Landroid/app/Activity;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_32} :catch_33

    goto :goto_3b

    :catch_33
    move-exception p0

    const-string p1, "nicoid-mylist"

    const-string v0, "Unable to prepare mylists"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3b
    return-void
.end method

.method public static show(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/String;)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 8
    const-string v0, "id"

    :try_start_2
    const-string v1, "b"

    invoke-static {p0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    move-object v7, p0

    check-cast v7, Landroid/app/Activity;

    invoke-static {v7}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    invoke-static {v7}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p0

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_1f} :catch_101

    const-string v2, "title"

    if-nez v1, :cond_e3

    :try_start_23
    invoke-static {p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object p1

    const/16 v0, 0x18

    invoke-static {p0, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    const/16 v4, 0x8

    invoke-static {p0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p0, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    const/4 v5, 0x0

    invoke-virtual {p1, v1, v4, v0, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-static {p1}, Le/e/a/UiDialogs;->insetContent(Landroid/view/View;)V

    new-instance v0, Landroid/widget/Spinner;

    invoke-direct {v0, p0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/ArrayAdapter;

    const v4, 0x1090009

    invoke-direct {v1, p0, v4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_4f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_d0

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v2, "\u30d5\u30a9\u30eb\u30c0\u30fc\u3092\u4f5c\u6210"

    const-string v4, "Create folder"

    const-string v5, "\u5efa\u7acb\u8cc7\u6599\u593e"

    invoke-static {p0, v2, v4, v5}, Le/e/a/AccountLists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v4, Landroid/widget/EditText;

    invoke-direct {v4, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const-string v5, "\u30e1\u30e2"

    const-string v6, "Note"

    const-string v8, "\u5099\u8a3b"

    invoke-static {p0, v5, v6, v8}, Le/e/a/AccountLists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const-string v6, "\u30de\u30a4\u30ea\u30b9\u30c8\u767b\u9332"

    invoke-static {v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5, p1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v5, "\u767b\u9332"

    const-string v6, "Add"

    const-string v8, "\u65b0\u589e"

    invoke-static {p0, v5, v6, v8}, Le/e/a/AccountLists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {p1, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v5, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v8, "Cancel"

    const-string v9, "\u53d6\u6d88"

    invoke-static {p0, v5, v8, v9}, Le/e/a/AccountLists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v5

    invoke-static {v5}, Le/e/a/PlaybackSession;->showForm(Landroid/app/AlertDialog;)V

    new-instance p0, Le/e/a/AccountLists$$ExternalSyntheticLambda8;

    invoke-direct {p0, v7, v3, v1, v0}, Le/e/a/AccountLists$$ExternalSyntheticLambda8;-><init>(Landroid/app/Activity;Ljava/util/ArrayList;Landroid/widget/ArrayAdapter;Landroid/widget/Spinner;)V

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 p0, -0x1

    invoke-virtual {v5, p0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p0

    new-instance p1, Le/e/a/AccountLists$$ExternalSyntheticLambda9;

    move-object v1, p1

    move-object v2, v0

    move-object v6, p2

    invoke-direct/range {v1 .. v7}, Le/e/a/AccountLists$$ExternalSyntheticLambda9;-><init>(Landroid/widget/Spinner;Ljava/util/ArrayList;Landroid/widget/EditText;Landroid/app/AlertDialog;Ljava/lang/String;Landroid/app/Activity;)V

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_109

    :cond_d0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    invoke-interface {v5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    goto/16 :goto_4f

    :cond_e3
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v4, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_ff
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_ff} :catch_101

    goto/16 :goto_1b

    :catch_101
    move-exception p0

    const-string p1, "nicoid-mylist"

    const-string p2, "Unable to display chooser"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_109
    return-void
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 6
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
