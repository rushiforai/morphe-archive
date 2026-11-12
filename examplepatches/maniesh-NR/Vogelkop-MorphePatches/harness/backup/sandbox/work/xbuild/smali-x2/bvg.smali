.class public final synthetic Lbvg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltah;


# direct methods
.method public synthetic constructor <init>(Ltah;B)V
    .registers 3

    iput-byte p2, p0, Lbvg;->a:B

    iput-object p1, p0, Lbvg;->b:Ltah;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lbvg;->a:B

    iget-object p0, p0, Lbvg;->b:Ltah;

    packed-switch v0, :pswitch_data_26

    check-cast p1, Lff3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p0}, Lff3;->s0(Lhf3;)V

    return-void

    :pswitch_10
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_20

    iget-object p0, p0, Ltah;->g:Ljava/lang/Object;

    check-cast p0, Lc0i;

    invoke-virtual {p0}, Lc0i;->a()V

    goto :goto_24

    :cond_20
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ltah;->L(I)V

    :goto_24
    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
