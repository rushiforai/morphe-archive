.class public final synthetic Lof;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly6f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lof;->a:B

    iput-object p1, p0, Lof;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lhjm;)V
    .registers 3

    iget-byte v0, p0, Lof;->a:B

    iget-object p0, p0, Lof;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_30

    check-cast p0, Lcej;

    invoke-virtual {p0, p1}, Lcej;->finish(Lhjm;)V

    return-void

    :pswitch_d
    check-cast p0, Ldej;

    invoke-virtual {p0, p1}, Ldej;->c(Lhjm;)V

    return-void

    :pswitch_13
    check-cast p0, Lxq3;

    sget-object p1, Lhjm;->b:Lhjm;

    invoke-virtual {p0, p1}, Lcej;->finish(Lhjm;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lxq3;->c:Ljava/lang/Object;

    return-void

    :pswitch_1e
    check-cast p0, Lpf;

    iget-boolean p1, p0, Lpf;->b:Z

    if-nez p1, :cond_2e

    const/4 p1, 0x1

    iput-boolean p1, p0, Lpf;->b:Z

    iget-object p0, p0, Lpf;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_2e
    return-void

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_1e
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
