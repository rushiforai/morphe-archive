.class public final synthetic Lsk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lsk;->a:B

    iput-object p1, p0, Lsk;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 15

    iget-byte v0, p0, Lsk;->a:B

    const-wide/16 v1, 0x0

    const-string v3, "text_wrap"

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    iget-object p0, p0, Lsk;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_23c

    check-cast p0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p0, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void

    :pswitch_14
    check-cast p0, Ljdo;

    invoke-static {}, LJ/N;->M4QvXpDD()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;

    invoke-static {p1}, LJ/N;->MNitnPWj(Ljava/lang/Object;)D

    move-result-wide v0

    iget-object p2, p0, Ljdo;->v:Ld83;

    if-nez p2, :cond_25

    move-object p2, v6

    :cond_25
    iget-object p2, p2, Ld83;->c:Ljava/util/List;

    check-cast p2, Ljava/util/ArrayList;

    new-instance v2, Ljava/util/ArrayList;

    const/16 v5, 0xa

    invoke-static {p2, v5}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v7, v4

    :goto_39
    if-ge v7, v5, :cond_49

    invoke-virtual {p2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Lldo;

    iget-object v8, v8, Lldo;->a:Ljava/lang/String;

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_39

    :cond_49
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p2

    move v5, v4

    :goto_4e
    if-ge v5, p2, :cond_5c

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v5, v5, 0x1

    check-cast v7, Ljava/lang/String;

    invoke-virtual {p0, p1, v0, v1, v7}, Ljdo;->G0(Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;DLjava/lang/String;)V

    goto :goto_4e

    :cond_5c
    iget-object p1, p0, Ljdo;->v:Ld83;

    if-eqz p1, :cond_61

    move-object v6, p1

    :cond_61
    iget-object p1, v6, Ld83;->d:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    iget-object p2, v6, Ld83;->c:Ljava/util/List;

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    iget-object p2, v6, Ld83;->d:Ljava/lang/Object;

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    iget-object p2, v6, Ld83;->e:Ljava/lang/Object;

    check-cast p2, Ljava/util/TreeSet;

    invoke-virtual {p2}, Ljava/util/TreeSet;->clear()V

    iget-object p2, v6, Ld83;->b:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/undo/UndoBar;

    iget-object v0, p2, Lcom/opera/android/undo/UndoBar;->c:Lmgh;

    iget-object v0, v0, Lmgh;->b:Ljava/lang/Object;

    check-cast v0, Lmhk;

    iput v4, v0, Lmhk;->b:I

    iget-object v0, v0, Lmhk;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    invoke-virtual {p2, v4}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    invoke-virtual {v6, v4, p1}, Landroidx/recyclerview/widget/d;->notifyItemRangeRemoved(II)V

    iget-object p0, p0, Ljdo;->r:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, v3}, Lcom/opera/android/settings/SettingsManager;->Q(Ljava/lang/String;)V

    return-void

    :pswitch_9d
    check-cast p0, Lwyl;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lxi5;->a(Landroid/content/Context;)Lxi5;

    move-result-object p1

    iget-object p2, p1, Lxi5;->f:Lqy4;

    invoke-virtual {p2}, Lqy4;->d()V

    invoke-virtual {p1, v1, v2}, Lxi5;->g(J)V

    invoke-virtual {p0}, Lwyl;->H0()V

    return-void

    :pswitch_b3
    check-cast p0, Lcom/opera/android/settings/cleardata/StorageFragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p0

    const-string p1, "activity"

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/ActivityManager;

    invoke-virtual {p0}, Landroid/app/ActivityManager;->clearApplicationUserData()Z

    return-void

    :pswitch_c5
    check-cast p0, Lrn9;

    invoke-virtual {p0, v6}, Lrn9;->G([I)V

    return-void

    :pswitch_cb
    check-cast p0, Lknh;

    iget-object p1, p0, Lknh;->C:Lgnh;

    if-nez p1, :cond_d2

    move-object p1, v6

    :cond_d2
    iget-object p2, p1, Lgnh;->b:Lfnh;

    iget-object p2, p2, Lfnh;->f:Lcom/opera/android/browser/SessionStore;

    iget-wide v0, p2, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v0, v1}, LJ/N;->MMBIyHnn(J)V

    iget-object p1, p1, Lgnh;->i:Lpde;

    sget-object p2, Ll08;->a:Ll08;

    invoke-virtual {p1, p2}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, p0, Lknh;->B:Lvl6;

    if-eqz p0, :cond_e7

    move-object v6, p0

    :cond_e7
    invoke-virtual {v6}, Lvl6;->S()Z

    return-void

    :pswitch_eb
    check-cast p0, Landroidx/fragment/app/r;

    sget-object p1, Lywa;->g:[Lxtb;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :pswitch_f3
    check-cast p0, Ldda;

    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object p0

    iget-object p1, p0, Lcom/opera/android/history/f;->d:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Law0;

    new-instance p2, Lld9;

    const/16 v0, 0x14

    invoke-direct {p2, p0, v0}, Lld9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Law0;->a(Ljava/lang/Runnable;)V

    return-void

    :pswitch_10c
    check-cast p0, Ldm8;

    invoke-virtual {p0}, Ldm8;->G0()Ljava/util/HashSet;

    move-result-object p1

    invoke-static {p1}, Ldm8;->K0(Ljava/util/AbstractCollection;)V

    sget-object p1, Ls9g;->h:Ls9g;

    iget-object p1, p1, Ls9g;->c:Lvzk;

    sget-object p2, Lkag;->c:Lkag;

    invoke-virtual {p1, p2}, Lvzk;->E(Lkag;)Ljava/util/HashSet;

    move-result-object p1

    invoke-static {p1}, Ldm8;->K0(Ljava/util/AbstractCollection;)V

    iget-object p1, p0, Ldm8;->z:Lqmj;

    invoke-virtual {p1}, Lqmj;->G()V

    iget-object p0, p0, Ldm8;->A:Lqmj;

    invoke-virtual {p0}, Lqmj;->G()V

    return-void

    :pswitch_12d
    check-cast p0, Ll35;

    iget-object p0, p0, Ll35;->d:Ljava/lang/Object;

    check-cast p0, Lzu3;

    iget-object p0, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, v5, v6}, Lcom/opera/android/BrowserActivity;->l0(ZLjava/lang/Runnable;)V

    return-void

    :pswitch_13b
    check-cast p0, Lhy4;

    iget-boolean v0, p0, Lhy4;->c:Z

    if-nez v0, :cond_14f

    iput-boolean v5, p0, Lhy4;->c:Z

    iget-object p0, p0, Lhy4;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/passwordmanager/ChooseCredentialsDialogRequest;

    iget-wide v0, p0, Lcom/opera/android/browser/passwordmanager/ChooseCredentialsDialogRequest;->b:J

    invoke-static {v0, v1, p2}, LJ/N;->M2LTxUAH(JI)V

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    :cond_14f
    return-void

    :pswitch_150
    check-cast p0, Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz p0, :cond_157

    move-object v6, p0

    :cond_157
    invoke-virtual {v6}, Lk6l;->j()V

    return-void

    :pswitch_15b
    check-cast p0, Lm93;

    invoke-virtual {p0}, Lm93;->I0()V

    iget-object p0, p0, Lm93;->r:Lqmj;

    invoke-virtual {p0}, Lqmj;->G()V

    return-void

    :pswitch_166
    check-cast p0, Ljh3;

    iget-object p0, p0, Ljh3;->v:Ld83;

    iget-object p1, p0, Ld83;->b:Ljava/lang/Object;

    check-cast p1, La4g;

    if-eqz p1, :cond_1a4

    iget-object p1, p0, Ld83;->c:Ljava/util/List;

    if-eqz p1, :cond_1a4

    iget-object p2, p0, Ld83;->d:Ljava/lang/Object;

    check-cast p2, Lwth;

    if-eqz p2, :cond_17e

    iput-object v6, p2, Lwth;->b:Ljava/lang/Object;

    iput-object v6, p0, Ld83;->d:Ljava/lang/Object;

    :cond_17e
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iget-object p2, p0, Ld83;->c:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->clear()V

    iget-object p2, p0, Ld83;->b:Ljava/lang/Object;

    check-cast p2, La4g;

    iget-object v0, p2, La4g;->a:Ljava/util/List;

    :goto_18d
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1a1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v1, v5

    iget-wide v2, p2, La4g;->b:J

    invoke-static {v2, v3, v1}, LJ/N;->MvKxovNE(JI)V

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_18d

    :cond_1a1
    invoke-virtual {p0, v4, p1}, Landroidx/recyclerview/widget/d;->notifyItemRangeRemoved(II)V

    :cond_1a4
    return-void

    :pswitch_1a5
    check-cast p0, Lg01;

    invoke-static {}, LJ/N;->M4QvXpDD()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;

    invoke-static {p1}, LJ/N;->MNitnPWj(Ljava/lang/Object;)D

    move-result-wide v0

    const-class p2, Lorg/chromium/content_public/browser/SiteZoomInfo;

    invoke-static {p1, p2}, LJ/N;->MZV6nIgn(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Lorg/chromium/content_public/browser/SiteZoomInfo;

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    move v7, v4

    :goto_1bf
    array-length v8, p2

    if-ge v7, v8, :cond_1d2

    aget-object v8, p2, v7

    iget-object v9, v8, Lorg/chromium/content_public/browser/SiteZoomInfo;->a:Ljava/lang/String;

    iget-wide v10, v8, Lorg/chromium/content_public/browser/SiteZoomInfo;->b:D

    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    invoke-virtual {v2, v9, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v7, v7, 0x1

    goto :goto_1bf

    :cond_1d2
    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1da
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1ea

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {p1, v2, v0, v1}, LJ/N;->MvtzH5Ni(Ljava/lang/Object;Ljava/lang/Object;D)V

    goto :goto_1da

    :cond_1ea
    invoke-static {v6, v5}, Llx3;->a(Ljava/lang/String;Z)V

    invoke-static {v4, v6}, Lj14;->t(ZLyqd;)V

    const/4 p1, 0x3

    invoke-static {p1}, Lhj;->a(I)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1f9
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_209

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v4, p1, v0, v4}, Lhj;->b(IILjava/lang/String;Z)V

    goto :goto_1f9

    :cond_209
    iget-object p1, p0, Lg01;->w:Lqmj;

    invoke-virtual {p1}, Lqmj;->G()V

    invoke-static {}, LJ/N;->MgUu3OWK()V

    iget-object p1, p0, Lg01;->v:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, v3}, Lcom/opera/android/settings/SettingsManager;->Q(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "open_in_app_count"

    invoke-virtual {p0, p1, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    :pswitch_22c
    check-cast p0, Lwk;

    iget-object p1, p0, Lwk;->y:Lxi5;

    iget-object p2, p1, Lxi5;->e:Lqy4;

    invoke-virtual {p2}, Lqy4;->d()V

    invoke-virtual {p1, v1, v2}, Lxi5;->f(J)V

    invoke-virtual {p0}, Lwk;->H0()V

    return-void

    :pswitch_data_23c
    .packed-switch 0x0
        :pswitch_22c
        :pswitch_1a5
        :pswitch_166
        :pswitch_15b
        :pswitch_150
        :pswitch_13b
        :pswitch_12d
        :pswitch_10c
        :pswitch_f3
        :pswitch_eb
        :pswitch_cb
        :pswitch_c5
        :pswitch_b3
        :pswitch_9d
        :pswitch_14
    .end packed-switch
.end method
