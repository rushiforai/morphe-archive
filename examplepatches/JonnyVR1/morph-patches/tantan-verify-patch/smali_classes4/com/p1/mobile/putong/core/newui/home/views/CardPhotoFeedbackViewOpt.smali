.class public Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Landroid/view/View;

.field public e:Lv/VText;

.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Lcom/p1/mobile/putong/data/User;

.field public h:Landroid/view/View$OnClickListener;

.field public i:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->h:Landroid/view/View$OnClickListener;

    .line 10
    .line 11
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$b;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->i:Landroid/view/View$OnClickListener;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->h:Landroid/view/View$OnClickListener;

    .line 21
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->i:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->h:Landroid/view/View$OnClickListener;

    .line 24
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->i:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public static synthetic p(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->w(Lcom/p1/mobile/putong/data/User;Z)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->u(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onVisibilityChanged(Landroid/view/View;I)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->v()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public final u(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lm4;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final v()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->c:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->c:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->e:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->e:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->c:Lv/VText;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->h:Landroid/view/View$OnClickListener;

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->e:Lv/VText;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->i:Landroid/view/View$OnClickListener;

    .line 37
    .line 38
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    check-cast v3, Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 19
    .line 20
    const/4 v4, 0x1

    .line 21
    invoke-virtual {v1, v2, v3, v4, p2}, Ll/dkb;->b7(Ljava/lang/String;Ljava/lang/String;ZZ)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {v0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$c;

    .line 30
    .line 31
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$c;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;Lcom/p1/mobile/putong/data/User;)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Ll/km4;

    .line 35
    .line 36
    invoke-direct {p0}, Ll/km4;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method
