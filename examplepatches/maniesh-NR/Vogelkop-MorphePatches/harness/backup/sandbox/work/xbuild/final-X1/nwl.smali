.class public final Lnwl;
.super Lp43;
.source "SourceFile"


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:Lle9;

.field public final synthetic l:Ljava/lang/Object;

.field public final synthetic m:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lle9;Lcom/opera/api/Callback;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 7

    const/4 v0, 0x1

    iput-byte v0, p0, Lnwl;->i:B

    iput-object p3, p0, Lnwl;->j:Ljava/lang/String;

    iput-object p4, p0, Lnwl;->l:Ljava/lang/Object;

    iput-object p5, p0, Lnwl;->m:Ljava/lang/Runnable;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lnwl;->k:Lle9;

    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public synthetic constructor <init>(Lle9;Lcom/opera/api/Callback;Ljava/lang/String;Lorb;Ljava/lang/Runnable;B)V
    .registers 7

    .line 18
    iput-byte p6, p0, Lnwl;->i:B

    iput-object p3, p0, Lnwl;->j:Ljava/lang/String;

    iput-object p4, p0, Lnwl;->l:Ljava/lang/Object;

    iput-object p5, p0, Lnwl;->m:Ljava/lang/Runnable;

    iput-object p1, p0, Lnwl;->k:Lle9;

    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public constructor <init>(Lle9;Lvk2;Ljava/lang/String;Lorb;Lrl;)V
    .registers 7

    const/4 v0, 0x3

    iput-byte v0, p0, Lnwl;->i:B

    .line 19
    iput-object p3, p0, Lnwl;->j:Ljava/lang/String;

    iput-object p4, p0, Lnwl;->l:Ljava/lang/Object;

    iput-object p5, p0, Lnwl;->m:Ljava/lang/Runnable;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lnwl;->k:Lle9;

    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method


# virtual methods
.method public final b()Lokhttp3/internal/connection/RealCall;
    .registers 7

    iget-byte v0, p0, Lnwl;->i:B

    const-string v1, "POST"

    iget-object v2, p0, Lnwl;->l:Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lnwl;->j:Ljava/lang/String;

    iget-object p0, p0, Lnwl;->k:Lle9;

    packed-switch v0, :pswitch_data_c4

    iget-object v0, p0, Ls43;->a:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    const-string v5, "notify-devices"

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {p0, v5, v4, v3}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    check-cast v2, Lorb;

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

    :pswitch_39
    iget-object v0, p0, Ls43;->a:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    const-string v5, "encryption-keys"

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {p0, v5, v4, v3}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    check-cast v2, Lorb;

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

    :pswitch_64
    iget-object v0, p0, Ls43;->a:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v5, "devices/"

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, La26;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    check-cast v2, Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {p0, v1, v2, v3}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    sget-object v1, Lrvh;->EMPTY:Lrvh;

    const-string v2, "DELETE"

    invoke-virtual {p0, v2, v1}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, p0}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    :pswitch_97
    iget-object v0, p0, Ls43;->a:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    const-string v1, "devices/me"

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {p0, v1, v4, v3}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    check-cast v2, Lorb;

    iget-object v1, v2, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ls43;->c:Lesd;

    invoke-static {v1, v2}, Lrvh;->create(Ljava/lang/String;Lesd;)Lrvh;

    move-result-object v1

    const-string v2, "PATCH"

    invoke-virtual {p0, v2, v1}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, p0}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    :pswitch_data_c4
    .packed-switch 0x0
        :pswitch_97
        :pswitch_64
        :pswitch_39
    .end packed-switch
.end method

.method public final d(Lpzh;)Z
    .registers 3

    iget-byte v0, p0, Lnwl;->i:B

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
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method

.method public final f(Lpzh;)V
    .registers 3

    iget-byte p1, p0, Lnwl;->i:B

    iget-object v0, p0, Lnwl;->m:Ljava/lang/Runnable;

    packed-switch p1, :pswitch_data_1c

    check-cast v0, Lrl;

    invoke-virtual {p0, v0}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_d
    invoke-virtual {p0, v0}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_11
    invoke-virtual {p0, v0}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_15
    check-cast v0, Lqn;

    invoke-virtual {p0, v0}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_15
        :pswitch_11
        :pswitch_d
    .end packed-switch
.end method
