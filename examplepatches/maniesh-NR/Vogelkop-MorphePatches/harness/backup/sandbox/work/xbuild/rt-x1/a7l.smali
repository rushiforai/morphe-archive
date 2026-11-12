.class public final synthetic La7l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ld7l;


# direct methods
.method public synthetic constructor <init>(Ld7l;B)V
    .registers 3

    iput-byte p2, p0, La7l;->a:B

    iput-object p1, p0, La7l;->b:Ld7l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, La7l;->a:B

    iget-object p0, p0, La7l;->b:Ld7l;

    packed-switch v0, :pswitch_data_14

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Le7l;->l()V

    return-void

    :pswitch_d
    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Le7l;->e()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
