.class public final synthetic Lh6j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lk6j;


# direct methods
.method public synthetic constructor <init>(Lk6j;B)V
    .registers 3

    iput-byte p2, p0, Lh6j;->a:B

    iput-object p1, p0, Lh6j;->b:Lk6j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte p1, p0, Lh6j;->a:B

    const/4 v0, 0x2

    const/4 v1, 0x0

    iget-object p0, p0, Lh6j;->b:Lk6j;

    packed-switch p1, :pswitch_data_1b4

    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    sget-object p1, Lc8j;->a:Lc8j;

    new-array v0, v1, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0, p1, v0}, Lg8j;->j(Lc8j;[I)V

    return-void

    :pswitch_1b
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    new-array p1, v1, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0, p1}, Lg8j;->b([I)V

    return-void

    :pswitch_2b
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    new-array p1, v1, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0, p1}, Lg8j;->d([I)V

    return-void

    :pswitch_3b
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Ldaj;->h:Lzwe;

    new-array p1, v1, [I

    invoke-virtual {p0, p1}, Lzwe;->a([I)V

    return-void

    :pswitch_49
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    invoke-virtual {p0}, Ldaj;->s()V

    return-void

    :pswitch_53
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Ldaj;->g:Lsyl;

    invoke-virtual {p0}, Lsyl;->a()V

    return-void

    :pswitch_5f
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Ldaj;->f:Lrj;

    new-array p1, v1, [I

    invoke-virtual {p0, p1}, Lrj;->a([I)V

    return-void

    :pswitch_6d
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Ldaj;->e:Lwc6;

    new-array p1, v1, [I

    invoke-virtual {p0, p1}, Lwc6;->a([I)V

    return-void

    :pswitch_7b
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Ldaj;->d:Lben;

    new-array p1, v1, [I

    invoke-virtual {p0, p1}, Lben;->a([I)V

    return-void

    :pswitch_89
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Ldaj;->p:Lmm6;

    invoke-virtual {p0}, Lmm6;->a()Lyl6;

    move-result-object p1

    iget-object p1, p1, Lyl6;->c:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "resume_type"

    const/4 v1, 0x6

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "resume_deep_link"

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lmm6;->a()Lyl6;

    move-result-object p1

    iget-object p0, p0, Lmm6;->f:Loi;

    invoke-virtual {p1, p0, v1}, Lyl6;->e(Loi;Ljava/lang/Runnable;)V

    return-void

    :pswitch_bc
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p1, p0, Ldaj;->i:Lru9;

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object v0, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "make_default_banner.dismissed"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    invoke-virtual {p0}, Ldaj;->g()V

    return-void

    :pswitch_d9
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    new-array p1, v1, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lo2;

    new-instance v3, Loba;

    invoke-direct {v3, v0, v1, p1}, Loba;-><init>(II[I)V

    invoke-direct {v2, v3}, Lo2;-><init>(Loba;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v2, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_f8
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    new-array p1, v1, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lbaa;

    new-instance v3, Loba;

    invoke-direct {v3, v0, v1, p1}, Loba;-><init>(II[I)V

    invoke-direct {v2, v3}, Lbaa;-><init>(Loba;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v2, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_117
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    new-array p1, v1, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0, p1}, Lg8j;->e([I)V

    return-void

    :pswitch_127
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    new-array p1, v1, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lbrd;

    new-instance v3, Loba;

    invoke-direct {v3, v0, v1, p1}, Loba;-><init>(II[I)V

    invoke-direct {v2, v3}, Lbrd;-><init>(Loba;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v2, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_146
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    new-array p1, v1, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0, p1}, Lg8j;->c([I)V

    return-void

    :pswitch_156
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    new-array p1, v1, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lx2f;

    new-instance v3, Loba;

    invoke-direct {v3, v0, v1, p1}, Loba;-><init>(II[I)V

    invoke-direct {v2, v3}, Lx2f;-><init>(Loba;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v2, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_175
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    new-array p1, v1, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0, p1}, Lg8j;->g([I)V

    return-void

    :pswitch_185
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    new-array p1, v1, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lxyg;

    new-instance v3, Loba;

    invoke-direct {v3, v0, v1, p1}, Loba;-><init>(II[I)V

    invoke-direct {v2, v3}, Lxyg;-><init>(Loba;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v2, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_1a4
    sget-object p1, Lk6j;->x:[Lxtb;

    invoke-virtual {p0}, Lk6j;->I0()Ldaj;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    new-array p1, v1, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0, p1}, Lg8j;->f([I)V

    return-void

    :pswitch_data_1b4
    .packed-switch 0x0
        :pswitch_1a4
        :pswitch_185
        :pswitch_175
        :pswitch_156
        :pswitch_146
        :pswitch_127
        :pswitch_117
        :pswitch_f8
        :pswitch_d9
        :pswitch_bc
        :pswitch_89
        :pswitch_7b
        :pswitch_6d
        :pswitch_5f
        :pswitch_53
        :pswitch_49
        :pswitch_3b
        :pswitch_2b
        :pswitch_1b
    .end packed-switch
.end method
