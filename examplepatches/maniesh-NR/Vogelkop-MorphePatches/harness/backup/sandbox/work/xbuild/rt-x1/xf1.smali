.class public final Lxf1;
.super Lr43;
.source "SourceFile"


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Ljava/lang/Object;

.field public final synthetic k:Ljava/lang/Object;

.field public final synthetic l:Ljava/lang/Object;

.field public final synthetic m:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ldi2;Liyk;Lcom/opera/android/oauth2/OperaAccessToken;Lorb;Lfi2;)V
    .registers 7

    const/4 v0, 0x1

    iput-byte v0, p0, Lxf1;->i:B

    iput-object p3, p0, Lxf1;->j:Ljava/lang/Object;

    iput-object p4, p0, Lxf1;->k:Ljava/lang/Object;

    iput-object p5, p0, Lxf1;->l:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lxf1;->m:Ljava/lang/Object;

    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public constructor <init>(Lle9;Lcom/opera/api/Callback;Ljava/lang/String;Ljava/lang/String;Lcom/opera/api/Callback;)V
    .registers 7

    const/4 v0, 0x4

    iput-byte v0, p0, Lxf1;->i:B

    .line 21
    iput-object p3, p0, Lxf1;->l:Ljava/lang/Object;

    iput-object p4, p0, Lxf1;->j:Ljava/lang/Object;

    iput-object p5, p0, Lxf1;->k:Ljava/lang/Object;

    iput-object p1, p0, Lxf1;->m:Ljava/lang/Object;

    .line 22
    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public constructor <init>(Lle9;Lj12;Ljava/lang/String;Lorb;Lqe9;)V
    .registers 7

    const/4 v0, 0x3

    iput-byte v0, p0, Lxf1;->i:B

    .line 23
    iput-object p3, p0, Lxf1;->l:Ljava/lang/Object;

    iput-object p4, p0, Lxf1;->k:Ljava/lang/Object;

    iput-object p5, p0, Lxf1;->j:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lxf1;->m:Ljava/lang/Object;

    .line 24
    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public constructor <init>(Lle9;Lve9;Ljava/lang/String;Lorb;Lsu;)V
    .registers 7

    const/4 v0, 0x2

    iput-byte v0, p0, Lxf1;->i:B

    .line 19
    iput-object p3, p0, Lxf1;->l:Ljava/lang/Object;

    iput-object p4, p0, Lxf1;->k:Ljava/lang/Object;

    iput-object p5, p0, Lxf1;->j:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lxf1;->m:Ljava/lang/Object;

    .line 20
    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public constructor <init>(Lyf1;Lygf;Lcom/opera/android/oauth2/OperaAccessToken;Lorb;Lygf;)V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Lxf1;->i:B

    iput-object p1, p0, Lxf1;->l:Ljava/lang/Object;

    iput-object p3, p0, Lxf1;->j:Ljava/lang/Object;

    iput-object p4, p0, Lxf1;->k:Ljava/lang/Object;

    iput-object p5, p0, Lxf1;->m:Ljava/lang/Object;

    .line 18
    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method


