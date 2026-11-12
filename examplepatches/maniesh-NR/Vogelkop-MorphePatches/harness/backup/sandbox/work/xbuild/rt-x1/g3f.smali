.class public final Lg3f;
.super Lsc;
.source "SourceFile"


# instance fields
.field public final synthetic d:B

.field public final e:Lw6f;


# direct methods
.method public constructor <init>(Li3j;Lkze;Lpc;Lhd;Lp1f;)V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Lg3f;->d:B

    .line 17
    invoke-direct {p0, p1, p3, p4}, Lsc;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 18
    iput-object p5, p0, Lg3f;->e:Lw6f;

    .line 19
    new-instance p1, Lf3f;

    invoke-direct {p1, p0}, Lf3f;-><init>(Lg3f;)V

    .line 20
    invoke-static {p5, p2, p1}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Lpjn;Lkze;Lpc;Lhd;Lk6l;)V
    .registers 7

    const/4 v0, 0x1

    iput-byte v0, p0, Lg3f;->d:B

    invoke-direct {p0, p1, p3, p4}, Lsc;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p5, p0, Lg3f;->e:Lw6f;

    new-instance p1, Lw3l;

    invoke-direct {p1, p0}, Lw3l;-><init>(Lg3f;)V

    invoke-static {p5, p2, p1}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final i(Ljf;)Lrc;
    .registers 4

    iget-byte v0, p0, Lg3f;->d:B

    iget-object v1, p0, Lg3f;->e:Lw6f;

    packed-switch v0, :pswitch_data_32

    check-cast v1, Lk6l;

    iget-object v0, v1, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_12

    invoke-interface {v0}, Lb9l;->T()Lp6l;

    move-result-object v0

    goto :goto_14

    :cond_12
    sget-object v0, Lp6l;->a:Lp6l;

    :goto_14
    invoke-virtual {v1, v0}, Lk6l;->s(Lp6l;)I

    move-result v0

    new-instance v1, Lv3l;

    iget-object p0, p0, Lsc;->b:Ljava/lang/Object;

    check-cast p0, Lpc;

    invoke-direct {v1, p0, p1, v0}, Lv3l;-><init>(Lpc;Ljf;I)V

    return-object v1

    :pswitch_22
    new-instance v0, Lrc;

    iget-object p0, p0, Lsc;->b:Ljava/lang/Object;

    check-cast p0, Lpc;

    check-cast v1, Lp1f;

    invoke-virtual {v1}, Lp1f;->a()Z

    move-result v1

    invoke-direct {v0, p0, p1, v1}, Lrc;-><init>(Lpc;Ljf;Z)V

    return-object v0

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_22
    .end packed-switch
.end method
