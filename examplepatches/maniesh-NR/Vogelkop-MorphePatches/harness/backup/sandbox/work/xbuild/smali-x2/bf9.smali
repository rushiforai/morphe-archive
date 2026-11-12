.class public final Lbf9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# static fields
.field public static final A:Lbxl;


# instance fields
.field public final a:Loji;

.field public final b:Landroid/content/Context;

.field public final c:Lumi;

.field public final d:Lj4c;

.field public final e:Lle9;

.field public final f:Lg16;

.field public final g:Ljava/util/ArrayList;

.field public final h:Lxl;

.field public final i:Lh7f;

.field public final j:Ljava/util/ArrayList;

.field public final k:Ljava/util/HashSet;

.field public l:Lzd2;

.field public m:Lzd2;

.field public n:Lzd2;

.field public o:Lih4;

.field public p:Lmgh;

.field public q:Lh5k;

.field public r:Lzd2;

.field public s:Ljava/lang/String;

.field public t:Ljava/lang/String;

.field public final u:Ljava/util/ArrayList;

.field public v:Z

.field public final w:Ljava/util/HashMap;

.field public final x:Ljava/util/ArrayList;

.field public y:Lmgh;

.field public z:Lcom/opera/android/browser/chromium/CookieManager;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lbxl;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lbxl;-><init>(B)V

    sput-object v0, Lbf9;->A:Lbxl;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Ldb;Lzwk;Lcom/opera/android/settings/SettingsManager;Lj4c;Lt1;)V
    .registers 16

    new-instance v0, Lge5;

    const/16 v2, 0x18

    invoke-direct {v0, p1, p2, v2}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lg16;

    move-object v7, p7

    invoke-direct {v2, p7}, Lg16;-><init>(Lt1;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v3, Loji;

    invoke-direct {v3, p0}, Loji;-><init>(Ljava/lang/Object;)V

    iput-object v3, p0, Lbf9;->a:Loji;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lbf9;->g:Ljava/util/ArrayList;

    new-instance v4, Lh7f;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object v4, p0, Lbf9;->i:Lh7f;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lbf9;->j:Ljava/util/ArrayList;

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    iput-object v4, p0, Lbf9;->k:Ljava/util/HashSet;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    iput-object v4, p0, Lbf9;->b:Landroid/content/Context;

    iput-object p2, p0, Lbf9;->c:Lumi;

    iput-object p6, p0, Lbf9;->d:Lj4c;

    iput-object v2, p0, Lbf9;->f:Lg16;

    iget-object v2, v0, Lge5;->b:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    iget-object v0, v0, Lge5;->c:Ljava/lang/Object;

    check-cast v0, Lumi;

    new-instance v4, Lle9;

    invoke-direct {v4, v2, v0, v3}, Lle9;-><init>(Landroid/content/Context;Lumi;Loji;)V

    iput-object v4, p0, Lbf9;->e:Lle9;

    new-instance v0, Lxl;

    invoke-direct {v0, p1, p2}, Lxl;-><init>(Landroid/content/Context;Lumi;)V

    iput-object v0, p0, Lbf9;->h:Lxl;

    invoke-virtual {v0}, Lldk;->h()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lbf9;->u:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lbf9;->w:Ljava/util/HashMap;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lbf9;->x:Ljava/util/ArrayList;

    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    if-nez v0, :cond_90

    new-instance v0, Lfs2;

    move-object v1, p0

    move-object v5, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lfs2;-><init>(Lbf9;Ldb;Lzwk;Lcom/opera/android/settings/SettingsManager;Lumi;Lj4c;Lt1;)V

    sget-object v2, Lcak;->d:Lavj;

    const/4 v2, 0x1

    invoke-static {v2, v0}, Lavj;->g(ILjava/lang/Runnable;)V

    new-instance v0, Lpc9;

    invoke-direct {v0, p1, p2, p0, p5}, Lpc9;-><init>(Landroid/content/Context;Lumi;Lbf9;Lcom/opera/android/settings/SettingsManager;)V

    invoke-virtual {p0, v0}, Lbf9;->a(Lvwl;)V

    :cond_90
    return-void
.end method

.method public static Q(I)C
    .registers 2

    rem-int/lit8 p0, p0, 0x3e

    const/16 v0, 0x1a

    if-ge p0, v0, :cond_a

    add-int/lit8 p0, p0, 0x61

    :goto_8
    int-to-char p0, p0

    return p0

    :cond_a
    const/16 v0, 0x34

    if-ge p0, v0, :cond_11

    add-int/lit8 p0, p0, 0x27

    goto :goto_8

    :cond_11
    add-int/lit8 p0, p0, -0x4

    goto :goto_8
.end method

.method public static e(Lrwl;Lpwl;Ljava/security/PrivateKey;)[B
    .registers 7

    iget-object v0, p0, Lrwl;->b:Ljava/lang/String;

    iget-object p0, p0, Lrwl;->c:Ljava/lang/String;

    iget-object p1, p1, Lpwl;->f:Ljava/security/PublicKey;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p0, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    const-string v3, "SHA512withRSA/PSS"

    invoke-static {v1, p0, p1, v3}, Lp36;->f([B[BLjava/security/PublicKey;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_19

    const/4 p0, 0x1

    goto :goto_1f

    :cond_19
    const-string v3, "SHA512withRSA"

    invoke-static {v1, p0, p1, v3}, Lp36;->f([B[BLjava/security/PublicKey;Ljava/lang/String;)Z

    move-result p0

    :goto_1f
    if-nez p0, :cond_23

    const/4 p0, 0x0

    return-object p0

    :cond_23
    invoke-static {v0, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    const/4 p1, 0x2

    invoke-static {p1, p0, p2}, Lp36;->b(I[BLjava/security/Key;)[B

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final A(Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lbf9;->a:Loji;

    invoke-virtual {v0}, Loji;->u()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Lbf9;->h()V

    return-void

    :cond_10
    iget-object v0, p0, Lbf9;->h:Lxl;

    invoke-virtual {v0}, Lxl;->k()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    :goto_17
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_3a

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpwl;

    iget-object v2, v2, Lpwl;->a:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_37

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lbf9;->J(Ljava/util/List;)Lpwl;

    return-void

    :cond_37
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    :cond_3a
    return-void
.end method

.method public final B()V
    .registers 8

    iget-object v0, p0, Lbf9;->q:Lh5k;

    const/4 v3, 0x0

    iget-object v2, p0, Lbf9;->e:Lle9;

    if-eqz v0, :cond_28

    iget-object v0, p0, Lbf9;->p:Lmgh;

    if-eqz v0, :cond_28

    new-instance v4, Laxl;

    const/4 v1, 0x3

    invoke-direct {v4, p0, v1}, Laxl;-><init>(Lbf9;B)V

    new-instance v5, Laxl;

    const/4 v1, 0x4

    invoke-direct {v5, p0, v1}, Laxl;-><init>(Lbf9;B)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lws1;

    const/16 v6, 0x12

    invoke-direct/range {v1 .. v6}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1, v5}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    move-result-object p0

    iput-object p0, v0, Lmgh;->b:Ljava/lang/Object;

    return-void

    :cond_28
    invoke-virtual {p0}, Lbf9;->r()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_51

    iget-object v0, p0, Lbf9;->r:Lzd2;

    if-eqz v0, :cond_36

    invoke-virtual {v0}, Lzd2;->cancel()V

    :cond_36
    new-instance v4, Laxl;

    const/4 v0, 0x1

    invoke-direct {v4, p0, v0}, Laxl;-><init>(Lbf9;B)V

    new-instance v5, Laxl;

    invoke-direct {v5, p0, v1}, Laxl;-><init>(Lbf9;B)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lws1;

    const/16 v6, 0x12

    invoke-direct/range {v1 .. v6}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1, v5}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    move-result-object v0

    iput-object v0, p0, Lbf9;->r:Lzd2;

    :cond_51
    return-void
.end method

.method public final C()V
    .registers 13

    invoke-virtual {p0}, Lbf9;->r()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_f

    iget-object v0, p0, Lbf9;->l:Lzd2;

    if-nez v0, :cond_f

    iget-object v3, p0, Lbf9;->s:Ljava/lang/String;

    if-nez v3, :cond_10

    :cond_f
    return-void

    :cond_10
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "OFA/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lbf9;->b:Landroid/content/Context;

    invoke-static {v1}, Lr9n;->t(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sget v0, Lu1b;->c:I

    new-instance v5, Lx1b;

    const-string v0, "sync"

    invoke-direct {v5, v0}, Lx1b;-><init>(Ljava/lang/Object;)V

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-static {v1}, Lcom/opera/android/utilities/DisplayUtil;->e(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_3b

    const-string v0, "tablet"

    :goto_39
    move-object v7, v0

    goto :goto_3e

    :cond_3b
    const-string v0, "mobile"

    goto :goto_39

    :goto_3e
    const-string v0, "ofa:"

    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    new-instance v1, Lxx1;

    const/16 v6, 0xd

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lxx1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v11, Laxl;

    const/4 p0, 0x6

    invoke-direct {v11, v2, p0}, Laxl;-><init>(Lbf9;B)V

    move-object v9, v5

    iget-object v5, v2, Lbf9;->e:Lle9;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v6, v4

    new-instance v4, Lxe9;

    move-object v10, v1

    invoke-direct/range {v4 .. v11}, Lxe9;-><init>(Lle9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lx1b;Lxx1;Laxl;)V

    invoke-static {v4, v11}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    move-result-object p0

    iput-object p0, v2, Lbf9;->l:Lzd2;

    return-void
.end method

.method public final D(Lhxl;)V
    .registers 2

    iget-object p0, p0, Lbf9;->i:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final E(Lw59;Lcom/opera/api/Callback;)Lih4;
    .registers 16

    invoke-virtual {p0}, Lbf9;->q()Lpc9;

    move-result-object v2

    invoke-virtual {p0}, Lbf9;->r()I

    move-result v0

    const/4 v1, 0x2

    sget-object v3, Lbf9;->A:Lbxl;

    const/4 v4, 0x0

    if-ge v0, v1, :cond_14

    if-eqz p2, :cond_2f

    invoke-interface {p2, v4}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-object v3

    :cond_14
    iget-object v0, p1, Lw59;->a:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lbf9;->j(Ljava/lang/String;)Llyf;

    move-result-object v0

    if-nez v0, :cond_22

    if-eqz p2, :cond_2f

    invoke-interface {p2, v4}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-object v3

    :cond_22
    iget-object v1, p1, Lw59;->b:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lbf9;->j(Ljava/lang/String;)Llyf;

    move-result-object v1

    if-nez v1, :cond_30

    if-eqz p2, :cond_2f

    invoke-interface {p2, v4}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_2f
    return-object v3

    :cond_30
    iget-object v3, v0, Llyf;->a:Ljava/lang/Object;

    move-object v8, v3

    check-cast v8, Ljava/lang/String;

    iget-object v3, v1, Llyf;->a:Ljava/lang/Object;

    move-object v9, v3

    check-cast v9, Ljava/lang/String;

    move-object v10, v8

    iget-object v8, p1, Lw59;->c:Ljava/lang/String;

    iget-object v3, v0, Llyf;->b:Ljava/lang/Object;

    move-object v11, v3

    check-cast v11, Ljava/lang/String;

    iget-object v3, v1, Llyf;->b:Ljava/lang/Object;

    move-object v12, v3

    check-cast v12, Ljava/lang/String;

    move-object v3, v0

    new-instance v0, Lqe9;

    const/4 v7, 0x0

    move-object v5, p1

    move-object v6, p2

    move-object v4, v1

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lqe9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object v3, v12

    new-instance v12, Lj12;

    const/4 p0, 0x4

    invoke-direct {v12, v6, p0}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    iget-object v5, v1, Lbf9;->e:Lle9;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lbe9;

    move-object v7, v9

    move-object v6, v10

    move-object v9, v11

    move-object v11, v0

    move-object v10, v3

    invoke-direct/range {v4 .. v12}, Lbe9;-><init>(Lle9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lqe9;Lj12;)V

    invoke-static {v4, v12}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    move-result-object p0

    return-object p0
.end method

.method public final bridge synthetic F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lhxl;

    invoke-virtual {p0, p1}, Lbf9;->b(Lhxl;)V

    return-void
.end method

.method public final G(Ljava/lang/String;Lcom/opera/api/Callback;)V
    .registers 8

    invoke-virtual {p0}, Lbf9;->q()Lpc9;

    move-result-object v0

    if-nez v0, :cond_c

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p2, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_c
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "type"

    const-string v3, "text"

    :try_start_1a
    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_21
    .catch Lorg/json/JSONException; {:try_start_1a .. :try_end_21} :catch_45

    :try_start_21
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v1, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_28
    .catch Lorg/json/JSONException; {:try_start_21 .. :try_end_28} :catch_40

    new-instance p1, Lw59;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p1, v0, v1, v2, v2}, Lw59;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lj12;

    const/4 v1, 0x3

    invoke-direct {v0, p2, v1}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {p0, p1, v0}, Lbf9;->E(Lw59;Lcom/opera/api/Callback;)Lih4;

    return-void

    :catch_40
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :catch_45
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void
.end method

.method public final bridge synthetic H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lhxl;

    invoke-virtual {p0, p1}, Lbf9;->D(Lhxl;)V

    return-void
.end method

.method public final I(Lvz;Lzzh;Z)Lmgh;
    .registers 15

    new-instance v0, Lmgh;

    new-instance v4, Lcxl;

    const/4 v1, 0x0

    invoke-direct {v4, p0, p2, v1}, Lcxl;-><init>(Lbf9;Lzzh;B)V

    new-instance v5, Lve9;

    const/4 v10, 0x4

    move-object v6, p0

    move-object v8, p1

    move-object v9, p2

    move v7, p3

    invoke-direct/range {v5 .. v10}, Lve9;-><init>(Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;B)V

    move-object v3, v8

    iget-object v2, v6, Lbf9;->e:Lle9;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lws1;

    const/16 v6, 0x11

    invoke-direct/range {v1 .. v6}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1, v5}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    move-result-object p0

    const/16 p1, 0x8

    invoke-direct {v0, p0, v9, p1}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0
.end method

.method public final J(Ljava/util/List;)Lpwl;
    .registers 10

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Lbf9;->q()Lpc9;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Lpc9;->d()V

    :cond_f
    iget-object v0, p0, Lbf9;->u:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-virtual {p0, p1}, Lbf9;->K(Ljava/util/List;)Lpwl;

    move-result-object p0

    return-object p0

    :cond_1c
    iget-object v1, p0, Lbf9;->h:Lxl;

    invoke-virtual {v1}, Lxl;->k()Ljava/util/List;

    move-result-object v1

    new-instance v2, Ljava/util/HashSet;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/HashSet;-><init>(I)V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_41

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lpwl;

    iget-object v3, v3, Lpwl;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_2f

    :cond_41
    invoke-virtual {p0, p1}, Lbf9;->K(Ljava/util/List;)Lpwl;

    move-result-object v1

    iget-object p0, p0, Lbf9;->a:Loji;

    invoke-virtual {p0}, Loji;->u()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v3, 0x0

    :cond_50
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_87

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lpwl;

    iget-object v4, v4, Lpwl;->a:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_50

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_50

    if-nez v3, :cond_74

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_74
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x0

    :goto_79
    if-ge v6, v5, :cond_50

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Lcom/opera/api/Callback;

    invoke-interface {v7, v4}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_79

    :cond_87
    return-object v1
.end method

.method public final K(Ljava/util/List;)Lpwl;
    .registers 6

    const/4 v0, 0x0

    iput-object v0, p0, Lbf9;->t:Ljava/lang/String;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpwl;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v3, v2, Lowl;

    if-eqz v3, :cond_7

    iget-object v0, v2, Lpwl;->a:Ljava/lang/String;

    iput-object v0, p0, Lbf9;->t:Ljava/lang/String;

    move-object v0, v2

    :cond_1f
    iget-object v1, p0, Lbf9;->h:Lxl;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v2, v1, Lxl;->m:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lldk;->g(Ljava/lang/Object;)V

    iget-object p0, p0, Lbf9;->i:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_34
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_44

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lhxl;

    invoke-interface {p1}, Lhxl;->z()V

    goto :goto_34

    :cond_44
    return-object v0
.end method

.method public final M(Ljavax/crypto/SecretKey;)V
    .registers 6

    iget-object v0, p0, Lbf9;->d:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object p1

    iget-object v1, p0, Lbf9;->f:Lg16;

    iget-object v1, v1, Lg16;->a:Lt1;

    invoke-virtual {v1}, Lt1;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc36;

    invoke-virtual {v1, p1}, Lc36;->d([B)[B

    move-result-object p1

    const/4 v1, 0x2

    invoke-static {p1, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p1

    const-string v2, "shared"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lbf9;->z()V

    invoke-virtual {p0}, Lbf9;->q()Lpc9;

    move-result-object p0

    if-eqz p0, :cond_58

    iget-object p1, p0, Lpc9;->g:Lqie;

    iget-object v0, p0, Lpc9;->b:Lumi;

    new-instance v2, Lec9;

    invoke-direct {v2, p0, v1}, Lec9;-><init>(Lpc9;B)V

    invoke-interface {v0, v2}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v1

    new-instance v2, Ldc9;

    const/4 v3, 0x5

    invoke-direct {v2, p0, v3}, Ldc9;-><init>(Lpc9;B)V

    invoke-virtual {v0, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {v1, p0}, Lnml;->b(Lnml;)V

    new-instance p0, Loml;

    invoke-direct {p0, v1}, Loml;-><init>(Lnml;)V

    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    :cond_58
    return-void
.end method

.method public final N()V
    .registers 6

    invoke-virtual {p0}, Lbf9;->r()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_b

    iget-object v0, p0, Lbf9;->n:Lzd2;

    if-eqz v0, :cond_c

    :cond_b
    return-void

    :cond_c
    iget-object v0, p0, Lbf9;->m:Lzd2;

    const/4 v2, 0x0

    if-eqz v0, :cond_16

    invoke-virtual {v0}, Lzd2;->cancel()V

    iput-object v2, p0, Lbf9;->m:Lzd2;

    :cond_16
    iget-object v0, p0, Lbf9;->p:Lmgh;

    if-eqz v0, :cond_1f

    invoke-virtual {v0}, Lmgh;->cancel()V

    iput-object v2, p0, Lbf9;->p:Lmgh;

    :cond_1f
    iget-object v0, p0, Lbf9;->o:Lih4;

    if-eqz v0, :cond_28

    invoke-interface {v0}, Lih4;->cancel()V

    iput-object v2, p0, Lbf9;->o:Lih4;

    :cond_28
    iget-object v0, p0, Lbf9;->r:Lzd2;

    if-eqz v0, :cond_31

    invoke-virtual {v0}, Lzd2;->cancel()V

    iput-object v2, p0, Lbf9;->r:Lzd2;

    :cond_31
    new-instance v0, Lwe9;

    invoke-direct {v0, p0, v1}, Lwe9;-><init>(Lbf9;B)V

    new-instance v1, Laxl;

    const/4 v2, 0x5

    invoke-direct {v1, p0, v2}, Laxl;-><init>(Lbf9;B)V

    iget-object v2, p0, Lbf9;->e:Lle9;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lvdi;

    const/16 v4, 0x9

    invoke-direct {v3, v2, v0, v1, v4}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3, v1}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    move-result-object v0

    iput-object v0, p0, Lbf9;->n:Lzd2;

    return-void
.end method

.method public final O(Z)V
    .registers 6

    invoke-virtual {p0}, Lbf9;->r()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_b

    iget-object v0, p0, Lbf9;->n:Lzd2;

    if-eqz v0, :cond_c

    :cond_b
    return-void

    :cond_c
    iget-object v0, p0, Lbf9;->o:Lih4;

    if-eqz v0, :cond_16

    invoke-interface {v0}, Lih4;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lbf9;->o:Lih4;

    :cond_16
    new-instance v0, Lw8d;

    const/4 v1, 0x3

    invoke-direct {v0, v1, p0, p1}, Lw8d;-><init>(BLjava/lang/Object;Z)V

    new-instance p1, Laxl;

    const/4 v1, 0x0

    invoke-direct {p1, p0, v1}, Laxl;-><init>(Lbf9;B)V

    iget-object v1, p0, Lbf9;->e:Lle9;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lvdi;

    const/16 v3, 0xa

    invoke-direct {v2, v1, v0, p1, v3}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, p1}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    move-result-object p1

    iput-object p1, p0, Lbf9;->o:Lih4;

    return-void
.end method

.method public final P(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    invoke-virtual {p0}, Lbf9;->s()Lmyk;

    move-result-object p0

    if-eqz p0, :cond_5f

    iget-object v0, p0, Lmyk;->c:Lzwk;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lcak;->d:Lavj;

    const/4 v0, 0x1

    invoke-static {v0}, Lavj;->b(I)Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-static {p2}, LJ/N;->M3WWUsfl(Ljava/lang/Object;)Z

    :cond_17
    invoke-virtual {p0}, Lmyk;->a()V

    iget-object p0, p0, Lmyk;->b:Ldb;

    iget-object p0, p0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-eqz p0, :cond_5f

    invoke-virtual {p0}, Lcom/opera/android/oauth2/OAuth2Account;->b()Z

    move-result p2

    if-eqz p2, :cond_5f

    iget-object p2, p0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    iget-object p2, p2, Lrb;->a:Lb59;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/SharedPreferences;

    const-string v1, "pun_1"

    const/4 v2, 0x0

    invoke-interface {p2, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_5f

    invoke-virtual {p0, p1}, Lcom/opera/android/oauth2/OAuth2Account;->d(Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/opera/android/oauth2/OAuth2Account;->e(Z)V

    invoke-virtual {p0, v0}, Lcom/opera/android/oauth2/OAuth2Account;->c(Z)V

    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->b:Lyqa;

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Ldb;

    iget-object p0, p0, Ldb;->e:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_4f
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_5f

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcb;

    invoke-virtual {p1}, Lcb;->f()V

    goto :goto_4f

    :cond_5f
    return-void
.end method

.method public final R(Ljava/util/List;ZLcom/opera/api/Callback;)Lcrk;
    .registers 7

    new-instance v0, Lh5k;

    new-instance v1, Lwe9;

    const/4 v2, 0x5

    invoke-direct {v1, p0, v2}, Lwe9;-><init>(Lbf9;B)V

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p1, v0, Lh5k;->b:Ljava/lang/Object;

    new-instance p1, Lq65;

    const/4 v2, 0x4

    invoke-direct {p1, v1, v2}, Lq65;-><init>(Ljava/lang/Object;B)V

    iput-object p1, v0, Lh5k;->c:Ljava/lang/Object;

    iput-object p3, v0, Lh5k;->d:Ljava/lang/Object;

    iput-boolean p2, v0, Lh5k;->a:Z

    iput-object v0, p0, Lbf9;->q:Lh5k;

    iget-object p1, v0, Lh5k;->c:Ljava/lang/Object;

    check-cast p1, Lq65;

    const-wide/16 p2, 0xf

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v1, p0, Lbf9;->c:Lumi;

    invoke-virtual {p1, v1, p2, p3, v0}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    new-instance p1, Lcrk;

    const/16 p2, 0x13

    invoke-direct {p1, p0, p2}, Lcrk;-><init>(Ljava/lang/Object;B)V

    return-object p1
.end method

.method public final a(Lvwl;)V
    .registers 5

    iget-object v0, p0, Lbf9;->j:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lbf9;->j:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    iget-object v2, p0, Lbf9;->j:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_1d

    if-eqz v1, :cond_1a

    new-instance p1, Lwe9;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, Lwe9;-><init>(Lbf9;B)V

    invoke-static {p1}, Lvml;->e(Ljava/lang/Runnable;)V

    :cond_1a
    return-void

    :goto_1b
    :try_start_1b
    monitor-exit v0
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_1d

    throw p0

    :catchall_1d
    move-exception p0

    goto :goto_1b
.end method

.method public final b(Lhxl;)V
    .registers 3

    iget-object v0, p0, Lbf9;->i:Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Lbf9;->t()Z

    move-result p0

    if-eqz p0, :cond_11

    invoke-interface {p1}, Lhxl;->i()V

    :cond_11
    return-void
.end method

.method public final c(Ljava/lang/String;Laz4;Z)Lmgh;
    .registers 15

    new-instance v0, Lmgh;

    new-instance v4, Lsu;

    const/16 v1, 0x19

    invoke-direct {v4, p0, p2, p1, v1}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v5, Lve9;

    const/4 v10, 0x0

    move-object v6, p0

    move-object v8, p1

    move-object v9, p2

    move v7, p3

    invoke-direct/range {v5 .. v10}, Lve9;-><init>(Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;B)V

    move-object v3, v8

    iget-object v2, v6, Lbf9;->e:Lle9;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lws1;

    const/4 v6, 0x7

    invoke-direct/range {v1 .. v6}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1, v5}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    move-result-object p0

    const/16 p1, 0x8

    invoke-direct {v0, p0, v9, p1}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0
.end method

.method public final f(Lcom/opera/api/Callback;)V
    .registers 5

    invoke-virtual {p0}, Lbf9;->r()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_d

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_d
    new-instance v0, Lcn7;

    const/16 v1, 0x1d

    invoke-direct {v0, p0, p1, v1}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lj12;

    const/4 v2, 0x7

    invoke-direct {v1, p1, v2}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    iget-object p0, p0, Lbf9;->e:Lle9;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, La32;

    const/16 v2, 0xc

    invoke-direct {p1, p0, v0, v1, v2}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1, v1}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    return-void
.end method

.method public final g(Ljava/lang/String;)V
    .registers 10

    invoke-virtual {p0}, Lbf9;->r()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_8

    return-void

    :cond_8
    new-instance v5, Lrl;

    const/4 v0, 0x4

    invoke-direct {v5, v0}, Lrl;-><init>(B)V

    new-instance v6, Lvk2;

    const/16 v0, 0xe

    invoke-direct {v6, v0}, Lvk2;-><init>(B)V

    iget-object v3, p0, Lbf9;->e:Lle9;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lws1;

    const/16 v7, 0x10

    move-object v4, p1

    invoke-direct/range {v2 .. v7}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, v6}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    return-void
.end method

.method public final h()V
    .registers 3

    invoke-virtual {p0}, Lbf9;->r()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_a

    invoke-virtual {p0}, Lbf9;->N()V

    :cond_a
    return-void
.end method

.method public final i(Ljava/lang/String;)V
    .registers 10

    iget-object v0, p0, Lbf9;->a:Loji;

    invoke-virtual {v0}, Loji;->u()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Lbf9;->h()V

    return-void

    :cond_10
    invoke-virtual {p0}, Lbf9;->r()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_18

    return-void

    :cond_18
    new-instance v5, Lnpl;

    const/4 v0, 0x5

    invoke-direct {v5, p0, p1, v0}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v6, Lvk2;

    const/16 v0, 0xd

    invoke-direct {v6, v0}, Lvk2;-><init>(B)V

    iget-object v3, p0, Lbf9;->e:Lle9;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lws1;

    const/16 v7, 0x10

    move-object v4, p1

    invoke-direct/range {v2 .. v7}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, v6}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    return-void
.end method

.method public final j(Ljava/lang/String;)Llyf;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    invoke-virtual {p0}, Lbf9;->x()Ljavax/crypto/spec/SecretKeySpec;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_2f

    sget-object v1, Lp36;->a:Lii;

    const/16 v1, 0xc

    new-array v1, v1, [B

    new-instance v2, Ljava/security/SecureRandom;

    invoke-direct {v2}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v2, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v3, p0, v1, v2}, Lp36;->a(ILjavax/crypto/spec/SecretKeySpec;[BZ)Ljavax/crypto/Cipher;

    move-result-object p0

    if-eqz p0, :cond_26

    :try_start_21
    invoke-virtual {p0, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p0
    :try_end_25
    .catch Ljavax/crypto/BadPaddingException; {:try_start_21 .. :try_end_25} :catch_26
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_21 .. :try_end_25} :catch_26

    goto :goto_27

    :catch_26
    :cond_26
    move-object p0, v0

    :goto_27
    if-eqz p0, :cond_2f

    new-instance p1, Llyf;

    invoke-direct {p1, p0, v1}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_30

    :cond_2f
    move-object p1, v0

    :goto_30
    if-eqz p1, :cond_49

    new-instance p0, Llyf;

    iget-object v0, p1, Llyf;->a:Ljava/lang/Object;

    check-cast v0, [B

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    iget-object p1, p1, Llyf;->b:Ljava/lang/Object;

    check-cast p1, [B

    invoke-static {p1, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0

    :cond_49
    return-object v0
.end method

.method public final k()V
    .registers 3

    const/4 v0, 0x0

    iput-object v0, p0, Lbf9;->t:Ljava/lang/String;

    iget-object v0, p0, Lbf9;->d:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "priv"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "pub"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "device_id"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "device_auth_token"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "device_notification_token"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "device_version_token"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "device_capabilities"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "shared"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v0, Lwe9;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lwe9;-><init>(Lbf9;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final l(Ljava/lang/String;)Lpwl;
    .registers 4

    invoke-virtual {p0}, Lbf9;->r()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_e

    iget-object p0, p0, Lbf9;->h:Lxl;

    invoke-virtual {p0}, Lxl;->k()Ljava/util/List;

    move-result-object p0

    goto :goto_16

    :cond_e
    iget-object p0, p0, Lbf9;->q:Lh5k;

    if-eqz p0, :cond_2f

    iget-object p0, p0, Lh5k;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    :goto_16
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpwl;

    iget-object v1, v0, Lpwl;->a:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    return-object v0

    :cond_2f
    const/4 p0, 0x0

    return-object p0
.end method

.method public final m()Ljava/security/KeyPair;
    .registers 5

    sget-object v0, Lp36;->a:Lii;

    const/4 v0, 0x0

    :try_start_3
    const-string v1, "RSA"

    invoke-static {v1}, Ljava/security/KeyPairGenerator;->getInstance(Ljava/lang/String;)Ljava/security/KeyPairGenerator;

    move-result-object v1

    const/16 v2, 0x800

    invoke-virtual {v1, v2}, Ljava/security/KeyPairGenerator;->initialize(I)V

    invoke-virtual {v1}, Ljava/security/KeyPairGenerator;->generateKeyPair()Ljava/security/KeyPair;

    move-result-object v1
    :try_end_12
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_3 .. :try_end_12} :catch_13

    goto :goto_14

    :catch_13
    move-object v1, v0

    :goto_14
    if-eqz v1, :cond_2e

    invoke-virtual {v1}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v2

    invoke-interface {v2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v2

    iget-object v3, p0, Lbf9;->f:Lg16;

    iget-object v3, v3, Lg16;->a:Lt1;

    invoke-virtual {v3}, Lt1;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lc36;

    invoke-virtual {v3, v2}, Lc36;->d([B)[B

    move-result-object v2

    if-nez v2, :cond_2f

    :cond_2e
    return-object v0

    :cond_2f
    iget-object p0, p0, Lbf9;->d:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "priv"

    const/4 v3, 0x2

    invoke-static {v2, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-virtual {v1}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v0

    invoke-interface {v0}, Ljava/security/Key;->getEncoded()[B

    move-result-object v0

    invoke-static {v0, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    const-string v2, "pub"

    invoke-interface {p0, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-object v1
.end method

.method public final n(Ljava/lang/Class;)Lvwl;
    .registers 7

    iget-object v0, p0, Lbf9;->j:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lbf9;->j:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_a
    if-ge v2, v1, :cond_20

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lvwl;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_a

    monitor-exit v0

    return-object v3

    :cond_20
    monitor-exit v0

    const/4 p0, 0x0

    return-object p0

    :goto_23
    monitor-exit v0
    :try_end_24
    .catchall {:try_start_3 .. :try_end_24} :catchall_25

    throw p0

    :catchall_25
    move-exception p0

    goto :goto_23
.end method

.method public final o(Lzzh;)Lih4;
    .registers 5

    invoke-virtual {p0}, Lbf9;->s()Lmyk;

    move-result-object v0

    invoke-virtual {p0}, Lbf9;->r()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_2c

    if-eqz v0, :cond_2c

    new-instance v1, Lhu5;

    const/16 v2, 0xe

    invoke-direct {v1, v0, p1, v2}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lhu5;

    const/16 v2, 0xf

    invoke-direct {v0, p0, p1, v2}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lbf9;->e:Lle9;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, La32;

    const/16 v2, 0xd

    invoke-direct {p1, p0, v1, v0, v2}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1, v0}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    move-result-object p0

    return-object p0

    :cond_2c
    if-eqz p1, :cond_33

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p1, p0}, Lzzh;->run(Ljava/lang/Object;)V

    :cond_33
    sget-object p0, Lbf9;->A:Lbxl;

    return-object p0
.end method

.method public final p(Ljava/lang/Long;Lcom/opera/api/Callback;)Lih4;
    .registers 12

    invoke-virtual {p0}, Lbf9;->q()Lpc9;

    move-result-object v0

    invoke-virtual {p0}, Lbf9;->r()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_2c

    if-eqz v0, :cond_2c

    new-instance v6, Lhu5;

    const/16 v1, 0x10

    invoke-direct {v6, v0, p2, v1}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v7, Lj12;

    const/4 v0, 0x6

    invoke-direct {v7, p2, v0}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    iget-object v4, p0, Lbf9;->e:Lle9;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lws1;

    const/16 v8, 0x8

    move-object v5, p1

    invoke-direct/range {v3 .. v8}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3, v7}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    move-result-object p0

    return-object p0

    :cond_2c
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p2, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    sget-object p0, Lbf9;->A:Lbxl;

    return-object p0
.end method

.method public final q()Lpc9;
    .registers 2

    const-class v0, Lpc9;

    invoke-virtual {p0, v0}, Lbf9;->n(Ljava/lang/Class;)Lvwl;

    move-result-object p0

    check-cast p0, Lpc9;

    return-object p0
.end method

.method public final r()I
    .registers 4

    iget-object p0, p0, Lbf9;->d:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "device_id"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_13

    const/4 p0, 0x0

    return p0

    :cond_13
    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "shared"

    invoke-interface {p0, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_23

    const/4 p0, 0x1

    return p0

    :cond_23
    const/4 p0, 0x2

    return p0
.end method

.method public final s()Lmyk;
    .registers 2

    const-class v0, Lmyk;

    invoke-virtual {p0, v0}, Lbf9;->n(Ljava/lang/Class;)Lvwl;

    move-result-object p0

    check-cast p0, Lmyk;

    return-object p0
.end method

.method public final t()Z
    .registers 2

    iget-object v0, p0, Lbf9;->j:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lbf9;->j:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    monitor-exit v0

    return p0

    :goto_d
    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_f

    throw p0

    :catchall_f
    move-exception p0

    goto :goto_d
.end method

.method public final u()Ljava/util/List;
    .registers 6

    invoke-virtual {p0}, Lbf9;->r()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_a

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0

    :cond_a
    iget-object v0, p0, Lbf9;->h:Lxl;

    invoke-virtual {v0}, Lxl;->k()Ljava/util/List;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iget-object p0, p0, Lbf9;->d:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v2, "device_id"

    const/4 v3, 0x0

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_47

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpwl;

    new-instance v3, Lfxl;

    iget-object v4, v2, Lpwl;->a:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    invoke-direct {v3, v2, v4}, Lfxl;-><init>(Lpwl;Z)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2c

    :cond_47
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final v(Ljava/util/List;)Z
    .registers 4

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_31

    iget-object p0, p0, Lbf9;->d:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "device_id"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_31

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_31

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpwl;

    iget-object v0, v0, Lpwl;->a:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    const/4 p0, 0x1

    return p0

    :cond_31
    const/4 p0, 0x0

    return p0
.end method

.method public final x()Ljavax/crypto/spec/SecretKeySpec;
    .registers 5

    iget-object v0, p0, Lbf9;->d:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "shared"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_26

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    iget-object p0, p0, Lbf9;->f:Lg16;

    iget-object p0, p0, Lg16;->a:Lt1;

    invoke-virtual {p0}, Lt1;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc36;

    invoke-virtual {p0, v0}, Lc36;->b([B)[B

    move-result-object p0

    if-nez p0, :cond_27

    :cond_26
    return-object v2

    :cond_27
    sget-object v0, Lp36;->a:Lii;

    new-instance v0, Ljavax/crypto/spec/SecretKeySpec;

    array-length v2, p0

    const-string v3, "AES"

    invoke-direct {v0, p0, v1, v2, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BIILjava/lang/String;)V

    return-object v0
.end method

.method public final y(Lcom/opera/api/Callback;Z)Lih4;
    .registers 11

    invoke-virtual {p0}, Lbf9;->s()Lmyk;

    move-result-object v0

    if-nez v0, :cond_e

    sget-object p0, Laf9;->c:Laf9;

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    sget-object p0, Lbf9;->A:Lbxl;

    return-object p0

    :cond_e
    const/16 v1, 0x8

    if-eqz p2, :cond_1d

    new-instance p0, Lj12;

    invoke-direct {p0, p1, v1}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    new-instance p1, Ljyk;

    invoke-direct {p1, v0, p0}, Ljyk;-><init>(Lmyk;Lcom/opera/api/Callback;)V

    return-object p1

    :cond_1d
    new-instance p2, Lmgh;

    const/4 v2, 0x0

    invoke-direct {p2, v2, p1, v1}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, p0, Lbf9;->z:Lcom/opera/android/browser/chromium/CookieManager;

    if-nez v1, :cond_2e

    new-instance v1, Lcom/opera/android/browser/chromium/CookieManager;

    invoke-direct {v1}, Lcom/opera/android/browser/chromium/CookieManager;-><init>()V

    iput-object v1, p0, Lbf9;->z:Lcom/opera/android/browser/chromium/CookieManager;

    :cond_2e
    new-instance v2, Lorg/chromium/url/GURL;

    invoke-static {}, Ldgh;->h()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    new-instance v7, Lsu;

    const/16 p0, 0x1a

    invoke-direct {v7, p2, v0, p1, p0}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v2 .. v7}, LJ/N;->M8VJflmI(Ljava/lang/Object;ZZZLjava/lang/Object;Ljava/lang/Object;)V

    return-object p2
.end method

.method public final z()V
    .registers 3

    invoke-virtual {p0}, Lbf9;->r()I

    move-result v0

    iget-object p0, p0, Lbf9;->i:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_a
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lhxl;

    invoke-interface {v1, v0}, Lhxl;->x(I)V

    goto :goto_a

    :cond_1a
    return-void
.end method
