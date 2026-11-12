.class public final synthetic Lkw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldkj;
.implements Lwgb;
.implements Ln5o;
.implements Lrll;
.implements Lurg;
.implements Lfua;
.implements Lpsk;


# instance fields
.field public final synthetic a:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;)V
    .registers 2

    iput-object p1, p0, Lkw0;->a:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lorg/chromium/components/messages/MessageWrapper;Landroid/content/Context;)V
    .registers 3

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lkw0;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 10

    const/4 v0, 0x0

    new-array v0, v0, [Ln6h;

    new-instance v2, Lwzg;

    const/4 v1, 0x0

    const/4 v3, 0x4

    const-class v4, Lrbn;

    invoke-direct {v2, v1, v4, v3}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    const-string v1, "highlight_active"

    const/4 v4, 0x1

    invoke-virtual {v3, v1, v4}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    new-instance v1, Lzhj;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/4 v4, 0x2

    const/16 v5, 0x1003

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v8}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    iget-object p0, p0, Lkw0;->a:Landroid/content/Context;

    invoke-virtual {v1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method

.method public final b(Lev4;)Lqsk;
    .registers 9

    iget-object v0, p1, Lev4;->e:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    iget-object p1, p1, Lev4;->f:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Le04;

    if-eqz v3, :cond_1c

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result p1

    if-eqz p1, :cond_1c

    new-instance v1, Lyo9;

    iget-object v2, p0, Lkw0;->a:Landroid/content/Context;

    const/4 v5, 0x1

    const/4 v6, 0x1

    invoke-direct/range {v1 .. v6}, Lyo9;-><init>(Landroid/content/Context;Ljava/lang/String;Le04;ZZ)V

    return-object v1

    :cond_1c
    const-string p0, "Must set a non-null database name to a configuration that uses the no backup directory."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Ljava/lang/String;

    const/4 v0, 0x0

    iget-object p0, p0, Lkw0;->a:Landroid/content/Context;

    invoke-static {p0, p1, v0}, Llcp;->F(Landroid/content/Context;Ljava/lang/String;Z)V

    const-string p1, "Data set to clipboard"

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final get()Lpne;
    .registers 2

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lkw0;->a:Landroid/content/Context;

    invoke-static {p0}, Lcqp;->h0(Landroid/content/Context;)Lpne;

    move-result-object p0

    return-object p0
.end method

.method public final getValue()Ljava/lang/Object;
    .registers 3

    sget v0, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;->f:I

    const v0, 0x7f0402c4

    const v1, 0x7f06063b

    iget-object p0, p0, Lkw0;->a:Landroid/content/Context;

    invoke-static {v0, p0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final i()Landroid/graphics/drawable/Drawable;
    .registers 3

    const v0, 0x7f0804c3

    iget-object p0, p0, Lkw0;->a:Landroid/content/Context;

    invoke-static {v0, p0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1, v0, p0}, Lddh;->p(ZLandroid/graphics/drawable/Drawable;Landroid/content/Context;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p0

    return-object p0
.end method

.method public final test(Ljava/lang/Object;)Z
    .registers 2

    iget-object p0, p0, Lkw0;->a:Landroid/content/Context;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Lw8h;->o(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method
