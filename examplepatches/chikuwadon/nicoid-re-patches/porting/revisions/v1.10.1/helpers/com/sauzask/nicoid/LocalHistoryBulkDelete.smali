.class public Lcom/sauzask/nicoid/LocalHistoryBulkDelete;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnMultiChoiceClickListener;


# instance fields
.field private checked:[Z

.field private fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;[Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sauzask/nicoid/LocalHistoryBulkDelete;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iput-object p2, p0, Lcom/sauzask/nicoid/LocalHistoryBulkDelete;->checked:[Z

    return-void
.end method

.method public static confirm(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V
    .registers 9

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v2, v1, [Z

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_a
    if-ge v3, v1, :cond_2c

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/x1;

    const-string v6, "isselect"

    invoke-virtual {v5, v6}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    instance-of v6, v5, Ljava/lang/Boolean;

    if-eqz v6, :cond_29

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_29

    const/4 v5, 0x1

    aput-boolean v5, v2, v3

    add-int/lit8 v4, v4, 0x1

    :cond_29
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    :cond_2c
    if-lez v4, :cond_61

    new-instance v0, Lcom/sauzask/nicoid/LocalHistoryBulkDelete;

    invoke-direct {v0, p0, v2}, Lcom/sauzask/nicoid/LocalHistoryBulkDelete;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;[Z)V

    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u9078\u629e\u4e2d: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "\u4ef6\u306e\u5c65\u6b74\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v2, "\u524a\u9664"

    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string v2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-static {v1}, Le/e/a/v0;->a(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    :cond_61
    return-void
.end method

.method public static show(Lcom/sauzask/nicoid/NicoidVideoListFragment;I)V
    .registers 11

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_52

    if-ltz p1, :cond_52

    if-ge p1, v1, :cond_52

    new-array v2, v1, [Ljava/lang/CharSequence;

    new-array v3, v1, [Z

    const/4 v4, 0x1

    aput-boolean v4, v3, p1

    const/4 v5, 0x0

    :goto_14
    if-ge v5, v1, :cond_30

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le/e/a/x1;

    const-string v7, "title"

    invoke-virtual {v6, v7}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_29

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_2b

    :cond_29
    const-string v6, "\u52d5\u753b"

    :goto_2b
    aput-object v6, v2, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_14

    :cond_30
    new-instance v0, Lcom/sauzask/nicoid/LocalHistoryBulkDelete;

    invoke-direct {v0, p0, v3}, Lcom/sauzask/nicoid/LocalHistoryBulkDelete;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;[Z)V

    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    invoke-direct {v1, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v5, "\u524a\u9664\u3059\u308b\u5c65\u6b74\u3092\u9078\u629e"

    invoke-virtual {v1, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1, v2, v3, v0}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    const-string v2, "\u9078\u629e\u3057\u305f\u5c65\u6b74\u3092\u524a\u9664"

    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string v2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-static {v1}, Le/e/a/v0;->a(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    :cond_52
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 17

    iget-object v0, p0, Lcom/sauzask/nicoid/LocalHistoryBulkDelete;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const/4 v2, 0x1

    invoke-static {v2, v1}, Le/e/a/v0;->a(ILandroid/content/Context;)Lorg/json/JSONArray;

    move-result-object v3

    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    iget-object v7, p0, Lcom/sauzask/nicoid/LocalHistoryBulkDelete;->checked:[Z

    const/4 v8, 0x0

    :goto_18
    array-length v9, v7

    if-ge v8, v9, :cond_37

    aget-boolean v9, v7, v8

    if-eqz v9, :cond_34

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Le/e/a/x1;

    const-string v10, "videourl"

    invoke-virtual {v9, v10}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_34

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_34
    add-int/lit8 v8, v8, 0x1

    goto :goto_18

    :cond_37
    invoke-virtual {v5}, Ljava/util/HashSet;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_7b

    const/4 v8, 0x0

    :goto_3e
    :try_start_3e
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v8, v9, :cond_5a

    invoke-virtual {v3, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "videourl"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_57

    invoke-virtual {v4, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_57
    add-int/lit8 v8, v8, 0x1

    goto :goto_3e

    :cond_5a
    invoke-static {v2, v4, v1}, Le/e/a/v0;->a(ILorg/json/JSONArray;Landroid/content/Context;)I
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_5d} :catch_77

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    iget-object v7, p0, Lcom/sauzask/nicoid/LocalHistoryBulkDelete;->checked:[Z

    array-length v8, v7

    :cond_62
    :goto_62
    add-int/lit8 v8, v8, -0x1

    if-ltz v8, :cond_6e

    aget-boolean v9, v7, v8

    if-eqz v9, :cond_62

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_62

    :cond_6e
    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    invoke-virtual {v6}, Le/e/a/b0;->notifyDataSetChanged()V

    invoke-virtual {v0}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Y()V

    goto :goto_7b

    :catch_77
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_7b
    :goto_7b
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;IZ)V
    .registers 5

    iget-object v0, p0, Lcom/sauzask/nicoid/LocalHistoryBulkDelete;->checked:[Z

    aput-boolean p3, v0, p2

    return-void
.end method
