.class public final Lpc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvwl;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public final c:Lbf9;

.field public final d:Lcom/opera/android/touch/a;

.field public final e:Ljava/util/Set;

.field public final f:Ljava/util/HashSet;

.field public final g:Lqie;

.field public final h:Lxc9;

.field public final i:Lcom/opera/android/settings/SettingsManager;

.field public j:Ljc9;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lbf9;Lcom/opera/android/settings/SettingsManager;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/opera/android/touch/a;

    invoke-direct {v0, p0}, Lcom/opera/android/touch/a;-><init>(Lpc9;)V

    iput-object v0, p0, Lpc9;->d:Lcom/opera/android/touch/a;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lpc9;->e:Ljava/util/Set;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lpc9;->f:Ljava/util/HashSet;

    new-instance v0, Lqie;

    const/16 v1, 0x13

    invoke-direct {v0, v1}, Lqie;-><init>(B)V

    iput-object v0, p0, Lpc9;->g:Lqie;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lpc9;->a:Landroid/content/Context;

    iput-object p2, p0, Lpc9;->b:Lumi;

    iput-object p3, p0, Lpc9;->c:Lbf9;

    new-instance p3, Lxc9;

    invoke-direct {p3, p1, p2}, Lxc9;-><init>(Landroid/content/Context;Ltcl;)V

    iput-object p3, p0, Lpc9;->h:Lxc9;

    iput-object p4, p0, Lpc9;->i:Lcom/opera/android/settings/SettingsManager;

    return-void
.end method

