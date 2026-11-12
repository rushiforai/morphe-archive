.class public final Lnsc;
.super Lr62;
.source "SourceFile"


# instance fields
.field public final synthetic f:B


# direct methods
.method public synthetic constructor <init>(Lekc;Lcom/opera/api/Callback;B)V
    .registers 4

    iput-byte p3, p0, Lnsc;->f:B

    const/4 p3, 0x1

    invoke-direct {p0, p1, p2, p3}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)Z
    .registers 4

    iget-byte p0, p0, Lnsc;->f:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    packed-switch p0, :pswitch_data_1c

    check-cast p1, Lsb;

    if-eqz p1, :cond_10

    sget-object p0, Lsb;->a:Lsb;

    if-eq p1, p0, :cond_10

    move v0, v1

    :cond_10
    return v0

    :pswitch_11
    check-cast p1, Lipf;

    if-eqz p1, :cond_1a

    instance-of p0, p1, Lepf;

    if-nez p0, :cond_1a

    move v0, v1

    :cond_1a
    return v0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
