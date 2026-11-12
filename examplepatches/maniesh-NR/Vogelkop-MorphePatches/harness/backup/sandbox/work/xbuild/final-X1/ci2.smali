.class public final Lci2;
.super Lp43;
.source "SourceFile"


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Ljava/lang/Object;

.field public final synthetic k:Ls43;

.field public final synthetic l:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ldi2;Lkyk;Lcom/opera/android/oauth2/OperaAccessToken;Lkyk;)V
    .registers 6

    const/4 v0, 0x2

    iput-byte v0, p0, Lci2;->i:B

    .line 17
    iput-object p3, p0, Lci2;->j:Ljava/lang/Object;

    iput-object p4, p0, Lci2;->l:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lci2;->k:Ls43;

    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public constructor <init>(Ldi2;Lzzh;Lcom/opera/android/oauth2/OperaAccessToken;Lqlk;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Lci2;->i:B

    iput-object p3, p0, Lci2;->j:Ljava/lang/Object;

    iput-object p4, p0, Lci2;->l:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lci2;->k:Ls43;

    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public constructor <init>(Ldi2;Lzzh;Lcom/opera/android/oauth2/OperaAccessToken;Lqlk;B)V
    .registers 6

    const/4 p5, 0x1

    iput-byte p5, p0, Lci2;->i:B

    .line 16
    iput-object p3, p0, Lci2;->j:Ljava/lang/Object;

    iput-object p4, p0, Lci2;->l:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lci2;->k:Ls43;

    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public constructor <init>(Lle9;Lj12;Ljava/lang/String;Lcn7;)V
    .registers 6

    const/4 v0, 0x3

    iput-byte v0, p0, Lci2;->i:B

    .line 18
    iput-object p3, p0, Lci2;->j:Ljava/lang/Object;

    iput-object p4, p0, Lci2;->l:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lci2;->k:Ls43;

    invoke-direct {p0, p1, p2}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method


# virtual methods
.method public final b()Lokhttp3/internal/connection/RealCall;
    .registers 7

    iget-byte v0, p0, Lci2;->i:B

    const-string v1, "POST"

    const/4 v2, 0x0

    iget-object v3, p0, Lci2;->j:Ljava/lang/Object;

    iget-object p0, p0, Lci2;->k:Ls43;

    packed-switch v0, :pswitch_data_b2

    check-cast p0, Lle9;

    iget-object v0, p0, Ls43;->a:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    check-cast v3, Ljava/lang/String;

    new-array v1, v2, [Ljava/lang/String;

    const-string v2, "all-messages"

    invoke-virtual {p0, v2, v3, v1}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    sget-object v1, Lrvh;->EMPTY:Lrvh;

    const-string v2, "DELETE"

    invoke-virtual {p0, v2, v1}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, p0}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    :pswitch_31
    check-cast p0, Ldi2;

    iget-object v0, p0, Ls43;->a:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    check-cast v3, Lcom/opera/android/oauth2/OperaAccessToken;

    invoke-static {v3}, Ldi2;->c(Lcom/opera/android/oauth2/OperaAccessToken;)Ljava/lang/String;

    move-result-object v3

    new-array v4, v2, [Ljava/lang/String;

    const-string v5, "flow/profile-login"

    invoke-virtual {p0, v5, v3, v4}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    new-array v2, v2, [B

    invoke-static {v2}, Lrvh;->create([B)Lrvh;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, p0}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    :pswitch_5c
    check-cast p0, Ldi2;

    iget-object v0, p0, Ls43;->a:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    check-cast v3, Lcom/opera/android/oauth2/OperaAccessToken;

    invoke-static {v3}, Ldi2;->c(Lcom/opera/android/oauth2/OperaAccessToken;)Ljava/lang/String;

    move-result-object v3

    new-array v4, v2, [Ljava/lang/String;

    const-string v5, "delete"

    invoke-virtual {p0, v5, v3, v4}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    new-array v2, v2, [B

    invoke-static {v2}, Lrvh;->create([B)Lrvh;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, p0}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    :pswitch_87
    check-cast p0, Ldi2;

    iget-object v0, p0, Ls43;->a:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    check-cast v3, Lcom/opera/android/oauth2/OperaAccessToken;

    invoke-static {v3}, Ldi2;->c(Lcom/opera/android/oauth2/OperaAccessToken;)Ljava/lang/String;

    move-result-object v3

    new-array v4, v2, [Ljava/lang/String;

    const-string v5, "resend-email-verification"

    invoke-virtual {p0, v5, v3, v4}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    new-array v2, v2, [B

    invoke-static {v2}, Lrvh;->create([B)Lrvh;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, p0}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    :pswitch_data_b2
    .packed-switch 0x0
        :pswitch_87
        :pswitch_5c
        :pswitch_31
    .end packed-switch
.end method

.method public final d(Lpzh;)Z
    .registers 5

    iget-byte p0, p0, Lci2;->i:B

    const/16 v0, 0xcc

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch p0, :pswitch_data_24

    iget p0, p1, Lpzh;->d:I

    const/16 p1, 0xca

    if-ne p0, p1, :cond_10

    move v1, v2

    :cond_10
    return v1

    :pswitch_11
    iget p0, p1, Lpzh;->d:I

    if-ne p0, v0, :cond_16

    move v1, v2

    :cond_16
    return v1

    :pswitch_17
    iget p0, p1, Lpzh;->d:I

    if-ne p0, v0, :cond_1c

    move v1, v2

    :cond_1c
    return v1

    :pswitch_1d
    iget p0, p1, Lpzh;->d:I

    if-ne p0, v0, :cond_22

    move v1, v2

    :cond_22
    return v1

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_17
        :pswitch_11
    .end packed-switch
.end method

.method public final f(Lpzh;)V
    .registers 5

    iget-byte v0, p0, Lci2;->i:B

    iget-object v1, p0, Lci2;->l:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_42

    check-cast v1, Lcn7;

    invoke-virtual {p0, v1}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_d
    iget-object v0, p1, Lpzh;->f:Le9a;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "Set-Cookie"

    invoke-static {v0, v2}, Lokhttp3/internal/_HeadersCommonKt;->commonValues(Le9a;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_20

    const/4 p1, 0x0

    goto :goto_2a

    :cond_20
    new-instance v2, Llv5;

    iget-object p1, p1, Lpzh;->a:Lkvh;

    iget-object p1, p1, Lkvh;->a:Lhra;

    invoke-direct {v2, p1, v0}, Llv5;-><init>(Lhra;Ljava/util/List;)V

    move-object p1, v2

    :goto_2a
    check-cast v1, Lkyk;

    new-instance v0, Lbi2;

    const/4 v2, 0x1

    invoke-direct {v0, v1, p1, v2}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_36
    check-cast v1, Lqlk;

    invoke-virtual {p0, v1}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_3c
    check-cast v1, Lqlk;

    invoke-virtual {p0, v1}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_3c
        :pswitch_36
        :pswitch_d
    .end packed-switch
.end method
