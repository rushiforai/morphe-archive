.class public final synthetic Lwrn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvsn;


# direct methods
.method public synthetic constructor <init>(Lvsn;B)V
    .registers 3

    iput-byte p2, p0, Lwrn;->a:B

    iput-object p1, p0, Lwrn;->b:Lvsn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 7

    iget-byte v0, p0, Lwrn;->a:B

    iget-object p0, p0, Lwrn;->b:Lvsn;

    packed-switch v0, :pswitch_data_44

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lvsn;->q:Lwnm;

    invoke-virtual {p0}, Lwnm;->u()V

    return-void

    :pswitch_f
    check-cast p1, Lu42;

    const/4 v0, 0x0

    if-eqz p1, :cond_19

    iget-object v1, p1, Lu42;->c:Lpu4;

    iget-object v1, v1, Lpu4;->e:Lw42;

    goto :goto_1a

    :cond_19
    move-object v1, v0

    :goto_1a
    sget-object v2, Lw42;->d:Lw42;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v1, v2, :cond_22

    move v1, v4

    goto :goto_23

    :cond_22
    move v1, v3

    :goto_23
    if-eqz p1, :cond_27

    iget-object v0, p1, Lu42;->b:Lx42;

    :cond_27
    sget-object p1, Lx42;->c:Lx42;

    if-ne v0, p1, :cond_2c

    move v3, v4

    :cond_2c
    if-nez v1, :cond_30

    if-nez v3, :cond_39

    :cond_30
    iget-object p1, p0, Lvsn;->c:Ls62;

    invoke-virtual {p1}, Ls62;->f()Lqyj;

    move-result-object p1

    invoke-virtual {p1}, Lqyj;->f()V

    :cond_39
    iget-object p0, p0, Lvsn;->n:Lkze;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_44
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
