.class public final synthetic Lgqe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Llqe;


# direct methods
.method public synthetic constructor <init>(Llqe;B)V
    .registers 3

    iput-byte p2, p0, Lgqe;->a:B

    iput-object p1, p0, Lgqe;->b:Llqe;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lgqe;->a:B

    const-wide/16 v1, 0x0

    iget-object p0, p0, Lgqe;->b:Llqe;

    packed-switch v0, :pswitch_data_56

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Llqe;->q:Lc1f;

    if-eqz p0, :cond_15

    invoke-virtual {p0}, Lc1f;->e()V

    :cond_15
    return-void

    :pswitch_16
    check-cast p1, Lv8k;

    invoke-virtual {p0}, Llqe;->b()V

    sget-object p1, Lpn7;->b:Lon7;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v1, v2}, Llqe;->a(J)V

    return-void

    :pswitch_24
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lpn7;->b:Lon7;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v1, v2}, Llqe;->a(J)V

    return-void

    :pswitch_32
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lpn7;->b:Lon7;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v1, v2}, Llqe;->a(J)V

    return-void

    :pswitch_40
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-wide v0, Llqe;->x:J

    invoke-virtual {p0, v0, v1}, Llqe;->a(J)V

    return-void

    :pswitch_4b
    check-cast p1, Lkl5;

    sget-object p1, Lpn7;->b:Lon7;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v1, v2}, Llqe;->a(J)V

    return-void

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_4b
        :pswitch_40
        :pswitch_32
        :pswitch_24
        :pswitch_16
    .end packed-switch
.end method
