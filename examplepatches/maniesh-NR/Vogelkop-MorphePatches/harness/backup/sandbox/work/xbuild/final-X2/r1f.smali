.class public final Lr1f;
.super Lp1f;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lndc;Ljnm;Lyqd;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lr1f;->e:B

    invoke-direct {p0, p3}, Lp1f;-><init>(Ljava/lang/Runnable;)V

    iput-object p2, p0, Lr1f;->f:Ljava/lang/Object;

    new-instance p3, Lyqd;

    const/16 v0, 0x15

    invoke-direct {p3, p0, v0}, Lyqd;-><init>(Ljava/lang/Object;B)V

    iget-object v0, p2, Ljnm;->c:Lnrl;

    invoke-virtual {v0, p3}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    new-instance p3, Lq1f;

    invoke-direct {p3, p0}, Lq1f;-><init>(Lr1f;)V

    new-instance p0, Lvme;

    const/16 v0, 0x13

    invoke-direct {p0, v0}, Lvme;-><init>(B)V

    invoke-static {p2, p1, p3, p0}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public constructor <init>(Lndc;Lxc9;Lyqd;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lr1f;->e:B

    .line 36
    invoke-direct {p0, p3}, Lp1f;-><init>(Ljava/lang/Runnable;)V

    .line 37
    iput-object p2, p0, Lr1f;->f:Ljava/lang/Object;

    .line 38
    new-instance p3, Lhpd;

    const/16 v0, 0x11

    invoke-direct {p3, p0, p1, v0}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    .line 39
    iget-object p0, p2, Lxc9;->b:Lnrl;

    .line 40
    invoke-virtual {p0, p3}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Lojn;)V
    .registers 4

    const/4 v0, 0x3

    iput-byte v0, p0, Lr1f;->e:B

    .line 43
    new-instance v0, Lrl;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lrl;-><init>(B)V

    invoke-direct {p0, v0}, Lp1f;-><init>(Ljava/lang/Runnable;)V

    .line 44
    iput-object p1, p0, Lr1f;->f:Ljava/lang/Object;

    .line 45
    iget-object p0, p0, Lp1f;->b:Lnrl;

    invoke-virtual {p0}, Lnrl;->K()V

    return-void
.end method

.method public constructor <init>(Lv1f;Lrl;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lr1f;->e:B

    .line 41
    iput-object p1, p0, Lr1f;->f:Ljava/lang/Object;

    .line 42
    invoke-direct {p0, p2}, Lp1f;-><init>(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 7

    iget-byte v0, p0, Lr1f;->e:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lr1f;->f:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_7e

    check-cast p0, Lojn;

    iget-object p0, p0, Lojn;->c:Lfjn;

    invoke-virtual {p0}, Lfjn;->a()Z

    move-result p0

    return p0

    :pswitch_12
    check-cast p0, Lv1f;

    iget-object v0, p0, Lv1f;->b:Landroid/util/SparseArray;

    invoke-virtual {p0}, Lv1f;->b()I

    move-result v3

    invoke-virtual {p0}, Lv1f;->b()I

    move-result p0

    if-eqz p0, :cond_51

    move p0, v1

    :goto_21
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v4

    if-ge p0, v4, :cond_51

    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v4

    and-int/2addr v4, v3

    if-eqz v4, :cond_4e

    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lp1f;

    iget-object v4, v4, Lp1f;->a:Li7f;

    new-instance v5, Lg7f;

    invoke-direct {v5, v4}, Lg7f;-><init>(Li7f;)V

    :cond_3b
    invoke-virtual {v5}, Lg7f;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4c

    invoke-virtual {v5}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lt1f;

    instance-of v4, v4, Lf3f;

    if-eqz v4, :cond_3b

    goto :goto_4e

    :cond_4c
    move v1, v2

    goto :goto_51

    :cond_4e
    :goto_4e
    add-int/lit8 p0, p0, 0x1

    goto :goto_21

    :cond_51
    :goto_51
    return v1

    :pswitch_52
    check-cast p0, Lxc9;

    iget-object p0, p0, Lxc9;->c:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v3, "unread_message"

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_73

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "opened_my_flow_fragment"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-nez p0, :cond_73

    move v1, v2

    :cond_73
    return v1

    :pswitch_74
    check-cast p0, Ljnm;

    iget-object v0, p0, Ljnm;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    iget-boolean p0, p0, Ljnm;->e:Z

    return p0

    :pswitch_data_7e
    .packed-switch 0x0
        :pswitch_74
        :pswitch_52
        :pswitch_12
    .end packed-switch
.end method
