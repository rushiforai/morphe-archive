.class public final synthetic Lf15;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsrg;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lf15;->a:B

    iput-object p1, p0, Lf15;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Z
    .registers 6

    iget-byte v0, p0, Lf15;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lf15;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_d4

    check-cast p0, Ljava/util/HashSet;

    check-cast p1, Lxxc;

    invoke-virtual {p1}, Lxxc;->f()Lfdn;

    move-result-object v0

    invoke-virtual {v0}, Lfdn;->b()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-virtual {p1}, Lxxc;->f()Lfdn;

    move-result-object p1

    iget-object p1, p1, Lfdn;->c:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_24

    move v1, v2

    :cond_24
    return v1

    :pswitch_25
    check-cast p0, Lurg;

    check-cast p1, Lkqm;

    invoke-interface {p0, p1}, Lurg;->test(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_2e
    check-cast p0, Lz3m;

    check-cast p1, Ly3m;

    iget-object p0, p0, Lz3m;->l:Ljjg;

    iget-object p0, p0, Ljjg;->b:Ljava/lang/Object;

    check-cast p0, Lv3m;

    iget-object v0, p0, Lv3m;->a:Landroid/content/Context;

    invoke-static {v0}, Lv3m;->c(Landroid/content/Context;)Ljava/util/Set;

    move-result-object v0

    new-instance v1, Lf15;

    const/4 v2, 0x5

    invoke-direct {v1, p0, v2}, Lf15;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lsfe;->Q(Ljava/lang/Iterable;Lsrg;)Lzlb;

    move-result-object p0

    invoke-static {p0}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p0

    iget-object p1, p1, Ly3m;->a:Lszb;

    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_53
    check-cast p0, Lv3m;

    check-cast p1, Lszb;

    invoke-virtual {p0}, Lv3m;->d()Lszb;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_67

    invoke-virtual {p0, p1, v2}, Lv3m;->e(Lszb;I)Z

    move-result p0

    if-eqz p0, :cond_68

    :cond_67
    move v1, v2

    :cond_68
    return v1

    :pswitch_69
    check-cast p0, Lepk;

    check-cast p1, Ljn7;

    invoke-virtual {p0, p1}, Lepk;->test(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_72
    check-cast p0, Lepk;

    check-cast p1, Ln8f;

    invoke-virtual {p0, p1}, Lepk;->test(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_7b
    check-cast p0, Ltmk;

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Ltmk;->a:Lmcj;

    iget-object p0, p0, Lmcj;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "acked_tokens"

    sget-object v1, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-static {p0, v0, v1}, Lw1h;->o(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_98
    check-cast p0, Ljava/lang/String;

    check-cast p1, Lbre;

    invoke-static {p1}, Lx77;->h(Lbre;)Ljava/lang/String;

    move-result-object v0

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_b4

    iget-object p1, p1, Lbre;->d:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_b5

    :cond_b4
    move v1, v2

    :cond_b5
    return v1

    :pswitch_b6
    check-cast p0, Lcre;

    check-cast p1, Lg15;

    iget-object v0, p1, Lg15;->a:Lcre;

    iget-object v0, v0, Lcre;->c:Ljava/lang/String;

    iget-object v3, p0, Lcre;->c:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d2

    iget-object p1, p1, Lg15;->a:Lcre;

    iget-object p1, p1, Lcre;->d:Ljava/lang/String;

    iget-object p0, p0, Lcre;->d:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d3

    :cond_d2
    move v1, v2

    :cond_d3
    return v1

    :pswitch_data_d4
    .packed-switch 0x0
        :pswitch_b6
        :pswitch_98
        :pswitch_7b
        :pswitch_72
        :pswitch_69
        :pswitch_53
        :pswitch_2e
        :pswitch_25
    .end packed-switch
.end method
