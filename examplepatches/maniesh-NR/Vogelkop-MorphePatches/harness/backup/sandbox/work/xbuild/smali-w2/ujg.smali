.class public final synthetic Lujg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxq9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lakg;


# direct methods
.method public synthetic constructor <init>(Lakg;B)V
    .registers 3

    iput-byte p2, p0, Lujg;->a:B

    iput-object p1, p0, Lujg;->b:Lakg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lujg;->a:B

    const/4 v1, -0x1

    iget-object p0, p0, Lujg;->b:Lakg;

    check-cast p1, Lzjg;

    packed-switch v0, :pswitch_data_11a

    new-instance v0, Likg;

    iget-object p1, p1, Lzjg;->a:Loj9;

    invoke-virtual {p0, p1}, Lakg;->r(Loj9;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_23

    iget-object p0, p0, Lakg;->q:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    const p1, 0x7f1403c1

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    :cond_23
    invoke-direct {v0, p1}, Likg;-><init>(Ljava/lang/String;)V

    return-object v0

    :pswitch_27
    new-instance v0, Likg;

    iget-object p1, p1, Lzjg;->a:Loj9;

    invoke-virtual {p0, p1}, Lakg;->r(Loj9;)Ljava/lang/String;

    move-result-object v2

    iget v3, p1, Loj9;->j:I

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_42

    iget-object v2, p0, Lakg;->q:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    const v4, 0x7f1401ee

    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    :cond_42
    iget p1, p1, Loj9;->F:I

    const v4, 0x49742400    # 1000000.0f

    if-eq p1, v1, :cond_b6

    const/4 v5, 0x1

    if-lt p1, v5, :cond_b6

    if-eq p1, v5, :cond_87

    const/4 v5, 0x2

    if-eq p1, v5, :cond_7b

    const/4 v5, 0x6

    if-eq p1, v5, :cond_6f

    const/4 v5, 0x7

    if-eq p1, v5, :cond_6f

    iget-object v5, p0, Lakg;->q:Ljava/lang/Object;

    check-cast v5, Landroid/content/Context;

    const/16 v6, 0x8

    if-eq p1, v6, :cond_67

    const p1, 0x7f140712

    invoke-virtual {v5, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_92

    :cond_67
    const p1, 0x7f140714

    invoke-virtual {v5, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_92

    :cond_6f
    iget-object p1, p0, Lakg;->q:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    const v5, 0x7f140713

    invoke-virtual {p1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_92

    :cond_7b
    iget-object p1, p0, Lakg;->q:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    const v5, 0x7f140711

    invoke-virtual {p1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_92

    :cond_87
    iget-object p1, p0, Lakg;->q:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    const v5, 0x7f140708

    invoke-virtual {p1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_92
    iget-object p0, p0, Lakg;->q:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    if-eq v3, v1, :cond_aa

    int-to-float v1, v3

    div-float/2addr v1, v4

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    filled-new-array {v2, p1, v1}, [Ljava/lang/Object;

    move-result-object p1

    const v1, 0x7f1401ec

    invoke-virtual {p0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_cd

    :cond_aa
    const v1, 0x7f1401ed

    filled-new-array {v2, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_cd

    :cond_b6
    if-eq v3, v1, :cond_cd

    iget-object p0, p0, Lakg;->q:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    int-to-float p1, v3

    div-float/2addr p1, v4

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    filled-new-array {v2, p1}, [Ljava/lang/Object;

    move-result-object p1

    const v1, 0x7f1401eb

    invoke-virtual {p0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :cond_cd
    :goto_cd
    invoke-direct {v0, v2}, Likg;-><init>(Ljava/lang/String;)V

    return-object v0

    :pswitch_d1
    new-instance v0, Likg;

    iget-object p1, p1, Lzjg;->a:Loj9;

    iget v2, p1, Loj9;->u:I

    if-eq v2, v1, :cond_fe

    const/16 p0, 0xdac

    if-le v2, p0, :cond_ea

    sget-object p0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    add-int/lit16 v2, v2, 0x3e7

    div-int/lit16 v2, v2, 0x3e8

    const-string p0, "K"

    invoke-static {v2, p0}, Lu35;->g(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_115

    :cond_ea
    iget p0, p1, Loj9;->v:I

    if-eq p0, v1, :cond_f7

    sget-object p1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string p1, "p"

    invoke-static {p0, p1}, Lu35;->g(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_115

    :cond_f7
    sget-object p0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_115

    :cond_fe
    invoke-virtual {p0, p1}, Lakg;->r(Loj9;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_114

    iget-object p0, p0, Lakg;->q:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    const p1, 0x7f140d72

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_115

    :cond_114
    move-object p0, p1

    :goto_115
    invoke-direct {v0, p0}, Likg;-><init>(Ljava/lang/String;)V

    return-object v0

    nop

    :pswitch_data_11a
    .packed-switch 0x0
        :pswitch_d1
        :pswitch_27
    .end packed-switch
.end method
