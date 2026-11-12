.class public final Lj42;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lchf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/oauth2/OAuth2Account;Lahf;)V
    .registers 3

    const/4 p1, 0x2

    iput-byte p1, p0, Lj42;->a:B

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lj42;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/oauth2/OperaAccessSandbox;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lj42;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lj42;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lk42;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lj42;->a:B

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lj42;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/android/oauth2/OperaAccessToken;)V
    .registers 10

    iget-byte v0, p0, Lj42;->a:B

    iget-object p0, p0, Lj42;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_48

    check-cast p0, Lahf;

    invoke-interface {p0, p1}, Lahf;->V(Lcom/opera/android/oauth2/OperaAccessToken;)V

    return-void

    :pswitch_d
    check-cast p0, Lcom/opera/android/oauth2/OperaAccessSandbox;

    iget-byte v0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3a

    const/4 v0, 0x2

    iput-byte v0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    iget-object v3, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->c:Lyf1;

    invoke-static {}, LJ/N;->MsWGZerj()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v7, Lygf;

    const/4 v2, 0x0

    invoke-direct {v7, p0, v2}, Lygf;-><init>(Lcom/opera/android/oauth2/OperaAccessSandbox;B)V

    new-instance v4, Lygf;

    invoke-direct {v4, p0, v1}, Lygf;-><init>(Lcom/opera/android/oauth2/OperaAccessSandbox;B)V

    const-string p0, "client_id"

    const-string v1, "service"

    const-string v2, "aria"

    invoke-static {p0, v0, v1, v2}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v6

    new-instance v2, Lxf1;

    move-object v5, p1

    invoke-direct/range {v2 .. v7}, Lxf1;-><init>(Lyf1;Lygf;Lcom/opera/android/oauth2/OperaAccessToken;Lorb;Lygf;)V

    :cond_3a
    return-void

    :pswitch_3b
    move-object v5, p1

    new-instance p1, Li42;

    check-cast p0, Lk42;

    invoke-direct {p1, v5, p0}, Li42;-><init>(Lcom/opera/android/oauth2/OperaAccessToken;Lk42;)V

    invoke-virtual {p1}, Lyi2;->k()V

    return-void

    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_3b
        :pswitch_d
    .end packed-switch
.end method

.method public final b()V
    .registers 3

    iget-byte v0, p0, Lj42;->a:B

    iget-object p0, p0, Lj42;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_38

    check-cast p0, Lahf;

    invoke-interface {p0}, Lahf;->b()V

    return-void

    :pswitch_d
    check-cast p0, Lcom/opera/android/oauth2/OperaAccessSandbox;

    iget-byte v0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    const/4 v1, 0x1

    if-ne v0, v1, :cond_18

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/opera/android/oauth2/OperaAccessSandbox;->a(I)V

    :cond_18
    return-void

    :pswitch_19
    check-cast p0, Lk42;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lk42;->f:Z

    iget-object p0, p0, Lk42;->d:Lh42;

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lf42;

    const-string v1, "Token lost"

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    new-instance v1, Lq0i;

    invoke-direct {v1, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance v0, Lt0i;

    invoke-direct {v0, v1}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_19
        :pswitch_d
    .end packed-switch
.end method

.method public final c()V
    .registers 3

    iget-byte v0, p0, Lj42;->a:B

    iget-object p0, p0, Lj42;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_32

    check-cast p0, Lahf;

    invoke-interface {p0}, Lahf;->b()V

    return-void

    :pswitch_d
    check-cast p0, Lcom/opera/android/oauth2/OperaAccessSandbox;

    iget-byte v0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    const/4 v1, 0x1

    if-ne v0, v1, :cond_18

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/opera/android/oauth2/OperaAccessSandbox;->a(I)V

    :cond_18
    return-void

    :pswitch_19
    check-cast p0, Lk42;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lk42;->f:Z

    iget-object p0, p0, Lk42;->d:Lh42;

    sget-object v0, Lt0i;->b:Lp0i;

    sget-object v0, Le42;->a:Le42;

    new-instance v1, Lq0i;

    invoke-direct {v1, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance v0, Lt0i;

    invoke-direct {v0, v1}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_19
        :pswitch_d
    .end packed-switch
.end method
