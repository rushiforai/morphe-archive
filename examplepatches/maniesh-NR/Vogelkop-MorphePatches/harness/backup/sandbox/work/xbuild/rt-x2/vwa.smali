.class public final Lvwa;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lywa;


# direct methods
.method public synthetic constructor <init>(Lywa;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lvwa;->t:B

    iput-object p1, p0, Lvwa;->v:Lywa;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte v0, p0, Lvwa;->t:B

    iget-object p0, p0, Lvwa;->v:Lywa;

    packed-switch v0, :pswitch_data_2c

    new-instance v0, Lvwa;

    const/4 v1, 0x3

    invoke-direct {v0, p0, p2, v1}, Lvwa;-><init>(Lywa;Lmt5;B)V

    iput-object p1, v0, Lvwa;->u:Ljava/lang/Object;

    return-object v0

    :pswitch_10
    new-instance v0, Lvwa;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p2, v1}, Lvwa;-><init>(Lywa;Lmt5;B)V

    iput-object p1, v0, Lvwa;->u:Ljava/lang/Object;

    return-object v0

    :pswitch_19
    new-instance v0, Lvwa;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p2, v1}, Lvwa;-><init>(Lywa;Lmt5;B)V

    iput-object p1, v0, Lvwa;->u:Ljava/lang/Object;

    return-object v0

    :pswitch_22
    new-instance v0, Lvwa;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, v1}, Lvwa;-><init>(Lywa;Lmt5;B)V

    iput-object p1, v0, Lvwa;->u:Ljava/lang/Object;

    return-object v0

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_22
        :pswitch_19
        :pswitch_10
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lvwa;->t:B

    packed-switch v0, :pswitch_data_4a

    check-cast p1, Lnsl;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lvwa;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lvwa;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lvwa;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Ls5h;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lvwa;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lvwa;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lvwa;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_27
    check-cast p1, Liea;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lvwa;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lvwa;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lvwa;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_38
    check-cast p1, Ljava/util/List;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lvwa;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lvwa;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lvwa;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_38
        :pswitch_27
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Lvwa;->t:B

    const/16 v1, 0x8

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object v4, p0, Lvwa;->v:Lywa;

    iget-object p0, p0, Lvwa;->u:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_194

    check-cast p0, Lnsl;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    if-nez p0, :cond_24

    invoke-virtual {v4}, Lywa;->h0()Lora;

    move-result-object p0

    iget-object p0, p0, Lora;->e:Lcom/opera/hype/image/editor/EditImage;

    sget-object p1, Lat7;->f:Lat7;

    invoke-virtual {p0, p1}, Lcom/opera/hype/image/editor/EditImage;->j(Lat7;)V

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_59

    :cond_24
    invoke-virtual {v4}, Lywa;->h0()Lora;

    move-result-object p1

    iget-object p1, p1, Lora;->e:Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_52

    const/4 v0, 0x1

    if-eq p0, v0, :cond_4f

    const/4 v0, 0x2

    if-eq p0, v0, :cond_4c

    const/4 v0, 0x3

    if-eq p0, v0, :cond_49

    const/4 v0, 0x4

    if-eq p0, v0, :cond_46

    const/4 v0, 0x5

    if-ne p0, v0, :cond_42

    sget-object p0, Lat7;->e:Lat7;

    goto :goto_54

    :cond_42
    invoke-static {}, Lh9o;->p()V

    goto :goto_59

    :cond_46
    sget-object p0, Lat7;->d:Lat7;

    goto :goto_54

    :cond_49
    sget-object p0, Lat7;->a:Lat7;

    goto :goto_54

    :cond_4c
    sget-object p0, Lat7;->c:Lat7;

    goto :goto_54

    :cond_4f
    sget-object p0, Lat7;->c:Lat7;

    goto :goto_54

    :cond_52
    sget-object p0, Lat7;->b:Lat7;

    :goto_54
    invoke-virtual {p1, p0}, Lcom/opera/hype/image/editor/EditImage;->j(Lat7;)V

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_59
    return-object v3

    :pswitch_5a
    check-cast p0, Ls5h;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Ls5h;->a:Ln8g;

    iget v0, v0, Ln8g;->b:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getColor(I)I

    move-result v6

    iget-object v0, p0, Ls5h;->f:Ln8g;

    if-nez v0, :cond_73

    move v11, v2

    goto :goto_7a

    :cond_73
    iget v0, v0, Ln8g;->b:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getColor(I)I

    move-result p1

    move v11, p1

    :goto_7a
    invoke-virtual {v4}, Lywa;->h0()Lora;

    move-result-object p1

    iget-object p1, p1, Lora;->e:Lcom/opera/hype/image/editor/EditImage;

    iget-object p1, p1, Lcom/opera/hype/image/editor/EditImage;->n:Lo8g;

    iget-object p1, p1, Lo8g;->b:Lfz2;

    sget-object v0, Lo8g;->d:[Lxtb;

    aget-object v0, v0, v2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    invoke-virtual {v4}, Lywa;->h0()Lora;

    move-result-object p1

    iget-object p1, p1, Lora;->e:Lcom/opera/hype/image/editor/EditImage;

    new-instance v5, Lbt7;

    iget-boolean v7, p0, Ls5h;->b:Z

    iget v8, p0, Ls5h;->c:I

    iget-object v9, p0, Ls5h;->d:Lnil;

    iget-boolean v10, p0, Ls5h;->e:Z

    invoke-direct/range {v5 .. v11}, Lbt7;-><init>(IZILnil;ZI)V

    iget-object p0, p1, Lcom/opera/hype/image/editor/EditImage;->p:Let7;

    sget-object p1, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    aget-object p1, p1, v2

    invoke-virtual {p0, p1, v5}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_ae
    check-cast p0, Liea;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {v4}, Lywa;->h0()Lora;

    move-result-object p1

    iget-object p1, p1, Lora;->g:Landroid/widget/ImageView;

    iget-boolean v0, p0, Liea;->a:Z

    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {v4}, Lywa;->h0()Lora;

    move-result-object p1

    iget-object p1, p1, Lora;->f:Landroid/widget/ImageView;

    iget-boolean v0, p0, Liea;->b:Z

    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {v4}, Lywa;->h0()Lora;

    move-result-object p1

    iget-object p1, p1, Lora;->k:Landroid/widget/LinearLayout;

    iget-boolean p0, p0, Liea;->c:Z

    if-eqz p0, :cond_d6

    move v1, v2

    :cond_d6
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_dc
    check-cast p0, Ljava/util/List;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_e9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_190

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Losl;

    invoke-virtual {v4}, Lywa;->h0()Lora;

    move-result-object v0

    iget-object v0, v0, Lora;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v5, p1, Losl;->a:Lnsl;

    iget v5, v5, Lnsl;->a:I

    sget-object v6, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v0, v5}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroidx/appcompat/widget/AppCompatImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    iget-boolean v6, p1, Losl;->b:Z

    if-eqz v6, :cond_113

    move v6, v2

    goto :goto_114

    :cond_113
    move v6, v1

    :goto_114
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    iget-boolean p1, p1, Losl;->c:Z

    if-eqz p1, :cond_185

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v6, 0x7f06027e

    invoke-virtual {p1, v6}, Landroid/content/Context;->getColor(I)I

    move-result p1

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    sget-object v7, Lpl7;->a:[I

    invoke-virtual {v6}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    aget v6, v7, v6

    packed-switch v6, :pswitch_data_19e

    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_192

    :pswitch_138
    sget-object v6, Llh3;->p:Llh3;

    goto :goto_16d

    :pswitch_13b
    sget-object v6, Llh3;->m:Llh3;

    goto :goto_16d

    :pswitch_13e
    sget-object v6, Llh3;->o:Llh3;

    goto :goto_16d

    :pswitch_141
    sget-object v6, Llh3;->q:Llh3;

    goto :goto_16d

    :pswitch_144
    sget-object v6, Llh3;->l:Llh3;

    goto :goto_16d

    :pswitch_147
    sget-object v6, Llh3;->k:Llh3;

    goto :goto_16d

    :pswitch_14a
    sget-object v6, Llh3;->j:Llh3;

    goto :goto_16d

    :pswitch_14d
    sget-object v6, Llh3;->i:Llh3;

    goto :goto_16d

    :pswitch_150
    sget-object v6, Llh3;->h:Llh3;

    goto :goto_16d

    :pswitch_153
    sget-object v6, Llh3;->g:Llh3;

    goto :goto_16d

    :pswitch_156
    sget-object v6, Llh3;->f:Llh3;

    goto :goto_16d

    :pswitch_159
    sget-object v6, Llh3;->e:Llh3;

    goto :goto_16d

    :pswitch_15c
    sget-object v6, Llh3;->d:Llh3;

    goto :goto_16d

    :pswitch_15f
    sget-object v6, Llh3;->c:Llh3;

    goto :goto_16d

    :pswitch_162
    sget-object v6, Llh3;->b:Llh3;

    goto :goto_16d

    :pswitch_165
    sget-object v6, Llh3;->a:Llh3;

    goto :goto_16d

    :pswitch_168
    sget-object v6, Llh3;->r:Llh3;

    goto :goto_16d

    :pswitch_16b
    sget-object v6, Llh3;->n:Llh3;

    :goto_16d
    invoke-static {v6}, Lqyn;->R(Llh3;)Landroid/graphics/BlendMode;

    move-result-object v6

    if-eqz v6, :cond_179

    new-instance v7, Landroid/graphics/BlendModeColorFilter;

    invoke-direct {v7, p1, v6}, Landroid/graphics/BlendModeColorFilter;-><init>(ILandroid/graphics/BlendMode;)V

    goto :goto_17a

    :cond_179
    move-object v7, v3

    :goto_17a
    invoke-virtual {v5, v7}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    const p1, 0x7f0803e7

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    goto/16 :goto_e9

    :cond_185
    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    const p1, 0x7f0803e8

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    goto/16 :goto_e9

    :cond_190
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_192
    return-object v3

    nop

    :pswitch_data_194
    .packed-switch 0x0
        :pswitch_dc
        :pswitch_ae
        :pswitch_5a
    .end packed-switch

    :pswitch_data_19e
    .packed-switch 0x1
        :pswitch_16b
        :pswitch_168
        :pswitch_165
        :pswitch_162
        :pswitch_15f
        :pswitch_15c
        :pswitch_159
        :pswitch_156
        :pswitch_153
        :pswitch_150
        :pswitch_14d
        :pswitch_14a
        :pswitch_147
        :pswitch_144
        :pswitch_141
        :pswitch_13e
        :pswitch_13b
        :pswitch_138
    .end packed-switch
.end method
