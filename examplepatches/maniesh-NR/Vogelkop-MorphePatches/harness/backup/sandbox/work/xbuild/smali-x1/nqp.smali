.class public final Lnqp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljrp;


# instance fields
.field public final synthetic a:B

.field public final b:Lz4k;


# direct methods
.method public synthetic constructor <init>(Lz4k;B)V
    .registers 3

    iput-byte p2, p0, Lnqp;->a:B

    iput-object p1, p0, Lnqp;->b:Lz4k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lnqp;->a:B

    iget-object p0, p0, Lnqp;->b:Lz4k;

    packed-switch v0, :pswitch_data_20

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lh61;

    iget-object p0, p0, Lh61;->a:Landroid/content/Context;

    new-instance v0, Lpup;

    invoke-direct {v0, p0}, Lpup;-><init>(Landroid/content/Context;)V

    return-object v0

    :pswitch_13
    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lh61;

    iget-object p0, p0, Lh61;->a:Landroid/content/Context;

    new-instance v0, Lmqp;

    invoke-direct {v0, p0}, Lmqp;-><init>(Landroid/content/Context;)V

    return-object v0

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
