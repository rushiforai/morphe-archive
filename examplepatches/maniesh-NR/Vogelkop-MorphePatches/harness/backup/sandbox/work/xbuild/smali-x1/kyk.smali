.class public final synthetic Lkyk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljyk;


# direct methods
.method public synthetic constructor <init>(Ljyk;B)V
    .registers 3

    iput-byte p2, p0, Lkyk;->a:B

    iput-object p1, p0, Lkyk;->b:Ljyk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lkyk;->a:B

    iget-object p0, p0, Lkyk;->b:Ljyk;

    packed-switch v0, :pswitch_data_24

    check-cast p1, Lq43;

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lzz2;->c(Ljava/lang/Boolean;)V

    return-void

    :pswitch_f
    check-cast p1, Llv5;

    if-nez p1, :cond_19

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lzz2;->c(Ljava/lang/Boolean;)V

    goto :goto_23

    :cond_19
    new-instance v0, Lqlk;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Lqlk;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Llv5;->a(Lqlk;)V

    :goto_23
    return-void

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
