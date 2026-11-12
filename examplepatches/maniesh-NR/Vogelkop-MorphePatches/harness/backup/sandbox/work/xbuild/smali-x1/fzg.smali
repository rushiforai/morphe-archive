.class public final synthetic Lfzg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhzg;


# direct methods
.method public synthetic constructor <init>(Lhzg;B)V
    .registers 3

    iput-byte p2, p0, Lfzg;->a:B

    iput-object p1, p0, Lfzg;->b:Lhzg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lfzg;->a:B

    iget-object p0, p0, Lfzg;->b:Lhzg;

    packed-switch v0, :pswitch_data_10

    invoke-virtual {p0}, Lhzg;->g()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Lhzg;->g()V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
