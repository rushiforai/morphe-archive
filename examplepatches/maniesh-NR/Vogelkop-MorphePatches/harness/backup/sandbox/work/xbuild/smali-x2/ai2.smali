.class public final Lai2;
.super Lr43;
.source "SourceFile"


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Ljava/lang/Object;

.field public final synthetic k:Lcom/opera/api/Callback;

.field public final synthetic l:Ls43;


# direct methods
.method public constructor <init>(Ldi2;Lzzh;Lorb;Lay1;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Lai2;->i:B

    iput-object p3, p0, Lai2;->j:Ljava/lang/Object;

    iput-object p4, p0, Lai2;->k:Lcom/opera/api/Callback;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lai2;->l:Ls43;

    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public constructor <init>(Lle9;Laxl;Lorb;Lxx1;)V
    .registers 6

    const/4 v0, 0x2

    iput-byte v0, p0, Lai2;->i:B

    .line 16
    iput-object p3, p0, Lai2;->j:Ljava/lang/Object;

    iput-object p4, p0, Lai2;->k:Lcom/opera/api/Callback;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lai2;->l:Ls43;

    .line 17
    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public constructor <init>(Lle9;Lcom/opera/api/Callback;Ljava/lang/String;Lcom/opera/api/Callback;)V
    .registers 6

    const/4 v0, 0x3

    iput-byte v0, p0, Lai2;->i:B

    .line 18
    iput-object p3, p0, Lai2;->j:Ljava/lang/Object;

    iput-object p4, p0, Lai2;->k:Lcom/opera/api/Callback;

    iput-object p1, p0, Lai2;->l:Ls43;

    .line 19
    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public constructor <init>(Lle9;Lpe9;Ljava/lang/String;Lue9;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Lai2;->i:B

    .line 20
    iput-object p3, p0, Lai2;->j:Ljava/lang/Object;

    iput-object p4, p0, Lai2;->k:Lcom/opera/api/Callback;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lai2;->l:Ls43;

    .line 21
    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method


# virtual methods
.method public final b()Lokhttp3/internal/connection/RealCall;
    .registers 7

    iget-byte v0, p0, Lai2;->i:B

    const/4 v1, 0x0

    const-string v2, "devices"

    const-string v3, "POST"

    const/4 v4, 0x0

    iget-object v5, p0, Lai2;->j:Ljava/lang/Object;

    iget-object p0, p0, Lai2;->l:Ls43;

    packed-switch v0, :pswitch_data_a6

    check-cast p0, Lle9;

    iget-object v0, p0, Ls43;->a:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    check-cast v5, Ljava/lang/String;

    new-array v1, v4, [Ljava/lang/String;

    invoke-virtual {p0, v2, v5, v1}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    invoke-static {p0, v0}, Lj7c;->q(Lfvh;Lt9f;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    :pswitch_26
    check-cast p0, Lle9;

    iget-object v0, p0, Ls43;->a:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    new-array v4, v4, [Ljava/lang/String;

    invoke-virtual {p0, v2, v1, v4}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    check-cast v5, Lorb;

    iget-object v1, v5, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ls43;->c:Lesd;

    invoke-static {v1, v2}, Lrvh;->create(Ljava/lang/String;Lesd;)Lrvh;

    move-result-object v1

    invoke-virtual {p0, v3, v1}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, p0}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    :pswitch_51
    check-cast p0, Lle9;

    iget-object v0, p0, Ls43;->a:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    check-cast v5, Ljava/lang/String;

    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "file-storage"

    invoke-virtual {p0, v2, v5, v1}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    new-array v1, v4, [B

    invoke-static {v1}, Lrvh;->create([B)Lrvh;

    move-result-object v1

    invoke-virtual {p0, v3, v1}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, p0}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    :pswitch_78
    check-cast p0, Ldi2;

    iget-object v0, p0, Ls43;->a:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    const-string v2, "flow/signup"

    new-array v4, v4, [Ljava/lang/String;

    invoke-virtual {p0, v2, v1, v4}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    check-cast v5, Lorb;

    iget-object v1, v5, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ls43;->c:Lesd;

    invoke-static {v1, v2}, Lrvh;->create(Ljava/lang/String;Lesd;)Lrvh;

    move-result-object v1

    invoke-virtual {p0, v3, v1}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, p0}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_a6
    .packed-switch 0x0
        :pswitch_78
        :pswitch_51
        :pswitch_26
    .end packed-switch
.end method

.method public final d(Lpzh;)Z
    .registers 3

    iget-byte v0, p0, Lai2;->i:B

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

.method public final g(Lorb;)V
    .registers 5

    iget-byte v0, p0, Lai2;->i:B

    iget-object v1, p0, Lai2;->k:Lcom/opera/api/Callback;

    packed-switch v0, :pswitch_data_50

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1, v0}, Lle9;->e(Lorb;Ljava/util/ArrayList;)Lowl;

    new-instance p1, Lnpl;

    const/4 v2, 0x2

    invoke-direct {p1, v1, v0, v2}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_19
    new-instance v0, Ltwl;

    invoke-direct {v0, p1}, Ltwl;-><init>(Lorb;)V

    check-cast v1, Lxx1;

    new-instance p1, Lnpl;

    const/4 v2, 0x1

    invoke-direct {p1, v1, v0, v2}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_2a
    new-instance v0, Lie9;

    invoke-direct {v0, p1}, Lie9;-><init>(Lorb;)V

    check-cast v1, Lue9;

    new-instance p1, Lcn7;

    const/16 v2, 0x1b

    invoke-direct {p1, v1, v0, v2}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_3c
    const-string v0, "token"

    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    check-cast v1, Lay1;

    new-instance v0, Lxa;

    const/16 v2, 0x1d

    invoke-direct {v0, v1, p1, v2}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    nop

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_3c
        :pswitch_2a
        :pswitch_19
    .end packed-switch
.end method
