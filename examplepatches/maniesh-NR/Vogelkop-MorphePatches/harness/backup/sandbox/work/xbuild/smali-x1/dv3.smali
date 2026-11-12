.class public final Ldv3;
.super Ly08;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;B)V
    .registers 3

    iput-byte p2, p0, Ldv3;->a:B

    iput-object p1, p0, Ldv3;->b:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final G(Lb2l;)V
    .registers 4

    iget-byte v0, p0, Ldv3;->a:B

    packed-switch v0, :pswitch_data_20

    return-void

    :pswitch_6
    iget-object v0, p0, Ldv3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v1, v0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v1, :cond_d

    const/4 v1, 0x0

    :cond_d
    iget-object v1, v1, Lk6l;->w:Lxg;

    invoke-virtual {v1, p0}, Lxg;->b(La2l;)V

    invoke-virtual {v0}, Ldx3;->M()Llg;

    move-result-object p0

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->j0()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Llg;->e(J)Z

    return-void

    :pswitch_data_20
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final Q(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 4

    iget-byte v0, p0, Ldv3;->a:B

    packed-switch v0, :pswitch_data_42

    return-void

    :pswitch_6
    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p1

    const-string v0, "article_id"

    invoke-static {p1, v0}, Lcom/opera/android/browser/UrlMangler;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_40

    iget-object p1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p1

    const-string p2, "startpage"

    invoke-static {p2}, Lwqm;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_40

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Ldv3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_40

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lx5f;->l(I)V

    :cond_40
    return-void

    nop

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final e(Lb2l;II)V
    .registers 7

    iget-byte v0, p0, Ldv3;->a:B

    packed-switch v0, :pswitch_data_54

    return-void

    :pswitch_6
    iget-object p0, p0, Ldv3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->a1:Lzyk;

    const/4 v1, 0x3

    if-ne p2, v1, :cond_53

    if-eqz p3, :cond_53

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->f:Laal;

    new-instance p2, Lglj;

    const v1, 0x7f140d9c

    const/16 v2, 0x9c4

    invoke-direct {p2, v1, v2}, Lglj;-><init>(II)V

    const/4 v1, 0x0

    invoke-virtual {p0, p2, p1, v1}, Laal;->S(Lo93;Lb2l;Z)V

    const/4 p0, 0x1

    if-eq p3, p0, :cond_3f

    const/4 p0, 0x2

    if-ne p3, p0, :cond_53

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmu6;

    move-object p2, p1

    check-cast p2, Ld7l;

    iget-object p2, p2, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p2

    sget-object p3, Ljo0;->c:Ljo0;

    invoke-virtual {p0, p2, p1, p3}, Lmu6;->b(Ljava/lang/String;Lb2l;Ljo0;)V

    goto :goto_53

    :cond_3f
    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmu6;

    move-object p2, p1

    check-cast p2, Ld7l;

    iget-object p2, p2, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p2

    sget-object p3, Ljo0;->b:Ljo0;

    invoke-virtual {p0, p2, p1, p3}, Lmu6;->b(Ljava/lang/String;Lb2l;Ljo0;)V

    :cond_53
    :goto_53
    return-void

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method
