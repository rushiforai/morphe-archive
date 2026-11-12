.class public final synthetic Lmyj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvi2;


# direct methods
.method public synthetic constructor <init>(Lvi2;B)V
    .registers 3

    iput-byte p2, p0, Lmyj;->a:B

    iput-object p1, p0, Lmyj;->b:Lvi2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lmyj;->a:B

    iget-object p0, p0, Lmyj;->b:Lvi2;

    packed-switch v0, :pswitch_data_88

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lvi2;->a(I)V

    return-void

    :pswitch_11
    check-cast p1, Lbzj;

    iget-object p1, p0, Lvi2;->g:Ljava/lang/Object;

    check-cast p1, Lpde;

    iget-object v0, p0, Lvi2;->d:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbzj;

    if-eqz v1, :cond_35

    invoke-virtual {v1}, Lbzj;->a()Z

    move-result v2

    if-nez v2, :cond_35

    iget-object v2, p0, Lvi2;->h:Ljava/lang/Object;

    check-cast v2, Lmyj;

    invoke-virtual {v0, v2}, Lekc;->p(Lf7f;)V

    sget-object v0, Log;->a:Log;

    invoke-virtual {p1, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_35
    if-eqz v1, :cond_86

    sget-object v0, Lwyj;->a:Lwyj;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_86

    instance-of v0, v1, Lxyj;

    if-nez v0, :cond_86

    instance-of v0, v1, Lyyj;

    if-eqz v0, :cond_55

    check-cast v1, Lyyj;

    iget-object v0, v1, Lyyj;->c:Lkze;

    new-instance v1, Lmyj;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lmyj;-><init>(Lvi2;B)V

    invoke-static {v0, p1, v1}, La26;->T(Lekc;Likc;Lf7f;)V

    goto :goto_86

    :cond_55
    instance-of p1, v1, Lvyj;

    if-eqz p1, :cond_69

    iget-object p1, p0, Lvi2;->f:Ljava/lang/Object;

    check-cast p1, Loyj;

    iget-object v0, p0, Lvi2;->a:Ljava/lang/String;

    iget p0, p0, Lvi2;->c:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Loyj;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_86

    :cond_69
    sget-object p1, Lazj;->a:Lazj;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_86

    sget-object p1, Lzyj;->a:Lzyj;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_83

    iget-object p1, p0, Lvi2;->a:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p0, p1}, Lvi2;->a(I)V

    goto :goto_86

    :cond_83
    invoke-static {}, Lh9o;->p()V

    :cond_86
    :goto_86
    return-void

    nop

    :pswitch_data_88
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
