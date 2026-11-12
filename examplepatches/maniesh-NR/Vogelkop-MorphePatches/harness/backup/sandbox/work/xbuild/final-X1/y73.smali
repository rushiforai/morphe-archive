.class public final Ly73;
.super Llim;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 34
    const/4 v0, 0x3

    iput-byte v0, p0, Ly73;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 33
    iput-byte p2, p0, Ly73;->a:B

    iput-object p1, p0, Ly73;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljh3;Ltcc;Lqp2;)V
    .registers 4

    const/4 p1, 0x0

    iput-byte p1, p0, Ly73;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lyqa;

    const/16 p3, 0xa

    invoke-direct {p1, p3}, Lyqa;-><init>(B)V

    iput-object p1, p0, Ly73;->c:Ljava/lang/Object;

    new-instance p1, Lb83;

    const/4 p3, 0x1

    invoke-direct {p1, p0, p3}, Lb83;-><init>(Ly73;B)V

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1, p3}, LJ/N;->MwwLnzkg(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p2, p0}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public constructor <init>(Lrld;Ltcc;)V
    .registers 4

    const/4 v0, 0x4

    iput-byte v0, p0, Ly73;->a:B

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Ly73;->c:Ljava/lang/Object;

    .line 39
    invoke-virtual {p2, p0}, Ltcc;->a(Lmdc;)V

    const/4 p1, 0x1

    .line 40
    iput-boolean p1, p0, Ly73;->b:Z

    return-void
.end method

.method public constructor <init>(Ltc6;Z)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Ly73;->a:B

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-boolean p2, p0, Ly73;->b:Z

    iput-object p1, p0, Ly73;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onDestroy(Lndc;)V
    .registers 3

    iget-byte v0, p0, Ly73;->a:B

    packed-switch v0, :pswitch_data_26

    invoke-super {p0, p1}, Llim;->onDestroy(Lndc;)V

    return-void

    :pswitch_9
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Ly73;->b:Z

    iget-object p0, p0, Ly73;->c:Ljava/lang/Object;

    check-cast p0, Lyqa;

    iget-object p1, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p1, La4g;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lyqa;->q(La4g;)V

    if-eqz p1, :cond_24

    invoke-virtual {p1}, La4g;->a()V

    :cond_24
    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final onPause(Lndc;)V
    .registers 3

    iget-byte p1, p0, Ly73;->a:B

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_14

    return-void

    :pswitch_7
    iput-boolean v0, p0, Ly73;->b:Z

    return-void

    :pswitch_a
    iput-boolean v0, p0, Ly73;->b:Z

    iget-object p0, p0, Ly73;->c:Ljava/lang/Object;

    check-cast p0, Lxw8;

    invoke-virtual {p0}, Lxw8;->d()V

    return-void

    :pswitch_data_14
    .packed-switch 0x2
        :pswitch_a
        :pswitch_7
    .end packed-switch
.end method

.method public final onResume(Lndc;)V
    .registers 7

    iget-byte v0, p0, Ly73;->a:B

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_4a

    return-void

    :pswitch_7
    iget-boolean p1, p0, Ly73;->b:Z

    if-nez p1, :cond_24

    iput-boolean v1, p0, Ly73;->b:Z

    iget-object p1, p0, Ly73;->c:Ljava/lang/Object;

    check-cast p1, Lslk;

    new-instance v0, Lo8f;

    const/16 v2, 0x17

    invoke-direct {v0, p0, v2}, Lo8f;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lr62;

    iget-object v3, p1, Lslk;->h:Lode;

    new-instance v4, Leof;

    invoke-direct {v4, p1, v0, v2}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p0, v3, v4, v1}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    :cond_24
    return-void

    :pswitch_25
    iget-boolean v0, p0, Ly73;->b:Z

    if-eqz v0, :cond_30

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    :cond_30
    return-void

    :pswitch_31
    iput-boolean v1, p0, Ly73;->b:Z

    iget-object p1, p0, Ly73;->c:Ljava/lang/Object;

    check-cast p1, Lgl6;

    if-eqz p1, :cond_3f

    const/4 v0, 0x0

    iput-object v0, p0, Ly73;->c:Ljava/lang/Object;

    invoke-virtual {p1}, Lgl6;->run()V

    :cond_3f
    return-void

    :pswitch_40
    iput-boolean v1, p0, Ly73;->b:Z

    iget-object p0, p0, Ly73;->c:Ljava/lang/Object;

    check-cast p0, Lxw8;

    invoke-virtual {p0}, Lxw8;->d()V

    return-void

    :pswitch_data_4a
    .packed-switch 0x2
        :pswitch_40
        :pswitch_31
        :pswitch_25
        :pswitch_7
    .end packed-switch
.end method

.method public final onStart(Lndc;)V
    .registers 6

    iget-byte v0, p0, Ly73;->a:B

    packed-switch v0, :pswitch_data_44

    return-void

    :pswitch_6
    iget-object v0, p0, Ly73;->c:Ljava/lang/Object;

    check-cast v0, Ltc6;

    iget-object v1, v0, Ltc6;->v:Lydn;

    iget-object v2, v0, Ltc6;->u:Lcom/opera/android/settings/SettingsManager;

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-boolean p0, p0, Ly73;->b:Z

    const/4 p1, 0x1

    const-string v3, "compression"

    if-eqz p0, :cond_25

    iget-object p0, v1, Lydn;->d:Lvdn;

    iget-boolean p0, p0, Lvdn;->a:Z

    if-nez p0, :cond_25

    invoke-virtual {v2, p1, v3}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_25
    invoke-virtual {v2, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_31

    new-instance p0, Lb76;

    invoke-direct {p0, p1}, Lb76;-><init>(B)V

    goto :goto_38

    :cond_31
    new-instance p0, Ltf7;

    iget-object p1, v0, Ltc6;->w:Lorm;

    invoke-direct {p0, p1, v2, v1}, Ltf7;-><init>(Lorm;Lcom/opera/android/settings/SettingsManager;Lydn;)V

    :goto_38
    iget-object p1, v0, Ltc6;->y:Lz77;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p1, p0, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    nop

    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final onStop(Lndc;)V
    .registers 4

    iget-byte v0, p0, Ly73;->a:B

    packed-switch v0, :pswitch_data_2e

    return-void

    :pswitch_6
    iget-object v0, p0, Ly73;->c:Ljava/lang/Object;

    check-cast v0, Lrld;

    iget-object v1, v0, Lrld;->n:Lxbf;

    if-eqz v1, :cond_26

    iget-object v1, v1, Lxbf;->c:Ljava/lang/Object;

    check-cast v1, Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgig;

    invoke-interface {v1}, Lgig;->pause()V

    iget-object v1, v0, Lrld;->q:Lwld;

    iget-object v0, v0, Lrld;->n:Lxbf;

    iget-object v0, v0, Lxbf;->d:Ljava/lang/Object;

    check-cast v0, Lpod;

    invoke-virtual {v1, v0}, Lsc;->n(Ljava/lang/Object;)V

    :cond_26
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    return-void

    :pswitch_data_2e
    .packed-switch 0x4
        :pswitch_6
    .end packed-switch
.end method
