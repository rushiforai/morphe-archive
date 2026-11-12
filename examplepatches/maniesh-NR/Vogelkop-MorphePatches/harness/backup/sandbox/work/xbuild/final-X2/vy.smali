.class public final synthetic Lvy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmo7;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lvy;->a:B

    iput-object p1, p0, Lvy;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final o(Z)V
    .registers 9

    iget-byte v0, p0, Lvy;->a:B

    const/4 v1, 0x4

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object p0, p0, Lvy;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_104

    check-cast p0, Lydn;

    new-instance p1, Lwdn;

    invoke-direct {p1, p0}, Lwdn;-><init>(Lydn;)V

    invoke-virtual {p0, p1}, Lydn;->J(Lwdn;)V

    return-void

    :pswitch_15
    check-cast p0, Lx77;

    iget-object p1, p0, Lx77;->d:Ljava/lang/Object;

    check-cast p1, Lxnh;

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwnh;

    iget-object v0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, Lcom/opera/android/utilities/DisplayUtil;->a(Landroid/content/Context;)Z

    invoke-virtual {p1, v1}, Lwnh;->b(I)Z

    move-result p1

    iget-object p0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    const-string v0, "enable_newsfeed"

    if-nez p1, :cond_38

    invoke-virtual {p0, v3, v0}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    goto :goto_3b

    :cond_38
    invoke-virtual {p0, v2, v0}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    :goto_3b
    return-void

    :pswitch_3c
    check-cast p0, Lq6e;

    if-nez p1, :cond_57

    iget-object p1, p0, Lq6e;->i:Ljbf;

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Libf;

    const/16 v0, 0x200

    invoke-virtual {p1, v0}, Libf;->a(I)Z

    move-result p1

    invoke-virtual {p0, p1}, Lq6e;->g(Z)Z

    move-result p1

    if-eqz p1, :cond_57

    invoke-virtual {p0}, Lq6e;->l()V

    :cond_57
    return-void

    :pswitch_58
    check-cast p0, Lvpc;

    invoke-virtual {p0}, Lvpc;->b()V

    return-void

    :pswitch_5e
    check-cast p0, Lx79;

    iget-object v0, p0, Lx79;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    const-string v4, "ongoing_installation_location_reset"

    invoke-virtual {v0, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_96

    iget-object v5, p0, Lx79;->b:Ljava/lang/Object;

    check-cast v5, Ldj9;

    invoke-virtual {v5}, Lno7;->i()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcj9;

    iget-object v6, v5, Lcj9;->b:Ljava/lang/String;

    iget-object v5, v5, Lcj9;->a:Ljava/lang/String;

    invoke-static {v6, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_96

    invoke-virtual {v0, v2, v4}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    iget-object v4, p0, Lx79;->d:Ljava/lang/Object;

    check-cast v4, Lj4c;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lmdh;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v5, Liqi;->c:Liqi;

    const/4 v6, 0x0

    invoke-static {v4, v3, v5, v6, v1}, Lmdh;->b(Lmdh;ZLiqi;Lkotlin/jvm/functions/Function1;I)V

    :cond_96
    if-eqz p1, :cond_a5

    new-instance p1, Ls9;

    const/16 v1, 0x11

    invoke-direct {p1, p0, v1}, Ls9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p0, v2}, Lx79;->P(Z)V

    :cond_a5
    return-void

    :pswitch_a6
    check-cast p0, Lqb7;

    iget-object p1, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast p1, Lxnh;

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwnh;

    const/high16 v0, 0x400000

    invoke-virtual {p1, v0}, Lwnh;->a(I)Z

    move-result p1

    xor-int/2addr p1, v3

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lqb7;->c:Ljava/lang/Object;

    iget-object p1, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_c7
    if-ge v2, v0, :cond_d9

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v2, v2, 0x1

    check-cast v1, Lcom/opera/api/Callback;

    iget-object v3, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Boolean;

    invoke-interface {v1, v3}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_c7

    :cond_d9
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    return-void

    :pswitch_dd
    check-cast p0, Lny3;

    invoke-virtual {p0}, Lny3;->c()V

    return-void

    :pswitch_e3
    check-cast p0, Lpu3;

    iget-object p1, p0, Lpu3;->d:Lxnh;

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwnh;

    const/high16 v0, 0x1000000

    invoke-virtual {p1, v0}, Lwnh;->a(I)Z

    move-result p1

    iput-boolean p1, p0, Lpu3;->f:Z

    return-void

    :pswitch_f6
    check-cast p0, Lbn7;

    invoke-virtual {p0}, Lbn7;->run()V

    return-void

    :pswitch_fc
    check-cast p0, Lwy;

    if-nez p1, :cond_103

    invoke-virtual {p0}, Lwy;->U()V

    :cond_103
    return-void

    :pswitch_data_104
    .packed-switch 0x0
        :pswitch_fc
        :pswitch_f6
        :pswitch_e3
        :pswitch_dd
        :pswitch_a6
        :pswitch_5e
        :pswitch_58
        :pswitch_3c
        :pswitch_15
    .end packed-switch
.end method
