.class public final synthetic Lixk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkxk;

.field public final synthetic c:Lbf9;


# direct methods
.method public synthetic constructor <init>(Lkxk;Lbf9;B)V
    .registers 4

    iput-byte p3, p0, Lixk;->a:B

    iput-object p1, p0, Lixk;->b:Lkxk;

    iput-object p2, p0, Lixk;->c:Lbf9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Lixk;->a:B

    const/16 v1, 0x1388

    const v2, 0x7f140803

    iget-object v3, p0, Lixk;->c:Lbf9;

    iget-object p0, p0, Lixk;->b:Lkxk;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    packed-switch v0, :pswitch_data_50

    if-nez p1, :cond_1a

    invoke-virtual {p0, v2, v1}, Lkxk;->b(II)V

    goto :goto_31

    :cond_1a
    new-instance p1, Lixk;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v3, v0}, Lixk;-><init>(Lkxk;Lbf9;B)V

    invoke-virtual {v3}, Lbf9;->s()Lmyk;

    move-result-object p0

    if-nez p0, :cond_2c

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p1, p0}, Lixk;->run(Ljava/lang/Object;)V

    goto :goto_31

    :cond_2c
    new-instance v0, Ljyk;

    invoke-direct {v0, p0, p1}, Ljyk;-><init>(Lmyk;Lixk;)V

    :goto_31
    return-void

    :pswitch_32
    if-nez p1, :cond_38

    invoke-virtual {p0, v2, v1}, Lkxk;->b(II)V

    goto :goto_4f

    :cond_38
    iget-object p1, p0, Lkxk;->a:Lji;

    invoke-virtual {p1}, Lji;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldb;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ldb;->j(Z)V

    invoke-virtual {v3}, Lbf9;->h()V

    const p1, 0x7f14120c

    const/16 v0, 0x9c4

    invoke-virtual {p0, p1, v0}, Lkxk;->b(II)V

    :goto_4f
    return-void

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_32
    .end packed-switch
.end method