# virtual methods
.method public final b()Lokhttp3/internal/connection/RealCall;
    .registers 7

    iget-byte v0, p0, Lxf1;->i:B

    iget-object v1, p0, Lxf1;->j:Ljava/lang/Object;

    const-string v2, "POST"

    iget-object v3, p0, Lxf1;->k:Ljava/lang/Object;

    iget-object v4, p0, Lxf1;->l:Ljava/lang/Object;

    iget-object p0, p0, Lxf1;->m:Ljava/lang/Object;

    const/4 v5, 0x0

    packed-switch v0, :pswitch_data_110

    check-cast p0, Lle9;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_23

    const-string v2, "type"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_23
    iget-object v2, p0, Ls43;->a:Lii;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lt9f;

    check-cast v1, Ljava/lang/String;

    new-array v3, v5, [Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const-string v3, "encryption-keys"

    invoke-virtual {p0, v3, v1, v0}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    invoke-static {p0, v2}, Lj7c;->q(Lfvh;Lt9f;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    :pswitch_40
    check-cast p0, Lle9;

    iget-object v0, p0, Ls43;->a:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    check-cast v4, Ljava/lang/String;

    new-array v1, v5, [Ljava/lang/String;

    const-string v5, "messages"

    invoke-virtual {p0, v5, v4, v1}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    check-cast v3, Lorb;

    iget-object v1, v3, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v3, Ls43;->c:Lesd;

    invoke-static {v1, v3}, Lrvh;->create(Ljava/lang/String;Lesd;)Lrvh;

    move-result-object v1

    invoke-virtual {p0, v2, v1}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, p0}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    :pswitch_6f
    check-cast p0, Lle9;

    iget-object v0, p0, Ls43;->a:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    check-cast v4, Ljava/lang/String;

    new-array v1, v5, [Ljava/lang/String;

    const-string v5, "pairing-tokens"

    invoke-virtual {p0, v5, v4, v1}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    check-cast v3, Lorb;

    iget-object v1, v3, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v3, Ls43;->c:Lesd;

    invoke-static {v1, v3}, Lrvh;->create(Ljava/lang/String;Lesd;)Lrvh;

    move-result-object v1

    invoke-virtual {p0, v2, v1}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, p0}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    :pswitch_9e
    check-cast p0, Ldi2;

    iget-object v0, p0, Ls43;->a:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    check-cast v1, Lcom/opera/android/oauth2/OperaAccessToken;

    invoke-static {v1}, Ldi2;->c(Lcom/opera/android/oauth2/OperaAccessToken;)Ljava/lang/String;

    move-result-object v1

    new-array v4, v5, [Ljava/lang/String;

    const-string v5, "flow/login"

    invoke-virtual {p0, v5, v1, v4}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    check-cast v3, Lorb;

    if-nez v3, :cond_bd

    const-string v1, ""

    goto :goto_c3

    :cond_bd
    iget-object v1, v3, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_c3
    sget-object v3, Ls43;->c:Lesd;

    invoke-static {v1, v3}, Lrvh;->create(Ljava/lang/String;Lesd;)Lrvh;

    move-result-object v1

    invoke-virtual {p0, v2, v1}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, p0}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    :pswitch_d6
    check-cast v4, Lyf1;

    iget-object p0, v4, Ls43;->a:Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt9f;

    sget v0, Lyf1;->e:I

    check-cast v1, Lcom/opera/android/oauth2/OperaAccessToken;

    iget-object v0, v1, Lcom/opera/android/oauth2/OperaAccessToken;->a:Ljava/lang/String;

    const-string v1, "Bearer "

    invoke-static {v1, v0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-array v1, v5, [Ljava/lang/String;

    const-string v5, "anonymous/signup"

    invoke-virtual {v4, v5, v0, v1}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object v0

    sget-object v1, Lrvh;->Companion:Lqvh;

    check-cast v3, Lorb;

    iget-object v3, v3, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ls43;->c:Lesd;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3, v4}, Lqvh;->b(Ljava/lang/String;Lesd;)Lpvh;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    invoke-static {v0, p0}, Lj7c;->q(Lfvh;Lt9f;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_110
    .packed-switch 0x0
        :pswitch_d6
        :pswitch_9e
        :pswitch_6f
        :pswitch_40
    .end packed-switch
.end method

.method public final c(Lpzh;)Lq43;
    .registers 4

    iget-byte v0, p0, Lxf1;->i:B

    packed-switch v0, :pswitch_data_68

    invoke-super {p0, p1}, Lp43;->c(Lpzh;)Lq43;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget p0, p1, Lpzh;->d:I

    const/16 v0, 0x19c

    if-eq p0, v0, :cond_16

    new-instance p0, Lq43;

    invoke-direct {p0, p1}, Lq43;-><init>(Lpzh;)V

    goto :goto_66

    :cond_16
    :try_start_16
    iget-object p0, p1, Lpzh;->g:Lvzh;

    invoke-virtual {p0}, Lvzh;->string()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "error"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_3a

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    new-instance p0, Lq43;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lq43;-><init>(ILjava/lang/String;)V

    goto :goto_66

    :cond_3a
    new-instance p1, Lorg/json/JSONException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " is null"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_51
    .catch Lorg/json/JSONException; {:try_start_16 .. :try_end_51} :catch_5e
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_51} :catch_51

    :catch_51
    move-exception p0

    new-instance p1, Lq43;

    const/4 v0, -0x2

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, v0, p0}, Lq43;-><init>(ILjava/lang/String;)V

    move-object p0, p1

    goto :goto_66

    :catch_5e
    new-instance p0, Lq43;

    const/4 p1, -0x1

    const-string v0, "Bad JSON"

    invoke-direct {p0, p1, v0}, Lq43;-><init>(ILjava/lang/String;)V

    :goto_66
    return-object p0

    nop

    :pswitch_data_68
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final d(Lpzh;)Z
    .registers 6

    iget-byte v0, p0, Lxf1;->i:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/16 v3, 0xc9

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0, p1}, Lp43;->d(Lpzh;)Z

    move-result p0

    return p0

    :pswitch_e
    iget p0, p1, Lpzh;->d:I

    if-ne p0, v3, :cond_13

    move v1, v2

    :cond_13
    return v1

    :pswitch_14
    iget p0, p1, Lpzh;->d:I

    if-ne p0, v3, :cond_19

    move v1, v2

    :cond_19
    return v1

    :pswitch_data_1a
    .packed-switch 0x2
        :pswitch_14
        :pswitch_e
    .end packed-switch
.end method

.method public final g(Lorb;)V
    .registers 6

    iget-byte v0, p0, Lxf1;->i:B

    const-string v1, "token"

    iget-object v2, p0, Lxf1;->j:Ljava/lang/Object;

    const/4 v3, 0x4

    packed-switch v0, :pswitch_data_66

    new-instance v0, Lrwl;

    invoke-direct {v0, p1}, Lrwl;-><init>(Lorb;)V

    iget-object p1, p0, Lxf1;->k:Ljava/lang/Object;

    check-cast p1, Lcom/opera/api/Callback;

    new-instance v1, Lnpl;

    invoke-direct {v1, p1, v0, v3}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_1c
    const-string v0, "id"

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    check-cast v2, Lqe9;

    new-instance p1, Loi2;

    invoke-direct {p1, v2, v0, v1, v3}, Loi2;-><init>(Ljava/lang/Object;JB)V

    invoke-virtual {p0, p1}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_2f
    new-instance v0, Lke9;

    invoke-direct {v0, p1}, Lke9;-><init>(Lorb;)V

    check-cast v2, Lsu;

    new-instance p1, Lcn7;

    const/16 v1, 0x17

    invoke-direct {p1, v2, v0, v1}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_41
    invoke-virtual {p1, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lxf1;->l:Ljava/lang/Object;

    check-cast v0, Lfi2;

    new-instance v1, Lbi2;

    const/4 v2, 0x0

    invoke-direct {v1, v0, p1, v2}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_53
    invoke-virtual {p1, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lxf1;->m:Ljava/lang/Object;

    check-cast v0, Lygf;

    new-instance v1, Lxa;

    const/16 v2, 0x10

    invoke-direct {v1, v0, p1, v2}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_53
        :pswitch_41
        :pswitch_2f
        :pswitch_1c
    .end packed-switch
.end method
