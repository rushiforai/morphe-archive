.class public final Ltb9;
.super Lxb9;
.source "SourceFile"


# instance fields
.field public final m:Lvk2;

.field public final n:Lwun;

.field public final o:Lnb9;

.field private final p:Landroid/widget/TextView;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public final q:Landroid/widget/TextView;

.field public final r:Landroid/widget/TextView;

.field public final s:Landroid/widget/ImageView;

.field public t:Luun;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Ltcl;Landroid/view/View;Ljava/lang/String;Lrn9;Lvk2;Lwun;Lnb9;)V
    .registers 9

    invoke-direct/range {p0 .. p5}, Lxb9;-><init>(Lcom/opera/android/BrowserActivity;Ltcl;Landroid/view/View;Ljava/lang/String;Lrn9;)V

    iput-object p6, p0, Ltb9;->m:Lvk2;

    iput-object p7, p0, Ltb9;->n:Lwun;

    iput-object p8, p0, Ltb9;->o:Lnb9;

    sget-object p1, Lr5n;->a:Ljava/util/WeakHashMap;

    const p1, 0x7f0a06c5

    invoke-static {p3, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Ltb9;->p:Landroid/widget/TextView;

    const p2, 0x7f0a05ff

    invoke-static {p3, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Ltb9;->q:Landroid/widget/TextView;

    const p2, 0x7f0a02d0

    invoke-static {p3, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Ltb9;->r:Landroid/widget/TextView;

    const p2, 0x7f0a085d

    invoke-static {p3, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Ltb9;->s:Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Lxb9;->b0(Landroid/widget/TextView;)V

    return-void
.end method

.method public static bridge synthetic i0(Ltb9;)Landroid/widget/TextView;
    .registers 1

    iget-object p0, p0, Ltb9;->p:Landroid/widget/TextView;

    return-object p0
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 13

    invoke-super {p0, p1, p2}, Lxb9;->V(Lja2;Z)V

    move-object p2, p1

    check-cast p2, Ljb9;

    iget-object v0, p2, Ljb9;->e:Ljava/lang/String;

    iget-object v1, p2, Ljb9;->f:Ljava/lang/String;

    iget-object v2, p2, Ljb9;->h:Ljava/lang/String;

    iget-object v3, p2, Ljb9;->g:Ljava/lang/String;

    sget-object v4, Lp6l;->a:Lp6l;

    iget-object v5, p0, Ltb9;->n:Lwun;

    invoke-virtual {v5, v3, v4}, Lwun;->b(Ljava/lang/String;Lp6l;)Ltun;

    move-result-object v6

    const/4 v7, 0x0

    if-eqz v6, :cond_80

    invoke-virtual {v6}, Ltun;->a()Ljava/lang/String;

    move-result-object v8

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_2a

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_2a

    move-object v1, v8

    :cond_2a
    invoke-virtual {v6}, Ltun;->c()Ljava/lang/String;

    move-result-object v8

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_3b

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_3b

    move-object v2, v8

    :cond_3b
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_6f

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const-string v8, "www.youtube.com"

    invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5d

    const-string v8, "m.youtube.com"

    invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6e

    :cond_5d
    const-string v8, "v"

    invoke-virtual {v2, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6e

    const-string v8, "https://img.youtube.com/vi/"

    const-string v9, "/mqdefault.jpg"

    invoke-static {v8, v2, v9}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_6f

    :cond_6e
    move-object v2, v7

    :cond_6f
    :goto_6f
    invoke-virtual {v6}, Ltun;->e()Ljava/lang/String;

    move-result-object v8

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_80

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_80

    move-object v0, v8

    :cond_80
    const/4 v8, 0x1

    if-nez v2, :cond_98

    if-nez v6, :cond_98

    iget-object v6, p0, Ltb9;->t:Luun;

    if-eqz v6, :cond_8b

    iput-boolean v8, v6, Luun;->b:Z

    :cond_8b
    new-instance v6, Lesg;

    const/16 v9, 0x11

    invoke-direct {v6, p0, p1, v9}, Lesg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v5, v3, v4, v6}, Lwun;->a(Ljava/lang/String;Lp6l;Lzun;)Luun;

    move-result-object p1

    iput-object p1, p0, Ltb9;->t:Luun;

    :cond_98
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    iget-object v4, p0, Ltb9;->p:Landroid/widget/TextView;

    const/4 v5, 0x0

    const/16 v6, 0x8

    if-eqz p1, :cond_a7

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_af

    :cond_a7
    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Ltb9;->p:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_af
    iget-object p1, p0, Ltb9;->q:Landroid/widget/TextView;

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Lrb9;

    invoke-direct {v0, p0, p2, v5}, Lrb9;-><init>(Ltb9;Ljb9;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lrb9;

    invoke-direct {v0, p0, p2, v8}, Lrb9;-><init>(Ltb9;Ljb9;B)V

    iget-object v3, p0, Ltb9;->s:Landroid/widget/ImageView;

    invoke-virtual {v3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lsb9;

    invoke-direct {v0, p0, p2, v5}, Lsb9;-><init>(Ltb9;Ljb9;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    new-instance p1, Lsb9;

    invoke-direct {p1, p0, p2, v8}, Lsb9;-><init>(Ltb9;Ljb9;B)V

    invoke-virtual {v3, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    iget-object p2, p0, Ltb9;->r:Landroid/widget/TextView;

    if-eqz p1, :cond_e2

    invoke-virtual {p2, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_e8

    :cond_e2
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p2, v5}, Landroid/view/View;->setVisibility(I)V

    :goto_e8
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_f2

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    :cond_f2
    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    sget-object p1, Lyne;->b:Ldeg;

    invoke-virtual {p1, v2}, Ldeg;->i(Ljava/lang/String;)Ldwh;

    move-result-object p1

    iput-boolean v8, p1, Ldwh;->d:Z

    invoke-virtual {p1}, Ldwh;->a()V

    invoke-static {v2}, Lwqm;->r(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_10d

    iget-object p0, p0, Ltb9;->o:Lnb9;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    goto :goto_10f

    :cond_10d
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_10f
    invoke-virtual {p1, p0}, Ldwh;->m(Ljava/util/List;)V

    iget-object p0, p1, Ldwh;->b:Lgvh;

    iput-boolean v8, p0, Lgvh;->k:Z

    invoke-virtual {p1, v3, v7}, Ldwh;->g(Landroid/widget/ImageView;Ld94;)V

    return-void
.end method

.method public final Y()V
    .registers 3

    invoke-super {p0}, Lxb9;->Y()V

    iget-object v0, p0, Ltb9;->t:Luun;

    if-eqz v0, :cond_d

    const/4 v1, 0x1

    iput-boolean v1, v0, Luun;->b:Z

    const/4 v0, 0x0

    iput-object v0, p0, Ltb9;->t:Luun;

    :cond_d
    return-void
.end method

.method public final f0(Lja2;)V
    .registers 6

    iget-object v0, p0, Lxb9;->d:Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, La4h;->f(Landroid/content/Context;)Lnej;

    move-result-object v0

    new-instance v1, Lxq3;

    const/4 v2, 0x4

    const/4 v3, 0x0

    invoke-direct {v1, v2, p0, p1, v3}, Lxq3;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method
