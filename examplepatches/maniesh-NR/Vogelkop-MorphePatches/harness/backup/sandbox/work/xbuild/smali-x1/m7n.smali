.class public final synthetic Lm7n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/AutoCloseable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lm7n;->a:B

    iput-object p1, p0, Lm7n;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final close()V
    .registers 2

    iget-byte v0, p0, Lm7n;->a:B

    iget-object p0, p0, Lm7n;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1e

    check-cast p0, Latl;

    iget-object p0, p0, Latl;->b:Lqdc;

    sget-object v0, Lqcc;->a:Lqcc;

    invoke-virtual {p0, v0}, Lqdc;->g(Lqcc;)V

    return-void

    :pswitch_11
    check-cast p0, Ltvk;

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lkze;

    sget-object v0, Log;->a:Log;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
