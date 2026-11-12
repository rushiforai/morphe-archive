.class public final Lrtg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final b:Lx5f;


# direct methods
.method public constructor <init>(Lslk;Lx5f;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lrtg;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lrtg;->b:Lx5f;

    iget-object p1, p1, Lslk;->c:Lpy9;

    iget-object p1, p1, Lpy9;->g:Lkze;

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lx5f;Lkze;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lrtg;->a:B

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lrtg;->b:Lx5f;

    .line 18
    invoke-virtual {p2, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Lrtg;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lrtg;->b:Lx5f;

    packed-switch v0, :pswitch_data_6c

    check-cast p1, Lwvg;

    if-eqz p1, :cond_24

    iget v0, p1, Lwvg;->e:I

    const/4 v2, 0x3

    if-eq v0, v2, :cond_1a

    const/4 v2, 0x4

    if-eq v0, v2, :cond_1a

    const/4 v2, 0x5

    if-eq v0, v2, :cond_1a

    const/4 v2, 0x6

    if-ne v0, v2, :cond_24

    :cond_1a
    iget-object p1, p1, Lwvg;->j:Ljava/lang/String;

    if-eqz p1, :cond_21

    sget-object p1, Lar0;->c:Lar0;

    goto :goto_26

    :cond_21
    sget-object p1, Lar0;->b:Lar0;

    goto :goto_26

    :cond_24
    sget-object p1, Lar0;->d:Lar0;

    :goto_26
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-virtual {v2, v0}, Lx56;->O(Lzpa;)Le66;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v3, 0xb

    invoke-virtual {v0, v3, v1, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    return-void

    :pswitch_3c
    check-cast p1, Lqtg;

    iget p1, p1, Lqtg;->a:I

    if-eqz p1, :cond_4d

    if-eq p1, v1, :cond_4a

    const/4 v0, 0x2

    if-ne p1, v0, :cond_6b

    sget-object p1, Lqe0;->d:Lqe0;

    goto :goto_4f

    :cond_4a
    sget-object p1, Lqe0;->c:Lqe0;

    goto :goto_4f

    :cond_4d
    sget-object p1, Lqe0;->b:Lqe0;

    :goto_4f
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v3, Lck0;

    invoke-direct {v3, v0, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v3}, Lck0;->i()Lbt0;

    move-result-object v0

    iget-object v0, v0, Lbt0;->a:Le66;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v3, 0x1d

    invoke-virtual {v0, v3, v1, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    :cond_6b
    return-void

    :pswitch_data_6c
    .packed-switch 0x0
        :pswitch_3c
    .end packed-switch
.end method
