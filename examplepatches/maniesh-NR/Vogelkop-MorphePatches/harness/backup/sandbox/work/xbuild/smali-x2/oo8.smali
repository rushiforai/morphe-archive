.class public final Loo8;
.super Lbqi;
.source "SourceFile"


# static fields
.field public static q:Lnrl;

.field public static r:Z

.field public static s:I


# instance fields
.field public final synthetic p:B


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Landroid/app/Activity;Lyo;Lrm;Ljava/lang/String;Lpyl;Luwh;Lqfb;Lr68;Li3j;Lap;Lr9g;B)V
    .registers 14

    iput-byte p13, p0, Loo8;->p:B

    invoke-direct/range {p0 .. p12}, Lbqi;-><init>(Ljava/lang/String;Landroid/app/Activity;Lyo;Lrm;Ljava/lang/String;Lpyl;Luwh;Lqfb;Lr68;Li3j;Lap;Lr9g;)V

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    iget-byte v0, p0, Loo8;->p:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0}, Lbqi;->a()Z

    move-result p0

    return p0

    :pswitch_a
    sget-boolean v0, Loo8;->r:Z

    if-eqz v0, :cond_10

    const/4 p0, 0x0

    goto :goto_14

    :cond_10
    invoke-super {p0}, Lbqi;->a()Z

    move-result p0

    :goto_14
    return p0

    nop

    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final l(Lzy;Laz;)Lk43;
    .registers 15

    iget-byte v0, p0, Loo8;->p:B

    iget-object v1, p0, Lbqi;->f:Lrm;

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_9a

    invoke-virtual {p0}, Lbqi;->m()Landroid/app/Activity;

    move-result-object v5

    iget-object v0, p0, Lbqi;->g:Ljava/lang/String;

    if-eqz v5, :cond_5d

    sget-boolean v3, Loo8;->r:Z

    if-nez v3, :cond_5d

    invoke-interface {p2}, Laz;->b()Z

    move-result v3

    if-eqz v3, :cond_24

    const-string p0, "ad provider does not support offline requests"

    invoke-static {p0, v0}, Lbqi;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Lzy;->onFailed(Ljava/lang/String;)V

    goto :goto_67

    :cond_24
    invoke-interface {p2}, Laz;->a()Ldl;

    move-result-object v7

    invoke-interface {p2}, Laz;->f()Z

    move-result p2

    if-eqz p2, :cond_38

    new-instance v3, Lrhf;

    const/4 v8, 0x1

    move-object v4, p0

    move-object v6, p1

    invoke-direct/range {v3 .. v8}, Lrhf;-><init>(Loo8;Landroid/app/Activity;Lzy;Ldl;B)V

    :goto_36
    move-object v2, v3

    goto :goto_67

    :cond_38
    move-object v4, p0

    move-object v6, p1

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    packed-switch p0, :pswitch_data_a0

    invoke-static {}, Lh9o;->p()V

    goto :goto_67

    :pswitch_45
    const-string p0, "ad format not supported"

    invoke-static {p0, v0}, Lbqi;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v6, p0}, Lzy;->onFailed(Ljava/lang/String;)V

    goto :goto_67

    :pswitch_4f
    new-instance v3, Lrhf;

    const/4 v8, 0x0

    invoke-direct/range {v3 .. v8}, Lrhf;-><init>(Loo8;Landroid/app/Activity;Lzy;Ldl;B)V

    goto :goto_36

    :pswitch_56
    new-instance v3, Lrhf;

    const/4 v8, 0x2

    invoke-direct/range {v3 .. v8}, Lrhf;-><init>(Loo8;Landroid/app/Activity;Lzy;Ldl;B)V

    goto :goto_36

    :cond_5d
    move-object v6, p1

    const-string p0, "ads provider not available"

    invoke-static {p0, v0}, Lbqi;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v6, p0}, Lzy;->onFailed(Ljava/lang/String;)V

    :goto_67
    return-object v2

    :pswitch_68
    move-object v4, p0

    move-object v6, p1

    invoke-interface {p2}, Laz;->a()Ldl;

    move-result-object v7

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_8c

    const/4 p1, 0x5

    if-eq p0, p1, :cond_98

    move-object v5, v4

    new-instance v4, Lmo8;

    move-object v8, v6

    invoke-virtual {v5}, Lbqi;->m()Landroid/app/Activity;

    move-result-object v6

    if-eqz v6, :cond_98

    iget-object v10, v5, Lbqi;->h:Li3j;

    iget-object v11, v5, Lbqi;->i:Lap;

    move-object v9, v7

    move-object v7, v5

    invoke-direct/range {v4 .. v11}, Lmo8;-><init>(Loo8;Landroid/app/Activity;Loo8;Lzy;Ldl;Li3j;Lap;)V

    :goto_8a
    move-object v2, v4

    goto :goto_98

    :cond_8c
    new-instance p0, Lno8;

    iget-object v8, v4, Lbqi;->h:Li3j;

    iget-object v9, v4, Lbqi;->i:Lap;

    move-object v5, v4

    move-object v4, p0

    invoke-direct/range {v4 .. v9}, Lno8;-><init>(Loo8;Lzy;Ldl;Li3j;Lap;)V

    goto :goto_8a

    :cond_98
    :goto_98
    return-object v2

    nop

    :pswitch_data_9a
    .packed-switch 0x0
        :pswitch_68
    .end packed-switch

    :pswitch_data_a0
    .packed-switch 0x0
        :pswitch_56
        :pswitch_4f
        :pswitch_4f
        :pswitch_45
        :pswitch_45
        :pswitch_45
        :pswitch_45
    .end packed-switch
.end method
