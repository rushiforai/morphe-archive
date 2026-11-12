.class public final synthetic Lcl4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;
.implements Lkr9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lcl4;->a:B

    iput-object p1, p0, Lcl4;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lbr9;
    .registers 9

    iget-byte v0, p0, Lcl4;->a:B

    iget-object p0, p0, Lcl4;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_9a

    check-cast p0, Ltu7;

    return-object p0

    :pswitch_a
    check-cast p0, Ltu7;

    return-object p0

    :pswitch_d
    check-cast p0, Ltu7;

    return-object p0

    :pswitch_10
    check-cast p0, Ltu7;

    return-object p0

    :pswitch_13
    check-cast p0, Ltu7;

    return-object p0

    :pswitch_16
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lfw9;

    const-string v5, "updateState(Lcom/opera/android/settings/gesture_shortcut/GestureShortcutSettingsState;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lfw9;

    const-string v4, "updateState"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_27
    check-cast p0, Lry7;

    return-object p0

    :pswitch_2a
    check-cast p0, Ltu7;

    return-object p0

    :pswitch_2d
    check-cast p0, Ltu7;

    return-object p0

    :pswitch_30
    check-cast p0, Ltu7;

    return-object p0

    :pswitch_33
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Llx;

    const-string v5, "updateBackground(Z)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Llx;

    const-string v4, "updateBackground"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_44
    new-instance v1, Lnr9;

    move-object v3, p0

    check-cast v3, Lfv8;

    const-string v6, "onForegroundItemStyleChanged(Lcom/opera/android/StartPageItemStyle;)V"

    const/4 v7, 0x0

    const/4 v2, 0x1

    const-class v4, Lfv8;

    const-string v5, "onForegroundItemStyleChanged"

    invoke-direct/range {v1 .. v7}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :pswitch_55
    check-cast p0, Ltu7;

    return-object p0

    :pswitch_58
    check-cast p0, Lu68;

    return-object p0

    :pswitch_5b
    check-cast p0, Ljv7;

    return-object p0

    :pswitch_5e
    check-cast p0, Ltu7;

    return-object p0

    :pswitch_61
    check-cast p0, Ltu7;

    return-object p0

    :pswitch_64
    check-cast p0, Lwg5;

    return-object p0

    :pswitch_67
    check-cast p0, Lwg5;

    return-object p0

    :pswitch_6a
    check-cast p0, Lwg5;

    return-object p0

    :pswitch_6d
    check-cast p0, Lwg5;

    return-object p0

    :pswitch_70
    check-cast p0, Ltb6;

    return-object p0

    :pswitch_73
    check-cast p0, Ltk6;

    return-object p0

    :pswitch_76
    check-cast p0, Lwg5;

    return-object p0

    :pswitch_79
    check-cast p0, Lwg5;

    return-object p0

    :pswitch_7c
    check-cast p0, Lwg5;

    return-object p0

    :pswitch_7f
    check-cast p0, Lbo3;

    return-object p0

    :pswitch_82
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lo85;

    const-string v5, "applyState(Lcom/opera/android/startpage/collapsibleomnibar/CollapsibleOmnibarState;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lo85;

    const-string v4, "applyState"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_93
    check-cast p0, Lbo3;

    return-object p0

    :pswitch_96
    check-cast p0, Lcv2;

    return-object p0

    nop

    :pswitch_data_9a
    .packed-switch 0x0
        :pswitch_96
        :pswitch_93
        :pswitch_82
        :pswitch_7f
        :pswitch_7c
        :pswitch_79
        :pswitch_76
        :pswitch_73
        :pswitch_70
        :pswitch_6d
        :pswitch_6a
        :pswitch_67
        :pswitch_64
        :pswitch_61
        :pswitch_5e
        :pswitch_5b
        :pswitch_58
        :pswitch_55
        :pswitch_44
        :pswitch_33
        :pswitch_30
        :pswitch_2d
        :pswitch_2a
        :pswitch_27
        :pswitch_16
        :pswitch_13
        :pswitch_10
        :pswitch_d
        :pswitch_a
    .end packed-switch
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lcl4;->a:B

    iget-object p0, p0, Lcl4;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_152

    check-cast p0, Ltu7;

    invoke-virtual {p0, p1}, Ltu7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_d
    check-cast p0, Ltu7;

    invoke-virtual {p0, p1}, Ltu7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_13
    check-cast p0, Ltu7;

    invoke-virtual {p0, p1}, Ltu7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_19
    check-cast p0, Ltu7;

    invoke-virtual {p0, p1}, Ltu7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1f
    check-cast p0, Ltu7;

    invoke-virtual {p0, p1}, Ltu7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_25
    check-cast p1, Lgw9;

    check-cast p0, Lfw9;

    invoke-virtual {p0}, Lfw9;->H0()Lpl9;

    move-result-object v0

    iget-object v0, v0, Lpl9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v1, p1, Lgw9;->a:Lf03;

    invoke-static {v0, v1}, Lfw9;->J0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lf03;)V

    invoke-virtual {p0}, Lfw9;->H0()Lpl9;

    move-result-object v0

    iget-object v0, v0, Lpl9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v1, p1, Lgw9;->b:Lf03;

    invoke-static {v0, v1}, Lfw9;->J0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lf03;)V

    invoke-virtual {p0}, Lfw9;->H0()Lpl9;

    move-result-object v0

    iget-object v0, v0, Lpl9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v1, p1, Lgw9;->c:Z

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    invoke-virtual {p0}, Lfw9;->H0()Lpl9;

    move-result-object p0

    iget-object p0, p0, Lpl9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p1, p1, Lgw9;->d:Lqhj;

    iget v0, p1, Lqhj;->c:I

    new-instance v1, Llxh;

    invoke-direct {v1, v0}, Llxh;-><init>(I)V

    invoke-virtual {p0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    iget p1, p1, Lqhj;->b:I

    invoke-static {p1, p0}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    return-void

    :pswitch_62
    check-cast p0, Lry7;

    invoke-virtual {p0, p1}, Lry7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_68
    check-cast p0, Ltu7;

    invoke-virtual {p0, p1}, Ltu7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_6e
    check-cast p0, Ltu7;

    invoke-virtual {p0, p1}, Ltu7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_74
    check-cast p0, Ltu7;

    invoke-virtual {p0, p1}, Ltu7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_7a
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    check-cast p0, Llx;

    iget-object v0, p0, Llx;->j:Landroid/view/View;

    if-eqz p1, :cond_97

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const p1, 0x7f0402f3

    const v1, 0x7f06063b

    invoke-static {p1, p0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    goto :goto_98

    :cond_97
    const/4 p0, 0x0

    :goto_98
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void

    :pswitch_9c
    check-cast p1, Lw6k;

    check-cast p0, Lfv8;

    iget-object v0, p0, Lfv8;->a:Lzi4;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_b2

    if-ne v1, v2, :cond_ae

    iget-object v1, p0, Lfv8;->d:Llaj;

    goto :goto_b3

    :cond_ae
    invoke-static {}, Lh9o;->p()V

    goto :goto_e3

    :cond_b2
    const/4 v1, 0x0

    :goto_b3
    invoke-virtual {v0, v1}, Lzi4;->Y(Llaj;)Z

    move-result v0

    iget-object v1, p0, Lfv8;->g:Llv8;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_c8

    if-ne p1, v2, :cond_c4

    iget p1, p0, Lfv8;->f:I

    goto :goto_ca

    :cond_c4
    invoke-static {}, Lh9o;->p()V

    goto :goto_e3

    :cond_c8
    iget p1, p0, Lfv8;->e:I

    :goto_ca
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Llv8;

    invoke-direct {v1, p1}, Llv8;-><init>(I)V

    if-nez v0, :cond_dc

    iget-object p1, p0, Lfv8;->g:Llv8;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_e3

    :cond_dc
    iput-object v1, p0, Lfv8;->g:Llv8;

    iget-object p0, p0, Lfv8;->c:Lyu8;

    invoke-virtual {p0}, Lyu8;->invoke()Ljava/lang/Object;

    :cond_e3
    :goto_e3
    return-void

    :pswitch_e4
    check-cast p0, Ltu7;

    invoke-virtual {p0, p1}, Ltu7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_ea
    check-cast p0, Lu68;

    invoke-virtual {p0, p1}, Lu68;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_f0
    check-cast p0, Ljv7;

    invoke-virtual {p0, p1}, Ljv7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_f6
    check-cast p0, Ltu7;

    invoke-virtual {p0, p1}, Ltu7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_fc
    check-cast p0, Ltu7;

    invoke-virtual {p0, p1}, Ltu7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_102
    check-cast p0, Lwg5;

    invoke-virtual {p0, p1}, Lwg5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_108
    check-cast p0, Lwg5;

    invoke-virtual {p0, p1}, Lwg5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_10e
    check-cast p0, Lwg5;

    invoke-virtual {p0, p1}, Lwg5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_114
    check-cast p0, Lwg5;

    invoke-virtual {p0, p1}, Lwg5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_11a
    check-cast p0, Ltb6;

    invoke-virtual {p0, p1}, Ltb6;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_120
    check-cast p0, Ltk6;

    invoke-virtual {p0, p1}, Ltk6;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_126
    check-cast p0, Lwg5;

    invoke-virtual {p0, p1}, Lwg5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_12c
    check-cast p0, Lwg5;

    invoke-virtual {p0, p1}, Lwg5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_132
    check-cast p0, Lwg5;

    invoke-virtual {p0, p1}, Lwg5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_138
    check-cast p0, Lbo3;

    invoke-virtual {p0, p1}, Lbo3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_13e
    check-cast p1, Lq85;

    check-cast p0, Lo85;

    invoke-virtual {p0, p1}, Lo85;->a(Lq85;)V

    return-void

    :pswitch_146
    check-cast p0, Lbo3;

    invoke-virtual {p0, p1}, Lbo3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_14c
    check-cast p0, Lcv2;

    invoke-virtual {p0, p1}, Lcv2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_data_152
    .packed-switch 0x0
        :pswitch_14c
        :pswitch_146
        :pswitch_13e
        :pswitch_138
        :pswitch_132
        :pswitch_12c
        :pswitch_126
        :pswitch_120
        :pswitch_11a
        :pswitch_114
        :pswitch_10e
        :pswitch_108
        :pswitch_102
        :pswitch_fc
        :pswitch_f6
        :pswitch_f0
        :pswitch_ea
        :pswitch_e4
        :pswitch_9c
        :pswitch_7a
        :pswitch_74
        :pswitch_6e
        :pswitch_68
        :pswitch_62
        :pswitch_25
        :pswitch_1f
        :pswitch_19
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    iget-byte v0, p0, Lcl4;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_2b8

    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1c

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1c

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1c
    return v1

    :pswitch_1d
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_33

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_33

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_33
    return v1

    :pswitch_34
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_4a

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_4a

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_4a
    return v1

    :pswitch_4b
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_61

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_61

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_61
    return v1

    :pswitch_62
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_78

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_78

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_78
    return v1

    :pswitch_79
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_8f

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_8f

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_8f
    return v1

    :pswitch_90
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_a6

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_a6

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_a6
    return v1

    :pswitch_a7
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_bd

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_bd

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_bd
    return v1

    :pswitch_be
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_d4

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_d4

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_d4
    return v1

    :pswitch_d5
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_eb

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_eb

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_eb
    return v1

    :pswitch_ec
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_102

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_102

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_102
    return v1

    :pswitch_103
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_119

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_119

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_119
    return v1

    :pswitch_11a
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_130

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_130

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_130
    return v1

    :pswitch_131
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_147

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_147

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_147
    return v1

    :pswitch_148
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_15e

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_15e

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_15e
    return v1

    :pswitch_15f
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_175

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_175

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_175
    return v1

    :pswitch_176
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_18c

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_18c

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_18c
    return v1

    :pswitch_18d
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1a3

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1a3

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1a3
    return v1

    :pswitch_1a4
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1ba

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1ba

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1ba
    return v1

    :pswitch_1bb
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1d1

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1d1

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1d1
    return v1

    :pswitch_1d2
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1e8

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1e8

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1e8
    return v1

    :pswitch_1e9
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1ff

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1ff

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1ff
    return v1

    :pswitch_200
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_216

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_216

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_216
    return v1

    :pswitch_217
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_22d

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_22d

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_22d
    return v1

    :pswitch_22e
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_244

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_244

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_244
    return v1

    :pswitch_245
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_25b

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_25b

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_25b
    return v1

    :pswitch_25c
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_272

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_272

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_272
    return v1

    :pswitch_273
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_289

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_289

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_289
    return v1

    :pswitch_28a
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_2a0

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_2a0

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_2a0
    return v1

    :pswitch_2a1
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_2b7

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_2b7

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_2b7
    return v1

    :pswitch_data_2b8
    .packed-switch 0x0
        :pswitch_2a1
        :pswitch_28a
        :pswitch_273
        :pswitch_25c
        :pswitch_245
        :pswitch_22e
        :pswitch_217
        :pswitch_200
        :pswitch_1e9
        :pswitch_1d2
        :pswitch_1bb
        :pswitch_1a4
        :pswitch_18d
        :pswitch_176
        :pswitch_15f
        :pswitch_148
        :pswitch_131
        :pswitch_11a
        :pswitch_103
        :pswitch_ec
        :pswitch_d5
        :pswitch_be
        :pswitch_a7
        :pswitch_90
        :pswitch_79
        :pswitch_62
        :pswitch_4b
        :pswitch_34
        :pswitch_1d
    .end packed-switch
.end method

.method public final hashCode()I
    .registers 2

    iget-byte v0, p0, Lcl4;->a:B

    packed-switch v0, :pswitch_data_114

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_e
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_17
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_20
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_29
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_32
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_3b
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_44
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_4d
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_56
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_5f
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_68
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_71
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_7a
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_83
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_8c
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_95
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_9e
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_a7
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_b0
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_b9
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_c2
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_cb
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_d4
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_dd
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_e6
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_ef
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_f8
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_101
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_10a
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    nop

    :pswitch_data_114
    .packed-switch 0x0
        :pswitch_10a
        :pswitch_101
        :pswitch_f8
        :pswitch_ef
        :pswitch_e6
        :pswitch_dd
        :pswitch_d4
        :pswitch_cb
        :pswitch_c2
        :pswitch_b9
        :pswitch_b0
        :pswitch_a7
        :pswitch_9e
        :pswitch_95
        :pswitch_8c
        :pswitch_83
        :pswitch_7a
        :pswitch_71
        :pswitch_68
        :pswitch_5f
        :pswitch_56
        :pswitch_4d
        :pswitch_44
        :pswitch_3b
        :pswitch_32
        :pswitch_29
        :pswitch_20
        :pswitch_17
        :pswitch_e
    .end packed-switch
.end method
