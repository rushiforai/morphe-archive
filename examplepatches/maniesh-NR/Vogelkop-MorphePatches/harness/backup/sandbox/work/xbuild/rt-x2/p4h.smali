.class public final synthetic Lp4h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lt59;


# direct methods
.method public synthetic constructor <init>(Lt59;B)V
    .registers 3

    iput-byte p2, p0, Lp4h;->a:B

    iput-object p1, p0, Lp4h;->b:Lt59;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lp4h;->a:B

    iget-object p0, p0, Lp4h;->b:Lt59;

    check-cast p1, Ljava/lang/Long;

    packed-switch v0, :pswitch_data_1e

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lt59;->b:J

    invoke-virtual {p0}, Lt59;->a()V

    return-void

    :pswitch_13
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lt59;->a:J

    invoke-virtual {p0}, Lt59;->a()V

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
