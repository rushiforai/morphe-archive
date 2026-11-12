.class public final Lml;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Lrn9;

.field public d:Lrn9;

.field public e:Ljl;

.field public f:Lhl;

.field public g:Lkl;

.field public h:Lil;

.field public i:J

.field public final j:Ljava/util/HashSet;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lml;->j:Ljava/util/HashSet;

    if-eqz p1, :cond_1a

    new-instance v0, Lix5;

    const/16 v1, 0x15

    invoke-direct {v0, v1}, Lix5;-><init>(B)V

    invoke-virtual {p0, p1, v0}, Lml;->d(Ljava/lang/String;Lgm;)Z

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lml;->i:J

    :cond_1a
    return-void
.end method

.method public static a(Lrn9;)Ljava/util/Set;
    .registers 4

    if-nez p0, :cond_5

    sget-object p0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    return-object p0

    :cond_5
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iget-object v1, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_26

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_14
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_26

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ldl;

    iget-object v2, v2, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_14

    :cond_26
    iget-object p0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast p0, Lgl;

    if-eqz p0, :cond_44

    iget-object p0, p0, Lgl;->b:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_32
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_44

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldl;

    iget-object v1, v1, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_32

    :cond_44
    return-object v0
.end method

.method public static b(Lgm;Lll;)Lll;
    .registers 4

    iget v0, p1, Ldl;->a:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_6

    return-object p1

    :cond_6
    const-string p1, "style"

    const-string v0, "small"

    invoke-interface {p0, p1, v0}, Lgm;->b(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static c(Lgm;Lrn9;)Lrn9;
    .registers 9

    iget-object v0, p1, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    iget-object v1, p1, Lrn9;->d:Ljava/lang/Object;

    check-cast v1, Lgl;

    const/4 v2, 0x3

    if-eqz v0, :cond_20

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_20

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ldl;

    iget v4, v4, Ldl;->a:I

    if-ne v4, v2, :cond_f

    goto :goto_38

    :cond_20
    if-eqz v1, :cond_ac

    iget-object v3, v1, Lgl;->b:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_28
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_ac

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ldl;

    iget v4, v4, Ldl;->a:I

    if-ne v4, v2, :cond_28

    :goto_38
    const-string v3, "style"

    const-string v4, "small"

    invoke-interface {p0, v3, v4}, Lgm;->b(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    if-eqz v0, :cond_69

    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4f
    :goto_4f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_63

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lel;

    iget v5, v4, Ldl;->a:I

    if-eq v5, v2, :cond_4f

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4f

    :cond_63
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_6a

    :cond_69
    move-object v3, p0

    :cond_6a
    if-eqz v1, :cond_95

    iget-object v0, v1, Lgl;->b:Ljava/util/List;

    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_7b
    :goto_7b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lfl;

    iget v6, v5, Ldl;->a:I

    if-eq v6, v2, :cond_7b

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7b

    :cond_8f
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_96

    :cond_95
    move-object v4, p0

    :cond_96
    if-nez v3, :cond_9b

    if-nez v4, :cond_9b

    return-object p0

    :cond_9b
    new-instance v0, Lrn9;

    if-eqz v4, :cond_a6

    new-instance p0, Lgl;

    iget v1, v1, Lgl;->a:I

    invoke-direct {p0, v1, v4}, Lgl;-><init>(ILjava/util/ArrayList;)V

    :cond_a6
    iget-boolean p1, p1, Lrn9;->b:Z

    invoke-direct {v0, v3, p0, p1}, Lrn9;-><init>(Ljava/util/ArrayList;Lgl;Z)V

    return-object v0

    :cond_ac
    return-object p1
.end method


# virtual methods
.method public final d(Ljava/lang/String;Lgm;)Z
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const-string v3, "name"

    const-string v4, ""

    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    const/4 v5, 0x1

    iget-object v6, v0, Lml;->j:Ljava/util/HashSet;

    const/4 v7, 0x0

    if-eqz v4, :cond_2a

    iput-object v7, v0, Lml;->c:Lrn9;

    iput-object v7, v0, Lml;->d:Lrn9;

    iput-object v7, v0, Lml;->e:Ljl;

    iput-object v7, v0, Lml;->f:Lhl;

    iput-object v7, v0, Lml;->g:Lkl;

    iput-object v7, v0, Lml;->h:Lil;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, v0, Lml;->i:J

    invoke-virtual {v6}, Ljava/util/HashSet;->clear()V

    return v5

    :cond_2a
    const/4 v4, 0x0

    :try_start_2b
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "ok"

    const-string v9, "ret"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    invoke-static {v9}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_43

    return v4

    :cond_43
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, v4}, Ljava/util/HashSet;-><init>(I)V

    const-string v9, "dat"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    if-nez v9, :cond_52

    move-object v10, v7

    goto :goto_57

    :cond_52
    new-instance v10, Lvpb;

    invoke-direct {v10, v9}, Lvpb;-><init>(Lorg/json/JSONArray;)V

    :goto_57
    if-eqz v10, :cond_179

    move v9, v4

    move/from16 v17, v5

    move-object v11, v7

    move-object v12, v11

    move-object v13, v12

    move-object v14, v13

    move-object v15, v14

    move-object/from16 v16, v15

    :goto_63
    iget-object v5, v10, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v9, v5, :cond_175

    invoke-virtual {v10, v9}, Lvpb;->c(I)Lorb;

    move-result-object v5

    const-string v7, "data"

    invoke-virtual {v5, v7}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-instance v4, Lorb;

    move/from16 p1, v9

    new-instance v9, Ljava/lang/String;

    move-object/from16 v19, v10

    const/4 v10, 0x0

    invoke-static {v7, v10}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v7

    invoke-direct {v9, v7}, Ljava/lang/String;-><init>([B)V

    invoke-direct {v4, v9}, Lorb;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    move-result v9

    sparse-switch v9, :sswitch_data_202

    goto/16 :goto_13b

    :sswitch_95
    const-string v9, "Opt-Flags"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13b

    invoke-static {v4}, Lil;->a(Lorb;)Lil;

    move-result-object v16

    goto/16 :goto_122

    :sswitch_a3
    const-string v4, "Fallback-Pool"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13b

    invoke-virtual {v5, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto/16 :goto_122

    :sswitch_b4
    const-string v4, "Feed-others"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13b

    goto :goto_122

    :sswitch_bd
    const-string v9, "Interstitial"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13b

    invoke-virtual {v5, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-static {v4}, Lhl;->c(Lorb;)Lhl;

    move-result-object v4

    invoke-static {v2, v4}, Lml;->b(Lgm;Lll;)Lll;

    move-result-object v4

    move-object v14, v4

    check-cast v14, Lhl;

    goto :goto_122

    :sswitch_d4
    const-string v4, "adpkg"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13b

    invoke-virtual {v5, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_122

    :sswitch_e4
    const-string v9, "Super-Premium-Home"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13b

    invoke-virtual {v5, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-static {v4}, Lkl;->c(Lorb;)Lkl;

    move-result-object v4

    invoke-static {v2, v4}, Lml;->b(Lgm;Lll;)Lll;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Lkl;

    goto :goto_122

    :sswitch_fb
    const-string v9, "Feed-FRN"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13b

    invoke-virtual {v5, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    sget-object v5, Lq50;->b:Lq50;

    sget-object v7, Liq;->a:Liq;

    invoke-static {v5, v7, v4}, Lrn9;->u(Lq50;Liq;Lorb;)Lrn9;

    move-result-object v4

    invoke-static {v2, v4}, Lml;->c(Lgm;Lrn9;)Lrn9;

    move-result-object v11

    goto :goto_122

    :sswitch_113
    const-string v4, "Article-Page"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13b

    invoke-virtual {v5, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :goto_122
    const/4 v9, 0x0

    goto :goto_16d

    :sswitch_124
    const-string v9, "Video-Playlist"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13b

    invoke-virtual {v5, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    sget-object v5, Lq50;->f:Lq50;

    const/4 v9, 0x0

    invoke-static {v5, v9, v4}, Lrn9;->u(Lq50;Liq;Lorb;)Lrn9;

    move-result-object v4

    invoke-static {v2, v4}, Lml;->c(Lgm;Lrn9;)Lrn9;

    move-result-object v12

    goto :goto_16d

    :cond_13b
    :goto_13b
    const/4 v9, 0x0

    goto :goto_166

    :sswitch_13d
    const/4 v9, 0x0

    const-string v10, "Sidebar"

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_166

    invoke-virtual {v5, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    invoke-static {v4}, Ljl;->c(Lorb;)Ljl;

    move-result-object v4

    invoke-static {v2, v4}, Lml;->b(Lgm;Lll;)Lll;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Ljl;

    goto :goto_16d

    :sswitch_155
    const/4 v9, 0x0

    const-string v4, "Article-Related"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_166

    invoke-virtual {v5, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_16d

    :cond_166
    :goto_166
    invoke-virtual {v5, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :goto_16d
    add-int/lit8 v4, p1, 0x1

    move-object v7, v9

    move-object/from16 v10, v19

    move v9, v4

    goto/16 :goto_63

    :cond_175
    move-object v9, v7

    move-object/from16 v3, v16

    goto :goto_182

    :cond_179
    move/from16 v17, v5

    move-object v9, v7

    move-object v3, v9

    move-object v11, v3

    move-object v12, v11

    move-object v13, v12

    move-object v14, v13

    move-object v15, v14

    :goto_182
    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_18b

    invoke-interface {v2, v1}, Lgm;->f(Ljava/util/HashSet;)V

    :cond_18b
    const-string v1, "ip_country"

    invoke-virtual {v8, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_19c

    sget-object v4, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq v1, v4, :cond_19c

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_19d

    :cond_19c
    move-object v1, v9

    :goto_19d
    iput-object v1, v0, Lml;->a:Ljava/lang/String;

    const-string v1, "ip_address"

    invoke-virtual {v8, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1b0

    sget-object v4, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq v1, v4, :cond_1b0

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_1b1

    :cond_1b0
    move-object v7, v9

    :goto_1b1
    iput-object v7, v0, Lml;->b:Ljava/lang/String;

    iput-object v11, v0, Lml;->c:Lrn9;

    iput-object v12, v0, Lml;->d:Lrn9;

    iput-object v13, v0, Lml;->e:Ljl;

    iput-object v14, v0, Lml;->f:Lhl;

    iput-object v15, v0, Lml;->g:Lkl;

    iput-object v3, v0, Lml;->h:Lil;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iput-wide v3, v0, Lml;->i:J

    invoke-virtual {v6}, Ljava/util/HashSet;->clear()V

    iget-object v1, v0, Lml;->c:Lrn9;

    invoke-static {v1}, Lml;->a(Lrn9;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v6, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iget-object v1, v0, Lml;->d:Lrn9;

    invoke-static {v1}, Lml;->a(Lrn9;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v6, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iget-object v1, v0, Lml;->e:Ljl;

    if-eqz v1, :cond_1e3

    iget-object v1, v1, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v6, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_1e3
    iget-object v1, v0, Lml;->f:Lhl;

    if-eqz v1, :cond_1ec

    iget-object v1, v1, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v6, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_1ec
    iget-object v0, v0, Lml;->g:Lkl;

    if-eqz v0, :cond_1f5

    iget-object v0, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_1f5
    .catch Lorg/json/JSONException; {:try_start_2b .. :try_end_1f5} :catch_1f6
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2b .. :try_end_1f5} :catch_1f6

    :cond_1f5
    return v17

    :catch_1f6
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Lgm;->n(Ljava/lang/String;)V

    const/16 v18, 0x0

    return v18

    nop

    :sswitch_data_202
    .sparse-switch
        -0x5610b9ec -> :sswitch_155
        -0x207d5cc4 -> :sswitch_13d
        -0x1c6104dc -> :sswitch_124
        -0x1085d6ba -> :sswitch_113
        -0x7a82f8d -> :sswitch_fb
        -0x539dff9 -> :sswitch_e4
        0x5860ec9 -> :sswitch_d4
        0x2dd6bb4c -> :sswitch_bd
        0x3aeda252 -> :sswitch_b4
        0x4e5eb427 -> :sswitch_a3
        0x7ccbcead -> :sswitch_95
    .end sparse-switch
.end method
