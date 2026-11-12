.class public final Lee9;
.super Lr43;
.source "SourceFile"


# instance fields
.field public final synthetic i:B

.field public j:Z

.field public k:J

.field public l:Ljava/util/ArrayList;

.field public final synthetic m:Ljava/lang/String;

.field public final synthetic n:Lle9;

.field public final synthetic o:Lcom/opera/api/Callback;


# direct methods
.method public constructor <init>(Lle9;Lhu5;Ljava/lang/String;Lhu5;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Lee9;->i:B

    .line 32
    iput-object p3, p0, Lee9;->m:Ljava/lang/String;

    iput-object p4, p0, Lee9;->o:Lcom/opera/api/Callback;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lee9;->n:Lle9;

    .line 33
    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public constructor <init>(Lle9;Lj12;Ljava/lang/Long;Ljava/lang/String;Lhu5;)V
    .registers 7

    const/4 v0, 0x1

    iput-byte v0, p0, Lee9;->i:B

    iput-object p4, p0, Lee9;->m:Ljava/lang/String;

    iput-object p5, p0, Lee9;->o:Lcom/opera/api/Callback;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lee9;->n:Lle9;

    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    if-nez p3, :cond_12

    const/4 v0, 0x0

    :cond_12
    iput-boolean v0, p0, Lee9;->j:Z

    if-eqz p3, :cond_1b

    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    goto :goto_1d

    :cond_1b
    const-wide/16 p1, 0x0

    :goto_1d
    iput-wide p1, p0, Lee9;->k:J

    return-void
.end method


# virtual methods
.method public final b()Lokhttp3/internal/connection/RealCall;
    .registers 7

    iget-byte v0, p0, Lee9;->i:B

    const/4 v1, 0x0

    iget-object v2, p0, Lee9;->m:Ljava/lang/String;

    iget-object v3, p0, Lee9;->n:Lle9;

    packed-switch v0, :pswitch_data_74

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v4, "order"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v4, "asc"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-boolean v4, p0, Lee9;->j:Z

    if-eqz v4, :cond_2b

    const-string v4, "from_id"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-wide v4, p0, Lee9;->k:J

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2b
    iget-object p0, v3, Ls43;->a:Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt9f;

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const-string v1, "messages"

    invoke-virtual {v3, v1, v2, v0}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object v0

    :goto_41
    invoke-static {v0, p0}, Lj7c;->q(Lfvh;Lt9f;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    :pswitch_46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-boolean v4, p0, Lee9;->j:Z

    if-eqz v4, :cond_5d

    const-string v4, "progress_marker"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-wide v4, p0, Lee9;->k:J

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5d
    iget-object p0, v3, Ls43;->a:Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt9f;

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const-string v1, "devices/me/direct-messages"

    invoke-virtual {v3, v1, v2, v0}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object v0

    goto :goto_41

    :pswitch_data_74
    .packed-switch 0x0
        :pswitch_46
    .end packed-switch
.end method

.method public final g(Lorb;)V
    .registers 14

    iget-byte v0, p0, Lee9;->i:B

    iget-object v1, p0, Lee9;->o:Lcom/opera/api/Callback;

    const/4 v2, 0x6

    const-wide/16 v3, 0x64

    const/4 v5, 0x0

    const-string v6, "messages"

    const/4 v7, 0x1

    packed-switch v0, :pswitch_data_c6

    invoke-virtual {p1, v6}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v0

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    new-instance v6, Ljava/util/ArrayList;

    iget-object v8, v0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v9

    invoke-direct {v6, v9}, Ljava/util/ArrayList;-><init>(I)V

    move v9, v5

    :goto_20
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v9, v10, :cond_35

    invoke-virtual {v0, v9}, Lvpb;->c(I)Lorb;

    move-result-object v10

    new-instance v11, Lje9;

    invoke-direct {v11, v10}, Lje9;-><init>(Lorb;)V

    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v9, v9, 0x1

    goto :goto_20

    :cond_35
    iget-object v0, p0, Lee9;->l:Ljava/util/ArrayList;

    if-eqz v0, :cond_3c

    invoke-virtual {v6, v5, v0}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    :cond_3c
    const-string v0, "changes_remaining"

    invoke-virtual {p1, v0, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_5d

    const-string v0, "last_id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lee9;->k:J

    iput-boolean v7, p0, Lee9;->j:Z

    iput-object v6, p0, Lee9;->l:Ljava/util/ArrayList;

    iput v5, p0, Lp43;->f:I

    iput-wide v3, p0, Lp43;->g:J

    new-instance p1, Lfv2;

    invoke-direct {p1, p0, v2}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lp43;->e(Ljava/lang/Runnable;)V

    goto :goto_69

    :cond_5d
    check-cast v1, Lhu5;

    new-instance p1, Lcn7;

    const/16 v0, 0x1a

    invoke-direct {p1, v1, v6, v0}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lp43;->e(Ljava/lang/Runnable;)V

    :goto_69
    return-void

    :pswitch_6a
    invoke-virtual {p1, v6}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v0

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    new-instance v6, Ljava/util/ArrayList;

    iget-object v8, v0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v9

    invoke-direct {v6, v9}, Ljava/util/ArrayList;-><init>(I)V

    move v9, v5

    :goto_7c
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v9, v10, :cond_91

    invoke-virtual {v0, v9}, Lvpb;->c(I)Lorb;

    move-result-object v10

    new-instance v11, Lhe9;

    invoke-direct {v11, v10}, Lhe9;-><init>(Lorb;)V

    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v9, v9, 0x1

    goto :goto_7c

    :cond_91
    iget-object v0, p0, Lee9;->l:Ljava/util/ArrayList;

    if-eqz v0, :cond_98

    invoke-virtual {v6, v5, v0}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    :cond_98
    const-string v0, "more"

    invoke-virtual {p1, v0, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_b9

    const-string v0, "progress_marker"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lee9;->k:J

    iput-boolean v7, p0, Lee9;->j:Z

    iput-object v6, p0, Lee9;->l:Ljava/util/ArrayList;

    iput v5, p0, Lp43;->f:I

    iput-wide v3, p0, Lp43;->g:J

    new-instance p1, Lfv2;

    invoke-direct {p1, p0, v2}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lp43;->e(Ljava/lang/Runnable;)V

    goto :goto_c5

    :cond_b9
    check-cast v1, Lhu5;

    new-instance p1, Lcn7;

    const/16 v0, 0x18

    invoke-direct {p1, v1, v6, v0}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lp43;->e(Ljava/lang/Runnable;)V

    :goto_c5
    return-void

    :pswitch_data_c6
    .packed-switch 0x0
        :pswitch_6a
    .end packed-switch
.end method
