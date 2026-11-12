.class public final Lq3i;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Llim;


# direct methods
.method public synthetic constructor <init>(Llim;B)V
    .registers 3

    iput-byte p2, p0, Lq3i;->a:B

    iput-object p1, p0, Lq3i;->b:Llim;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .registers 6

    iget-byte v0, p0, Lq3i;->a:B

    iget-object p0, p0, Lq3i;->b:Llim;

    packed-switch v0, :pswitch_data_44

    check-cast p0, Ldxk;

    iput-object p1, p0, Ldxk;->l:Ljava/lang/String;

    if-nez p1, :cond_f

    const-string p1, ""

    :cond_f
    invoke-static {p1}, LJ/N;->Mfa5Y2xC(Ljava/lang/Object;)V

    iget-object p1, p0, Ldxk;->g:Lx5f;

    iget-object p0, p0, Ldxk;->l:Ljava/lang/String;

    const/4 v0, 0x1

    if-nez p0, :cond_1b

    move p0, v0

    goto :goto_1c

    :cond_1b
    const/4 p0, 0x0

    :goto_1c
    iget-boolean v1, p1, Lx5f;->h:Z

    if-eqz v1, :cond_31

    iget-object v1, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-virtual {v2, v1}, Lx56;->z(Lzpa;)Lq56;

    move-result-object v1

    const/4 v3, 0x7

    invoke-virtual {v1, v3, v0, p0}, Ljf0;->r(IIZ)V

    invoke-virtual {p1, v2}, Lx5f;->U0(Lx56;)V

    :cond_31
    return-void

    :pswitch_32
    if-eqz p1, :cond_43

    check-cast p0, Lvl6;

    iget-object p0, p0, Lvl6;->d:Ljava/lang/Object;

    check-cast p0, Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ly3i;

    invoke-interface {p0, p1}, Ly3i;->e(Ljava/lang/String;)V

    :cond_43
    return-void

    :pswitch_data_44
    .packed-switch 0x0
        :pswitch_32
    .end packed-switch
.end method
