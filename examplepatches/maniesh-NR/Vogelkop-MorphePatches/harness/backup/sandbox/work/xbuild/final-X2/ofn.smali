.class public final Lofn;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Lpfn;


# direct methods
.method public constructor <init>(Lpfn;B)V
    .registers 3

    iput-byte p2, p0, Lofn;->c:B

    iput-object p1, p0, Lofn;->d:Lpfn;

    packed-switch p2, :pswitch_data_14

    sget-object p1, Lru9;->d:Lmu9;

    invoke-direct {p0, p1}, Ln1;-><init>(Lou9;)V

    return-void

    :pswitch_d
    sget-object p1, Lru9;->e:Llu9;

    invoke-direct {p0, p1}, Ln1;-><init>(Lou9;)V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_d
    .end packed-switch
.end method


# virtual methods
.method public final x0(Lou9;)V
    .registers 3

    iget-byte v0, p0, Lofn;->c:B

    iget-object p0, p0, Lofn;->d:Lpfn;

    packed-switch v0, :pswitch_data_14

    check-cast p1, Llu9;

    invoke-virtual {p0}, Lpfn;->S()V

    return-void

    :pswitch_d
    check-cast p1, Lmu9;

    invoke-virtual {p0}, Lpfn;->S()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
