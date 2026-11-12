.class public final synthetic Lq6k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lx9n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lr6k;


# direct methods
.method public synthetic constructor <init>(Lr6k;B)V
    .registers 3

    iput-byte p2, p0, Lq6k;->a:B

    iput-object p1, p0, Lq6k;->b:Lr6k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 8

    iget-byte v0, p0, Lq6k;->a:B

    const/16 v1, 0x64

    iget-object p0, p0, Lq6k;->b:Lr6k;

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_5a

    if-ne p1, v1, :cond_f

    move p1, v2

    goto :goto_10

    :cond_f
    move p1, v3

    :goto_10
    iget-boolean v0, p0, Lr6k;->h:Z

    if-eq p1, v0, :cond_4c

    iput-boolean p1, p0, Lr6k;->h:Z

    iget-boolean v0, p0, Lr6k;->g:Z

    if-eqz v0, :cond_4c

    if-eqz p1, :cond_4c

    iget-object p0, p0, Lr6k;->e:Lne5;

    iget-object p0, p0, Lne5;->e:Ljava/lang/Object;

    check-cast p0, Lpz6;

    iget-object p0, p0, Lpz6;->e:Lxz6;

    iget-boolean p1, p0, Lxz6;->b:Z

    if-nez p1, :cond_4c

    iput-boolean v2, p0, Lxz6;->b:Z

    iget-object p0, p0, Lxz6;->a:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_4c

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    invoke-static {p1, v0}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object p1

    iget-object p1, p1, Lhi0;->e:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwu0;

    const-wide/16 v4, 0x1

    iget-object p1, p1, Lwu0;->b:Lvu0;

    invoke-virtual {p1, v3, v2, v4, v5}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    :cond_4c
    return-void

    :pswitch_4d
    if-eq p1, v1, :cond_50

    move v2, v3

    :cond_50
    iget-boolean p1, p0, Lr6k;->i:Z

    if-eq v2, p1, :cond_59

    iput-boolean v2, p0, Lr6k;->i:Z

    invoke-virtual {p0}, Lr6k;->c0()V

    :cond_59
    return-void

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_4d
    .end packed-switch
.end method
