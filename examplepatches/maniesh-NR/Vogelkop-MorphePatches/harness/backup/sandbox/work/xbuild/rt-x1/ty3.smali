.class public final Lty3;
.super Liz4;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lty3;->a:B

    iput-object p1, p0, Lty3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final A(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 3

    iget-byte p1, p0, Lty3;->a:B

    packed-switch p1, :pswitch_data_26

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Lnz4;

    iget-object p1, p0, Lnz4;->e:Landroid/view/View;

    if-eqz p1, :cond_21

    iget-object v0, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v0, :cond_21

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    iget-object v0, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->J:Lxr5;

    if-ne p1, v0, :cond_21

    iget-object p1, p0, Lnz4;->e:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_21
    const/4 p1, 0x0

    iput-object p1, p0, Lnz4;->e:Landroid/view/View;

    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final B()V
    .registers 4

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_36

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb7l;

    iget-object v0, v0, Lb7l;->a:Ld7l;

    iget-object v1, v0, Ld7l;->g:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_24
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La2l;

    invoke-interface {v2, v0}, La2l;->I(Lb2l;)V

    goto :goto_24

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final C(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 4

    iget-byte v0, p0, Lty3;->a:B

    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_66

    return-void

    :sswitch_8
    check-cast p0, Lcom/opera/android/webapps/WebappActivity;

    sget p1, Lcom/opera/android/webapps/WebappActivity;->J:I

    invoke-virtual {p0}, Lcom/opera/android/webapps/WebappActivity;->h0()V

    return-void

    :sswitch_10
    check-cast p0, Lard;

    invoke-virtual {p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->p()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const-string v0, "\u25b6"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2b

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    :cond_2b
    iget-object v0, p0, Lard;->m:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_38

    iput-object p1, p0, Lard;->m:Ljava/lang/String;

    invoke-virtual {p0}, Lard;->i()V

    :cond_38
    return-void

    :sswitch_39
    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_41
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_65

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb7l;

    iget-object p1, p1, Lb7l;->a:Ld7l;

    iget-object v0, p1, Ld7l;->g:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_55
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_41

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, La2l;

    invoke-interface {v1, p1}, La2l;->p(Lb2l;)V

    goto :goto_55

    :cond_65
    return-void

    :sswitch_data_66
    .sparse-switch
        0x0 -> :sswitch_39
        0x7 -> :sswitch_10
        0xa -> :sswitch_8
    .end sparse-switch
.end method

.method public final D(J)V
    .registers 6

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_36

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb7l;

    iget-object v0, v0, Lb7l;->a:Ld7l;

    iget-object v1, v0, Ld7l;->g:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_24
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La2l;

    invoke-interface {v2, v0, p1, p2}, La2l;->g(Lb2l;J)V

    goto :goto_24

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final E()V
    .registers 4

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_36

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb7l;

    iget-object v0, v0, Lb7l;->a:Ld7l;

    iget-object v1, v0, Ld7l;->g:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_24
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La2l;

    invoke-interface {v2, v0}, La2l;->x(Lb2l;)V

    goto :goto_24

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final G()V
    .registers 2

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Leq9;

    invoke-virtual {p0}, Leq9;->e()V

    return-void

    :pswitch_data_e
    .packed-switch 0x5
        :pswitch_6
    .end packed-switch
.end method

.method public final H(Lcom/opera/android/browser/chromium/ChromiumContent;Lqwi;)V
    .registers 5

    iget-byte p1, p0, Lty3;->a:B

    packed-switch p1, :pswitch_data_36

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_34

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb7l;

    iget-object p1, p1, Lb7l;->a:Ld7l;

    iget-object v0, p1, Ld7l;->g:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_24
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_10

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, La2l;

    invoke-interface {v1, p1, p2}, La2l;->i(Lb2l;Lqwi;)V

    goto :goto_24

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final I(Lorg/chromium/content_public/browser/WebContents;Lorg/chromium/content_public/browser/WebContents;)V
    .registers 14

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_88

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object v0, p0, Luy3;->d:Lvzk;

    iget-object v1, p0, Luy3;->e:Lcom/opera/android/browser/TabInfo;

    iget v1, v1, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->m()Z

    move-result p1

    iget-object v2, v0, Lvzk;->c:Ljava/lang/Object;

    check-cast v2, Lnx3;

    invoke-virtual {v2}, Lnx3;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_26

    :goto_24
    move v4, v1

    goto :goto_28

    :cond_26
    const/4 v1, 0x0

    goto :goto_24

    :goto_28
    new-instance v2, Lcom/opera/android/browser/TabInfo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v2 .. v8}, Lcom/opera/android/browser/TabInfo;-><init>(IIJJ)V

    iget-object v1, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v1, Lhz4;

    invoke-virtual {v1, p1, p2}, Lhz4;->a(ZLorg/chromium/content_public/browser/WebContents;)Lcom/opera/android/browser/chromium/ChromiumContent;

    move-result-object p1

    invoke-virtual {v0, v2, p1}, Lvzk;->t(Lcom/opera/android/browser/TabInfo;Lcom/opera/android/browser/chromium/ChromiumContent;)Luy3;

    move-result-object v5

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_46
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_87

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb7l;

    iget-object p1, p1, Lb7l;->a:Ld7l;

    iget-object v4, p1, Ld7l;->h:Lxbf;

    new-instance v3, Ld7l;

    iget-object p2, v4, Lxbf;->e:Ljava/lang/Object;

    move-object v6, p2

    check-cast v6, Ltw2;

    iget-object p2, v4, Lxbf;->f:Ljava/lang/Object;

    move-object v7, p2

    check-cast v7, Laal;

    iget-object p2, v4, Lxbf;->c:Ljava/lang/Object;

    move-object v8, p2

    check-cast v8, Liga;

    iget-object p2, v4, Lxbf;->d:Ljava/lang/Object;

    move-object v9, p2

    check-cast v9, Lrc6;

    sget-object v10, Llqm;->d:Llqm;

    invoke-direct/range {v3 .. v10}, Ld7l;-><init>(Lxbf;Luy3;Ltw2;Laal;Liga;Lrc6;Llqm;)V

    iget-object p2, p1, Ld7l;->g:Lh7f;

    invoke-static {p2, p2}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p2

    :goto_77
    invoke-virtual {p2}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_46

    invoke-virtual {p2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, La2l;

    invoke-interface {v0, p1, v3}, La2l;->a(Lb2l;Ld7l;)V

    goto :goto_77

    :cond_87
    return-void

    :pswitch_data_88
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final J(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_36

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb7l;

    iget-object v0, v0, Lb7l;->a:Ld7l;

    iget-object v1, v0, Ld7l;->g:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_24
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La2l;

    invoke-interface {v2, v0, p1, p2}, La2l;->O(Lb2l;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_24

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final L(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 2

    iget-byte p1, p0, Lty3;->a:B

    packed-switch p1, :pswitch_data_10

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Laeb;

    iget-object p0, p0, Laeb;->f:Lbp;

    const/4 p1, 0x0

    iput-object p1, p0, Lbp;->b:Ljava/lang/Object;

    return-void

    :pswitch_data_10
    .packed-switch 0x6
        :pswitch_6
    .end packed-switch
.end method

.method public final d(Z)V
    .registers 5

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_36

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb7l;

    iget-object v0, v0, Lb7l;->a:Ld7l;

    iget-object v1, v0, Ld7l;->g:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_24
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La2l;

    invoke-interface {v2, v0, p1}, La2l;->D(Lb2l;Z)V

    goto :goto_24

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final e(Lorg/chromium/content_public/browser/MediaSession;)V
    .registers 3

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_22

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Lard;

    iget-object v0, p0, Lard;->j:Lzqd;

    if-eqz v0, :cond_12

    iget-object v0, v0, Lzqd;->a:Lorg/chromium/content_public/browser/MediaSession;

    if-eq p1, v0, :cond_21

    :cond_12
    invoke-virtual {p0}, Lard;->a()V

    if-eqz p1, :cond_1e

    new-instance v0, Lzqd;

    invoke-direct {v0, p0, p1, p1}, Lzqd;-><init>(Lard;Lorg/chromium/content_public/browser/MediaSession;Lorg/chromium/content_public/browser/MediaSession;)V

    iput-object v0, p0, Lard;->j:Lzqd;

    :cond_1e
    invoke-virtual {p0}, Lard;->f()V

    :cond_21
    return-void

    :pswitch_data_22
    .packed-switch 0x7
        :pswitch_6
    .end packed-switch
.end method

.method public final f(J)V
    .registers 6

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_36

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb7l;

    iget-object v0, v0, Lb7l;->a:Ld7l;

    iget-object v1, v0, Ld7l;->g:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_24
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La2l;

    invoke-interface {v2, v0, p1, p2}, La2l;->U(Lb2l;J)V

    goto :goto_24

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final g(Z)V
    .registers 5

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_36

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb7l;

    iget-object v0, v0, Lb7l;->a:Ld7l;

    iget-object v1, v0, Ld7l;->g:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_24
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La2l;

    invoke-interface {v2, v0, p1}, La2l;->J(Lb2l;Z)V

    goto :goto_24

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final j(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 3

    iget-byte v0, p0, Lty3;->a:B

    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_44

    :pswitch_7
    return-void

    :pswitch_8
    check-cast p0, Lcom/opera/android/media/WebPictureInPictureActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :pswitch_e
    check-cast p0, Ltgi;

    iget-object p0, p0, Ltgi;->b:Ljava/util/LinkedHashSet;

    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void

    :pswitch_16
    check-cast p0, Laeb;

    iget-object p1, p0, Laeb;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, p0, Laeb;->e:Lty3;

    invoke-virtual {p1, v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->y(Liz4;)V

    iget-object p1, p0, Laeb;->g:Lzdb;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lzdb;->b(Lorg/chromium/content_public/browser/WebContents;)V

    iput-object v0, p0, Laeb;->g:Lzdb;

    return-void

    :pswitch_28
    check-cast p0, Lmlf;

    iget-object p1, p0, Lmlf;->b:Ljava/lang/Object;

    check-cast p1, Laeb;

    iget-object p1, p1, Laeb;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lmlf;->f:Ljava/lang/Object;

    check-cast p0, Lty3;

    invoke-virtual {p1, p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->y(Liz4;)V

    return-void

    :pswitch_38
    check-cast p0, Lnz4;

    iget-object p1, p0, Lnz4;->j:Lb7f;

    if-eqz p1, :cond_43

    iget-object p0, p0, Lnz4;->k:Lwa;

    invoke-virtual {p1, p0}, Lb7f;->a(Lorg/chromium/base/Callback;)V

    :cond_43
    return-void

    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_38
        :pswitch_7
        :pswitch_28
        :pswitch_7
        :pswitch_7
        :pswitch_16
        :pswitch_7
        :pswitch_e
        :pswitch_8
    .end packed-switch
.end method

.method public final k(I)V
    .registers 3

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_14

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/webapps/WebappActivity;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/webapps/WebappActivity;->z:Ljava/lang/Integer;

    invoke-virtual {p0}, Lcom/opera/android/webapps/WebappActivity;->h0()V

    return-void

    :pswitch_data_14
    .packed-switch 0xa
        :pswitch_6
    .end packed-switch
.end method

.method public final l(Lcom/opera/android/browser/chromium/ChromiumContent;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 9

    iget-byte v0, p0, Lty3;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_ea

    :pswitch_a
    return-void

    :pswitch_b
    check-cast p0, Lcom/opera/android/webapps/WebappActivity;

    sget p1, Lcom/opera/android/webapps/WebappActivity;->J:I

    invoke-virtual {p0}, Lcom/opera/android/webapps/WebappActivity;->g0()V

    return-void

    :pswitch_13
    iget-boolean p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz p2, :cond_1c

    check-cast p0, Ltgi;

    invoke-virtual {p0, p1}, Ltgi;->a(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    :cond_1c
    return-void

    :pswitch_1d
    check-cast p0, Lard;

    iget-boolean p1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz p1, :cond_65

    iget-boolean p1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez p1, :cond_65

    iget-object p1, p0, Lard;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->r()Ljava/lang/String;

    move-result-object p1

    :try_start_2d
    invoke-static {p1, v2}, LJ/N;->MR6Af3ZS(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;
    :try_end_33
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_2d .. :try_end_33} :catch_34

    move-object p1, p2

    :catch_34
    iput-boolean v1, p0, Lard;->i:Z

    iput-object p1, p0, Lard;->h:Ljava/lang/String;

    iput-object v3, p0, Lard;->f:Landroid/graphics/Bitmap;

    iput-object v3, p0, Lard;->e:Landroid/graphics/Bitmap;

    iput-object v3, p0, Lard;->n:Lorg/chromium/services/media_session/MediaMetadata;

    invoke-virtual {p0}, Lard;->b()Lorg/chromium/services/media_session/MediaMetadata;

    move-result-object p1

    iput-object p1, p0, Lard;->o:Lorg/chromium/services/media_session/MediaMetadata;

    iput-object v3, p0, Lard;->q:Ljava/util/HashSet;

    invoke-virtual {p0}, Lard;->e()Z

    move-result p1

    if-nez p1, :cond_65

    iget-object p1, p0, Lard;->l:Likd;

    iget-object p2, p0, Lard;->h:Ljava/lang/String;

    iput-object p2, p1, Likd;->c:Ljava/lang/String;

    iget-object p2, p0, Lard;->f:Landroid/graphics/Bitmap;

    iput-object p2, p1, Likd;->g:Landroid/graphics/Bitmap;

    iget-object p2, p0, Lard;->e:Landroid/graphics/Bitmap;

    iput-object p2, p1, Likd;->h:Landroid/graphics/Bitmap;

    iget-object p2, p0, Lard;->o:Lorg/chromium/services/media_session/MediaMetadata;

    iput-object p2, p1, Likd;->a:Lorg/chromium/services/media_session/MediaMetadata;

    iget-object p2, p0, Lard;->q:Ljava/util/HashSet;

    iput-object p2, p1, Likd;->m:Ljava/util/HashSet;

    invoke-virtual {p0}, Lard;->g()V

    :cond_65
    return-void

    :pswitch_66
    check-cast p0, Laeb;

    iget-object p1, p0, Laeb;->g:Lzdb;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-boolean v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz v0, :cond_9c

    iget-object v0, p1, Lzdb;->b:Laeb;

    invoke-virtual {v0}, Laeb;->b()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v4

    invoke-interface {v4}, Lorg/chromium/content_public/browser/WebContents;->q()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object v4

    iget-boolean v5, p1, Lzdb;->f:Z

    if-eqz v5, :cond_83

    invoke-interface {v4}, Lorg/chromium/content_public/browser/NavigationController;->o()V

    goto :goto_98

    :cond_83
    iget-boolean v5, p1, Lzdb;->g:Z

    if-eqz v5, :cond_98

    iget-object v0, v0, Laeb;->f:Lbp;

    iget v0, v0, Lbp;->a:I

    invoke-virtual {p1}, Lzdb;->e()I

    move-result v5

    sub-int/2addr v5, v1

    :goto_90
    if-le v5, v0, :cond_98

    invoke-interface {v4, v5}, Lorg/chromium/content_public/browser/NavigationController;->j(I)Z

    add-int/lit8 v5, v5, -0x1

    goto :goto_90

    :cond_98
    :goto_98
    iput-boolean v2, p1, Lzdb;->f:Z

    iput-boolean v2, p1, Lzdb;->g:Z

    :cond_9c
    iget-boolean p1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->t:Z

    if-eqz p1, :cond_a4

    iget-object p0, p0, Laeb;->f:Lbp;

    iput-object v3, p0, Lbp;->b:Ljava/lang/Object;

    :cond_a4
    return-void

    :pswitch_a5
    iget-wide p1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->s:J

    check-cast p0, Lmlf;

    iget-object v0, p0, Lmlf;->e:Ljava/lang/Object;

    check-cast v0, Lol5;

    if-eqz v0, :cond_bc

    iget-wide v1, p0, Lmlf;->a:J

    cmp-long p1, v1, p1

    if-eqz p1, :cond_bc

    sget-object p1, Lhjm;->b:Lhjm;

    invoke-virtual {v0, p1}, Ld63;->finish(Lhjm;)V

    iput-object v3, p0, Lmlf;->e:Ljava/lang/Object;

    :cond_bc
    return-void

    :pswitch_bd
    iget-boolean p1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez p1, :cond_ca

    check-cast p0, Luz4;

    iput v2, p0, Luz4;->f:I

    iget-object p0, p0, Luz4;->a:Lcom/opera/android/widget/ThumbScroller;

    invoke-virtual {p0, v2, v2}, Lcom/opera/android/widget/ThumbScroller;->d(ZZ)V

    :cond_ca
    return-void

    :pswitch_cb
    check-cast p0, Luy3;

    iget-boolean p1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz p1, :cond_d3

    iput-boolean v1, p0, Luy3;->f:Z

    :cond_d3
    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_d9
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_e9

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb7l;

    invoke-virtual {p1, p2}, Lb7l;->a(Lorg/chromium/content_public/browser/NavigationHandle;)V

    goto :goto_d9

    :cond_e9
    return-void

    :pswitch_data_ea
    .packed-switch 0x0
        :pswitch_cb
        :pswitch_a
        :pswitch_bd
        :pswitch_a5
        :pswitch_a
        :pswitch_a
        :pswitch_66
        :pswitch_1d
        :pswitch_13
        :pswitch_a
        :pswitch_b
    .end packed-switch
.end method

.method public final m(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 4

    iget-byte p1, p0, Lty3;->a:B

    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    sparse-switch p1, :sswitch_data_5a

    return-void

    :sswitch_8
    check-cast p0, Lcom/opera/android/webapps/WebappActivity;

    iget-object p0, p0, Lcom/opera/android/webapps/WebappActivity;->B:Luuj;

    iget-object p1, p0, Luuj;->c:Ljava/lang/Object;

    check-cast p1, Landroid/view/ViewGroup;

    if-eqz p1, :cond_2b

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p0}, Luuj;->k()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Lssi;

    invoke-direct {v0, p0}, Lssi;-><init>(Luuj;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    :cond_2b
    return-void

    :sswitch_2c
    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_34
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_58

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb7l;

    iget-object p1, p1, Lb7l;->a:Ld7l;

    iget-object v0, p1, Ld7l;->g:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_48
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_34

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, La2l;

    invoke-interface {v1, p1}, La2l;->u(Lb2l;)V

    goto :goto_48

    :cond_58
    return-void

    nop

    :sswitch_data_5a
    .sparse-switch
        0x0 -> :sswitch_2c
        0xa -> :sswitch_8
    .end sparse-switch
.end method

.method public final n(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 2

    iget-byte p1, p0, Lty3;->a:B

    packed-switch p1, :pswitch_data_22

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_20

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb7l;

    invoke-virtual {p1}, Lb7l;->b()V

    goto :goto_10

    :cond_20
    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final o(Lcom/opera/android/browser/chromium/ChromiumContent;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 6

    iget-byte v0, p0, Lty3;->a:B

    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_4c

    return-void

    :sswitch_8
    check-cast p0, Lcom/opera/android/media/WebPictureInPictureActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :sswitch_e
    iget-wide p1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->s:J

    check-cast p0, Lmlf;

    iget-object v0, p0, Lmlf;->e:Ljava/lang/Object;

    check-cast v0, Lol5;

    if-eqz v0, :cond_26

    iget-wide v1, p0, Lmlf;->a:J

    cmp-long p1, v1, p1

    if-eqz p1, :cond_26

    sget-object p1, Lhjm;->b:Lhjm;

    invoke-virtual {v0, p1}, Ld63;->finish(Lhjm;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lmlf;->e:Ljava/lang/Object;

    :cond_26
    return-void

    :sswitch_27
    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-static {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->fromWebContents(Lorg/chromium/content_public/browser/WebContents;)Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    move-result-object p0

    invoke-virtual {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->r()V

    return-void

    :sswitch_33
    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_3b
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_4b

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb7l;

    invoke-virtual {p1, p2}, Lb7l;->c(Lorg/chromium/content_public/browser/NavigationHandle;)V

    goto :goto_3b

    :cond_4b
    return-void

    :sswitch_data_4c
    .sparse-switch
        0x0 -> :sswitch_33
        0x1 -> :sswitch_27
        0x3 -> :sswitch_e
        0x9 -> :sswitch_8
    .end sparse-switch
.end method

.method public final p(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 5

    iget-byte p1, p0, Lty3;->a:B

    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_46

    return-void

    :pswitch_8
    check-cast p0, Lnz4;

    iget-object p0, p0, Lnz4;->d:Lcy3;

    iget-object p1, p0, Lcy3;->d:Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;

    iget-boolean v0, p1, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->b:Z

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcy3;->e:Lssi;

    if-eqz v0, :cond_19

    invoke-virtual {p1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_19
    iget-object v0, p0, Lcy3;->e:Lssi;

    if-nez v0, :cond_26

    new-instance v0, Lssi;

    const/16 v1, 0x8

    invoke-direct {v0, p0, v1}, Lssi;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcy3;->e:Lssi;

    :cond_26
    const-wide/16 v1, 0x1f4

    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2b
    return-void

    :pswitch_2c
    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_34
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_44

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb7l;

    invoke-virtual {p1}, Lb7l;->d()V

    goto :goto_34

    :cond_44
    return-void

    nop

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_2c
        :pswitch_8
    .end packed-switch
.end method

.method public final q(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 14

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_3c

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3b

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb7l;

    iget-object v1, v0, Lb7l;->a:Ld7l;

    iget-object v1, v1, Ld7l;->g:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_24
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, La2l;

    iget-object v4, v0, Lb7l;->a:Ld7l;

    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    move-object v8, p4

    invoke-interface/range {v3 .. v8}, La2l;->m(Ld7l;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_24

    :cond_3b
    return-void

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final r(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V
    .registers 5

    iget-byte v0, p0, Lty3;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_3e

    return-void

    :sswitch_9
    check-cast p0, Leq9;

    iget-object v0, p0, Leq9;->a:Ld37;

    iput-object p1, v0, Ld37;->g:Ljava/lang/Object;

    iput-boolean p2, v0, Ld37;->b:Z

    invoke-virtual {v0, p1, v1}, Ld37;->j(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V

    invoke-static {p1, v1}, Ld37;->C(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V

    iget-boolean p1, v0, Ld37;->a:Z

    iget-object p2, p0, Leq9;->c:Lh7f;

    invoke-static {p2, p2}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p2

    :goto_1f
    invoke-virtual {p2}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_30

    invoke-virtual {p2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liq9;

    const/4 v1, 0x1

    invoke-interface {v0, v1, p1}, Liq9;->F(ZZ)V

    goto :goto_1f

    :cond_30
    invoke-virtual {p0}, Leq9;->e()V

    return-void

    :sswitch_34
    check-cast p0, Luz4;

    iput v1, p0, Luz4;->f:I

    iget-object p0, p0, Luz4;->a:Lcom/opera/android/widget/ThumbScroller;

    invoke-virtual {p0, v1, v1}, Lcom/opera/android/widget/ThumbScroller;->d(ZZ)V

    return-void

    :sswitch_data_3e
    .sparse-switch
        0x2 -> :sswitch_34
        0x5 -> :sswitch_9
    .end sparse-switch
.end method

.method public final s(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 9

    iget-byte v0, p0, Lty3;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_52

    return-void

    :sswitch_9
    check-cast p0, Leq9;

    iget-object v0, p0, Leq9;->a:Ld37;

    iget-object v2, v0, Ld37;->h:Ljava/lang/Object;

    check-cast v2, Lhq9;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_27

    iget-object v2, v2, Lhq9;->i:Lxy0;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    const/4 v5, 0x2

    invoke-virtual {v2, v5}, Landroid/os/Handler;->removeMessages(I)V

    const/4 v6, 0x3

    invoke-virtual {v2, v6}, Landroid/os/Handler;->removeMessages(I)V

    invoke-virtual {v2, v5}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    iput-object v4, v0, Ld37;->h:Ljava/lang/Object;

    :cond_27
    iput-object v4, v0, Ld37;->g:Ljava/lang/Object;

    invoke-static {p1, v3}, Ld37;->C(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V

    iget-boolean p1, v0, Ld37;->a:Z

    iget-object v0, p0, Leq9;->c:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_34
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_44

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Liq9;

    invoke-interface {v2, v1, p1}, Liq9;->F(ZZ)V

    goto :goto_34

    :cond_44
    invoke-virtual {p0}, Leq9;->e()V

    return-void

    :sswitch_48
    check-cast p0, Luz4;

    iput v1, p0, Luz4;->f:I

    iget-object p0, p0, Luz4;->a:Lcom/opera/android/widget/ThumbScroller;

    invoke-virtual {p0, v1, v1}, Lcom/opera/android/widget/ThumbScroller;->d(ZZ)V

    return-void

    :sswitch_data_52
    .sparse-switch
        0x2 -> :sswitch_48
        0x5 -> :sswitch_9
    .end sparse-switch
.end method

.method public final t(III)V
    .registers 5

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_30

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Lzg;

    iget v0, p0, Lzg;->a:I

    if-ne p1, v0, :cond_2e

    iget-object p0, p0, Lzg;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/bar/FindInPage;

    if-eqz p0, :cond_2e

    iput p3, p0, Lcom/opera/android/bar/FindInPage;->e:I

    iput p2, p0, Lcom/opera/android/bar/FindInPage;->f:I

    invoke-virtual {p0}, Lcom/opera/android/bar/FindInPage;->g()V

    iget-boolean p1, p0, Lcom/opera/android/bar/FindInPage;->g:Z

    if-nez p1, :cond_2e

    iget p1, p0, Lcom/opera/android/bar/FindInPage;->e:I

    const/4 p2, 0x1

    if-le p1, p2, :cond_2e

    const p1, 0x7f0a0494

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lq9n;->u(Landroid/view/View;)Z

    :cond_2e
    return-void

    nop

    :pswitch_data_30
    .packed-switch 0x4
        :pswitch_6
    .end packed-switch
.end method

.method public final v(Lyqa;)V
    .registers 5

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_36

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb7l;

    iget-object v0, v0, Lb7l;->a:Ld7l;

    iget-object v1, v0, Ld7l;->g:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_24
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La2l;

    invoke-interface {v2, v0, p1}, La2l;->b(Lb2l;Lyqa;)V

    goto :goto_24

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final w(I)V
    .registers 5

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_36

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb7l;

    iget-object v0, v0, Lb7l;->a:Ld7l;

    iget-object v1, v0, Ld7l;->g:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_24
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La2l;

    invoke-interface {v2, v0, p1}, La2l;->l(Lb2l;I)V

    goto :goto_24

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final x(I)V
    .registers 5

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_36

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb7l;

    iget-object v0, v0, Lb7l;->a:Ld7l;

    iget-object v1, v0, Ld7l;->g:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_24
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La2l;

    invoke-interface {v2, v0, p1}, La2l;->V(Lb2l;I)V

    goto :goto_24

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final y(II)V
    .registers 6

    iget-byte v0, p0, Lty3;->a:B

    packed-switch v0, :pswitch_data_36

    return-void

    :pswitch_6
    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_10
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb7l;

    iget-object v0, v0, Lb7l;->a:Ld7l;

    iget-object v1, v0, Ld7l;->g:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_24
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La2l;

    invoke-interface {v2, v0, p1, p2}, La2l;->e(Lb2l;II)V

    goto :goto_24

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final z(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 10

    iget-byte v0, p0, Lty3;->a:B

    iget-object p0, p0, Lty3;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_e4

    return-void

    :sswitch_8
    check-cast p0, Lcom/opera/android/media/WebPictureInPictureActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :sswitch_e
    check-cast p0, Lard;

    iget-object p0, p0, Lard;->u:Lk03;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lk03;->a:J

    const-wide/16 v4, 0x0

    cmp-long p1, v2, v4

    const-wide/16 v6, 0x3e8

    if-ltz p1, :cond_22

    sub-long/2addr v0, v2

    goto :goto_2f

    :cond_22
    iget-wide v2, p0, Lk03;->b:J

    cmp-long p1, v2, v4

    if-ltz p1, :cond_83

    sub-long/2addr v0, v2

    cmp-long p1, v0, v6

    if-gtz p1, :cond_83

    iget-wide v0, p0, Lk03;->c:J

    :goto_2f
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lk03;->a:J

    iput-wide v2, p0, Lk03;->b:J

    iget-boolean p1, p0, Lk03;->d:Z

    if-nez p1, :cond_83

    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->hasVisibleActivities()Z

    move-result p1

    if-nez p1, :cond_83

    const/4 p1, 0x1

    iput-boolean p1, p0, Lk03;->d:Z

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    div-long/2addr v0, v6

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const-string v0, "bps_played_s"

    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->getStateForApplication()I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "bps_app_state"

    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p1, Lt8;->a:Landroid/content/Context;

    const-string v0, "power"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    if-eqz p1, :cond_77

    invoke-virtual {p1}, Landroid/os/PowerManager;->isInteractive()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    const-string v0, "bps_screen_on"

    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_77
    new-instance p1, Lyo8;

    const-string v0, "BackgroundPlaybackStopped"

    const-string v1, "renderer_gone"

    invoke-direct {p1, v0, v1}, Lyo8;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p1, p0}, Lks3;->E(Ljava/lang/Throwable;Ljava/util/Map;)V

    :cond_83
    return-void

    :sswitch_84
    iget-boolean p1, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->q:Z

    if-nez p1, :cond_b6

    check-cast p0, Lnz4;

    iget-object p1, p0, Lnz4;->e:Landroid/view/View;

    if-nez p1, :cond_b6

    iget-object p1, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p1, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->J:Lxr5;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lnz4;->d:Lcy3;

    sget v2, Lcom/opera/android/browser/chromium/TabCrashView;->h:I

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v2, 0x7f0d00c7

    const/4 v3, 0x0

    invoke-virtual {v0, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/opera/android/browser/chromium/TabCrashView;

    iput-object v1, v2, Lcom/opera/android/browser/chromium/TabCrashView;->a:Lcy3;

    iput-object v0, p0, Lnz4;->e:Landroid/view/View;

    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {p0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_b6
    return-void

    :sswitch_b7
    check-cast p0, Luy3;

    iget-object p0, p0, Luy3;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_bf
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_e3

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb7l;

    iget-object p1, p1, Lb7l;->a:Ld7l;

    iget-object v0, p1, Ld7l;->g:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_d3
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_bf

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, La2l;

    invoke-interface {v1, p1}, La2l;->f(Lb2l;)V

    goto :goto_d3

    :cond_e3
    return-void

    :sswitch_data_e4
    .sparse-switch
        0x0 -> :sswitch_b7
        0x1 -> :sswitch_84
        0x7 -> :sswitch_e
        0x9 -> :sswitch_8
    .end sparse-switch
.end method
