.class public final Lrz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 8
    const/4 v0, 0x4

    iput-byte v0, p0, Lrz;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lrz;->a:B

    iput-object p1, p0, Lrz;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDestroy(Lndc;)V
    .registers 7

    iget-byte v0, p0, Lrz;->a:B

    const-wide/16 v1, 0x0

    packed-switch v0, :pswitch_data_5c

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lrz;->b:Ljava/lang/Object;

    return-void

    :pswitch_12
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p0, p0, Lrz;->b:Ljava/lang/Object;

    check-cast p0, Ls9i;

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/webcore/WebcoreRpcBridge;

    iget-wide v3, p0, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    invoke-static {v3, v4}, LJ/N;->MVisE3We(J)V

    iput-wide v1, p0, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    return-void

    :pswitch_29
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p0, p0, Lrz;->b:Ljava/lang/Object;

    check-cast p0, Lr9i;

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/webcore/WebcoreRpcBridge;

    iget-wide v3, p0, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    invoke-static {v3, v4}, LJ/N;->MVisE3We(J)V

    iput-wide v1, p0, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    return-void

    :pswitch_40
    iget-object p1, p0, Lrz;->b:Ljava/lang/Object;

    check-cast p1, Luwh;

    iget-object v0, p1, Luwh;->j:Lrle;

    iget-object v0, v0, Lrle;->a:Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifier;->removeConnectionTypeObserver(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V

    invoke-virtual {p1}, Luwh;->c()V

    iget-object p1, p1, Luwh;->i:Ltcc;

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    return-void

    :pswitch_54
    iget-object p0, p0, Lrz;->b:Ljava/lang/Object;

    check-cast p0, Lwjh;

    invoke-virtual {p0}, Lwjh;->A()V

    return-void

    :pswitch_data_5c
    .packed-switch 0x0
        :pswitch_54
        :pswitch_40
        :pswitch_29
        :pswitch_12
    .end packed-switch
.end method
