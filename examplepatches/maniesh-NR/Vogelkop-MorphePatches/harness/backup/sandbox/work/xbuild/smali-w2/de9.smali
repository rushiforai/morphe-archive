.class public final Lde9;
.super Lr43;
.source "SourceFile"


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:Lorb;

.field public final synthetic l:Lle9;

.field public final synthetic m:Ljava/lang/Object;

.field public final synthetic n:Lcom/opera/api/Callback;


# direct methods
.method public constructor <init>(Lle9;Lse9;Ljava/lang/String;Ljava/lang/String;Lorb;Lse9;)V
    .registers 8

    const/4 v0, 0x0

    iput-byte v0, p0, Lde9;->i:B

    iput-object p3, p0, Lde9;->j:Ljava/lang/String;

    iput-object p4, p0, Lde9;->m:Ljava/lang/Object;

    iput-object p5, p0, Lde9;->k:Lorb;

    iput-object p6, p0, Lde9;->n:Lcom/opera/api/Callback;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lde9;->l:Lle9;

    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public constructor <init>(Lle9;Lve9;Ljava/lang/String;Lorb;Lvz;Lcxl;)V
    .registers 8

    const/4 v0, 0x1

    iput-byte v0, p0, Lde9;->i:B

    .line 20
    iput-object p3, p0, Lde9;->j:Ljava/lang/String;

    iput-object p4, p0, Lde9;->k:Lorb;

    iput-object p5, p0, Lde9;->m:Ljava/lang/Object;

    iput-object p6, p0, Lde9;->n:Lcom/opera/api/Callback;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lde9;->l:Lle9;

    .line 21
    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method


# virtual methods
.method public final b()Lokhttp3/internal/connection/RealCall;
    .registers 9

    iget-byte v0, p0, Lde9;->i:B

    const-string v1, "POST"

    iget-object v2, p0, Lde9;->k:Lorb;

    const/4 v3, 0x0

    iget-object v4, p0, Lde9;->j:Ljava/lang/String;

    iget-object v5, p0, Lde9;->l:Lle9;

    packed-switch v0, :pswitch_data_7a

    iget-object p0, v5, Ls43;->a:Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt9f;

    const-string v0, "connect-devices"

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {v5, v0, v4, v3}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object v0

    iget-object v2, v2, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ls43;->c:Lesd;

    invoke-static {v2, v3}, Lrvh;->create(Ljava/lang/String;Lesd;)Lrvh;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, v0}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {p0, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    :pswitch_37
    iget-object v0, v5, Ls43;->a:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "devices/"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, La26;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/direct-messages"

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object p0, p0, Lde9;->m:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {v5, v4, p0, v3}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    iget-object v2, v2, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ls43;->c:Lesd;

    invoke-static {v2, v3}, Lrvh;->create(Ljava/lang/String;Lesd;)Lrvh;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, p0}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_37
    .end packed-switch
.end method

.method public final d(Lpzh;)Z
    .registers 3

    iget-byte v0, p0, Lde9;->i:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0, p1}, Lp43;->d(Lpzh;)Z

    move-result p0

    return p0

    :pswitch_a
    iget p0, p1, Lpzh;->d:I

    const/16 p1, 0xc9

    if-ne p0, p1, :cond_12

    const/4 p0, 0x1

    goto :goto_13

    :cond_12
    const/4 p0, 0x0

    :goto_13
    return p0

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final g(Lorb;)V
    .registers 11

    iget-byte v0, p0, Lde9;->i:B

    const/4 v1, 0x3

    iget-object v2, p0, Lde9;->n:Lcom/opera/api/Callback;

    packed-switch v0, :pswitch_data_66

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1, v0}, Lle9;->e(Lorb;Ljava/util/ArrayList;)Lowl;

    move-result-object p1

    iget-object v3, p0, Lde9;->m:Ljava/lang/Object;

    check-cast v3, Lvz;

    iget-object v3, v3, Lvz;->b:Ljava/lang/String;

    if-eqz p1, :cond_41

    iget-object v4, p1, Lowl;->i:Ljava/lang/String;

    const-string v5, "\\$"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    array-length v6, v5

    const/4 v7, 0x2

    if-ne v6, v7, :cond_41

    iget-object v6, p1, Lpwl;->a:Ljava/lang/String;

    iget-object v7, p1, Lpwl;->f:Ljava/security/PublicKey;

    const/4 v8, 0x1

    aget-object v5, v5, v8

    invoke-static {v6, v3, v7, v5}, Lle9;->d(Ljava/lang/String;Ljava/lang/String;Ljava/security/PublicKey;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_41

    check-cast v2, Lcxl;

    new-instance p1, Lnpl;

    invoke-direct {p1, v2, v0, v1}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lp43;->e(Ljava/lang/Runnable;)V

    goto :goto_51

    :cond_41
    new-instance v0, Lq43;

    if-eqz p1, :cond_48

    iget-object p1, p1, Lpwl;->a:Ljava/lang/String;

    goto :goto_4a

    :cond_48
    const-string p1, ""

    :goto_4a
    const/4 v1, -0x3

    invoke-direct {v0, v1, p1}, Lq43;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v0}, Lp43;->a(Lq43;)V

    :goto_51
    return-void

    :pswitch_52
    const-string v0, "id"

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    check-cast v2, Lse9;

    new-instance p1, Loi2;

    invoke-direct {p1, v2, v3, v4, v1}, Loi2;-><init>(Ljava/lang/Object;JB)V

    invoke-virtual {p0, p1}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    nop

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_52
    .end packed-switch
.end method
