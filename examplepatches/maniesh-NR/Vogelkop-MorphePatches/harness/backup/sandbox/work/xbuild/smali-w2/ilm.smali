.class public final synthetic Lilm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lilm;->a:B

    iput-object p1, p0, Lilm;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 8

    iget-byte v0, p0, Lilm;->a:B

    const/4 v1, 0x3

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object p0, p0, Lilm;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_26e

    check-cast p0, Laco;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, v3, v4}, Laco;->m(Ljava/lang/Integer;Z)V

    new-instance v0, Lq6;

    invoke-direct {v0, p1}, Lq6;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Laco;->p(Ljava/lang/Throwable;)V

    return-void

    :pswitch_1b
    check-cast p0, Lcom/opera/android/startup/WelcomeActivity;

    check-cast p1, Lu65;

    sget v0, Lcom/opera/android/startup/WelcomeActivity;->w:I

    invoke-virtual {p0, p1}, Lcom/opera/android/startup/WelcomeActivity;->R(Lu65;)V

    return-void

    :pswitch_25
    check-cast p0, Lcom/opera/android/webcore/WebcoreRpcBridge;

    check-cast p1, Ljava/lang/String;

    iget-wide v0, p0, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_34

    invoke-static {v0, v1, p1}, LJ/N;->M4gFreVH(JLjava/lang/Object;)V

    :cond_34
    return-void

    :pswitch_35
    check-cast p0, Lsrn;

    check-cast p1, Lb87;

    iget-object p0, p0, Lsrn;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->z0()Lz77;

    move-result-object p0

    invoke-virtual {p0, p1}, Lr22;->a(Ljjm;)V

    return-void

    :pswitch_43
    check-cast p0, Lks3;

    check-cast p1, Lgkn;

    iget-object p0, p0, Lks3;->i:Ljava/lang/Object;

    check-cast p0, Llh4;

    if-eqz p0, :cond_50

    invoke-virtual {p0, p1}, Llh4;->run(Ljava/lang/Object;)V

    :cond_50
    return-void

    :pswitch_51
    check-cast p0, Lilm;

    check-cast p1, Laln;

    if-eqz p1, :cond_60

    new-instance v0, Lomn;

    invoke-direct {v0, p1}, Lomn;-><init>(Laln;)V

    invoke-virtual {p0, v0}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_68

    :cond_60
    new-instance p1, Lpmn;

    invoke-direct {p1, v4}, Lpmn;-><init>(B)V

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    :goto_68
    return-void

    :pswitch_69
    check-cast p0, Ls14;

    check-cast p1, Lqmn;

    iput-boolean v4, p0, Ls14;->b:Z

    iput-object p1, p0, Ls14;->f:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    iget-object v0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_81
    if-ge v4, v0, :cond_93

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v4, v4, 0x1

    check-cast v1, Lcom/opera/api/Callback;

    iget-object v2, p0, Ls14;->f:Ljava/lang/Object;

    check-cast v2, Lqmn;

    invoke-interface {v1, v2}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_81

    :cond_93
    return-void

    :pswitch_94
    check-cast p0, Ll45;

    check-cast p1, Ldnn;

    new-instance v0, Ldcl;

    invoke-direct {v0, p0}, Ldcl;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Ldnn;->a(Lann;)V

    return-void

    :pswitch_a1
    check-cast p0, Lm59;

    check-cast p1, Ldnn;

    new-instance v0, Ltvk;

    invoke-direct {v0, p0}, Ltvk;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Ldnn;->a(Lann;)V

    return-void

    :pswitch_ae
    check-cast p0, Lvq8;

    check-cast p1, Ljava/util/Set;

    invoke-virtual {p0, p1}, Lvq8;->d(Ljava/util/Set;)Lokhttp3/internal/connection/RealCall;

    move-result-object p1

    invoke-virtual {p0}, Lvq8;->i()Z

    move-result v0

    iget-object v1, p0, Lvq8;->l:Ljava/lang/Object;

    check-cast v1, Lrii;

    if-eqz v0, :cond_c9

    new-instance v0, Ldln;

    invoke-direct {v0, p0, v1, v2}, Ldln;-><init>(Lvq8;Lgln;Z)V

    invoke-interface {p1, v0}, Lv84;->enqueue(Lf94;)V

    goto :goto_e9

    :cond_c9
    iget-object v0, p0, Lvq8;->g:Ljava/lang/Object;

    check-cast v0, Lumi;

    new-instance v2, Lr2n;

    const/16 v4, 0xb

    invoke-direct {v2, p0, v4}, Lr2n;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v2

    new-instance v4, Lvdi;

    const/16 v5, 0xd

    invoke-direct {v4, p0, p1, v1, v5}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v4}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {v2, p0}, Lnml;->b(Lnml;)V

    invoke-virtual {v2, v3}, Lnml;->a(Ljava/lang/Object;)Loml;

    :goto_e9
    return-void

    :pswitch_ea
    check-cast p0, Lpkn;

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object p1

    new-instance v0, Lnn;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Lnn;-><init>(B)V

    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    move-result p1

    if-eqz p1, :cond_111

    iget-object p0, p0, Lpkn;->f:Lqkn;

    iget-object p0, p0, Lqkn;->p:Lysj;

    const p1, 0x7f14085a

    const/16 v0, 0x9c4

    invoke-static {p1, v0, p0}, Lam2;->i(IILysj;)Lglj;

    move-result-object p1

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_111
    return-void

    :pswitch_112
    check-cast p0, Lu7k;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Lydn;

    iget-object v0, p0, Lydn;->M:Lcom/opera/api/Callback;

    iput-object v3, p0, Lydn;->M:Lcom/opera/api/Callback;

    if-eqz p1, :cond_12e

    iput-byte v1, p0, Lydn;->H:B

    if-eqz v0, :cond_13a

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_13a

    :cond_12e
    iput-byte v4, p0, Lydn;->H:B

    if-eqz v0, :cond_137

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_137
    invoke-virtual {p0, v4}, Lydn;->C(Z)V

    :cond_13a
    :goto_13a
    return-void

    :pswitch_13b
    check-cast p0, Lndn;

    check-cast p1, Lfdn;

    iget-boolean v0, p1, Lfdn;->e:Z

    if-eqz v0, :cond_14b

    iget-object v0, p0, Lndn;->p:Lfdn;

    invoke-virtual {p1, v0}, Lfdn;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_194

    :cond_14b
    iget-object v0, p0, Lndn;->n:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lndn;->n:Ljava/util/List;

    invoke-interface {v0, v4, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :goto_155
    iget-object p1, p0, Lndn;->n:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-le p1, v1, :cond_168

    iget-object p1, p0, Lndn;->n:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v2

    invoke-interface {p1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_155

    :cond_168
    iget-object p1, p0, Lndn;->a:Landroid/content/Context;

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    iget-object p0, p0, Lndn;->n:Ljava/util/List;

    const/16 v0, 0x3b

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lbql;

    const/4 v2, 0x7

    invoke-direct {v1, v2}, Lbql;-><init>(B)V

    invoke-static {v1, p0}, Lnb6;->W(Lxq9;Ljava/util/List;)Ljava/util/AbstractList;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object v0, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "settings.vpn.location.recently_used"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    :cond_194
    return-void

    :pswitch_195
    check-cast p0, La7n;

    check-cast p1, Landroid/view/View;

    iget-object p0, p0, La7n;->f:Lgjm;

    new-instance p1, Lxyg;

    invoke-direct {p1, v4}, Lxyg;-><init>(I)V

    invoke-virtual {p0, p1, v4}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_1a4
    check-cast p0, Lmm2;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1bf

    sget-object v0, Ls9g;->h:Ls9g;

    iget-boolean v1, p0, Lmm2;->b:Z

    iget-object p0, p0, Lmm2;->c:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Ljava/lang/String;

    sget-object v4, Lkag;->b:Lkag;

    const/4 v5, 0x1

    sget-object v3, Llag;->b:Llag;

    invoke-virtual/range {v0 .. v5}, Ls9g;->o(ZLjava/lang/String;Llag;Lkag;Z)V

    :cond_1bf
    return-void

    :pswitch_1c0
    check-cast p0, Lldh;

    check-cast p1, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Lldh;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1c8
    check-cast p0, Lcbk;

    check-cast p1, Lh1b;

    invoke-virtual {p1, v4}, Lh1b;->u(I)La1b;

    move-result-object p1

    :cond_1d0
    invoke-virtual {p1}, Lq4;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_200

    invoke-virtual {p1}, Lq4;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcbk;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-eq v2, v5, :cond_1f6

    invoke-static {v0, v1, v4}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1f6

    new-instance v1, Lari;

    invoke-direct {v1, v0}, Lari;-><init>(Ljava/lang/String;)V

    goto :goto_1f7

    :cond_1f6
    move-object v1, v3

    :goto_1f7
    if-eqz v1, :cond_1d0

    iget-object p1, p0, Lcbk;->d:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_200
    invoke-virtual {p0}, Lcbk;->b()V

    return-void

    :pswitch_204
    check-cast p0, Lsom;

    check-cast p1, Ljava/lang/Boolean;

    iget-object v0, p0, Lsom;->h:Lcom/opera/android/autofill/PasswordManager;

    if-eqz v0, :cond_23a

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object v0, p0, Lsom;->i:Lcom/opera/android/autofill/PasswordDataMonitor;

    if-eqz p1, :cond_231

    if-nez v0, :cond_23a

    iget-object p1, p0, Lsom;->h:Lcom/opera/android/autofill/PasswordManager;

    new-instance v0, Lrom;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lrom;-><init>(Lsom;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lcom/opera/android/autofill/PasswordDataMonitor;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object v0, p1, Lcom/opera/android/autofill/PasswordDataMonitor;->a:Ljava/lang/Runnable;

    invoke-static {p1}, LJ/N;->MtK05rRq(Ljava/lang/Object;)J

    move-result-wide v0

    iput-wide v0, p1, Lcom/opera/android/autofill/PasswordDataMonitor;->b:J

    iput-object p1, p0, Lsom;->i:Lcom/opera/android/autofill/PasswordDataMonitor;

    goto :goto_23a

    :cond_231
    if-eqz v0, :cond_238

    invoke-virtual {v0}, Lcom/opera/android/autofill/PasswordDataMonitor;->a()V

    iput-object v3, p0, Lsom;->i:Lcom/opera/android/autofill/PasswordDataMonitor;

    :cond_238
    iput-boolean v2, p0, Lsom;->l:Z

    :cond_23a
    :goto_23a
    return-void

    :pswitch_23b
    check-cast p0, Ljnm;

    check-cast p1, Landroid/content/SharedPreferences;

    const-string v0, "unseen_download_ids"

    invoke-static {p1, v0}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/HashSet;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iput-boolean p1, p0, Ljnm;->e:Z

    iget-object p0, p0, Ljnm;->c:Lnrl;

    invoke-virtual {p0}, Lnrl;->K()V

    return-void

    :pswitch_252
    check-cast p0, Lhlm;

    check-cast p1, Ljava/lang/String;

    sget-object v0, Lf8a;->h:Lf8a;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Uninstall-"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lf8a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lhlm;->a(Ljava/lang/String;)V

    return-void

    :pswitch_data_26e
    .packed-switch 0x0
        :pswitch_252
        :pswitch_23b
        :pswitch_204
        :pswitch_1c8
        :pswitch_1c0
        :pswitch_1a4
        :pswitch_195
        :pswitch_13b
        :pswitch_112
        :pswitch_ea
        :pswitch_ae
        :pswitch_a1
        :pswitch_94
        :pswitch_69
        :pswitch_51
        :pswitch_43
        :pswitch_35
        :pswitch_25
        :pswitch_1b
    .end packed-switch
.end method
