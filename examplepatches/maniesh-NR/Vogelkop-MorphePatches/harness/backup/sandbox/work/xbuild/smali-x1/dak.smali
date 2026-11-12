.class public final Ldak;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lnh4;


# direct methods
.method public synthetic constructor <init>(Lnh4;B)V
    .registers 3

    iput-byte p2, p0, Ldak;->a:B

    iput-object p1, p0, Ldak;->b:Lnh4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Ldak;->a:B

    iget-object p0, p0, Ldak;->b:Lnh4;

    packed-switch v0, :pswitch_data_20

    sget-object v0, Lt0i;->b:Lp0i;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    return-void

    :pswitch_f
    invoke-virtual {p0}, Lnh4;->r()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lc0f;

    if-eqz v0, :cond_1e

    sget-object v0, Lt0i;->b:Lp0i;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, v0}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_1e
    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
