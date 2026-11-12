.class public final synthetic Lo6e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lq6e;


# direct methods
.method public synthetic constructor <init>(Lq6e;B)V
    .registers 3

    iput-byte p2, p0, Lo6e;->a:B

    iput-object p1, p0, Lo6e;->b:Lq6e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lo6e;->a:B

    iget-object p0, p0, Lo6e;->b:Lq6e;

    packed-switch v0, :pswitch_data_20

    check-cast p1, Li0a;

    invoke-virtual {p0}, Lq6e;->j()Z

    move-result p1

    if-eqz p1, :cond_12

    invoke-virtual {p0}, Lq6e;->l()V

    :cond_12
    return-void

    :pswitch_13
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Lq6e;->j()Z

    move-result p1

    if-eqz p1, :cond_1e

    invoke-virtual {p0}, Lq6e;->l()V

    :cond_1e
    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
