.class public final synthetic Lgrk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmrk;


# direct methods
.method public synthetic constructor <init>(Lmrk;B)V
    .registers 3

    iput-byte p2, p0, Lgrk;->a:B

    iput-object p1, p0, Lgrk;->b:Lmrk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    iget-byte v0, p0, Lgrk;->a:B

    iget-object p0, p0, Lgrk;->b:Lmrk;

    packed-switch v0, :pswitch_data_1e

    iget-object p0, p0, Lmrk;->I:Lirk;

    iget-boolean p0, p0, Lirk;->a:Z

    return p0

    :pswitch_c
    iget-object p0, p0, Lmrk;->i:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_1b

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result p0

    goto :goto_1c

    :cond_1b
    const/4 p0, 0x0

    :goto_1c
    return p0

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
