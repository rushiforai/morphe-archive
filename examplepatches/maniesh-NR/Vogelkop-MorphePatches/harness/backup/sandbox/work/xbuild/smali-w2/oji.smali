.class public final Loji;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liyg;
.implements Ltri;
.implements Lhti;
.implements Lw9m;
.implements Lf94;
.implements Lla;
.implements Lmgd;
.implements Linh;
.implements Lhtd;
.implements Luom;
.implements Lmf1;
.implements Lorg/chromium/support_lib_boundary/WebMessageListenerBoundaryInterface;


# static fields
.field public static b:Loji;

.field public static c:Loji;


# instance fields
.field public a:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;B)V
    .registers 5

    packed-switch p2, :pswitch_data_20

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    new-instance p2, Lxcj;

    invoke-direct {p2, p1}, Lxcj;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Loji;->a:Ljava/lang/Object;

    return-void

    .line 115
    :pswitch_e
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    sget-object p2, Lvml;->d:Lumi;

    const-string v0, "stats"

    const/4 v1, 0x0

    new-array v1, v1, [Lbg1;

    invoke-static {p1, p2, v0, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Loji;->a:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x8
        :pswitch_e
    .end packed-switch
.end method

.method public constructor <init>(Landroid/view/View;)V
    .registers 4

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_14

    .line 107
    new-instance v0, Lmvj;

    const/4 v1, 0x5

    .line 108
    invoke-direct {v0, p1, v1}, Lrii;-><init>(Ljava/lang/Object;B)V

    .line 109
    iput-object p1, v0, Lmvj;->c:Landroid/view/View;

    .line 110
    iput-object v0, p0, Loji;->a:Ljava/lang/Object;

    return-void

    .line 111
    :cond_14
    new-instance v0, Lrii;

    const/4 v1, 0x5

    invoke-direct {v0, p1, v1}, Lrii;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Loji;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lazl;)V
    .registers 15

    new-instance v0, Lec3;

    iget-object v1, p1, Lazl;->b:Lfc3;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lec3;-><init>(Lk73;B)V

    new-instance v1, Lec3;

    iget-object v3, p1, Lazl;->c:Lfc3;

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lec3;-><init>(Lk73;B)V

    new-instance v3, Lec3;

    iget-object v5, p1, Lazl;->e:Lfc3;

    const/4 v6, 0x4

    invoke-direct {v3, v5, v6}, Lec3;-><init>(Lk73;B)V

    new-instance v5, Lec3;

    iget-object v7, p1, Lazl;->d:Luoe;

    const/4 v8, 0x2

    invoke-direct {v5, v7, v8}, Lec3;-><init>(Lk73;B)V

    new-instance v9, Lec3;

    const/4 v10, 0x3

    invoke-direct {v9, v7, v10}, Lec3;-><init>(Lk73;B)V

    new-instance v11, Lfoe;

    invoke-direct {v11, v7}, Lo53;-><init>(Lk73;)V

    new-instance v12, Laoe;

    invoke-direct {v12, v7}, Lo53;-><init>(Lk73;)V

    iget-object p1, p1, Lazl;->a:Landroid/content/Context;

    sget v7, Lq4o;->a:I

    const-string v7, "connectivity"

    invoke-virtual {p1, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    new-instance v7, Lmoe;

    invoke-direct {v7, p1}, Lmoe;-><init>(Landroid/net/ConnectivityManager;)V

    const/16 p1, 0x8

    new-array p1, p1, [Lgo5;

    aput-object v0, p1, v2

    aput-object v1, p1, v4

    aput-object v3, p1, v8

    aput-object v5, p1, v10

    aput-object v9, p1, v6

    const/4 v0, 0x5

    aput-object v11, p1, v0

    const/4 v0, 0x6

    aput-object v12, p1, v0

    const/4 v0, 0x7

    aput-object v7, p1, v0

    invoke-static {p1}, Le82;->p([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loji;->a:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 112
    iput-object p1, p0, Loji;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ln27;)V
    .registers 4

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    new-instance v0, Lf82;

    .line 100
    sget v1, Lm0k;->a:F

    .line 101
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput v1, v0, Lf82;->a:F

    .line 102
    invoke-interface {p1}, Ln27;->b()F

    move-result p1

    const v1, 0x43c10b3d

    mul-float/2addr p1, v1

    const/high16 v1, 0x43200000    # 160.0f

    mul-float/2addr p1, v1

    const v1, 0x3f570a3d    # 0.84f

    mul-float/2addr p1, v1

    .line 103
    iput p1, v0, Lf82;->b:F

    .line 104
    iput-object v0, p0, Loji;->a:Ljava/lang/Object;

    return-void
.end method

.method public static n(Ljava/io/InputStream;)[B
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_2
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_7} :catch_23
    .catchall {:try_start_2 .. :try_end_7} :catchall_1b

    const/16 v1, 0x400

    :try_start_9
    new-array v1, v1, [B

    :goto_b
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_24

    invoke-virtual {v2, v1, v0, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_15} :catch_19
    .catchall {:try_start_9 .. :try_end_15} :catchall_16

    goto :goto_b

    :catchall_16
    move-exception v0

    move-object v1, v2

    goto :goto_1c

    :catch_19
    move-object v1, v2

    goto :goto_23

    :catchall_1b
    move-exception v0

    :goto_1c
    invoke-static {v1}, Lr9h;->l(Ljava/io/Closeable;)V

    invoke-static {p0}, Lr9h;->l(Ljava/io/Closeable;)V

    throw v0

    :catch_23
    :goto_23
    move-object v2, v1

    :cond_24
    invoke-static {v2}, Lr9h;->l(Ljava/io/Closeable;)V

    invoke-static {p0}, Lr9h;->l(Ljava/io/Closeable;)V

    if-eqz v2, :cond_31

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0

    :cond_31
    new-array p0, v0, [B

    return-object p0
.end method

.method public static t(Ljava/lang/String;DJ)Landroid/content/ContentValues;
    .registers 7

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    if-eqz p0, :cond_c

    const-string v1, "target"

    invoke-virtual {v0, v1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_c
    const-string p0, "priority"

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string p0, "time"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const/4 p0, 0x3

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const-string p1, "version"

    invoke-virtual {v0, p1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    return-object v0
.end method

.method public static y(Landroid/content/Context;)Loji;
    .registers 3

    sget-object v0, Loji;->b:Loji;

    if-nez v0, :cond_d

    new-instance v0, Loji;

    const/16 v1, 0x8

    invoke-direct {v0, p0, v1}, Loji;-><init>(Landroid/content/Context;B)V

    sput-object v0, Loji;->b:Loji;

    :cond_d
    return-object v0
.end method


# virtual methods
.method public final A()Ljava/security/PublicKey;
    .registers 4

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lbf9;

    iget-object v0, p0, Lbf9;->d:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "pub"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_24

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    invoke-static {v0}, Lp36;->c([B)Ljava/security/PublicKey;

    move-result-object v0

    if-eqz v0, :cond_21

    return-object v0

    :cond_21
    invoke-virtual {p0}, Lbf9;->k()V

    :cond_24
    invoke-virtual {p0}, Lbf9;->m()Ljava/security/KeyPair;

    move-result-object p0

    if-nez p0, :cond_2b

    return-object v2

    :cond_2b
    invoke-virtual {p0}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object p0

    return-object p0
.end method

.method public final B(Ljava/lang/Class;)Lytm;
    .registers 2

    invoke-virtual {p0}, Loji;->o()V

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Landroid/util/ArrayMap;

    invoke-virtual {p0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lytm;

    return-object p0
.end method

.method public final C(Lnt5;)Ljava/lang/Object;
    .registers 6

    instance-of v0, p1, Lhpn;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lhpn;

    iget v1, v0, Lhpn;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lhpn;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lhpn;

    invoke-direct {v0, p0, p1}, Lhpn;-><init>(Loji;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lhpn;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lhpn;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v3, :cond_27

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_3a

    :cond_27
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput v3, v0, Lhpn;->v:I

    invoke-virtual {p0, v0}, Loji;->w(Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_3a

    return-object v1

    :cond_3a
    :goto_3a
    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lm9c;

    invoke-virtual {p0}, Lm9c;->b()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lbum;

    invoke-direct {v0, p1, p0}, Lbum;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public final D(Lvyi;)V
    .registers 7

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    iget-boolean v0, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->D:Z

    const/4 v1, 0x0

    if-nez v0, :cond_c

    iput-object v1, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->L:Lvyi;

    return-void

    :cond_c
    iget v0, p1, Lvyi;->d:I

    if-gtz v0, :cond_32

    iget v2, p1, Lvyi;->e:I

    if-ltz v2, :cond_32

    iput-object p1, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->L:Lvyi;

    if-nez v0, :cond_29

    if-nez v2, :cond_29

    iget-object v0, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->J:Lshf;

    if-eqz v0, :cond_25

    iget-object v1, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->z:Ljava/lang/String;

    iget v2, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->A:I

    invoke-virtual {v0, v1, v2, p1}, Lshf;->E(Ljava/lang/String;ILvyi;)V

    :cond_25
    invoke-virtual {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->J()V

    return-void

    :cond_29
    iget-object p0, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->e:Lorg/chromium/content/browser/webcontents/WebContentsImpl;

    const/4 p1, 0x1

    iget-wide v3, p0, Lorg/chromium/content/browser/webcontents/WebContentsImpl;->b:J

    invoke-static {v3, v4, v0, v2, p1}, LJ/N;->MjgOFo_o(JIIZ)V

    return-void

    :cond_32
    iput-object v1, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->L:Lvyi;

    invoke-virtual {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->J()V

    return-void
.end method

.method public final E(Lcom/opera/android/suggestion/Suggestion;)Z
    .registers 8

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lmrk;

    invoke-virtual {p0}, Lmrk;->c()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_4b

    iget-object p0, p0, Lmrk;->C:Lhqk;

    const/4 v0, 0x0

    const/4 v2, 0x5

    const/4 v3, 0x4

    if-nez p1, :cond_1f

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lxpk;->d:Lxpk;

    invoke-virtual {p0, v0, v3, p1}, Lhqk;->I(Lcom/opera/android/suggestion/Suggestion;ILxpk;)Z

    invoke-virtual {p0, v0, v2, p1}, Lhqk;->I(Lcom/opera/android/suggestion/Suggestion;ILxpk;)Z

    :goto_1d
    move p0, v1

    goto :goto_47

    :cond_1f
    iget v4, p1, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v5, 0xc

    if-ne v4, v5, :cond_32

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lxpk;->d:Lxpk;

    invoke-virtual {p0, v0, v2, v4}, Lhqk;->I(Lcom/opera/android/suggestion/Suggestion;ILxpk;)Z

    invoke-virtual {p0, p1, v3, v4}, Lhqk;->I(Lcom/opera/android/suggestion/Suggestion;ILxpk;)Z

    move-result p0

    goto :goto_47

    :cond_32
    const/16 v5, 0xd

    if-ne v4, v5, :cond_43

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lxpk;->d:Lxpk;

    invoke-virtual {p0, v0, v3, v4}, Lhqk;->I(Lcom/opera/android/suggestion/Suggestion;ILxpk;)Z

    invoke-virtual {p0, p1, v2, v4}, Lhqk;->I(Lcom/opera/android/suggestion/Suggestion;ILxpk;)Z

    move-result p0

    goto :goto_47

    :cond_43
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_1d

    :goto_47
    if-eqz p0, :cond_4b

    const/4 p0, 0x1

    return p0

    :cond_4b
    return v1
.end method

.method public final F(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;
    .registers 16

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lxcj;

    invoke-virtual {p0}, Lxcj;->h()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string p0, "target"

    const-string v10, "version"

    filled-new-array {p0, v10}, [Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v3, "targets"

    const/4 v6, 0x0

    move-object v9, p2

    move-object v5, p3

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p2

    invoke-interface {p2, p0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p0

    invoke-interface {p2, v10}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p3

    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_bf

    const/4 v2, 0x0

    :cond_34
    invoke-interface {p2, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2, p3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lwcj;

    if-eqz v6, :cond_4b

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_b9

    :cond_4b
    const-wide/16 v6, 0x3

    cmp-long v4, v4, v6

    if-gez v4, :cond_b9

    if-nez v2, :cond_9a

    new-instance v2, Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/HashMap;-><init>(I)V

    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_64
    :goto_64
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lzcj;->a(Ljava/lang/String;)Landroid/util/Pair;

    move-result-object v6

    if-eqz v6, :cond_64

    iget-object v6, v6, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    if-nez v7, :cond_90

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_90
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lwcj;

    invoke-interface {v7, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_64

    :cond_9a
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_b9

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_a6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_b9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lwcj;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_a6

    :cond_b9
    :goto_b9
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_34

    :cond_bf
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    if-eqz p4, :cond_e5

    invoke-virtual {p1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_cc
    :goto_cc
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_e5

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwcj;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_cc

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_cc

    :cond_e5
    return-object v1
.end method

.method public final G(I)V
    .registers 4

    invoke-static {p1}, Lfki;->t(I)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, p1, v0}, Lcom/appsflyer/internal/j;->b(Landroid/content/SharedPreferences;Ljava/lang/String;I)V

    return-void
.end method

.method public final a(ILd36;JI)V
    .registers 13

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Landroid/media/MediaCodec;

    iget-object v3, p2, Ld36;->i:Landroid/media/MediaCodec$CryptoInfo;

    const/4 v2, 0x0

    move v1, p1

    move-wide v4, p3

    move v6, p5

    invoke-virtual/range {v0 .. v6}, Landroid/media/MediaCodec;->queueSecureInputBuffer(IILandroid/media/MediaCodec$CryptoInfo;JI)V

    return-void
.end method

.method public final b(Landroid/os/Bundle;)V
    .registers 2

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Landroid/media/MediaCodec;

    invoke-virtual {p0, p1}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V

    return-void
.end method

.method public final c(IIIJ)V
    .registers 13

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Landroid/media/MediaCodec;

    const/4 v2, 0x0

    move v1, p1

    move v3, p2

    move v6, p3

    move-wide v4, p4

    invoke-virtual/range {v0 .. v6}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    return-void
.end method

.method public final create(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-nez p0, :cond_e

    const/4 p0, 0x0

    return-object p0

    :cond_e
    new-instance v0, Lgjk;

    invoke-direct {v0, p1, p0}, Lgjk;-><init>(Ljava/lang/String;Ljava/util/List;)V

    return-object v0
.end method

.method public final d(Landroid/view/View;)V
    .registers 3

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    instance-of v0, p1, Leri;

    if-eqz v0, :cond_13

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lmri;

    check-cast p1, Leri;

    iget-object p0, p0, Lmri;->k:Lq6e;

    invoke-virtual {p0, p1}, Lq6e;->n(Leri;)V

    :cond_13
    return-void
.end method

.method public final e(ILjava/lang/String;)Ljava/lang/Object;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-nez p0, :cond_1d

    const/4 p0, 0x0

    return-object p0

    :cond_1d
    new-instance p2, Lgjk;

    invoke-direct {p2, p1, p0}, Lgjk;-><init>(Ljava/lang/String;Ljava/util/List;)V

    return-object p2
.end method

.method public final f(Ljava/lang/String;Landroid/print/PrintDocumentAdapter;)Z
    .registers 4

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lqji;

    invoke-virtual {p0}, Lqji;->a()V

    invoke-virtual {p0}, Lqji;->c()Landroid/print/PrintAttributes;

    move-result-object p1

    const/4 v0, 0x0

    iput-object v0, p0, Lqji;->f:Landroid/print/PrintAttributes;

    new-instance v0, Landroid/os/CancellationSignal;

    invoke-direct {v0}, Landroid/os/CancellationSignal;-><init>()V

    iput-object v0, p0, Lqji;->g:Landroid/os/CancellationSignal;

    iput-object p2, p0, Lqji;->j:Landroid/print/PrintDocumentAdapter;

    invoke-virtual {p2}, Landroid/print/PrintDocumentAdapter;->onStart()V

    invoke-virtual {p0, p1}, Lqji;->g(Landroid/print/PrintAttributes;)V

    const/4 p0, 0x1

    return p0
.end method

.method public final flush()V
    .registers 1

    return-void
.end method

.method public final g()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final get(I)Ln89;
    .registers 2

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lw89;

    return-object p0
.end method

.method public final getSupportedFeatures()[Ljava/lang/String;
    .registers 2

    const-string p0, "WEB_MESSAGE_LISTENER"

    const-string v0, "WEB_MESSAGE_ARRAY_BUFFER"

    filled-new-array {p0, v0}, [Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final h()Ljava/nio/channels/FileChannel;
    .registers 2

    new-instance v0, Ljava/io/FileInputStream;

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v0}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object p0

    return-object p0
.end method

.method public final i()V
    .registers 1

    return-void
.end method

.method public final j()Lb2l;
    .registers 5

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lr9l;

    iget-object v0, p0, Lr9l;->c:Lk6l;

    invoke-virtual {v0}, Lk6l;->A()Lb2l;

    move-result-object v0

    iget-object v1, p0, Lr9l;->y:Lz9j;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb3c;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    if-eqz v1, :cond_31

    const/4 v3, 0x1

    if-eq v1, v3, :cond_26

    const/4 v3, 0x2

    if-eq v1, v3, :cond_26

    if-eq v1, v2, :cond_55

    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_26
    iget-object v1, p0, Lr9l;->t:Lgal;

    iget-object v1, v1, Lgal;->e:Lp6l;

    invoke-virtual {p0, v1}, Lr9l;->g(Lp6l;)Lb2l;

    move-result-object p0

    if-eqz p0, :cond_55

    return-object p0

    :cond_31
    invoke-virtual {p0}, Lr9l;->f()Lz5l;

    move-result-object p0

    iget-object v1, p0, Lz5l;->v:Lx2l;

    iget-object p0, p0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lbvk;

    invoke-direct {v3, v2}, Lbvk;-><init>(B)V

    invoke-static {p0, v3}, Lnxg;->n(Landroidx/recyclerview/widget/RecyclerView;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb2l;

    if-nez p0, :cond_53

    iget-object p0, v1, Lx2l;->o:Lo2l;

    iget-object p0, p0, Lo2l;->e:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb2l;

    :cond_53
    if-nez p0, :cond_56

    :cond_55
    return-object v0

    :cond_56
    return-object p0
.end method

.method public final k(Landroid/view/View;)Z
    .registers 5

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/behavior/SwipeDismissBehavior;

    invoke-virtual {p0, p1}, Lcom/google/android/material/behavior/SwipeDismissBehavior;->x(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_38

    invoke-virtual {p1}, Landroid/view/View;->getLayoutDirection()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_13

    move v1, v2

    :cond_13
    iget-byte v0, p0, Lcom/google/android/material/behavior/SwipeDismissBehavior;->e:B

    if-nez v0, :cond_19

    if-nez v1, :cond_1d

    :cond_19
    if-ne v0, v2, :cond_23

    if-nez v1, :cond_23

    :cond_1d
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    neg-int v0, v0

    goto :goto_27

    :cond_23
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    :goto_27
    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p1, v0}, Landroid/view/View;->offsetLeftAndRight(I)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    iget-object p0, p0, Lcom/google/android/material/behavior/SwipeDismissBehavior;->b:Ltw2;

    if-eqz p0, :cond_37

    invoke-virtual {p0, p1}, Ltw2;->s(Landroid/view/View;)V

    :cond_37
    return v2

    :cond_38
    return v1
.end method

.method public final l(Landroid/view/View;)V
    .registers 5

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lmri;

    invoke-virtual {p0}, Lo73;->f()Lr9i;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_1a

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lo66;

    iget-object p0, p0, Lo66;->f:Ll56;

    if-nez p0, :cond_15

    move-object p0, v0

    goto :goto_17

    :cond_15
    iget-object p0, p0, Landroidx/appcompat/widget/ListPopupWindow;->c:Lim7;

    :goto_17
    if-eqz p0, :cond_1a

    move-object v0, p0

    :cond_1a
    if-eqz v0, :cond_23

    invoke-virtual {v0, p1}, Landroid/widget/AdapterView;->getPositionForView(Landroid/view/View;)I

    move-result p0

    const/4 v1, -0x1

    if-ne p0, v1, :cond_24

    :cond_23
    return-void

    :cond_24
    invoke-virtual {v0, p0}, Landroid/widget/AdapterView;->getItemIdAtPosition(I)J

    move-result-wide v1

    invoke-virtual {v0, p1, p0, v1, v2}, Landroid/widget/AdapterView;->performItemClick(Landroid/view/View;IJ)Z

    return-void
.end method

.method public final m(Ljava/net/URLConnection;Liro;)V
    .registers 7

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Landroid/os/Handler;

    const/4 v0, 0x0

    :try_start_5
    const-string v1, "GET"

    move-object v2, p1

    check-cast v2, Ljava/net/HttpURLConnection;

    invoke-virtual {v2, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/net/URLConnection;->setDoInput(Z)V

    const/16 v2, 0x2710

    invoke-virtual {p1, v2}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    invoke-virtual {p1, v2}, Ljava/net/URLConnection;->setReadTimeout(I)V

    invoke-virtual {p1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    move-object v2, p1

    check-cast v2, Ljava/net/HttpURLConnection;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    const/16 v3, 0xc8

    if-ne v2, v3, :cond_34

    invoke-static {v0}, Loji;->n(Ljava/io/InputStream;)[B

    move-result-object v1

    new-instance v2, Lfmn;

    const/16 v3, 0xa

    invoke-direct {v2, p2, v1, v3}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    goto :goto_3a

    :cond_34
    new-instance v3, Lokp;

    invoke-direct {v3, p2, v2, v1}, Lokp;-><init>(Ljava/lang/Object;IB)V

    move-object v2, v3

    :goto_3a
    invoke-virtual {p0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_3d
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_3d} :catch_44
    .catchall {:try_start_5 .. :try_end_3d} :catchall_58

    invoke-static {p1}, Lhn9;->f(Ljava/net/URLConnection;)V

    invoke-static {v0}, Lr9h;->l(Ljava/io/Closeable;)V

    return-void

    :catch_44
    move-exception v1

    :try_start_45
    new-instance v2, Lfmn;

    const/16 v3, 0xc

    invoke-direct {v2, p2, v1, v3}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_4f
    .catchall {:try_start_45 .. :try_end_4f} :catchall_58

    if-eqz p1, :cond_54

    invoke-static {p1}, Lhn9;->f(Ljava/net/URLConnection;)V

    :cond_54
    invoke-static {v0}, Lr9h;->l(Ljava/io/Closeable;)V

    return-void

    :catchall_58
    move-exception p0

    if-eqz p1, :cond_5e

    invoke-static {p1}, Lhn9;->f(Ljava/net/URLConnection;)V

    :cond_5e
    invoke-static {v0}, Lr9h;->l(Ljava/io/Closeable;)V

    throw p0
.end method

.method public final o()V
    .registers 1

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Landroid/util/ArrayMap;

    if-eqz p0, :cond_7

    return-void

    :cond_7
    const-string p0, "Operation is not allowed after destroy()."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method

.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 3

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lb94;

    new-instance p1, Ldk8;

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Ldk8;-><init>(I)V

    invoke-virtual {p0, p1}, Lb94;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final onPostMessage(Landroid/webkit/WebView;Ljava/lang/reflect/InvocationHandler;Landroid/net/Uri;ZLjava/lang/reflect/InvocationHandler;)V
    .registers 14

    const-class v0, Lorg/chromium/support_lib_boundary/WebMessageBoundaryInterface;

    invoke-static {v0, p2}, Lfr3;->m(Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/chromium/support_lib_boundary/WebMessageBoundaryInterface;

    invoke-interface {p2}, Lorg/chromium/support_lib_boundary/WebMessageBoundaryInterface;->getPorts()[Ljava/lang/reflect/InvocationHandler;

    move-result-object v0

    array-length v1, v0

    new-array v1, v1, [Llun;

    const/4 v2, 0x0

    :goto_10
    array-length v3, v0

    if-ge v2, v3, :cond_29

    new-instance v3, Lmun;

    aget-object v4, v0, v2

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    const-class v5, Lorg/chromium/support_lib_boundary/WebMessagePortBoundaryInterface;

    invoke-static {v5, v4}, Lfr3;->m(Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/chromium/support_lib_boundary/WebMessagePortBoundaryInterface;

    iput-object v4, v3, Lmun;->b:Lorg/chromium/support_lib_boundary/WebMessagePortBoundaryInterface;

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    :cond_29
    sget-object v0, Laxn;->e:Lli1;

    invoke-virtual {v0}, Lli1;->a()Z

    move-result v0

    if-eqz v0, :cond_5e

    const-class v0, Lorg/chromium/support_lib_boundary/WebMessagePayloadBoundaryInterface;

    invoke-interface {p2}, Lorg/chromium/support_lib_boundary/WebMessageBoundaryInterface;->getMessagePayload()Ljava/lang/reflect/InvocationHandler;

    move-result-object p2

    invoke-static {v0, p2}, Lfr3;->m(Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/chromium/support_lib_boundary/WebMessagePayloadBoundaryInterface;

    invoke-interface {p2}, Lorg/chromium/support_lib_boundary/WebMessagePayloadBoundaryInterface;->getType()I

    move-result v0

    if-eqz v0, :cond_54

    const/4 v2, 0x1

    if-eq v0, v2, :cond_49

    const/4 p2, 0x0

    move-object v4, p2

    goto :goto_68

    :cond_49
    new-instance v0, Ljun;

    invoke-interface {p2}, Lorg/chromium/support_lib_boundary/WebMessagePayloadBoundaryInterface;->getAsArrayBuffer()[B

    move-result-object p2

    invoke-direct {v0, p2, v1}, Ljun;-><init>([B[Llun;)V

    :goto_52
    move-object v4, v0

    goto :goto_68

    :cond_54
    new-instance v0, Ljun;

    invoke-interface {p2}, Lorg/chromium/support_lib_boundary/WebMessagePayloadBoundaryInterface;->getAsString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v0, p2, v1}, Ljun;-><init>(Ljava/lang/String;[Llun;)V

    goto :goto_52

    :cond_5e
    new-instance v0, Ljun;

    invoke-interface {p2}, Lorg/chromium/support_lib_boundary/WebMessageBoundaryInterface;->getData()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v0, p2, v1}, Ljun;-><init>(Ljava/lang/String;[Llun;)V

    goto :goto_52

    :goto_68
    if-eqz v4, :cond_8a

    const-class p2, Lorg/chromium/support_lib_boundary/JsReplyProxyBoundaryInterface;

    invoke-static {p2, p5}, Lfr3;->m(Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/chromium/support_lib_boundary/JsReplyProxyBoundaryInterface;

    new-instance p5, Lce2;

    const/4 v0, 0x3

    invoke-direct {p5, p2, v0}, Lce2;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p2, p5}, Lorg/chromium/support_lib_boundary/IsomorphicObjectBoundaryInterface;->getOrCreatePeer(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object p2

    move-object v7, p2

    check-cast v7, Lymb;

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Luwn;

    move-object v3, p1

    move-object v5, p3

    move v6, p4

    invoke-interface/range {v2 .. v7}, Luwn;->onPostMessage(Landroid/webkit/WebView;Ljun;Landroid/net/Uri;ZLxmb;)V

    :cond_8a
    return-void
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 4

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lb94;

    :try_start_4
    iget-boolean p1, p2, Lpzh;->q:Z

    if-eqz p1, :cond_e

    sget-object p1, Lek8;->a:Lek8;

    invoke-virtual {p0, p1}, Lb94;->run(Ljava/lang/Object;)V

    goto :goto_1f

    :cond_e
    iget p1, p2, Lpzh;->d:I

    const/16 v0, 0x194

    if-ne p1, v0, :cond_16

    const/4 p1, 0x0

    goto :goto_17

    :cond_16
    const/4 p1, 0x1

    :goto_17
    new-instance v0, Ldk8;

    invoke-direct {v0, p1}, Ldk8;-><init>(I)V

    invoke-virtual {p0, v0}, Lb94;->run(Ljava/lang/Object;)V
    :try_end_1f
    .catchall {:try_start_4 .. :try_end_1f} :catchall_23

    :goto_1f
    invoke-virtual {p2}, Lpzh;->close()V

    return-void

    :catchall_23
    move-exception p0

    invoke-virtual {p2}, Lpzh;->close()V

    throw p0
.end method

.method public final p(Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Luoj;

    iget-object v0, p0, Luoj;->w:Lhag;

    invoke-virtual {v0, p1}, Lhag;->H(Ljava/lang/String;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Luoj;->G0(Z)V

    return-void
.end method

.method public final q(Ljava/lang/Integer;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p2, Lhjk;

    new-instance p0, Lfjk;

    invoke-direct {p0, p2, p1}, Lfjk;-><init>(Lhjk;Ljava/lang/Integer;)V

    return-object p0
.end method

.method public final r()Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lbf9;

    iget-object p0, p0, Lbf9;->d:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "device_auth_token"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final s(Litd;)V
    .registers 4

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/appcompat/widget/Toolbar;

    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->a:Lqe;

    iget-object v0, v0, Lqe;->t:Lne;

    if-eqz v0, :cond_10

    invoke-virtual {v0}, Lne;->k()Z

    move-result v0

    if-nez v0, :cond_28

    :cond_10
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar;->F:Lntd;

    iget-object v0, v0, Lntd;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_18
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmud;

    invoke-interface {v1, p1}, Lmud;->b(Landroid/view/Menu;)V

    goto :goto_18

    :cond_28
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->N:Ldcl;

    if-eqz p0, :cond_2f

    invoke-virtual {p0, p1}, Ldcl;->s(Litd;)V

    :cond_2f
    return-void
.end method

.method public final shutdown()V
    .registers 1

    return-void
.end method

.method public final start()V
    .registers 1

    return-void
.end method

.method public final u()Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lbf9;

    iget-object p0, p0, Lbf9;->d:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "device_id"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final v(Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Luoj;

    iget-object v0, p0, Luoj;->w:Lhag;

    invoke-virtual {v0, p1}, Lhag;->H(Ljava/lang/String;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Luoj;->G0(Z)V

    return-void
.end method

.method public final w(Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p1, Lgpn;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lgpn;

    iget v1, v0, Lgpn;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lgpn;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lgpn;

    invoke-direct {v0, p0, p1}, Lgpn;-><init>(Loji;Lnt5;)V

    :goto_18
    iget-object p0, v0, Lgpn;->t:Ljava/lang/Object;

    sget-object p1, Lpx5;->a:Lpx5;

    iget v1, v0, Lgpn;->v:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_2e

    if-ne v1, v3, :cond_28

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    return-object p0

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v2

    :cond_2e
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p0, Lbb7;->a:Lcv6;

    sget-object p0, Ls6d;->a:Ld7a;

    iget-object p0, p0, Ld7a;->e:Ld7a;

    new-instance v1, Lrz1;

    const/4 v4, 0x2

    const/4 v5, 0x5

    invoke-direct {v1, v4, v2, v5}, Lrz1;-><init>(ILmt5;B)V

    iput v3, v0, Lgpn;->v:I

    invoke-static {p0, v1, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p1, :cond_47

    return-object p1

    :cond_47
    return-object p0
.end method

.method public final x(Litd;Landroid/view/MenuItem;)Z
    .registers 3

    const/4 p0, 0x0

    return p0
.end method

.method public final z()Ljava/security/PrivateKey;
    .registers 5

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lbf9;

    iget-object v0, p0, Lbf9;->d:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "priv"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_43

    iget-object v1, p0, Lbf9;->f:Lg16;

    const/4 v3, 0x0

    invoke-static {v0, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    iget-object v1, v1, Lg16;->a:Lt1;

    invoke-virtual {v1}, Lt1;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc36;

    invoke-virtual {v1, v0}, Lc36;->b([B)[B

    move-result-object v0

    if-eqz v0, :cond_40

    sget-object v1, Lp36;->a:Lii;

    :try_start_2c
    const-string v1, "RSA"

    invoke-static {v1}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v1

    new-instance v3, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-direct {v3, v0}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    invoke-virtual {v1, v3}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    move-result-object v0
    :try_end_3b
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_2c .. :try_end_3b} :catch_3c
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2c .. :try_end_3b} :catch_3c

    goto :goto_3d

    :catch_3c
    move-object v0, v2

    :goto_3d
    if-eqz v0, :cond_40

    return-object v0

    :cond_40
    invoke-virtual {p0}, Lbf9;->k()V

    :cond_43
    invoke-virtual {p0}, Lbf9;->m()Ljava/security/KeyPair;

    move-result-object p0

    if-nez p0, :cond_4a

    return-object v2

    :cond_4a
    invoke-virtual {p0}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object p0

    return-object p0
.end method
