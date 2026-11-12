.class public final Lqs2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;
.implements Lewh;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lbli;Lqwa;)V
    .registers 3

    const/4 p1, 0x5

    iput-byte p1, p0, Lqs2;->a:B

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p2, p0, Lqs2;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 16
    iput-byte p3, p0, Lqs2;->a:B

    iput-object p1, p0, Lqs2;->b:Ljava/lang/Object;

    iput-object p2, p0, Lqs2;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lrs2;Lt53;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lqs2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lqs2;->b:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lqs2;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lru9;Ln1;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lqs2;->a:B

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lqs2;->b:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lqs2;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltah;Lilm;)V
    .registers 4

    const/4 v0, 0x6

    iput-byte v0, p0, Lqs2;->a:B

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lqs2;->b:Ljava/lang/Object;

    iput-object p1, p0, Lqs2;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object v0, p0, Lqs2;->b:Ljava/lang/Object;

    check-cast v0, Ltcc;

    invoke-virtual {v0, p0}, Ltcc;->b(Lmdc;)V

    return-void
.end method

.method public final b(Lxlh;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Lqs2;->b:Ljava/lang/Object;

    check-cast p0, Ltcc;

    invoke-static {p0, p1}, Luup;->h(Ltcc;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final c()V
    .registers 2

    iget-object v0, p0, Lqs2;->b:Ljava/lang/Object;

    check-cast v0, Ltcc;

    invoke-virtual {v0, p0}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public final d()V
    .registers 3

    iget-object p0, p0, Lqs2;->b:Ljava/lang/Object;

    check-cast p0, Lqwa;

    invoke-virtual {p0}, Lqwa;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltcc;

    move-object v0, p0

    check-cast v0, Lqdc;

    iget-object v0, v0, Lqdc;->i:Lqcc;

    sget-object v1, Lqcc;->a:Lqcc;

    if-eq v0, v1, :cond_14

    return-void

    :cond_14
    const-string v0, "Lifecycle "

    const-string v1, " is not active"

    invoke-static {p0, v1, v0}, Lhai;->g(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public final e(Lora;)V
    .registers 4

    iget-object v0, p0, Lqs2;->b:Ljava/lang/Object;

    check-cast v0, Lqwa;

    invoke-virtual {v0}, Lqwa;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltcc;

    if-nez p1, :cond_19

    iget-object v1, p0, Lqs2;->c:Ljava/lang/Object;

    check-cast v1, Lora;

    if-nez v1, :cond_13

    return-void

    :cond_13
    iput-object p1, p0, Lqs2;->c:Ljava/lang/Object;

    invoke-virtual {v0, p0}, Ltcc;->b(Lmdc;)V

    return-void

    :cond_19
    invoke-virtual {p0}, Lqs2;->d()V

    iget-object v1, p0, Lqs2;->c:Ljava/lang/Object;

    check-cast v1, Lora;

    if-nez v1, :cond_25

    invoke-virtual {v0, p0}, Ltcc;->a(Lmdc;)V

    :cond_25
    iput-object p1, p0, Lqs2;->c:Ljava/lang/Object;

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 5

    iget-byte v0, p0, Lqs2;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lqs2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_74

    iget-object p0, p0, Lqs2;->c:Ljava/lang/Object;

    check-cast p0, Ltah;

    iget-object p0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast p0, Li7f;

    check-cast v2, Lilm;

    invoke-virtual {p0, v2}, Li7f;->c(Ljava/lang/Object;)Z

    return-void

    :pswitch_16
    invoke-virtual {p0, v1}, Lqs2;->e(Lora;)V

    return-void

    :pswitch_1a
    iget-object p0, p0, Lqs2;->c:Ljava/lang/Object;

    check-cast p0, Lunb;

    invoke-interface {p0, v1}, Lunb;->k(Ljava/util/concurrent/CancellationException;)V

    return-void

    :pswitch_22
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v2, Lga6;

    iget-object p1, v2, Lga6;->b:Ljava/lang/Object;

    check-cast p1, Ld06;

    iget-object p0, p0, Lqs2;->c:Ljava/lang/Object;

    check-cast p0, Ld06;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3b

    iput-object v1, v2, Lga6;->b:Ljava/lang/Object;

    :cond_3b
    return-void

    :pswitch_3c
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v2, Lqe6;

    iget-object p1, v2, Lqe6;->b:Ljava/lang/Object;

    check-cast p1, Ltah;

    iget-object p0, p0, Lqs2;->c:Ljava/lang/Object;

    check-cast p0, Ltah;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_55

    iput-object v1, v2, Lqe6;->b:Ljava/lang/Object;

    :cond_55
    return-void

    :pswitch_56
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p0, p0, Lqs2;->c:Ljava/lang/Object;

    check-cast p0, Lru9;

    check-cast v2, Ln1;

    invoke-virtual {p0, v2}, Lru9;->d(Ln1;)V

    return-void

    :pswitch_67
    iget-object p0, p0, Lqs2;->c:Ljava/lang/Object;

    check-cast p0, Lrs2;

    iget-object p0, p0, Lrs2;->a:Li7f;

    check-cast v2, Lt53;

    invoke-virtual {p0, v2}, Li7f;->c(Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_74
    .packed-switch 0x0
        :pswitch_67
        :pswitch_56
        :pswitch_3c
        :pswitch_22
        :pswitch_1a
        :pswitch_16
    .end packed-switch
.end method
