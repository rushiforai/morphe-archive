.class public abstract Lhln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Laln;


# instance fields
.field public final a:Lorb;


# direct methods
.method public constructor <init>(Lorb;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhln;->a:Lorb;

    return-void
.end method

.method public static h(Lorb;)Lhln;
    .registers 15

    const-string v0, "type"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v4, -0x1

    sparse-switch v3, :sswitch_data_15a

    goto :goto_2e

    :sswitch_11
    const-string v3, "image"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    const/4 v4, 0x2

    goto :goto_2e

    :sswitch_1b
    const-string v3, "color"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    const/4 v4, 0x1

    goto :goto_2e

    :sswitch_25
    const-string v3, "gradient"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    const/4 v4, 0x0

    :cond_2e
    :goto_2e
    const-string v0, "light"

    const-string v3, "theme"

    const-string v5, "category_code"

    const-string v6, "id"

    const-string v7, "dark"

    const/4 v8, 0x0

    packed-switch v4, :pswitch_data_168

    invoke-static {}, Lhai;->d()V

    return-object v8

    :pswitch_40
    invoke-static {p0, v8}, Lhln;->i(Lorb;Lh06;)Lh06;

    move-result-object v4

    invoke-virtual {p0, v7}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v7

    new-instance v9, Lfln;

    invoke-virtual {p0, v6}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lvq8;->m(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lam2;->a(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_69

    invoke-virtual {p0, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lg7j;->d(Ljava/lang/String;)Lg7j;

    move-result-object v2

    goto :goto_6a

    :cond_69
    move-object v2, v8

    :goto_6a
    invoke-virtual {p0, v0}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v0

    invoke-static {v0, v4}, Lfln;->l(Lorb;Lh06;)Lzg;

    move-result-object v0

    if-eqz v7, :cond_78

    invoke-static {v7, v4}, Lfln;->l(Lorb;Lh06;)Lzg;

    move-result-object v8

    :cond_78
    const-string v3, "hidden"

    invoke-virtual {p0, v3}, Lorb;->f(Ljava/lang/String;)Z

    move-result v7

    move-object v1, p0

    move-object v4, v2

    move v3, v5

    move-object v2, v6

    move-object v6, v8

    move-object v5, v0

    move-object v0, v9

    invoke-direct/range {v0 .. v7}, Lfln;-><init>(Lorb;Ljava/lang/String;ILg7j;Lzg;Lzg;Z)V

    return-object v0

    :pswitch_89
    invoke-static {p0, v8}, Lhln;->i(Lorb;Lh06;)Lh06;

    move-result-object v4

    invoke-virtual {p0, v7}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v7

    new-instance v9, Leln;

    invoke-virtual {p0, v6}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lvq8;->m(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lam2;->a(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b2

    invoke-virtual {p0, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lg7j;->d(Ljava/lang/String;)Lg7j;

    move-result-object v2

    goto :goto_b3

    :cond_b2
    move-object v2, v8

    :goto_b3
    invoke-virtual {p0, v0}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v0

    const-string v3, "solid_color"

    invoke-virtual {v0, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lhln;->k(Ljava/lang/String;)I

    move-result v10

    move v11, v5

    new-instance v5, Lm9f;

    invoke-static {v0, v4}, Lhln;->i(Lorb;Lh06;)Lh06;

    move-result-object v0

    invoke-direct {v5, v10, v10, v0}, Lm9f;-><init>(IILjava/lang/Object;)V

    if-eqz v7, :cond_de

    invoke-virtual {v7, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lhln;->k(Ljava/lang/String;)I

    move-result v0

    new-instance v8, Lm9f;

    invoke-static {v7, v4}, Lhln;->i(Lorb;Lh06;)Lh06;

    move-result-object v3

    invoke-direct {v8, v0, v0, v3}, Lm9f;-><init>(IILjava/lang/Object;)V

    :cond_de
    const/4 v7, 0x1

    move-object v1, p0

    move-object v4, v2

    move-object v2, v6

    move-object v6, v8

    move-object v0, v9

    move v3, v11

    invoke-direct/range {v0 .. v7}, Leln;-><init>(Lorb;Ljava/lang/String;ILg7j;Lm9f;Lm9f;B)V

    return-object v0

    :pswitch_e9
    invoke-static {p0, v8}, Lhln;->i(Lorb;Lh06;)Lh06;

    move-result-object v4

    invoke-virtual {p0, v7}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v7

    new-instance v9, Leln;

    invoke-virtual {p0, v6}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lvq8;->m(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lam2;->a(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_112

    invoke-virtual {p0, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lg7j;->d(Ljava/lang/String;)Lg7j;

    move-result-object v2

    goto :goto_113

    :cond_112
    move-object v2, v8

    :goto_113
    invoke-virtual {p0, v0}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v0

    move v3, v5

    new-instance v5, Lm9f;

    const-string v10, "top_gradient_color"

    invoke-virtual {v0, v10}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lhln;->k(Ljava/lang/String;)I

    move-result v11

    const-string v12, "bottom_gradient_color"

    invoke-virtual {v0, v12}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lhln;->k(Ljava/lang/String;)I

    move-result v13

    invoke-static {v0, v4}, Lhln;->i(Lorb;Lh06;)Lh06;

    move-result-object v0

    invoke-direct {v5, v11, v13, v0}, Lm9f;-><init>(IILjava/lang/Object;)V

    if-eqz v7, :cond_150

    new-instance v8, Lm9f;

    invoke-virtual {v7, v10}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lhln;->k(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v7, v12}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lhln;->k(Ljava/lang/String;)I

    move-result v10

    invoke-static {v7, v4}, Lhln;->i(Lorb;Lh06;)Lh06;

    move-result-object v4

    invoke-direct {v8, v0, v10, v4}, Lm9f;-><init>(IILjava/lang/Object;)V

    :cond_150
    const/4 v7, 0x0

    move-object v1, p0

    move-object v4, v2

    move-object v2, v6

    move-object v6, v8

    move-object v0, v9

    invoke-direct/range {v0 .. v7}, Leln;-><init>(Lorb;Ljava/lang/String;ILg7j;Lm9f;Lm9f;B)V

    return-object v0

    :sswitch_data_15a
    .sparse-switch
        0x557f730 -> :sswitch_25
        0x5a72f63 -> :sswitch_1b
        0x5faa95b -> :sswitch_11
    .end sparse-switch

    :pswitch_data_168
    .packed-switch 0x0
        :pswitch_e9
        :pswitch_89
        :pswitch_40
    .end packed-switch
.end method

.method public static i(Lorb;Lh06;)Lh06;
    .registers 10

    new-instance v0, Lh06;

    const/4 v1, 0x0

    if-eqz p1, :cond_8

    iget-object v2, p1, Lh06;->a:Ljava/lang/String;

    goto :goto_9

    :cond_8
    move-object v2, v1

    :goto_9
    const-string v3, "title"

    invoke-virtual {p0, v3, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz p1, :cond_14

    iget-object v3, p1, Lh06;->b:Ljava/lang/String;

    goto :goto_15

    :cond_14
    move-object v3, v1

    :goto_15
    const-string v4, "title_url"

    invoke-virtual {p0, v4, v3}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz p1, :cond_20

    iget-object v4, p1, Lh06;->c:Ljava/lang/String;

    goto :goto_21

    :cond_20
    move-object v4, v1

    :goto_21
    const-string v5, "source_text"

    invoke-virtual {p0, v5, v4}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz p1, :cond_2c

    iget-object v5, p1, Lh06;->d:Ljava/lang/String;

    goto :goto_2d

    :cond_2c
    move-object v5, v1

    :goto_2d
    const-string v6, "source_url"

    invoke-virtual {p0, v6, v5}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz p1, :cond_38

    iget-object v6, p1, Lh06;->e:Ljava/lang/String;

    goto :goto_39

    :cond_38
    move-object v6, v1

    :goto_39
    const-string v7, "author_text"

    invoke-virtual {p0, v7, v6}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz p1, :cond_43

    iget-object v1, p1, Lh06;->f:Ljava/lang/String;

    :cond_43
    const-string p1, "author_url"

    invoke-virtual {p0, p1, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    move-object v1, v2

    move-object v2, v3

    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, p0

    invoke-direct/range {v0 .. v6}, Lh06;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static k(Ljava/lang/String;)I
    .registers 3

    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p0

    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    const/16 v1, 0xff

    if-lt v0, v1, :cond_d

    return p0

    :cond_d
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final j(Landroid/content/Context;Lo2c;)Z
    .registers 3

    invoke-interface {p0}, Laln;->a()Z

    move-result p0

    if-eqz p0, :cond_15

    invoke-static {p1}, Lf03;->H(Landroid/content/Context;)Z

    move-result p0

    iget-boolean p1, p2, Lo2c;->d:Z

    if-eqz p0, :cond_11

    if-eqz p1, :cond_13

    goto :goto_15

    :cond_11
    if-eqz p1, :cond_15

    :cond_13
    const/4 p0, 0x1

    return p0

    :cond_15
    :goto_15
    const/4 p0, 0x0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lhln;->a:Lorb;

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
