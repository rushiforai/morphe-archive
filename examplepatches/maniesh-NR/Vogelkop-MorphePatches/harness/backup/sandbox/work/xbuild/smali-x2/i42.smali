.class public final Li42;
.super Lyi2;
.source "SourceFile"


# instance fields
.field public final synthetic g:B

.field public final synthetic h:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/oauth2/OperaAccessToken;)V
    .registers 3

    .line 9
    const-string v0, "me"

    invoke-direct {p0, p1, v0}, Lyi2;-><init>(Lcom/opera/android/oauth2/OperaAccessToken;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/oauth2/OperaAccessToken;Lk42;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Li42;->g:B

    iput-object p2, p0, Li42;->h:Ljava/lang/Object;

    invoke-direct {p0, p1}, Li42;-><init>(Lcom/opera/android/oauth2/OperaAccessToken;)V

    return-void
.end method

.method public constructor <init>(Li4d;Lcom/opera/android/oauth2/OperaAccessToken;Lza;)V
    .registers 4

    const/4 p1, 0x1

    iput-byte p1, p0, Li42;->g:B

    .line 10
    iput-object p3, p0, Li42;->h:Ljava/lang/Object;

    invoke-direct {p0, p2}, Li42;-><init>(Lcom/opera/android/oauth2/OperaAccessToken;)V

    return-void
.end method


# virtual methods
.method public final d(Ljava/lang/String;)V
    .registers 4

    iget-byte v0, p0, Li42;->g:B

    packed-switch v0, :pswitch_data_2a

    invoke-virtual {p0, p1}, Li42;->q(Ljava/lang/String;)V

    return-void

    :pswitch_9
    invoke-virtual {p0, p1}, Li42;->q(Ljava/lang/String;)V

    iget-object p0, p0, Li42;->h:Ljava/lang/Object;

    check-cast p0, Lk42;

    iget-object p0, p0, Lk42;->a:Lji;

    iget-object p0, p0, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "aria.sandbox.userinfo"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final i(Ljava/lang/String;)V
    .registers 3

    iget-byte v0, p0, Li42;->g:B

    iget-object p0, p0, Li42;->h:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2a

    check-cast p0, Lza;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lza;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_e
    check-cast p0, Lk42;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lk42;->f:Z

    iget-object p0, p0, Lk42;->d:Lh42;

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lf42;

    invoke-direct {v0, p1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    new-instance p1, Lq0i;

    invoke-direct {p1, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance v0, Lt0i;

    invoke-direct {v0, p1}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final q(Ljava/lang/String;)V
    .registers 4

    invoke-static {p1}, Lyi4;->J(Ljava/lang/String;)Lehf;

    move-result-object p1

    new-instance v0, Lxa;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method
