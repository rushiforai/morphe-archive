.class public final synthetic Llu1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpu1;


# direct methods
.method public synthetic constructor <init>(Lpu1;B)V
    .registers 3

    iput-byte p2, p0, Llu1;->a:B

    iput-object p1, p0, Llu1;->b:Lpu1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 9

    iget-byte p1, p0, Llu1;->a:B

    sget-object v0, Lijm;->b:Lijm;

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Llu1;->b:Lpu1;

    packed-switch p1, :pswitch_data_12c

    invoke-virtual {p0}, Lpu1;->I0()Ldv1;

    move-result-object p0

    iget-object p0, p0, Ldv1;->f:Lg8j;

    const-class p1, Lts1;

    invoke-virtual {p0, p1, v1}, Lg8j;->l(Ljava/lang/Class;Landroid/os/Bundle;)V

    return-void

    :pswitch_17
    invoke-virtual {p0}, Lpu1;->I0()Ldv1;

    move-result-object p0

    iget-object p0, p0, Ldv1;->f:Lg8j;

    sget-object p1, Lwo3;->K:Lpsp;

    sget-object v0, Luo3;->e:Luo3;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lpsp;->j(Luo3;)Landroid/os/Bundle;

    move-result-object p1

    const-class v0, Lwo3;

    invoke-virtual {p0, v0, p1}, Lg8j;->l(Ljava/lang/Class;Landroid/os/Bundle;)V

    return-void

    :pswitch_2e
    invoke-virtual {p0}, Lpu1;->I0()Ldv1;

    move-result-object p0

    iget-object p0, p0, Ldv1;->f:Lg8j;

    new-array p1, v2, [I

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ldw9;

    new-instance v1, Loba;

    const/4 v3, 0x2

    invoke-direct {v1, v3, v2, p1}, Loba;-><init>(II[I)V

    invoke-direct {v0, v1}, Ldw9;-><init>(Loba;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v0, v2}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_4a
    invoke-virtual {p0}, Lpu1;->I0()Ldv1;

    move-result-object p0

    iget-object p0, p0, Ldv1;->f:Lg8j;

    new-array p1, v2, [I

    invoke-virtual {p0, p1}, Lg8j;->a([I)V

    return-void

    :pswitch_56
    invoke-virtual {p0}, Lpu1;->I0()Ldv1;

    move-result-object p0

    iget-object p0, p0, Ldv1;->d:Lxln;

    sget-object p1, Lvln;->a:Lvln;

    iget-object p0, p0, Lxln;->b:Lgjm;

    new-instance v0, Lrkn;

    invoke-direct {v0, p1, v1}, Lrkn;-><init>(Lvln;Landroid/os/Bundle;)V

    invoke-virtual {p0, v0, v2}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_69
    invoke-virtual {p0}, Lpu1;->I0()Ldv1;

    move-result-object p0

    iget-object p1, p0, Ldv1;->f:Lg8j;

    iget-object v1, p0, Ldv1;->i:Lyu1;

    iget-object v3, v1, Lyu1;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1}, Lyu1;->b()Le7j;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->D(Le7j;)Lr7j;

    move-result-object v3

    invoke-virtual {v1}, Lyu1;->a()Lb7j;

    move-result-object v4

    sget-object v5, Lb7j;->d:Lb7j;

    if-ne v4, v5, :cond_89

    sget-object v4, Lr7j;->d:Lr7j;

    if-ne v3, v4, :cond_89

    sget-object v3, Lr7j;->c:Lr7j;

    :cond_89
    invoke-virtual {v1}, Lyu1;->a()Lb7j;

    move-result-object v4

    const/4 v6, 0x1

    if-eq v4, v5, :cond_98

    invoke-virtual {v1}, Lyu1;->b()Le7j;

    move-result-object v1

    sget-object v4, Le7j;->d:Le7j;

    if-ne v1, v4, :cond_99

    :cond_98
    move v2, v6

    :cond_99
    new-instance v1, Lcv1;

    invoke-direct {v1, p0, v6}, Lcv1;-><init>(Ldv1;B)V

    iget-object p0, p1, Lg8j;->c:Ldu3;

    invoke-virtual {p0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqim;

    iget-object p0, p0, Lqim;->c:Lz77;

    iget-object p1, p1, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    const v4, 0x7f140feb

    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v4, Leyi;

    invoke-direct {v4, v6, v3, v1, v2}, Leyi;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    new-instance v1, Ltim;

    new-instance v2, Lalj;

    invoke-direct {v2, v4, p1}, Lalj;-><init>(Lzkj;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ltim;-><init>(Luim;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_c7
    invoke-virtual {p0}, Lpu1;->I0()Ldv1;

    move-result-object p0

    iget-object p1, p0, Ldv1;->f:Lg8j;

    iget-object v1, p0, Ldv1;->i:Lyu1;

    invoke-virtual {v1}, Lyu1;->a()Lb7j;

    move-result-object v1

    new-instance v3, Lcv1;

    invoke-direct {v3, p0, v2}, Lcv1;-><init>(Ldv1;B)V

    iget-object p0, p1, Lg8j;->c:Ldu3;

    invoke-virtual {p0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqim;

    iget-object p0, p0, Lqim;->c:Lz77;

    iget-object p1, p1, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    const v2, 0x7f140f53

    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v2, Livg;

    const/4 v4, 0x4

    invoke-direct {v2, v1, v3, v4}, Livg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Ltim;

    new-instance v3, Lalj;

    invoke-direct {v3, v2, p1}, Lalj;-><init>(Lzkj;Ljava/lang/String;)V

    invoke-direct {v1, v3}, Ltim;-><init>(Luim;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_102
    invoke-virtual {p0}, Lpu1;->I0()Ldv1;

    move-result-object p0

    iget-object p0, p0, Ldv1;->e:Lzwe;

    new-array p1, v2, [I

    invoke-virtual {p0, p1}, Lzwe;->a([I)V

    return-void

    :pswitch_10e
    invoke-virtual {p0}, Lpu1;->I0()Ldv1;

    move-result-object p0

    iget-object p0, p0, Ldv1;->e:Lzwe;

    new-array p1, v2, [I

    invoke-virtual {p0, p1}, Lzwe;->a([I)V

    return-void

    :pswitch_11a
    invoke-virtual {p0}, Lpu1;->I0()Ldv1;

    move-result-object p0

    iget-object p0, p0, Ldv1;->f:Lg8j;

    iget-object p0, p0, Lg8j;->b:Lgjm;

    new-instance p1, Lfs1;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, v2}, Lgjm;->e(Ln37;Z)V

    return-void

    nop

    :pswitch_data_12c
    .packed-switch 0x0
        :pswitch_11a
        :pswitch_10e
        :pswitch_102
        :pswitch_c7
        :pswitch_69
        :pswitch_56
        :pswitch_4a
        :pswitch_2e
        :pswitch_17
    .end packed-switch
.end method
