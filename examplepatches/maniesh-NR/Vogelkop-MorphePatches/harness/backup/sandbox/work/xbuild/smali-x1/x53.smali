.class public final Lx53;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lc5k;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Lx53;->c:B

    .line 19
    iput-object p1, p0, Lx53;->d:Ljava/lang/Object;

    sget-object p1, Lru9;->g:Lqu9;

    invoke-direct {p0, p1}, Ln1;-><init>(Lou9;)V

    return-void
.end method

.method public constructor <init>(Ldfn;)V
    .registers 3

    const/4 v0, 0x7

    iput-byte v0, p0, Lx53;->c:B

    iput-object p1, p0, Lx53;->d:Ljava/lang/Object;

    .line 12
    sget-object p1, Lru9;->l:Llu9;

    invoke-direct {p0, p1}, Ln1;-><init>(Lou9;)V

    return-void
.end method

.method public constructor <init>(Le8k;)V
    .registers 3

    const/4 v0, 0x3

    iput-byte v0, p0, Lx53;->c:B

    iput-object p1, p0, Lx53;->d:Ljava/lang/Object;

    .line 13
    sget-object p1, Lru9;->i:Llu9;

    invoke-direct {p0, p1}, Ln1;-><init>(Lou9;)V

    return-void
.end method

.method public constructor <init>(Lggn;)V
    .registers 3

    const/16 v0, 0x8

    iput-byte v0, p0, Lx53;->c:B

    iput-object p1, p0, Lx53;->d:Ljava/lang/Object;

    sget-object p1, Lru9;->l:Llu9;

    invoke-direct {p0, p1}, Ln1;-><init>(Lou9;)V

    return-void
.end method

.method public constructor <init>(Lhlk;)V
    .registers 3

    const/4 v0, 0x4

    iput-byte v0, p0, Lx53;->c:B

    .line 16
    iput-object p1, p0, Lx53;->d:Ljava/lang/Object;

    sget-object p1, Lru9;->l:Llu9;

    invoke-direct {p0, p1}, Ln1;-><init>(Lou9;)V

    return-void
.end method

.method public constructor <init>(Lu1f;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lx53;->c:B

    .line 17
    iput-object p1, p0, Lx53;->d:Ljava/lang/Object;

    sget-object p1, Lru9;->k:Llu9;

    invoke-direct {p0, p1}, Ln1;-><init>(Lou9;)V

    return-void
.end method

.method public constructor <init>(Ly53;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lx53;->c:B

    .line 15
    iput-object p1, p0, Lx53;->d:Ljava/lang/Object;

    sget-object p1, Lru9;->f:Llu9;

    invoke-direct {p0, p1}, Ln1;-><init>(Lou9;)V

    return-void
.end method

.method public constructor <init>(Lydn;)V
    .registers 3

    const/4 v0, 0x5

    iput-byte v0, p0, Lx53;->c:B

    .line 18
    iput-object p1, p0, Lx53;->d:Ljava/lang/Object;

    sget-object p1, Lru9;->l:Llu9;

    invoke-direct {p0, p1}, Ln1;-><init>(Lou9;)V

    return-void
.end method

.method public constructor <init>(Lyen;)V
    .registers 3

    const/4 v0, 0x6

    iput-byte v0, p0, Lx53;->c:B

    iput-object p1, p0, Lx53;->d:Ljava/lang/Object;

    .line 14
    sget-object p1, Lru9;->c:Llu9;

    invoke-direct {p0, p1}, Ln1;-><init>(Lou9;)V

    return-void
.end method


# virtual methods
.method public final x0(Lou9;)V
    .registers 5

    iget-byte v0, p0, Lx53;->c:B

    iget-object p0, p0, Lx53;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_d2

    check-cast p1, Llu9;

    check-cast p0, Lggn;

    invoke-virtual {p0}, Lggn;->a()V

    return-void

    :pswitch_f
    check-cast p1, Llu9;

    check-cast p0, Ldfn;

    iget-object p0, p0, Ldfn;->a:Lru9;

    iget-object p1, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v0, "vpn_pro.kill_switch.on"

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    const-string v0, "vpn_pro.kill_switch.activated_timestamp"

    if-eqz p1, :cond_3d

    iget-object p1, p0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_50

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1, v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    goto :goto_50

    :cond_3d
    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v0, "vpn_pro.reminder.show_count"

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_50
    :goto_50
    return-void

    :pswitch_51
    check-cast p1, Llu9;

    check-cast p0, Lyen;

    iget-object p1, p0, Lyen;->j:Lkze;

    iget-object v0, p0, Lyen;->g:Landroid/content/Context;

    invoke-virtual {p0, v0}, Lyen;->e(Landroid/content/Context;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p1, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_65
    check-cast p1, Llu9;

    check-cast p0, Lydn;

    new-instance p1, Lwdn;

    invoke-direct {p1, p0}, Lwdn;-><init>(Lydn;)V

    invoke-virtual {p0, p1}, Lydn;->J(Lwdn;)V

    iget-boolean p1, p0, Lydn;->T:Z

    invoke-virtual {p0, p1}, Lydn;->E(Z)V

    return-void

    :pswitch_77
    check-cast p1, Llu9;

    check-cast p0, Lhlk;

    invoke-virtual {p0}, Lhlk;->g()V

    return-void

    :pswitch_7f
    check-cast p1, Llu9;

    check-cast p0, Le8k;

    invoke-virtual {p0}, Le8k;->R()V

    return-void

    :pswitch_87
    check-cast p1, Lqu9;

    check-cast p0, Lc5k;

    iget-object v0, p0, Lc5k;->X:Lru9;

    iget-object v1, p0, Lc5k;->B:Lcom/opera/android/feed/FeedViewPager;

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    iget-object p1, p1, Lou9;->a:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-interface {v0, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_b0

    iget-object p0, p0, Lc5k;->A:Lbx8;

    invoke-virtual {p0, p1}, Lbx8;->a(Ljava/lang/String;)I

    move-result p0

    const/4 p1, -0x1

    if-eq p0, p1, :cond_b0

    invoke-virtual {v1, p0}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->r(I)I

    move-result p0

    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result p1

    if-eq p0, p1, :cond_b0

    invoke-virtual {v1, p0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    :cond_b0
    return-void

    :pswitch_b1
    check-cast p0, Lu1f;

    invoke-virtual {p0}, Lp1f;->b()V

    return-void

    :pswitch_b7
    check-cast p1, Llu9;

    check-cast p0, Ly53;

    iget-object v0, p0, Ly53;->p:Lru9;

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    iget-object p1, p1, Lou9;->a:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    xor-int/2addr p1, v1

    iget-object p0, p0, Ly53;->l:Lpde;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_d2
    .packed-switch 0x0
        :pswitch_b7
        :pswitch_b1
        :pswitch_87
        :pswitch_7f
        :pswitch_77
        :pswitch_65
        :pswitch_51
        :pswitch_f
    .end packed-switch
.end method
