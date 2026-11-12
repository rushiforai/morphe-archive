.class public final Lsok;
.super Lsgb;
.source "SourceFile"


# instance fields
.field public final synthetic k:B

.field public l:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 9
    const/4 v0, 0x0

    iput-byte v0, p0, Lsok;->k:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ls2g;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lsok;->k:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsok;->l:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final U(Landroid/graphics/Bitmap;Z)V
    .registers 3

    iget-byte p2, p0, Lsok;->k:B

    packed-switch p2, :pswitch_data_1a

    iget-object p0, p0, Lsok;->l:Ljava/lang/Object;

    check-cast p0, Ls2g;

    if-eqz p1, :cond_d

    const/4 p1, 0x1

    goto :goto_e

    :cond_d
    const/4 p1, 0x0

    :goto_e
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Ls2g;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_16
    iput-object p1, p0, Lsok;->l:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
