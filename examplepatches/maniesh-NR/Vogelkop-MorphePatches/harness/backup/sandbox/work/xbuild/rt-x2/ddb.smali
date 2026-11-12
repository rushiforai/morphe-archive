.class public final synthetic Lddb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ledb;


# direct methods
.method public synthetic constructor <init>(Ledb;B)V
    .registers 3

    iput-byte p2, p0, Lddb;->a:B

    iput-object p1, p0, Lddb;->b:Ledb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lddb;->a:B

    iget-object p0, p0, Lddb;->b:Ledb;

    packed-switch v0, :pswitch_data_14

    check-cast p1, Lqtg;

    invoke-virtual {p0}, Ledb;->a()V

    return-void

    :pswitch_d
    check-cast p1, Lwvg;

    invoke-virtual {p0}, Ledb;->a()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