.method public static a(Lfvd;Ljavax/crypto/spec/SecretKeySpec;Ljava/lang/String;)Lhb9;
    .registers 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-wide v2, v0, Lfvd;->a:J

    const-wide/high16 v4, -0x8000000000000000L

    cmp-long v2, v2, v4

    const/4 v3, 0x0

    if-nez v2, :cond_1b

    if-eqz p2, :cond_12a

    new-instance v4, Llb9;

    iget-wide v7, v0, Lfvd;->b:J

    const-wide/high16 v5, -0x8000000000000000L

    move-object/from16 v9, p2

    invoke-direct/range {v4 .. v9}, Lhb9;-><init>(JJLjava/lang/String;)V

    return-object v4

    :cond_1b
    const-string v2, "text"

    iget-object v4, v0, Lfvd;->d:Ljava/lang/String;

    iget-object v5, v0, Lfvd;->g:Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {v4, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v4

    invoke-static {v5, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v5

    const/4 v7, 0x2

    invoke-static {v7, v1, v5, v6}, Lp36;->a(ILjavax/crypto/spec/SecretKeySpec;[BZ)Ljavax/crypto/Cipher;

    move-result-object v5

    if-eqz v5, :cond_36

    :try_start_31
    invoke-virtual {v5, v4}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v4
    :try_end_35
    .catch Ljavax/crypto/BadPaddingException; {:try_start_31 .. :try_end_35} :catch_36
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_31 .. :try_end_35} :catch_36

    goto :goto_37

    :catch_36
    :cond_36
    move-object v4, v3

    :goto_37
    if-nez v4, :cond_3b

    move-object v5, v3

    goto :goto_40

    :cond_3b
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v4}, Ljava/lang/String;-><init>([B)V

    :goto_40
    if-eqz v5, :cond_12a

    iget-object v4, v0, Lfvd;->e:Ljava/lang/String;

    iget-object v8, v0, Lfvd;->h:Ljava/lang/String;

    invoke-static {v4, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v4

    invoke-static {v8, v6}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v8

    invoke-static {v7, v1, v8, v6}, Lp36;->a(ILjavax/crypto/spec/SecretKeySpec;[BZ)Ljavax/crypto/Cipher;

    move-result-object v1

    if-eqz v1, :cond_59

    :try_start_54
    invoke-virtual {v1, v4}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1
    :try_end_58
    .catch Ljavax/crypto/BadPaddingException; {:try_start_54 .. :try_end_58} :catch_59
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_54 .. :try_end_58} :catch_59

    goto :goto_5a

    :catch_59
    :cond_59
    move-object v1, v3

    :goto_5a
    if-nez v1, :cond_5e

    move-object v4, v3

    goto :goto_63

    :cond_5e
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v1}, Ljava/lang/String;-><init>([B)V

    :goto_63
    if-eqz v4, :cond_12a

    :try_start_65
    new-instance v1, Lorb;

    invoke-direct {v1, v5}, Lorb;-><init>(Ljava/lang/String;)V

    iget-object v5, v1, Lorb;->a:Lorg/json/JSONObject;

    new-instance v6, Lorb;

    invoke-direct {v6, v4}, Lorb;-><init>(Ljava/lang/String;)V

    const-string v4, "type"

    invoke-virtual {v1, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a8

    invoke-virtual {v6, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Laib;->Q(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_99

    new-instance v8, Ljb9;

    iget-wide v9, v0, Lfvd;->a:J

    iget-object v13, v0, Lfvd;->c:Ljava/lang/String;

    move-object/from16 v16, v14

    const-string v14, ""

    const/4 v15, 0x0

    const/16 v17, 0x0

    move-wide v11, v9

    invoke-direct/range {v8 .. v17}, Ljb9;-><init>(JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v8

    :cond_99
    move-object/from16 v16, v14

    new-instance v8, Lkb9;

    iget-wide v9, v0, Lfvd;->a:J

    iget-object v13, v0, Lfvd;->c:Ljava/lang/String;

    move-wide v11, v9

    move-object/from16 v14, v16

    invoke-direct/range {v8 .. v14}, Lkb9;-><init>(JJLjava/lang/String;Ljava/lang/String;)V

    return-object v8

    :cond_a8
    const-string v2, "link"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_ae
    .catch Lorg/json/JSONException; {:try_start_65 .. :try_end_ae} :catch_12a

    const-string v7, "preview"

    if-eqz v2, :cond_e0

    :try_start_b2
    new-instance v8, Ljb9;

    iget-wide v9, v0, Lfvd;->a:J

    iget-object v13, v0, Lfvd;->c:Ljava/lang/String;

    const-string v0, "title"

    const-string v1, ""

    invoke-virtual {v6, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v0, "description"

    invoke-virtual {v6, v0, v3}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    const-string v0, "url"

    invoke-virtual {v6, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual {v6, v7, v3}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    const-string v0, "favIconUrl"

    const-string v1, "icon"

    invoke-virtual {v6, v1, v3}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-wide v11, v9

    invoke-direct/range {v8 .. v17}, Ljb9;-><init>(JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v8

    :cond_e0
    const-string v2, "file2"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12a

    iget-object v2, v0, Lfvd;->f:Ljava/lang/String;

    if-eqz v2, :cond_12a

    new-instance v8, Lib9;

    iget-wide v9, v0, Lfvd;->a:J

    iget-object v13, v0, Lfvd;->c:Ljava/lang/String;

    const-string v2, "name"

    invoke-virtual {v1, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iget-object v15, v0, Lfvd;->f:Ljava/lang/String;

    const-string v2, "iv"

    invoke-virtual {v1, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const-string v2, "mimetype"

    invoke-virtual {v1, v2, v3}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    const-string v2, "expires"

    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v18

    const-string v2, "size"

    const-wide/16 v11, 0x0

    invoke-virtual {v5, v2, v11, v12}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v20

    invoke-virtual {v1, v7, v3}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    iget-object v0, v0, Lfvd;->i:Ljava/lang/String;

    if-eqz v0, :cond_123

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    move-object/from16 v23, v0

    goto :goto_125

    :cond_123
    move-object/from16 v23, v3

    :goto_125
    move-wide v11, v9

    invoke-direct/range {v8 .. v23}, Lib9;-><init>(JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLjava/lang/String;Landroid/net/Uri;)V
    :try_end_129
    .catch Lorg/json/JSONException; {:try_start_b2 .. :try_end_129} :catch_12a

    return-object v8

    :catch_12a
    :cond_12a
    return-object v3
.end method

.method public static b(Ljava/util/List;Ljavax/crypto/spec/SecretKeySpec;Ljava/lang/String;Ljava/util/ArrayList;)V
    .registers 5

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_4
    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfvd;

    invoke-static {v0, p1, p2}, Lpc9;->a(Lfvd;Ljavax/crypto/spec/SecretKeySpec;Ljava/lang/String;)Lhb9;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_1a
    return-void
.end method


# virtual methods
.method public final c()Ljvd;
    .registers 1

    iget-object p0, p0, Lpc9;->d:Lcom/opera/android/touch/a;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljvd;

    return-object p0
.end method

.method public final d()V
    .registers 5

    iget-object v0, p0, Lpc9;->h:Lxc9;

    invoke-virtual {v0}, Lxc9;->a()V

    new-instance v0, Lec9;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lec9;-><init>(Lpc9;B)V

    iget-object v1, p0, Lpc9;->b:Lumi;

    invoke-interface {v1, v0}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v0

    new-instance v2, Ldc9;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Ldc9;-><init>(Lpc9;B)V

    invoke-virtual {v1, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnml;->b(Lnml;)V

    new-instance v1, Loml;

    invoke-direct {v1, v0}, Loml;-><init>(Lnml;)V

    const/4 v0, 0x0

    iget-object p0, p0, Lpc9;->g:Lqie;

    invoke-virtual {p0, v1, v0}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final e(J)V
    .registers 5

    new-instance v0, Lgc9;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p2, v1}, Lgc9;-><init>(Ljava/lang/Object;JB)V

    iget-object p1, p0, Lpc9;->b:Lumi;

    invoke-interface {p1, v0}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p2

    new-instance v0, Ldc9;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Ldc9;-><init>(Lpc9;B)V

    invoke-virtual {p1, v0}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p1

    invoke-virtual {p2, p1}, Lnml;->b(Lnml;)V

    new-instance p1, Loml;

    invoke-direct {p1, p2}, Loml;-><init>(Lnml;)V

    const/4 p2, 0x0

    iget-object p0, p0, Lpc9;->g:Lqie;

    invoke-virtual {p0, p1, p2}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final f(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 22

    new-instance v0, Lfvd;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const/4 v11, 0x0

    move-wide v1, p1

    move-object v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    invoke-direct/range {v0 .. v11}, Lfvd;-><init>(JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lhc9;

    move-wide v2, p1

    move/from16 v6, p9

    move-object v4, v0

    move-object v0, v1

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lhc9;-><init>(Lpc9;JLfvd;Ljava/lang/String;Z)V

    iget-object p1, p0, Lpc9;->b:Lumi;

    invoke-interface {p1, v0}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p2

    new-instance p3, Ldc9;

    const/4 v0, 0x6

    invoke-direct {p3, p0, v0}, Ldc9;-><init>(Lpc9;B)V

    invoke-virtual {p1, p3}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p1

    invoke-virtual {p2, p1}, Lnml;->b(Lnml;)V

    new-instance p1, Loml;

    invoke-direct {p1, p2}, Loml;-><init>(Lnml;)V

    const/4 p2, 0x0

    iget-object p0, p0, Lpc9;->g:Lqie;

    invoke-virtual {p0, p1, p2}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final g(ILjava/util/List;)V
    .registers 7

    iget-object v0, p0, Lpc9;->e:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_31

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_11
    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_31

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsc9;

    iget-object v3, p0, Lpc9;->f:Ljava/util/HashSet;

    invoke-virtual {v3, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_11

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    check-cast v2, Lqc9;

    invoke-virtual {v2, p1, p2}, Lqc9;->a(ILjava/util/List;)V

    goto :goto_11

    :cond_31
    return-void
.end method

.method public final h(II)V
    .registers 8

    iget-object v0, p0, Lpc9;->e:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_50

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_50

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsc9;

    iget-object v3, p0, Lpc9;->f:Ljava/util/HashSet;

    invoke-virtual {v3, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_11

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    check-cast v2, Lqc9;

    iget-object v2, v2, Lqc9;->a:Lrc9;

    iget-object v3, v2, Lrc9;->c:Ljava/util/ArrayList;

    add-int v4, p1, p2

    invoke-virtual {v3, p1, v4}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->clear()V

    iget-object v2, v2, Lrc9;->d:Lh7f;

    invoke-static {v2, v2}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v2

    :goto_40
    invoke-virtual {v2}, Lg7f;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_11

    invoke-virtual {v2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmb9;

    invoke-interface {v3, p1, p2}, Lmb9;->f(II)V

    goto :goto_40

    :cond_50
    return-void
.end method
