.class public Ll/y1e0;
.super Ll/kmq0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/kmq0<",
        "Ll/v1e0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/v1e0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/kmq0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;[Ljava/lang/String;Z)V
    .locals 9

    if-eqz p3, :cond_0

    .line 1
    const-string p2, "model"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1a

    .line 2
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    new-instance p1, Ll/xg60;

    invoke-direct {p1}, Ll/xg60;-><init>()V

    invoke-virtual {p0, p1}, Ll/v1e0;->k(Ll/xg60;)V

    return-void

    .line 3
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p3

    const/4 v0, 0x6

    const/4 v1, 0x5

    const/4 v2, 0x4

    const/4 v3, -0x1

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    sparse-switch p3, :sswitch_data_0

    :goto_0
    move p1, v3

    goto/16 :goto_1

    :sswitch_0
    const-string p3, "layout_type"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/16 p1, 0x12

    goto/16 :goto_1

    :sswitch_1
    const-string p3, "chance_range"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    const/16 p1, 0x11

    goto/16 :goto_1

    :sswitch_2
    const-string p3, "move_to"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    goto :goto_0

    :cond_3
    const/16 p1, 0x10

    goto/16 :goto_1

    :sswitch_3
    const-string p3, "alpha_interpolator"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    goto :goto_0

    :cond_4
    const/16 p1, 0xf

    goto/16 :goto_1

    :sswitch_4
    const-string p3, "move_from"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    goto :goto_0

    :cond_5
    const/16 p1, 0xe

    goto/16 :goto_1

    :sswitch_5
    const-string p3, "move_rotate_to"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6

    goto :goto_0

    :cond_6
    const/16 p1, 0xd

    goto/16 :goto_1

    :sswitch_6
    const-string p3, "scale"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    goto :goto_0

    :cond_7
    const/16 p1, 0xc

    goto/16 :goto_1

    :sswitch_7
    const-string p3, "alpha"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    goto :goto_0

    :cond_8
    const/16 p1, 0xb

    goto/16 :goto_1

    :sswitch_8
    const-string p3, "name"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_9

    goto :goto_0

    :cond_9
    const/16 p1, 0xa

    goto/16 :goto_1

    :sswitch_9
    const-string p3, "max"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 p1, 0x9

    goto/16 :goto_1

    :sswitch_a
    const-string p3, "scale_interpolator"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 p1, 0x8

    goto/16 :goto_1

    :sswitch_b
    const-string p3, "src_id_wh"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_c

    goto/16 :goto_0

    :cond_c
    const/4 p1, 0x7

    goto :goto_1

    :sswitch_c
    const-string p3, "src_ltwh"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_d

    goto/16 :goto_0

    :cond_d
    move p1, v0

    goto :goto_1

    :sswitch_d
    const-string p3, "width_height"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_e

    goto/16 :goto_0

    :cond_e
    move p1, v1

    goto :goto_1

    :sswitch_e
    const-string p3, "rotate"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_f

    goto/16 :goto_0

    :cond_f
    move p1, v2

    goto :goto_1

    :sswitch_f
    const-string p3, "active_time"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_10

    goto/16 :goto_0

    :cond_10
    move p1, v4

    goto :goto_1

    :sswitch_10
    const-string p3, "move_interpolator"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_11

    goto/16 :goto_0

    :cond_11
    move p1, v5

    goto :goto_1

    :sswitch_11
    const-string p3, "rotate_interpolator"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_12

    goto/16 :goto_0

    :cond_12
    move p1, v6

    goto :goto_1

    :sswitch_12
    const-string p3, "duration"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_13

    goto/16 :goto_0

    :cond_13
    move p1, v7

    :goto_1
    const-string p3, "match_parent"

    const/4 v8, 0x0

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_6

    .line 4
    :pswitch_0
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    aget-object p1, p2, v7

    iput-object p1, p0, Lcom/sunshine/engine/base/a;->k:Ljava/lang/String;

    return-void

    .line 5
    :pswitch_1
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    invoke-virtual {p0}, Ll/v1e0;->m()Ll/xg60;

    move-result-object p0

    .line 6
    iget-object p0, p0, Ll/xg60;->c:Ll/kk90;

    aget-object p1, p2, v7

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aget-object p2, p2, v6

    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p2

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ll/kk90;->m(Ljava/lang/Float;Ljava/lang/Float;)Ll/kk90;

    return-void

    .line 7
    :pswitch_2
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    invoke-virtual {p0}, Ll/v1e0;->m()Ll/xg60;

    move-result-object p0

    .line 8
    aget-object p1, p2, v7

    iput-object p1, p0, Ll/xg60;->n:Ljava/lang/String;

    return-void

    .line 9
    :pswitch_3
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    invoke-virtual {p0}, Ll/v1e0;->m()Ll/xg60;

    move-result-object p0

    .line 10
    iget-object p1, p0, Ll/xg60;->e:Ll/fz0;

    aget-object v0, p2, v7

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p1, Ll/fz0;->b:I

    .line 11
    iget-object p1, p0, Ll/xg60;->e:Ll/fz0;

    aget-object v0, p2, v6

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p1, Ll/fz0;->d:I

    .line 12
    aget-object p1, p2, v5

    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    .line 13
    iget-object p3, p0, Ll/xg60;->e:Ll/fz0;

    if-eqz p1, :cond_14

    .line 14
    iput v3, p3, Ll/fz0;->f:I

    goto :goto_2

    .line 15
    :cond_14
    aget-object p1, p2, v5

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p3, Ll/fz0;->f:I

    .line 16
    :goto_2
    iget-object p0, p0, Ll/xg60;->e:Ll/fz0;

    aget-object p1, p2, v4

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Ll/fz0;->g:I

    return-void

    .line 17
    :pswitch_4
    iget-object p1, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p1, Ll/v1e0;

    invoke-virtual {p1}, Ll/v1e0;->m()Ll/xg60;

    move-result-object p1

    .line 18
    iget-object p1, p1, Ll/xg60;->f:Ll/fz0;

    iput-boolean v6, p1, Ll/fz0;->a:Z

    .line 19
    :pswitch_5
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    invoke-virtual {p0}, Ll/v1e0;->m()Ll/xg60;

    move-result-object p0

    .line 20
    aget-object p1, p2, v7

    const-string v0, "offset:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    const-string v1, ""

    if-eqz p1, :cond_15

    .line 21
    iget-object p1, p0, Ll/xg60;->f:Ll/fz0;

    iput-boolean v6, p1, Ll/fz0;->c:Z

    .line 22
    aget-object p1, p2, v7

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, p2, v7

    .line 23
    iget-object v2, p0, Ll/xg60;->f:Ll/fz0;

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, v2, Ll/fz0;->b:I

    goto :goto_3

    .line 24
    :cond_15
    iget-object p1, p0, Ll/xg60;->f:Ll/fz0;

    iput-boolean v7, p1, Ll/fz0;->c:Z

    .line 25
    aget-object v2, p2, v7

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p1, Ll/fz0;->b:I

    .line 26
    :goto_3
    aget-object p1, p2, v6

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_16

    .line 27
    iget-object p1, p0, Ll/xg60;->f:Ll/fz0;

    iput-boolean v6, p1, Ll/fz0;->e:Z

    .line 28
    aget-object p1, p2, v6

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, p2, v6

    .line 29
    iget-object v0, p0, Ll/xg60;->f:Ll/fz0;

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, v0, Ll/fz0;->d:I

    goto :goto_4

    .line 30
    :cond_16
    iget-object p1, p0, Ll/xg60;->f:Ll/fz0;

    iput-boolean v7, p1, Ll/fz0;->e:Z

    .line 31
    aget-object v0, p2, v6

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p1, Ll/fz0;->d:I

    .line 32
    :goto_4
    aget-object p1, p2, v5

    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_17

    .line 33
    iget-object p1, p0, Ll/xg60;->f:Ll/fz0;

    iput v3, p1, Ll/fz0;->f:I

    goto :goto_5

    .line 34
    :cond_17
    iget-object p1, p0, Ll/xg60;->f:Ll/fz0;

    aget-object p3, p2, v5

    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p3

    iput p3, p1, Ll/fz0;->f:I

    .line 35
    :goto_5
    iget-object p0, p0, Ll/xg60;->f:Ll/fz0;

    aget-object p1, p2, v4

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Ll/fz0;->g:I

    return-void

    .line 36
    :pswitch_6
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    invoke-virtual {p0}, Ll/v1e0;->m()Ll/xg60;

    move-result-object p0

    .line 37
    iget-object p1, p0, Ll/xg60;->o:Ll/kk90;

    aget-object p3, p2, v7

    invoke-static {p3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p3

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    aget-object v0, p2, v6

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {p1, p3, v0}, Ll/kk90;->m(Ljava/lang/Float;Ljava/lang/Float;)Ll/kk90;

    .line 38
    array-length p1, p2

    if-ne p1, v2, :cond_18

    .line 39
    iget-object p0, p0, Ll/xg60;->p:Ll/kk90;

    aget-object p1, p2, v5

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aget-object p2, p2, v4

    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p2

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ll/kk90;->m(Ljava/lang/Float;Ljava/lang/Float;)Ll/kk90;

    return-void

    .line 40
    :cond_18
    iput-object v8, p0, Ll/xg60;->p:Ll/kk90;

    return-void

    .line 41
    :pswitch_7
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    invoke-virtual {p0}, Ll/v1e0;->m()Ll/xg60;

    move-result-object p0

    .line 42
    iget-object p1, p0, Ll/xg60;->l:Ll/lk90;

    aget-object p3, p2, v7

    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aget-object v0, p2, v6

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, p3, v0}, Ll/lk90;->m(Ljava/lang/Integer;Ljava/lang/Integer;)Ll/lk90;

    .line 43
    array-length p1, p2

    if-ne p1, v5, :cond_19

    .line 44
    iput-object v8, p0, Ll/xg60;->m:Ll/lk90;

    return-void

    .line 45
    :cond_19
    iget-object p0, p0, Ll/xg60;->m:Ll/lk90;

    aget-object p1, p2, v5

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aget-object p2, p2, v4

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ll/lk90;->m(Ljava/lang/Integer;Ljava/lang/Integer;)Ll/lk90;

    return-void

    .line 46
    :pswitch_8
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    invoke-virtual {p0}, Ll/v1e0;->m()Ll/xg60;

    move-result-object p0

    .line 47
    aget-object p1, p2, v7

    iput-object p1, p0, Ll/xg60;->q:Ljava/lang/String;

    return-void

    .line 48
    :pswitch_9
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    aget-object p1, p2, v7

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Ll/v1e0;->p(I)V

    return-void

    .line 49
    :pswitch_a
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    invoke-virtual {p0}, Ll/v1e0;->m()Ll/xg60;

    move-result-object p0

    .line 50
    aget-object p1, p2, v7

    iput-object p1, p0, Ll/xg60;->s:Ljava/lang/String;

    return-void

    .line 51
    :pswitch_b
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    invoke-virtual {p0}, Ll/v1e0;->m()Ll/xg60;

    move-result-object p0

    .line 52
    aget-object p1, p2, v7

    iput-object p1, p0, Ll/xg60;->r:Ljava/lang/String;

    .line 53
    iget-object p1, p0, Ll/xg60;->b:Landroid/graphics/Rect;

    iput v7, p1, Landroid/graphics/Rect;->left:I

    .line 54
    iput v7, p1, Landroid/graphics/Rect;->top:I

    .line 55
    iget-object p1, p0, Ll/xg60;->a:Ll/drf0;

    aget-object p3, p2, v6

    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    iput-object p3, p1, Ll/drf0;->a:Ljava/lang/Object;

    .line 56
    iget-object p1, p0, Ll/xg60;->b:Landroid/graphics/Rect;

    iget p3, p1, Landroid/graphics/Rect;->left:I

    iget-object v0, p0, Ll/xg60;->a:Ll/drf0;

    iget-object v0, v0, Ll/drf0;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr p3, v0

    iput p3, p1, Landroid/graphics/Rect;->right:I

    .line 57
    iget-object p1, p0, Ll/xg60;->a:Ll/drf0;

    aget-object p2, p2, v5

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iput-object p2, p1, Ll/drf0;->b:Ljava/lang/Object;

    .line 58
    iget-object p1, p0, Ll/xg60;->b:Landroid/graphics/Rect;

    iget p2, p1, Landroid/graphics/Rect;->top:I

    iget-object p0, p0, Ll/xg60;->a:Ll/drf0;

    iget-object p0, p0, Ll/drf0;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    add-int/2addr p2, p0

    iput p2, p1, Landroid/graphics/Rect;->bottom:I

    return-void

    .line 59
    :pswitch_c
    iget-object p1, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p1, Ll/v1e0;

    invoke-virtual {p1}, Ll/v1e0;->m()Ll/xg60;

    move-result-object p1

    .line 60
    iget-object p3, p1, Ll/xg60;->b:Landroid/graphics/Rect;

    aget-object v0, p2, v7

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p3, Landroid/graphics/Rect;->left:I

    .line 61
    iget-object p3, p1, Ll/xg60;->b:Landroid/graphics/Rect;

    aget-object v0, p2, v6

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p3, Landroid/graphics/Rect;->top:I

    .line 62
    iget-object p3, p1, Ll/xg60;->a:Ll/drf0;

    aget-object v0, p2, v5

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p3, Ll/drf0;->a:Ljava/lang/Object;

    .line 63
    iget-object p3, p1, Ll/xg60;->b:Landroid/graphics/Rect;

    iget v0, p3, Landroid/graphics/Rect;->left:I

    iget-object v1, p1, Ll/xg60;->a:Ll/drf0;

    iget-object v1, v1, Ll/drf0;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p3, Landroid/graphics/Rect;->right:I

    .line 64
    iget-object p3, p1, Ll/xg60;->a:Ll/drf0;

    aget-object p2, p2, v4

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iput-object p2, p3, Ll/drf0;->b:Ljava/lang/Object;

    .line 65
    iget-object p2, p1, Ll/xg60;->b:Landroid/graphics/Rect;

    iget p3, p2, Landroid/graphics/Rect;->top:I

    iget-object v0, p1, Ll/xg60;->a:Ll/drf0;

    iget-object v0, v0, Ll/drf0;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr p3, v0

    iput p3, p2, Landroid/graphics/Rect;->bottom:I

    .line 66
    iget-object p2, p1, Ll/xg60;->q:Ljava/lang/String;

    if-eqz p2, :cond_1a

    .line 67
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    iget-object p0, p0, Lcom/sunshine/engine/base/a;->y:Ljava/util/Map;

    iget-object p1, p1, Ll/xg60;->b:Landroid/graphics/Rect;

    invoke-interface {p0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1a
    :goto_6
    return-void

    .line 68
    :pswitch_d
    iget-object p1, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p1, Ll/v1e0;

    iget-object p1, p1, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    aget-object p3, p2, v7

    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    iput-object p3, p1, Ll/drf0;->a:Ljava/lang/Object;

    .line 69
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    iget-object p0, p0, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    aget-object p1, p2, v6

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Ll/drf0;->b:Ljava/lang/Object;

    return-void

    .line 70
    :pswitch_e
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    invoke-virtual {p0}, Ll/v1e0;->m()Ll/xg60;

    move-result-object p0

    .line 71
    iget-object p1, p0, Ll/xg60;->i:Ll/lk90;

    aget-object p3, p2, v7

    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aget-object v3, p2, v6

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1, p3, v3}, Ll/lk90;->m(Ljava/lang/Integer;Ljava/lang/Integer;)Ll/lk90;

    .line 72
    array-length p1, p2

    if-ne p1, v0, :cond_1b

    .line 73
    iget-object p1, p0, Ll/xg60;->j:Ll/lk90;

    aget-object p3, p2, v5

    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aget-object v0, p2, v4

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, p3, v0}, Ll/lk90;->m(Ljava/lang/Integer;Ljava/lang/Integer;)Ll/lk90;

    .line 74
    iget-object p1, p0, Ll/xg60;->h:Ll/li80;

    aget-object p3, p2, v2

    invoke-static {p3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p3

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    iput-object p3, p1, Ll/li80;->a:Ljava/lang/Object;

    .line 75
    iget-object p0, p0, Ll/xg60;->h:Ll/li80;

    aget-object p1, p2, v1

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Ll/li80;->b:Ljava/lang/Object;

    return-void

    .line 76
    :cond_1b
    iput-object v8, p0, Ll/xg60;->j:Ll/lk90;

    .line 77
    iget-object p1, p0, Ll/xg60;->h:Ll/li80;

    aget-object p3, p2, v5

    invoke-static {p3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p3

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    iput-object p3, p1, Ll/li80;->a:Ljava/lang/Object;

    .line 78
    iget-object p0, p0, Ll/xg60;->h:Ll/li80;

    aget-object p1, p2, v4

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Ll/li80;->b:Ljava/lang/Object;

    return-void

    .line 79
    :pswitch_f
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    invoke-virtual {p0}, Ll/v1e0;->m()Ll/xg60;

    move-result-object p0

    .line 80
    iget-object p0, p0, Ll/xg60;->d:Ll/lk90;

    aget-object p1, p2, v7

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aget-object p2, p2, v6

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ll/lk90;->m(Ljava/lang/Integer;Ljava/lang/Integer;)Ll/lk90;

    return-void

    .line 81
    :pswitch_10
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    invoke-virtual {p0}, Ll/v1e0;->m()Ll/xg60;

    move-result-object p0

    .line 82
    iget-object p0, p0, Ll/xg60;->g:[Ljava/lang/String;

    aget-object p1, p2, v7

    aput-object p1, p0, v7

    .line 83
    aget-object p1, p2, v6

    aput-object p1, p0, v6

    return-void

    .line 84
    :pswitch_11
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    invoke-virtual {p0}, Ll/v1e0;->m()Ll/xg60;

    move-result-object p0

    .line 85
    aget-object p1, p2, v7

    iput-object p1, p0, Ll/xg60;->k:Ljava/lang/String;

    return-void

    .line 86
    :pswitch_12
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    check-cast p0, Ll/v1e0;

    aget-object p1, p2, v7

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/sunshine/engine/base/a;->m:I

    return-void

    :sswitch_data_0
    .sparse-switch
        -0x76bbb26c -> :sswitch_12
        -0x56235ed5 -> :sswitch_11
        -0x52380d8b -> :sswitch_10
        -0x3ea9ff9a -> :sswitch_f
        -0x372522a5 -> :sswitch_e
        -0x32c98a40 -> :sswitch_d
        -0x18f51c2c -> :sswitch_c
        -0x5e04da6 -> :sswitch_b
        -0x3de6e64 -> :sswitch_a
        0x1a564 -> :sswitch_9
        0x337a8b -> :sswitch_8
        0x589b15e -> :sswitch_7
        0x683094a -> :sswitch_6
        0x3d2338f1 -> :sswitch_5
        0x3fa94f58 -> :sswitch_4
        0x487faa08 -> :sswitch_3
        0x4a1f59a9 -> :sswitch_2
        0x6f517872 -> :sswitch_1
        0x77e6b72f -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_5
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
