.class public final synthetic Lzt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ldqi;Leqi;)V
    .registers 3

    const/16 p1, 0xd

    iput-byte p1, p0, Lzt;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lzt;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 10
    iput-byte p2, p0, Lzt;->a:B

    iput-object p1, p0, Lzt;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 13

    iget-byte v0, p0, Lzt;->a:B

    const/4 v1, 0x4

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object p0, p0, Lzt;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1be

    check-cast p0, Lexn;

    invoke-virtual {p0}, Lexn;->l0()V

    invoke-virtual {p0}, Lyzi;->h0()V

    return v3

    :pswitch_13
    check-cast p0, Ly6n;

    iget-object v0, p0, Ly6n;->c:Laln;

    if-eqz v0, :cond_1e

    iget-object p0, p0, Ly6n;->b:Ltjn;

    invoke-interface {p0, p1, v0}, Ltjn;->m(Landroid/view/View;Laln;)V

    :cond_1e
    return v3

    :pswitch_1f
    check-cast p0, Ljava/lang/String;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "clipboard"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    const-string v1, "id"

    invoke-static {v1, p0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "Copied to clipboard"

    invoke-static {p0, p1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return v3

    :pswitch_44
    check-cast p0, Lh5l;

    iget-object p1, p0, Lh5l;->c:Lypd;

    invoke-virtual {p1, p0}, Lypd;->H(Landroidx/recyclerview/widget/i;)Z

    move-result p0

    return p0

    :pswitch_4d
    check-cast p0, Lnwf;

    new-instance v0, Lbbl;

    invoke-direct {v0, p0, p1, v1}, Lbbl;-><init>(Lnwf;Landroid/view/View;B)V

    return v3

    :pswitch_55
    check-cast p0, Leqi;

    iget-object v0, p0, Leqi;->a:Ljava/lang/String;

    if-nez v0, :cond_5f

    iget-object v0, p0, Leqi;->b:Ljava/lang/String;

    if-eqz v0, :cond_69

    :cond_5f
    new-instance v0, Lxw;

    const/16 v1, 0xa

    invoke-direct {v0, v1, p0, p1, v2}, Lxw;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v0, p1}, Lo73;->p(Landroid/view/View;)V

    :cond_69
    return v3

    :pswitch_6a
    check-cast p0, Lhim;

    invoke-interface {p0, p1}, Lhim;->a(Landroid/view/View;)V

    return v3

    :pswitch_70
    check-cast p0, Lzoc;

    iget-object p1, p0, Lzoc;->j:Lwmc;

    if-eqz p1, :cond_7f

    iget-object v0, p0, Lzoc;->d:Lokc;

    iget-object p0, p0, Lzoc;->c:Lmlc;

    iget-object p0, p0, Lmlc;->f:Landroid/view/View;

    invoke-virtual {v0, p0, p1}, Lokc;->a(Landroid/view/View;Lzmc;)V

    :cond_7f
    return v3

    :pswitch_80
    check-cast p0, Lhoc;

    iget-object p1, p0, Lhoc;->h:Lqmc;

    if-eqz p1, :cond_91

    iget-object v0, p0, Lhoc;->d:Lokc;

    iget-object p0, p0, Lhoc;->c:Ly83;

    iget-object p0, p0, Ly83;->g:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {v0, p0, p1}, Lokc;->a(Landroid/view/View;Lzmc;)V

    :cond_91
    return v3

    :pswitch_92
    check-cast p0, Lfoc;

    iget-object p1, p0, Lfoc;->g:Lpmc;

    if-eqz p1, :cond_a1

    iget-object v0, p0, Lfoc;->d:Lokc;

    iget-object p0, p0, Lfoc;->c:Lalc;

    iget-object p0, p0, Lalc;->b:Landroid/view/View;

    invoke-virtual {v0, p0, p1}, Lokc;->a(Landroid/view/View;Lzmc;)V

    :cond_a1
    return v3

    :pswitch_a2
    check-cast p0, Lznc;

    iget-object p1, p0, Lznc;->h:Lnmc;

    if-eqz p1, :cond_b3

    iget-object v0, p0, Lznc;->d:Lokc;

    iget-object p0, p0, Lznc;->c:Ly83;

    iget-object p0, p0, Ly83;->g:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {v0, p0, p1}, Lokc;->a(Landroid/view/View;Lzmc;)V

    :cond_b3
    return v3

    :pswitch_b4
    check-cast p0, Lxkc;

    iget-object p1, p0, Lxkc;->g:Lkmc;

    if-eqz p1, :cond_c3

    iget-object v0, p0, Lxkc;->d:Lokc;

    iget-object p0, p0, Lxkc;->c:Lalc;

    iget-object p0, p0, Lalc;->b:Landroid/view/View;

    invoke-virtual {v0, p0, p1}, Lokc;->a(Landroid/view/View;Lzmc;)V

    :cond_c3
    return v3

    :pswitch_c4
    check-cast p0, Lwb9;

    iget-object p0, p0, Lxb9;->h:Lcom/opera/android/flow/MyFlowMessageRoot;

    invoke-virtual {p0}, Landroid/view/View;->performLongClick()Z

    move-result p0

    return p0

    :pswitch_cd
    check-cast p0, Lh85;

    iget-object p1, p0, Lh85;->e:Lypd;

    invoke-virtual {p1, p0}, Lypd;->H(Landroidx/recyclerview/widget/i;)Z

    move-result p0

    return p0

    :pswitch_d6
    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->a:Lhx3;

    iget-object v0, v0, Lhx3;->a:Lxbf;

    iget-object v0, v0, Lxbf;->e:Ljava/lang/Object;

    check-cast v0, Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lqln;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v6, v0, Ld6j;->c:Lx5f;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->O()Leej;

    move-result-object v7

    new-instance v8, Lwt3;

    const/4 v0, 0x6

    invoke-direct {v8, p0, v0}, Lwt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const-class v0, Ld8j;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    move-object v9, p0

    check-cast v9, Ld8j;

    sget-object p0, Lpk5;->n:Lxq3;

    if-nez p0, :cond_15a

    invoke-virtual {v8}, Lwt3;->get()Ljava/lang/Object;

    move-result-object p0

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_15a

    iget-object p0, v5, Lqln;->f:Lami;

    iget-object p0, p0, Lami;->e:Ljava/lang/Object;

    check-cast p0, Lvq8;

    invoke-virtual {p0}, Lvq8;->i()Z

    move-result p0

    if-nez p0, :cond_136

    iget-object p0, v5, Lqln;->f:Lami;

    new-instance v4, Li61;

    const/4 v10, 0x7

    invoke-direct/range {v4 .. v10}, Li61;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v4}, Lami;->r(Ljava/lang/Runnable;)V

    goto :goto_15a

    :cond_136
    new-instance p0, Lcpj;

    const/16 v0, 0x9

    invoke-direct {p0, v0}, Lcpj;-><init>(B)V

    new-instance v4, Lpk5;

    move-object v8, v7

    move-object v7, v9

    iget-object v9, v8, Leej;->c:Lgjm;

    invoke-direct/range {v4 .. v9}, Lpk5;-><init>(Lqln;Lx5f;Ld8j;Leej;Lgjm;)V

    move-object v7, v8

    new-instance v0, Lxq3;

    const/16 v1, 0xf

    invoke-direct {v0, v1, v4, p0, v2}, Lxq3;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object p0, v7, Leej;->a:Lnej;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, v1}, Lr22;->b(Ljjm;Lijm;)V

    sput-object v0, Lpk5;->n:Lxq3;

    :cond_15a
    :goto_15a
    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    sget-object p1, Lph0;->t:Lph0;

    invoke-virtual {p0, p1}, Lx5f;->f0(Lph0;)V

    return v3

    :pswitch_166
    check-cast p0, Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return v3

    :pswitch_16c
    check-cast p0, Lqy0;

    iget-object p1, p0, Lsy0;->f:Lfy0;

    check-cast p1, Lgy0;

    if-eqz p1, :cond_17f

    iget-object v0, p0, Lyzi;->b:Ltzi;

    iget-object v0, v0, Ltzi;->a:Le5d;

    invoke-virtual {p1}, Lgy0;->b()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Le5d;->d(J)V

    :cond_17f
    invoke-virtual {p0}, Lqy0;->h0()V

    return v3

    :pswitch_183
    check-cast p0, Lcu;

    iget-object v0, p0, Lcu;->e:Lis;

    if-eqz v0, :cond_19b

    sget v1, Leu;->b:I

    iget-object v1, p0, Lcu;->d:Lbs;

    invoke-interface {v1}, Lbs;->f()Lcom/opera/android/StatusBarDrawingFrameLayout;

    move-result-object v1

    new-instance v2, Lx2;

    const/4 v4, 0x5

    invoke-direct {v2, p0, v0, v4}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1, p1, v2}, Lx7d;->B(Landroid/view/ViewGroup;Landroid/view/View;Lkotlin/jvm/functions/Function0;)V

    move v2, v3

    :cond_19b
    return v2

    :pswitch_19c
    check-cast p0, Lau;

    iget-object v0, p0, Lau;->e:Lis;

    if-eqz v0, :cond_1bd

    iget-object v4, v0, Lis;->c:Lst;

    iget-object v4, v4, Lst;->j:Lrt;

    iget-object v4, v4, Lrt;->b:Lht;

    sget-object v5, Lht;->c:Lht;

    if-eq v4, v5, :cond_1bd

    sget v2, Leu;->b:I

    iget-object v2, p0, Lau;->d:Lbs;

    invoke-interface {v2}, Lbs;->f()Lcom/opera/android/StatusBarDrawingFrameLayout;

    move-result-object v2

    new-instance v4, Lx2;

    invoke-direct {v4, p0, v0, v1}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, p1, v4}, Lx7d;->B(Landroid/view/ViewGroup;Landroid/view/View;Lkotlin/jvm/functions/Function0;)V

    move v2, v3

    :cond_1bd
    return v2

    :pswitch_data_1be
    .packed-switch 0x0
        :pswitch_19c
        :pswitch_183
        :pswitch_16c
        :pswitch_166
        :pswitch_d6
        :pswitch_cd
        :pswitch_c4
        :pswitch_b4
        :pswitch_a2
        :pswitch_92
        :pswitch_80
        :pswitch_70
        :pswitch_6a
        :pswitch_55
        :pswitch_4d
        :pswitch_44
        :pswitch_1f
        :pswitch_13
    .end packed-switch
.end method
