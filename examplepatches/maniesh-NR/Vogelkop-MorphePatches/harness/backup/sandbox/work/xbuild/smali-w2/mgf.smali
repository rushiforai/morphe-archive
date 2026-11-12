.class public final synthetic Lmgf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;
.implements Lm94;
.implements Lvlf;
.implements Ldkj;
.implements Ljr9;
.implements Lod3;
.implements Lthj;
.implements Ltj9;
.implements Lokhttp3/internal/dns/DnsQuery$Factory;
.implements Lcom/google/android/gms/tasks/Continuation;
.implements Lmm9;
.implements Ltya;
.implements Lfua;
.implements Lekj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lglh;Lxx1;Ljava/lang/String;)V
    .registers 4

    const/16 p3, 0xd

    iput-byte p3, p0, Lmgf;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmgf;->b:Ljava/lang/Object;

    iput-object p2, p0, Lmgf;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 12
    iput-byte p3, p0, Lmgf;->a:B

    iput-object p1, p0, Lmgf;->b:Ljava/lang/Object;

    iput-object p2, p0, Lmgf;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final X(Landroid/os/Bundle;Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lmgf;->b:Ljava/lang/Object;

    check-cast v0, Lrn9;

    iget-object p0, p0, Lmgf;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    const-string v1, "SyncAuthPortalFragment_request"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2a

    const-string p2, "result_code"

    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result p1

    iget-boolean p2, v0, Lrn9;->b:Z

    const/4 v1, 0x0

    if-eqz p2, :cond_28

    const/4 p2, -0x1

    if-ne p1, p2, :cond_20

    const/4 p1, 0x1

    goto :goto_21

    :cond_20
    move p1, v1

    :goto_21
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_28
    iput-boolean v1, v0, Lrn9;->b:Z

    :cond_2a
    return-void
.end method

.method public final a()V
    .registers 5

    iget-object v0, p0, Lmgf;->b:Ljava/lang/Object;

    check-cast v0, Ltn;

    iget-object p0, p0, Lmgf;->c:Ljava/lang/Object;

    check-cast p0, Ldx3;

    const/4 v1, 0x1

    iput-boolean v1, v0, Ltn;->a:Z

    new-instance v1, Lvdf;

    const/16 v2, 0x17

    invoke-direct {v1, v0, v2}, Lvdf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lf03;->n(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    new-instance v2, Lqj2;

    const/16 v3, 0xb

    invoke-direct {v2, v1, v3}, Lqj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0, v2}, Lhjf;->D(Landroid/content/Intent;Lni;)V

    return-void
.end method

.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-object v0, p0, Lmgf;->b:Ljava/lang/Object;

    check-cast v0, Ltjg;

    iget-object p0, p0, Lmgf;->c:Ljava/lang/Object;

    check-cast p0, Lqi8;

    check-cast p1, Lokg;

    new-instance v1, Lyrd;

    iget-object v2, v0, Ltjg;->a:Landroid/content/Context;

    iget-object v0, v0, Ltjg;->u:Lhp2;

    invoke-direct {v1, v2, p0, v0, p1}, Lyrd;-><init>(Landroid/content/Context;Lqi8;Lhp2;Lokg;)V

    return-object v1
.end method

.method public final attachCompleter(Ll94;)Ljava/lang/Object;
    .registers 4

    iget-object v0, p0, Lmgf;->b:Ljava/lang/Object;

    check-cast v0, Lqie;

    iget-object v1, v0, Lqie;->b:Ljava/lang/Object;

    check-cast v1, Llyf;

    if-eqz v1, :cond_14

    iget-object v1, v1, Llyf;->a:Ljava/lang/Object;

    check-cast v1, Ll94;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1}, Ll94;->c()V

    :cond_14
    new-instance v1, Llyf;

    iget-object p0, p0, Lmgf;->c:Ljava/lang/Object;

    invoke-direct {v1, p1, p0}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v1, v0, Lqie;->b:Ljava/lang/Object;

    const-string p1, "PendingValue "

    invoke-static {p0, p1}, Lrfp;->o(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final b(Lhjm;)V
    .registers 2

    iget-object p1, p0, Lmgf;->b:Ljava/lang/Object;

    check-cast p1, Lr2;

    iget-object p0, p0, Lmgf;->c:Ljava/lang/Object;

    check-cast p0, Lpqh;

    iget-object p0, p0, Lpqh;->a:Ljava/lang/Object;

    invoke-virtual {p1, p0}, Lr2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final c(Ljava/lang/Integer;Lqjd;)V
    .registers 4

    iget-object v0, p0, Lmgf;->b:Ljava/lang/Object;

    check-cast v0, Lokg;

    iget-object p0, p0, Lmgf;->c:Ljava/lang/Object;

    check-cast p0, Lre7;

    invoke-virtual {v0, p2}, Lokg;->c(Lqjd;)Legd;

    move-result-object p2

    if-eqz p2, :cond_24

    iget-object p2, p2, Legd;->a:Lre7;

    invoke-virtual {p0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_24

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    iget-object p1, v0, Lokg;->c:Llkg;

    invoke-interface {p1, p0}, Llkg;->remove(I)V

    iget-object p0, v0, Lokg;->b:Lkjg;

    invoke-virtual {p0}, Lkjg;->b()V

    :cond_24
    return-void
.end method

.method public final d(I)V
    .registers 9

    iget-byte v0, p0, Lmgf;->a:B

    iget-object v1, p0, Lmgf;->c:Ljava/lang/Object;

    iget-object p0, p0, Lmgf;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_80

    check-cast p0, Lpii;

    check-cast v1, Lza9;

    iget-object v0, p0, Lpii;->r:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/print/PrintAttributes$MediaSize;

    iget-boolean v0, v1, Lza9;->a:Z

    iget-boolean v2, v1, Lza9;->b:Z

    invoke-virtual {p1}, Landroid/print/PrintAttributes$MediaSize;->asPortrait()Landroid/print/PrintAttributes$MediaSize;

    move-result-object v3

    sget-object v4, Landroid/print/PrintAttributes$MediaSize;->UNKNOWN_PORTRAIT:Landroid/print/PrintAttributes$MediaSize;

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq v3, v4, :cond_25

    move v3, v6

    goto :goto_26

    :cond_25
    move v3, v5

    :goto_26
    iput-boolean v3, v1, Lza9;->a:Z

    invoke-virtual {p1}, Landroid/print/PrintAttributes$MediaSize;->asLandscape()Landroid/print/PrintAttributes$MediaSize;

    move-result-object p1

    sget-object v3, Landroid/print/PrintAttributes$MediaSize;->UNKNOWN_LANDSCAPE:Landroid/print/PrintAttributes$MediaSize;

    if-eq p1, v3, :cond_32

    move p1, v6

    goto :goto_33

    :cond_32
    move p1, v5

    :goto_33
    iput-boolean p1, v1, Lza9;->b:Z

    iget-boolean v3, v1, Lza9;->a:Z

    if-ne v0, v3, :cond_3b

    if-eq v2, p1, :cond_6c

    :cond_3b
    iget-object p1, p0, Lpii;->x:Lro9;

    iget-object v0, p0, Lpii;->y:[Ljava/lang/CharSequence;

    iget-object v2, p1, Lro9;->c:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v3, Lth6;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v3, p1, v2, v0, v1}, Lth6;-><init>(Lro9;Landroid/content/Context;[Ljava/lang/Object;Lza9;)V

    iget-object p1, p1, Lro9;->d:Ljava/lang/Object;

    check-cast p1, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1, v3}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Lpii;->x:Lro9;

    iget v0, p1, Lro9;->b:I

    if-eqz v0, :cond_5e

    if-ne v0, v6, :cond_60

    iget-boolean v5, v1, Lza9;->b:Z

    goto :goto_60

    :cond_5e
    iget-boolean v5, v1, Lza9;->a:Z

    :cond_60
    :goto_60
    if-nez v5, :cond_6c

    add-int/2addr v0, v6

    iget-object v1, p0, Lpii;->y:[Ljava/lang/CharSequence;

    array-length v2, v1

    rem-int/2addr v0, v2

    aget-object v1, v1, v0

    invoke-virtual {p1, v0, v1}, Lro9;->a0(ILjava/lang/CharSequence;)V

    :cond_6c
    invoke-virtual {p0}, Lpii;->N0()V

    return-void

    :pswitch_70
    check-cast p0, Lkotlin/jvm/functions/Function1;

    check-cast v1, Lxbf;

    iget-object v0, v1, Lxbf;->g:Ljava/lang/Object;

    check-cast v0, Lh58;

    invoke-virtual {v0, p1}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_data_80
    .packed-switch 0xb
        :pswitch_70
    .end packed-switch
.end method

.method public final e()V
    .registers 4

    iget-object v0, p0, Lmgf;->b:Ljava/lang/Object;

    check-cast v0, Ls14;

    iget-object p0, p0, Lmgf;->c:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    iget-object v1, v0, Ls14;->c:Ljava/lang/Object;

    check-cast v1, Lj06;

    monitor-enter v1

    :try_start_d
    iget-object v2, v0, Ls14;->e:Ljava/lang/Object;

    check-cast v2, Ljava/util/Set;

    invoke-static {v2, p0}, Lb5j;->c(Ljava/util/Set;Ljava/lang/Object;)Ljava/util/LinkedHashSet;

    move-result-object p0

    iput-object p0, v0, Ls14;->e:Ljava/lang/Object;
    :try_end_17
    .catchall {:try_start_d .. :try_end_17} :catchall_19

    monitor-exit v1

    return-void

    :catchall_19
    move-exception p0

    monitor-exit v1

    throw p0
.end method

.method public final f()Z
    .registers 8

    iget-object v0, p0, Lmgf;->b:Ljava/lang/Object;

    check-cast v0, Lusg;

    iget-object p0, p0, Lmgf;->c:Ljava/lang/Object;

    check-cast p0, Lpv2;

    iget-boolean v1, v0, Lusg;->q:Z

    if-nez v1, :cond_27

    invoke-virtual {v0}, Lusg;->h()V

    iget-wide v1, v0, Lusg;->o:J

    iget-wide v3, p0, Lpv2;->a:J

    invoke-static {v1, v2, v3, v4}, Lpv2;->a(JJ)J

    move-result-wide v1

    iput-wide v1, p0, Lpv2;->a:J

    iget-wide v3, v0, Lusg;->n:J

    iget-wide v5, p0, Lpv2;->b:J

    add-long/2addr v1, v5

    invoke-virtual {v0, v3, v4, v1, v2}, Lusg;->g(JJ)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    iput-boolean p0, v0, Lusg;->q:Z

    return p0

    :cond_27
    return v1
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 21

    move-object/from16 v0, p0

    iget-byte v1, v0, Lmgf;->a:B

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object v5, v0, Lmgf;->c:Ljava/lang/Object;

    iget-object v0, v0, Lmgf;->b:Ljava/lang/Object;

    sparse-switch v1, :sswitch_data_3b2

    check-cast v0, Lvnj;

    check-cast v5, Lpnj;

    move-object/from16 v1, p1

    check-cast v1, Ljava/io/File;

    iput-boolean v3, v0, Lvnj;->f:Z

    iget-object v2, v5, Lpnj;->a:Ljava/lang/String;

    if-eqz v1, :cond_22

    new-instance v3, Ltnj;

    invoke-direct {v3, v1}, Ltnj;-><init>(Ljava/io/File;)V

    goto :goto_24

    :cond_22
    sget-object v3, Lnnj;->a:Lnnj;

    :goto_24
    invoke-virtual {v0, v2, v3}, Lvnj;->l(Ljava/lang/String;Lifd;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :sswitch_2a
    move-object v1, v0

    check-cast v1, Lvnj;

    check-cast v5, Ljlh;

    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Void;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v6, Ljava/util/LinkedHashMap;

    invoke-direct {v6}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v7, Ljava/util/LinkedHashSet;

    invoke-direct {v7}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    iput-object v5, v1, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    new-instance v5, Ljava/util/LinkedHashMap;

    invoke-direct {v5}, Ljava/util/LinkedHashMap;-><init>()V

    iget-object v8, v1, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v8, :cond_53

    move-object v9, v4

    goto :goto_54

    :cond_53
    move-object v9, v8

    :goto_54
    const-string v8, "id"

    const-string v10, "origin"

    filled-new-array {v8, v10}, [Ljava/lang/String;

    move-result-object v11

    const/4 v15, 0x0

    const/16 v16, 0x0

    const-string v10, "icons"

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-virtual/range {v9 .. v16}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    check-cast v8, Ljava/io/Closeable;

    :try_start_6a
    move-object v9, v8

    check-cast v9, Landroid/database/Cursor;

    :goto_6d
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v10

    if-eqz v10, :cond_83

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v5, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_82
    .catchall {:try_start_6a .. :try_end_82} :catchall_1c1

    goto :goto_6d

    :cond_83
    invoke-static {v8, v4}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    iget-object v8, v1, Lvnj;->c:Lk32;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    invoke-virtual {v8}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v8

    if-eqz v8, :cond_e3

    array-length v9, v8

    move v10, v3

    :goto_99
    if-ge v10, v9, :cond_e3

    aget-object v11, v8, v10

    invoke-virtual {v11}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    const-string v13, "ico-"

    invoke-static {v12, v13, v3}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_e0

    :try_start_a9
    invoke-virtual {v11}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x4

    invoke-virtual {v12, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    const/16 v13, 0x10

    invoke-static {v13}, Lkotlin/text/CharsKt;->checkRadix(I)I

    move-result v13

    invoke-static {v12, v13}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v5, v12}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    if-eqz v12, :cond_d9

    new-instance v13, Ltnj;

    invoke-direct {v13, v11}, Ltnj;-><init>(Ljava/io/File;)V

    invoke-interface {v0, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v13, Ljava/util/LinkedHashSet;

    invoke-direct {v13}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-interface {v6, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_e0

    :cond_d9
    invoke-virtual {v11}, Ljava/io/File;->delete()Z
    :try_end_dc
    .catch Ljava/lang/NumberFormatException; {:try_start_a9 .. :try_end_dc} :catch_dd

    goto :goto_e0

    :catch_dd
    invoke-virtual {v11}, Ljava/io/File;->delete()Z

    :cond_e0
    :goto_e0
    add-int/lit8 v10, v10, 0x1

    goto :goto_99

    :cond_e3
    iget-object v8, v1, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v8, :cond_e8

    move-object v8, v4

    :cond_e8
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_eb
    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v8

    check-cast v8, Ljava/lang/Iterable;

    new-instance v9, Lvvf;

    const/16 v10, 0x17

    invoke-direct {v9, v0, v1, v10}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v8, v9, v2}, Lo95;->u(Ljava/lang/Iterable;Lkotlin/jvm/functions/Function1;Z)Z

    iget-object v8, v1, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v8, :cond_100

    move-object v8, v4

    :cond_100
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_103
    .catchall {:try_start_eb .. :try_end_103} :catchall_1b7

    iget-object v8, v1, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v8, :cond_108

    move-object v8, v4

    :cond_108
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    sget-object v8, Lmnj;->e:Lh58;

    invoke-static {v8, v8}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v8

    :goto_111
    invoke-virtual {v8}, Lw4;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_180

    invoke-virtual {v8}, Lw4;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lmnj;

    iget-object v10, v1, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v10, :cond_123

    move-object v11, v4

    goto :goto_124

    :cond_123
    move-object v11, v10

    :goto_124
    sget v10, Lvnj;->j:I

    invoke-static {v9}, Lybh;->x(Lmnj;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v9}, Lybh;->d(Lmnj;)Ljava/lang/String;

    move-result-object v10

    const-string v13, "icon"

    filled-new-array {v10, v13}, [Ljava/lang/String;

    move-result-object v13

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-virtual/range {v11 .. v18}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    check-cast v10, Ljava/io/Closeable;

    :try_start_142
    move-object v11, v10

    check-cast v11, Landroid/database/Cursor;

    :goto_145
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v12

    if-eqz v12, :cond_174

    new-instance v12, Llnj;

    invoke-interface {v11, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    invoke-direct {v12, v9, v13, v14}, Llnj;-><init>(Lmnj;J)V

    invoke-interface {v11, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_15e

    invoke-interface {v7, v12}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_145

    :cond_15e
    invoke-interface {v11, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-virtual {v5, v13}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v6, v13}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/Set;

    invoke-interface {v13, v12}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_173
    .catchall {:try_start_142 .. :try_end_173} :catchall_178

    goto :goto_145

    :cond_174
    invoke-static {v10, v4}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    goto :goto_111

    :catchall_178
    move-exception v0

    move-object v1, v0

    :try_start_17a
    throw v1
    :try_end_17b
    .catchall {:try_start_17a .. :try_end_17b} :catchall_17b

    :catchall_17b
    move-exception v0

    invoke-static {v10, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :cond_180
    iget-object v3, v1, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v3, :cond_185

    move-object v3, v4

    :cond_185
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_188
    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    new-instance v5, Ltmi;

    const/4 v8, 0x3

    invoke-direct {v5, v6, v0, v1, v8}, Ltmi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3, v5, v2}, Lo95;->u(Ljava/lang/Iterable;Lkotlin/jvm/functions/Function1;Z)Z

    iget-object v2, v1, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v2, :cond_19c

    move-object v2, v4

    :cond_19c
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_19f
    .catchall {:try_start_188 .. :try_end_19f} :catchall_1ad

    iget-object v1, v1, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v1, :cond_1a4

    move-object v4, v1

    :cond_1a4
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    new-instance v1, Lfnj;

    invoke-direct {v1, v0, v6, v7}, Lfnj;-><init>(Ljava/util/LinkedHashMap;Ljava/util/LinkedHashMap;Ljava/util/LinkedHashSet;)V

    return-object v1

    :catchall_1ad
    move-exception v0

    iget-object v1, v1, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v1, :cond_1b3

    move-object v4, v1

    :cond_1b3
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    :catchall_1b7
    move-exception v0

    iget-object v1, v1, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v1, :cond_1bd

    move-object v4, v1

    :cond_1bd
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    :catchall_1c1
    move-exception v0

    move-object v1, v0

    :try_start_1c3
    throw v1
    :try_end_1c4
    .catchall {:try_start_1c3 .. :try_end_1c4} :catchall_1c4

    :catchall_1c4
    move-exception v0

    invoke-static {v8, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :sswitch_1c9
    check-cast v0, Li3j;

    check-cast v5, Landroid/graphics/Bitmap;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/Bitmap;

    iget-object v0, v0, Li3j;->b:Ljava/lang/Object;

    check-cast v0, Lq4b;

    iget-object v0, v0, Lq4b;->b:Ljava/lang/Object;

    check-cast v0, Lq6e;

    iget-object v0, v0, Lq6e;->c:Lwzg;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "/searchengine_j_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-static {v0}, Lcom/opera/android/browser/obml/Platform;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    :try_start_1f9
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1fe
    .catch Ljava/io/IOException; {:try_start_1f9 .. :try_end_1fe} :catch_215

    :try_start_1fe
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x55

    invoke-virtual {v5, v1, v3, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_205
    .catchall {:try_start_1fe .. :try_end_205} :catchall_20a

    :try_start_205
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_208
    .catch Ljava/io/IOException; {:try_start_205 .. :try_end_208} :catch_215

    move-object v4, v0

    goto :goto_219

    :catchall_20a
    move-exception v0

    move-object v1, v0

    :try_start_20c
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_20f
    .catchall {:try_start_20c .. :try_end_20f} :catchall_210

    goto :goto_214

    :catchall_210
    move-exception v0

    :try_start_211
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_214
    throw v1
    :try_end_215
    .catch Ljava/io/IOException; {:try_start_211 .. :try_end_215} :catch_215

    :catch_215
    move-exception v0

    invoke-static {v0}, Lks3;->D(Ljava/lang/Throwable;)V

    :goto_219
    return-object v4

    :sswitch_21a
    check-cast v0, Lghf;

    check-cast v5, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Void;

    new-instance v1, Ljava/io/File;

    iget-object v0, v0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    const-string v2, "sdx_json_data"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_22d
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_23c

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_23c

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_23c
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v5, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-static {v1, v0}, Ls29;->j(Ljava/io/File;[B)V
    :try_end_245
    .catch Ljava/io/IOException; {:try_start_22d .. :try_end_245} :catch_246

    goto :goto_249

    :catch_246
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :goto_249
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :sswitch_24c
    check-cast v0, Liji;

    check-cast v5, Lvii;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    iput-object v1, v0, Liji;->n:Ljava/lang/String;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v5, v0}, Lvii;->run(Ljava/lang/Object;)V

    return-object v4

    :sswitch_25c
    check-cast v0, Lpii;

    check-cast v5, [Landroid/print/PageRange;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/pdf/PdfRenderer;

    iget-object v2, v0, Lpii;->G:Llii;

    iput-boolean v3, v0, Lpii;->L:Z

    if-eqz v1, :cond_2b6

    iget-boolean v3, v0, Lpii;->N:Z

    if-nez v3, :cond_2b2

    iget-object v3, v0, Lpii;->u:Lqji;

    if-eqz v3, :cond_2b2

    invoke-interface {v2}, Llii;->m()I

    move-result v3

    int-to-float v3, v3

    const v6, 0x3f59999a    # 0.85f

    mul-float/2addr v3, v6

    float-to-int v3, v3

    iget-object v6, v0, Lpii;->u:Lqji;

    invoke-virtual {v6}, Lqji;->c()Landroid/print/PrintAttributes;

    move-result-object v6

    invoke-virtual {v6}, Landroid/print/PrintAttributes;->getMediaSize()Landroid/print/PrintAttributes$MediaSize;

    move-result-object v6

    invoke-virtual {v6}, Landroid/print/PrintAttributes$MediaSize;->getHeightMils()I

    move-result v7

    mul-int/2addr v7, v3

    invoke-virtual {v6}, Landroid/print/PrintAttributes$MediaSize;->getWidthMils()I

    move-result v6

    div-int/2addr v7, v6

    new-instance v6, Landroid/util/Size;

    invoke-direct {v6, v3, v7}, Landroid/util/Size;-><init>(II)V

    new-instance v3, Lm9f;

    invoke-virtual {v6}, Landroid/util/Size;->getWidth()I

    move-result v7

    invoke-virtual {v6}, Landroid/util/Size;->getHeight()I

    move-result v6

    invoke-direct {v3, v1, v7, v6}, Lm9f;-><init>(Ljava/lang/Object;II)V

    iput-object v3, v0, Lpii;->J:Lm9f;

    invoke-interface {v2}, Llii;->a()Z

    move-result v1

    if-eqz v1, :cond_2bf

    invoke-virtual {v0}, Lpii;->K0()V

    array-length v0, v5

    invoke-interface {v2, v0}, Llii;->o(I)V

    goto :goto_2bf

    :cond_2b2
    invoke-virtual {v1}, Landroid/graphics/pdf/PdfRenderer;->close()V

    goto :goto_2bf

    :cond_2b6
    invoke-interface {v2}, Llii;->a()Z

    move-result v1

    if-eqz v1, :cond_2bf

    invoke-virtual {v0}, Lpii;->L0()V

    :cond_2bf
    :goto_2bf
    return-object v4

    :sswitch_2c0
    check-cast v0, Lglh;

    check-cast v5, Lxx1;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Long;

    if-eqz v5, :cond_2cd

    invoke-virtual {v5, v1}, Lxx1;->run(Ljava/lang/Object;)V

    :cond_2cd
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-wide/16 v5, -0x1

    cmp-long v1, v1, v5

    if-eqz v1, :cond_2ed

    iget-object v0, v0, Lglh;->b:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_2dd
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2ed

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lclh;

    invoke-interface {v1}, Lclh;->a()V

    goto :goto_2dd

    :cond_2ed
    return-object v4

    :sswitch_2ee
    check-cast v0, Lglh;

    check-cast v5, Landroid/content/Context;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_311

    invoke-static {v5}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    const-string v3, "readinglist.access_after_upgrade.all_access"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    goto :goto_329

    :cond_311
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_315
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_329

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-virtual {v0, v5, v6, v2}, Lglh;->g(JZ)V

    goto :goto_315

    :cond_329
    :goto_329
    return-object v4

    :sswitch_32a
    check-cast v0, Lueh;

    check-cast v5, Landroid/net/Uri;

    move-object/from16 v1, p1

    check-cast v1, Lkotlin/Unit;

    iget-object v0, v0, Lueh;->E:Landroid/net/Uri;

    invoke-static {v0, v5}, Lqyn;->v(Landroid/net/Uri;Landroid/net/Uri;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :sswitch_33d
    check-cast v0, Lktf;

    check-cast v5, Ljava/lang/Runnable;

    move-object/from16 v1, p1

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v2

    if-nez v2, :cond_35d

    check-cast v1, Ljava/lang/String;

    iget-object v2, v0, Lktf;->c:Lefn;

    iput-object v2, v0, Lktf;->d:Lefn;

    iput-object v1, v0, Lktf;->e:Ljava/lang/String;

    iput-object v4, v0, Lktf;->c:Lefn;

    iput-object v4, v0, Lktf;->f:Loml;

    goto :goto_365

    :cond_35d
    iput-object v4, v0, Lktf;->d:Lefn;

    iput-object v4, v0, Lktf;->e:Ljava/lang/String;

    iput-object v4, v0, Lktf;->c:Lefn;

    iput-object v4, v0, Lktf;->f:Loml;

    :goto_365
    invoke-interface {v5}, Ljava/lang/Runnable;->run()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :sswitch_36b
    check-cast v0, Lpgf;

    check-cast v5, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Logf;

    iget-object v2, v0, Lpgf;->g:Ljava/lang/String;

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3b0

    iget-object v2, v0, Lpgf;->h:Lode;

    invoke-virtual {v2, v1}, Lekc;->r(Ljava/lang/Object;)V

    if-eqz v1, :cond_3b0

    iget-object v1, v0, Lpgf;->e:Lmu6;

    iget-object v0, v0, Lpgf;->b:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    invoke-virtual {v1, v0, v5}, Lmu6;->a(Lb2l;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3b0

    new-instance v0, Lorg/chromium/url/GURL;

    invoke-direct {v0, v5}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/chromium/url/GURL;->d()Lorg/chromium/url/GURL;

    move-result-object v0

    invoke-virtual {v0}, Lorg/chromium/url/GURL;->h()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3b0

    iget-object v1, v1, Lmu6;->b:Lhd;

    iget-boolean v2, v1, Lhd;->b:Z

    if-eqz v2, :cond_3b0

    new-instance v2, Lu5f;

    const/4 v3, 0x5

    invoke-direct {v2, v0, v3}, Lu5f;-><init>(Ljava/lang/String;B)V

    invoke-virtual {v1, v2}, Lhd;->t(Lkotlin/jvm/functions/Function1;)V

    :cond_3b0
    return-object v4

    nop

    :sswitch_data_3b2
    .sparse-switch
        0x0 -> :sswitch_36b
        0x1 -> :sswitch_33d
        0xa -> :sswitch_32a
        0xc -> :sswitch_2ee
        0xd -> :sswitch_2c0
        0x14 -> :sswitch_25c
        0x16 -> :sswitch_24c
        0x18 -> :sswitch_21a
        0x19 -> :sswitch_1c9
        0x1c -> :sswitch_2a
    .end sparse-switch
.end method

.method public final h(Lqwb;)Ljava/lang/Object;
    .registers 3

    iget-object v0, p0, Lmgf;->b:Ljava/lang/Object;

    check-cast v0, Lbyg;

    iget-object p0, p0, Lmgf;->c:Ljava/lang/Object;

    check-cast p0, Le20;

    invoke-virtual {p1}, Lqwb;->a()Loup;

    move-result-object p1

    iget-byte p0, p0, Le20;->a:B

    packed-switch p0, :pswitch_data_24

    const-class p0, Lk9h;

    goto :goto_1f

    :pswitch_14
    const-class p0, Li9h;

    goto :goto_1f

    :pswitch_17
    const-class p0, Lhxg;

    goto :goto_1f

    :pswitch_1a
    const-class p0, Lc05;

    goto :goto_1f

    :pswitch_1d
    const-class p0, Lz10;

    :goto_1f
    invoke-virtual {v0, p1, p0}, Lbyg;->a(Loup;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_1a
        :pswitch_17
        :pswitch_14
    .end packed-switch
.end method

.method public final i()Landroid/graphics/drawable/Drawable;
    .registers 2

    iget-object v0, p0, Lmgf;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object p0, p0, Lmgf;->c:Ljava/lang/Object;

    check-cast p0, Lpr;

    iget p0, p0, Lpr;->a:I

    invoke-static {p0, v0}, Ly9m;->V(ILandroid/content/Context;)I

    move-result p0

    if-nez p0, :cond_15

    const/4 p0, 0x5

    invoke-static {p0, v0}, Ly9m;->V(ILandroid/content/Context;)I

    move-result p0

    :cond_15
    invoke-static {p0, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public final newQuery(Lokhttp3/internal/dns/Question;)Lokhttp3/internal/dns/DnsQuery;
    .registers 3

    iget-object v0, p0, Lmgf;->b:Ljava/lang/Object;

    check-cast v0, Lokhttp3/internal/dns/RealDnsCache;

    iget-object p0, p0, Lmgf;->c:Ljava/lang/Object;

    check-cast p0, Lokhttp3/internal/dns/DnsQuery$Factory;

    invoke-static {v0, p0, p1}, Lokhttp3/internal/dns/RealDnsCache;->b(Lokhttp3/internal/dns/RealDnsCache;Lokhttp3/internal/dns/DnsQuery$Factory;Lokhttp3/internal/dns/Question;)Lokhttp3/internal/dns/DnsQuery;

    move-result-object p0

    return-object p0
.end method

.method public final o(Luya;)V
    .registers 2

    iget-object p1, p0, Lmgf;->b:Ljava/lang/Object;

    check-cast p1, Lbl9;

    iget-object p0, p0, Lmgf;->c:Ljava/lang/Object;

    check-cast p0, Ltya;

    invoke-interface {p0, p1}, Ltya;->o(Luya;)V

    return-void
.end method

.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .registers 4

    iget-object v0, p0, Lmgf;->b:Ljava/lang/Object;

    check-cast v0, Livg;

    iget-object p0, p0, Lmgf;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    monitor-enter v0

    :try_start_9
    iget-object v1, v0, Livg;->c:Ljava/lang/Object;

    check-cast v1, Landroidx/collection/ArrayMap;

    invoke-virtual {v1, p0}, Lhkj;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    return-object p1

    :goto_12
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_9 .. :try_end_13} :catchall_14

    throw p0

    :catchall_14
    move-exception p0

    goto :goto_12
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 5

    iget-byte p1, p0, Lmgf;->a:B

    iget-object v0, p0, Lmgf;->c:Ljava/lang/Object;

    iget-object p0, p0, Lmgf;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_26

    check-cast p0, Leog;

    check-cast v0, Landroid/view/MenuItem;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v0, Lqtd;

    invoke-virtual {p0, v0}, Leog;->j0(Lqtd;)V

    return-void

    :pswitch_16
    check-cast p0, Lg9g;

    check-cast v0, Ljava/lang/String;

    iget-object p0, p0, Lg9g;->s:Lb9g;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Laq3;

    const/4 v1, 0x1

    invoke-direct {p1, p0, v0, p2, v1}, Laq3;-><init>(Lt0h;Ljava/lang/Object;ZB)V

    return-void

    :pswitch_data_26
    .packed-switch 0x3
        :pswitch_16
    .end packed-switch
.end method
