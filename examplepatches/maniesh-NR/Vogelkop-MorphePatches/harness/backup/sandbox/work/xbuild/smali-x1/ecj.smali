.class public final synthetic Lecj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgcj;


# direct methods
.method public synthetic constructor <init>(Lgcj;B)V
    .registers 3

    iput-byte p2, p0, Lecj;->a:B

    iput-object p1, p0, Lecj;->b:Lgcj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lecj;->a:B

    const/16 v1, 0x9c4

    iget-object p0, p0, Lecj;->b:Lgcj;

    sget-object v2, Lijm;->b:Lijm;

    packed-switch v0, :pswitch_data_ae

    check-cast p1, Lfcj;

    if-eqz p1, :cond_1d

    iget-object v0, p0, Lgcj;->u:Lnej;

    new-instance v1, Lzfe;

    invoke-direct {v1, p0, p1}, Lzfe;-><init>(Lgcj;Lfcj;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_2d

    :cond_1d
    iget-object p0, p0, Lgcj;->v:Lysj;

    new-instance p1, Lglj;

    const v0, 0x7f14085a

    invoke-direct {p1, v0, v1}, Lglj;-><init>(II)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p1, v2}, Lr22;->b(Ljjm;Lijm;)V

    :goto_2d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_30
    check-cast p1, Lfcj;

    if-eqz p1, :cond_5b

    iget-object v0, p1, Lfcj;->c:Landroid/net/Uri;

    new-instance v1, Lghf;

    invoke-static {v0}, Ls29;->g(Landroid/net/Uri;)Z

    move-result v2

    if-eqz v2, :cond_44

    iget-object p1, p1, Lfcj;->b:Ljava/io/File;

    invoke-static {p1}, Lw7d;->x(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    :cond_44
    new-instance p1, Li4d;

    new-instance v2, Lvvf;

    const/16 v3, 0x13

    const-string v4, "image/png"

    invoke-direct {v2, v0, v4, v3}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p1, v2}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-direct {v1, p1}, Lghf;-><init>(Li4d;)V

    iget-object p0, p0, Lgcj;->r:Ldx3;

    invoke-virtual {v1, p0}, Lghf;->I(Landroid/content/Context;)Ljjm;

    goto :goto_67

    :cond_5b
    iget-object p0, p0, Lgcj;->v:Lysj;

    const p1, 0x7f14085c

    invoke-static {p1, v1, p0}, Lam2;->i(IILysj;)Lglj;

    move-result-object p1

    invoke-virtual {p0, p1, v2}, Lr22;->b(Ljjm;Lijm;)V

    :goto_67
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_6a
    check-cast p1, Landroid/graphics/Bitmap;

    iget-object v0, p0, Lgcj;->x:Lpt1;

    const/4 v3, 0x0

    if-nez v0, :cond_72

    move-object v0, v3

    :cond_72
    iget-object v0, v0, Lpt1;->g:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/Spinner;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    iget-object v0, p0, Lgcj;->x:Lpt1;

    if-nez v0, :cond_83

    move-object v0, v3

    :cond_83
    iget-object v0, v0, Lpt1;->e:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    iget-object v0, p0, Lgcj;->x:Lpt1;

    if-eqz v0, :cond_95

    move-object v3, v0

    :cond_95
    iget-object v0, v3, Lpt1;->e:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    if-nez p1, :cond_aa

    iget-object p0, p0, Lgcj;->v:Lysj;

    const p1, 0x7f140800

    invoke-static {p1, v1, p0}, Lam2;->i(IILysj;)Lglj;

    move-result-object p1

    invoke-virtual {p0, p1, v2}, Lr22;->b(Ljjm;Lijm;)V

    :cond_aa
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_ae
    .packed-switch 0x0
        :pswitch_6a
        :pswitch_30
    .end packed-switch
.end method
