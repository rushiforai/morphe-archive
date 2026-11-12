.class public final Lcko;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbpo;


# instance fields
.field public final a:Lcom/opera/ads/internal/fullscreenad/AdActivity;

.field public b:Z

.field public final c:Lylp;

.field public d:Llzo;

.field public e:Ldpo;

.field public f:J

.field public g:J

.field public h:J

.field public i:J

.field public j:J

.field public k:I

.field public l:J

.field public m:J

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:Z


# direct methods
.method public constructor <init>(Lcom/opera/ads/internal/fullscreenad/AdActivity;Lylp;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcko;->a:Lcom/opera/ads/internal/fullscreenad/AdActivity;

    iput-object p2, p0, Lcko;->c:Lylp;

    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lcko;->f:J

    iput-wide p1, p0, Lcko;->g:J

    iput-wide p1, p0, Lcko;->h:J

    iput-wide p1, p0, Lcko;->i:J

    iput-wide p1, p0, Lcko;->j:J

    iput-wide p1, p0, Lcko;->l:J

    iput-wide p1, p0, Lcko;->m:J

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    const/4 v0, 0x1

    .line 44
    iput-boolean v0, p0, Lcko;->b:Z

    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .registers 8

    invoke-virtual {p0}, Lcko;->f()Lvm;

    move-result-object v0

    if-eqz v0, :cond_b

    check-cast v0, Lwoo;

    invoke-virtual {v0}, Lwoo;->onAdClicked()V

    :cond_b
    new-instance v0, Lagm;

    iget-object v1, p0, Lcko;->c:Lylp;

    iget-object v2, v1, Lvoo;->b:Lpro;

    iget-object v2, v2, Lpro;->b:Lsm;

    const/16 v3, 0x9

    iget-object v4, p0, Lcko;->a:Lcom/opera/ads/internal/fullscreenad/AdActivity;

    const/4 v5, 0x0

    invoke-direct {v0, v4, v2, v5, v3}, Lagm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lh1p;

    iget-object v3, v1, Lvoo;->o:Ljava/lang/String;

    iget-object v1, v1, Lvoo;->p:Ljava/lang/String;

    invoke-direct {v2, v3, v1, p1, v5}, Lh1p;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcko;->e()Lp7p;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Lagm;->e(Lh1p;Lp7p;)V

    return-void
.end method

.method public final b()V
    .registers 14

    invoke-virtual {p0}, Lcko;->f()Lvm;

    move-result-object v0

    if-eqz v0, :cond_155

    iget-object v1, p0, Lcko;->c:Lylp;

    iget-object v2, v1, Lvoo;->b:Lpro;

    iget-object v2, v2, Lpro;->b:Lsm;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lsm;->f:Lsm;

    const/4 v4, 0x0

    if-eq v2, v3, :cond_19

    sget-object v3, Lsm;->g:Lsm;

    if-eq v2, v3, :cond_19

    move-object v0, v4

    :cond_19
    if-eqz v0, :cond_155

    instance-of v2, v0, Lidf;

    if-eqz v2, :cond_22

    check-cast v0, Lidf;

    goto :goto_23

    :cond_22
    move-object v0, v4

    :goto_23
    if-eqz v0, :cond_155

    iget-object v2, v1, Lylp;->E:Leio;

    new-instance v3, La36;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    invoke-interface {v0, v3}, Lidf;->a(La36;)V

    if-eqz v2, :cond_3e

    iget-object v0, v2, Leio;->e:Ljava/lang/String;

    if-eqz v0, :cond_3e

    invoke-static {v0}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3f

    :cond_3e
    move-object v0, v4

    :goto_3f
    if-eqz v2, :cond_44

    iget-object v2, v2, Leio;->d:Ljava/lang/String;

    goto :goto_45

    :cond_44
    move-object v2, v4

    :goto_45
    invoke-static {v1}, Locp;->d(Lvoo;)Luro;

    if-eqz v0, :cond_155

    invoke-static {v0}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_155

    if-eqz v2, :cond_155

    invoke-static {v2}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_155

    invoke-static {v0}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_155

    new-instance v1, Lkotlin/Pair;

    const-string v3, "custom_data"

    invoke-direct {v1, v3, v4}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v3, Lkotlin/Pair;

    const-string v5, "event_id"

    invoke-direct {v3, v5, v4}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v5, Lkotlin/Pair;

    const-string v6, "publisher_user_id"

    invoke-direct {v5, v6, v4}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v6, Lpn7;->b:Lon7;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sget-object v8, Lun7;->d:Lun7;

    invoke-static {v6, v7, v8}, Lcs5;->y0(JLun7;)J

    move-result-wide v6

    sget-object v8, Lun7;->e:Lun7;

    invoke-static {v6, v7, v8}, Lpn7;->p(JLun7;)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lkotlin/Pair;

    const-string v8, "timestamp"

    invoke-direct {v7, v8, v6}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v1, v3, v5, v7}, [Lkotlin/Pair;

    move-result-object v1

    invoke-static {v1}, Lrbd;->c([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_a0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const-string v5, ""

    if-eqz v3, :cond_d2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v7, "{"

    const/16 v8, 0x7d

    invoke-static {v8, v7, v6}, Lam2;->m(CLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v3, :cond_c9

    invoke-static {v3}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_ca

    :cond_c9
    move-object v3, v4

    :goto_ca
    if-eqz v3, :cond_cd

    move-object v5, v3

    :cond_cd
    invoke-static {v0, v6, v5}, Lkotlin/text/c;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_a0

    :cond_d2
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->isHierarchical()Z

    move-result v1

    if-eqz v1, :cond_dd

    move-object v4, v0

    :cond_dd
    if-eqz v4, :cond_155

    invoke-virtual {v4}, Landroid/net/Uri;->getQueryParameterNames()Ljava/util/Set;

    move-result-object v0

    const-string v11, "se"

    const-string v12, "ts"

    const-string v6, "cc"

    const-string v7, "cd"

    const-string v8, "eid"

    const-string v9, "s"

    const-string v10, "puid"

    filled-new-array/range {v6 .. v12}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->N(Ljava/lang/Iterable;Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->b0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v6

    new-instance v11, Lb11;

    const/16 v0, 0x17

    invoke-direct {v11, v4, v0}, Lb11;-><init>(Ljava/lang/Object;B)V

    const/4 v10, 0x0

    const/16 v12, 0x1e

    const-string v7, "&"

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static/range {v6 .. v12}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "HmacSHA256"

    invoke-static {v1}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v3

    new-instance v6, Ljavax/crypto/spec/SecretKeySpec;

    sget-object v7, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v7}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    invoke-direct {v6, v2, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v3, v6}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    invoke-virtual {v0, v7}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-virtual {v3, v0}, Ljavax/crypto/Mac;->doFinal([B)[B

    move-result-object v0

    sget-object v1, Lk0l;->F:Lk0l;

    const/16 v2, 0x1e

    invoke-static {v0, v5, v1, v2}, Le82;->w([BLjava/lang/String;Lkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "{signature}"

    invoke-static {v1, v2, v0}, Lkotlin/text/c;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ldap;->a:Ldap;

    new-instance v1, Logo;

    invoke-direct {v1, p0}, Logo;-><init>(Lcko;)V

    sget-object p0, Lp9p;->j:Lp9p;

    new-instance v2, Lp9p;

    const/4 v3, 0x1

    const/16 v4, 0xb

    invoke-direct {v2, v4, v3}, Lp9p;-><init>(BI)V

    invoke-static {v0, p0, v2, v1}, Ldap;->c(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Licp;)Lq8p;

    :cond_155
    return-void
.end method

.method public final c()V
    .registers 1

    invoke-virtual {p0}, Lcko;->g()V

    iget-object p0, p0, Lcko;->a:Lcom/opera/ads/internal/fullscreenad/AdActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final d(Z)V
    .registers 10

    iget-boolean v0, p0, Lcko;->o:Z

    if-nez v0, :cond_6c

    iget-boolean v0, p0, Lcko;->p:Z

    if-eqz v0, :cond_6c

    iget-boolean v0, p0, Lcko;->q:Z

    if-eqz v0, :cond_6c

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcko;->o:Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcko;->g:J

    const-wide/16 v4, 0x0

    if-eqz p1, :cond_1b

    move-wide v2, v4

    goto :goto_24

    :cond_1b
    cmp-long p1, v2, v4

    if-ltz p1, :cond_22

    sub-long v2, v0, v2

    goto :goto_24

    :cond_22
    const-wide/16 v2, -0x1

    :goto_24
    iput-wide v2, p0, Lcko;->i:J

    invoke-virtual {p0}, Lcko;->e()Lp7p;

    move-result-object p1

    if-eqz p1, :cond_41

    iget v2, p0, Lcko;->k:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-wide v6, p0, Lcko;->h:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iget-wide v6, p0, Lcko;->i:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {p1, v2, v3, v6}, Lp7p;->b(Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;)V

    :cond_41
    iget-object p1, p0, Lcko;->e:Ldpo;

    if-eqz p1, :cond_48

    invoke-virtual {p1}, Ldpo;->c()V

    :cond_48
    iput-wide v0, p0, Lcko;->j:J

    iput-wide v0, p0, Lcko;->l:J

    iput-wide v4, p0, Lcko;->m:J

    iget-object p1, p0, Lcko;->d:Llzo;

    if-eqz p1, :cond_61

    iget-object p1, p1, Llzo;->a:La3p;

    iget-object v0, p0, Lcko;->c:Lylp;

    invoke-static {v0}, Locp;->d(Lvoo;)Luro;

    move-result-object v0

    iget-object v0, v0, Luro;->d:Lmmo;

    if-eqz v0, :cond_61

    invoke-virtual {v0, p1}, Lmmo;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_61
    invoke-virtual {p0}, Lcko;->f()Lvm;

    move-result-object p0

    if-eqz p0, :cond_6c

    check-cast p0, Lwoo;

    invoke-virtual {p0}, Lwoo;->g()V

    :cond_6c
    return-void
.end method

.method public final e()Lp7p;
    .registers 4

    iget-object p0, p0, Lcko;->c:Lylp;

    invoke-static {p0}, Locp;->d(Lvoo;)Luro;

    move-result-object v0

    iget-object v1, v0, Luro;->a:Lylp;

    const/4 v2, 0x0

    if-eq v1, p0, :cond_c

    move-object v0, v2

    :cond_c
    if-eqz v0, :cond_11

    iget-object p0, v0, Luro;->b:Lp7p;

    return-object p0

    :cond_11
    return-object v2
.end method

.method public final f()Lvm;
    .registers 4

    iget-object p0, p0, Lcko;->c:Lylp;

    invoke-static {p0}, Locp;->d(Lvoo;)Luro;

    move-result-object v0

    iget-object v1, v0, Luro;->a:Lylp;

    const/4 v2, 0x0

    if-eq v1, p0, :cond_c

    move-object v0, v2

    :cond_c
    if-eqz v0, :cond_11

    iget-object p0, v0, Luro;->c:Lwoo;

    return-object p0

    :cond_11
    return-object v2
.end method

.method public final g()V
    .registers 27

    move-object/from16 v0, p0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcko;->n:Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iget-wide v3, v0, Lcko;->l:J

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    iget-wide v8, v0, Lcko;->m:J

    if-ltz v7, :cond_16

    sub-long v3, v1, v3

    add-long/2addr v8, v3

    :cond_16
    move-wide/from16 v17, v8

    iget-wide v3, v0, Lcko;->j:J

    cmp-long v5, v3, v5

    if-ltz v5, :cond_22

    sub-long/2addr v1, v3

    :goto_1f
    move-wide/from16 v24, v1

    goto :goto_25

    :cond_22
    const-wide/16 v1, -0x1

    goto :goto_1f

    :goto_25
    invoke-virtual {v0}, Lcko;->e()Lp7p;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_60

    iget v3, v0, Lcko;->k:I

    iget-wide v4, v0, Lcko;->h:J

    iget-wide v6, v0, Lcko;->i:J

    iget-object v8, v1, Lp7p;->a:Lvoo;

    new-instance v10, Lx2p;

    iget-object v11, v8, Lvoo;->c:Ljava/lang/String;

    iget-object v9, v8, Lvoo;->b:Lpro;

    iget-object v12, v9, Lpro;->a:Ljava/lang/String;

    iget-object v13, v8, Lvoo;->j:Ljava/lang/String;

    iget-object v14, v8, Lvoo;->l:Lfuo;

    invoke-static {}, Ld1p;->e()Lt5p;

    move-result-object v8

    invoke-virtual {v8}, Lt5p;->a()Ljava/lang/String;

    move-result-object v15

    invoke-static {}, Ld1p;->e()Lt5p;

    move-result-object v8

    iget-boolean v8, v8, Lt5p;->c:Z

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v16

    move/from16 v19, v3

    move-wide/from16 v20, v4

    move-wide/from16 v22, v6

    invoke-direct/range {v10 .. v25}, Lx2p;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/String;Ljava/lang/Boolean;JIJJJ)V

    iget-object v1, v1, Lp7p;->b:Ljava/util/LinkedHashSet;

    invoke-static {v10, v2, v1}, Lp7p;->e(Lp8p;Ljava/util/List;Ljava/util/LinkedHashSet;)V

    :cond_60
    invoke-virtual {v0}, Lcko;->f()Lvm;

    move-result-object v1

    iget-object v0, v0, Lcko;->c:Lylp;

    invoke-static {v0}, Locp;->d(Lvoo;)Luro;

    move-result-object v3

    iget-object v4, v3, Luro;->a:Lylp;

    if-eq v0, v4, :cond_6f

    move-object v3, v2

    :cond_6f
    if-eqz v3, :cond_79

    iput-object v2, v3, Luro;->a:Lylp;

    iput-object v2, v3, Luro;->b:Lp7p;

    iput-object v2, v3, Luro;->c:Lwoo;

    iput-object v2, v3, Luro;->d:Lmmo;

    :cond_79
    if-eqz v1, :cond_80

    check-cast v1, Lwoo;

    invoke-virtual {v1}, Lwoo;->onAdDismissed()V

    :cond_80
    return-void
.end method
