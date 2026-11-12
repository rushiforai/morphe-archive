.class public final synthetic Laji;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Liji;


# direct methods
.method public synthetic constructor <init>(Liji;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Laji;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laji;->b:Liji;

    return-void
.end method

.method public synthetic constructor <init>(Liji;Lwjh;)V
    .registers 3

    .line 9
    const/4 p2, 0x1

    iput-byte p2, p0, Laji;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laji;->b:Liji;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Laji;->a:B

    iget-object p0, p0, Laji;->b:Liji;

    packed-switch v0, :pswitch_data_10

    invoke-virtual {p0}, Liji;->u()V

    return-void

    :pswitch_b
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Liji;->e(Z)V

    return-void

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
