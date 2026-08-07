.class public Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$c;
    }
.end annotation


# instance fields
.field public a:Landroid/view/TextureView;

.field public b:Lv/VDraweeView;

.field public c:Lv/VProgressBar;

.field public d:Lv/VLinear;

.field public e:Lv/VText;

.field public f:Lv/VProgressBar;

.field public g:Lv/VText;

.field public h:Lv/VFrame_ColorFilter;

.field public i:Landroid/widget/ImageView;

.field public j:Lv/VProgressBar;

.field public k:Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$c;

.field public final l:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ll/ie80$b;",
            ">;"
        }
    .end annotation
.end field

.field public m:Landroid/view/Surface;

.field public n:Lcom/p1/mobile/putong/data/Video;

.field public o:Z

.field public p:Ll/ie80;

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Z

.field public u:Landroid/view/View$OnClickListener;

.field public v:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$c;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$c;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->k:Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$c;

    .line 10
    .line 11
    new-instance p1, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->l:Ljava/util/Set;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->t:Z

    .line 20
    .line 21
    new-instance p1, Ll/bh80;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Ll/bh80;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->u:Landroid/view/View$OnClickListener;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->w()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 32
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 33
    new-instance p1, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$c;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$c;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->k:Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$c;

    .line 34
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->l:Ljava/util/Set;

    const/4 p1, 0x0

    .line 35
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->t:Z

    .line 36
    new-instance p1, Ll/bh80;

    invoke-direct {p1, p0}, Ll/bh80;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->u:Landroid/view/View$OnClickListener;

    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->w()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->B()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->y()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->A(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->l:Ljava/util/Set;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->r:Z

    return p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)Ll/ie80;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->p:Ll/ie80;

    return-object p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->q:Z

    return p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->v:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->m:Landroid/view/Surface;

    return-object p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)Lcom/p1/mobile/putong/data/Video;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->n:Lcom/p1/mobile/putong/data/Video;

    return-object p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->o:Z

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;Landroid/view/Surface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->m:Landroid/view/Surface;

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->u(I)V

    return-void
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->v(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->E(Z)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->x()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->C()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->D()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic B()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->m:Landroid/view/Surface;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->k:Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$c;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->s:Z

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    sget v0, Lcom/p1/mobile/putong/common/R$string;->h1:I

    .line 18
    .line 19
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->k:Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$c;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$c;->d()V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->l:Ljava/util/Set;

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ll/ie80$b;

    .line 44
    .line 45
    invoke-interface {v0}, Ll/ie80$b;->d()V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    return-void
.end method

.method public C()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->v:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->o:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->p:Ll/ie80;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->p:Ll/ie80;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/ie80;->pause()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public D()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->E(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final E(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->m:Landroid/view/Surface;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->v:Ljava/lang/Runnable;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/eh80;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/eh80;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->v:Ljava/lang/Runnable;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->v:Ljava/lang/Runnable;

    .line 21
    .line 22
    const-wide/16 v1, 0x2710

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->p:Ll/ie80;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->n:Lcom/p1/mobile/putong/data/Video;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->o:Z

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->m:Landroid/view/Surface;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->p:Ll/ie80;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->k:Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$c;

    .line 57
    .line 58
    invoke-interface {v0, p0, p1}, Ll/ie80;->d(Ll/ie80$a;Z)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->k:Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$c;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$c;->c()V

    .line 65
    .line 66
    .line 67
    :cond_3
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/data/Video;Z)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->G()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->n:Lcom/p1/mobile/putong/data/Video;

    .line 9
    .line 10
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->b:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_5

    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->q:Z

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->e:Lv/VText;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->v(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->g:Lv/VText;

    .line 38
    .line 39
    iget v2, p1, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 40
    .line 41
    const/high16 v3, 0x447a0000    # 1000.0f

    .line 42
    .line 43
    mul-float/2addr v2, v3

    .line 44
    float-to-int v2, v2

    .line 45
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->v(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->c:Lv/VProgressBar;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->f:Lv/VProgressBar;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 60
    .line 61
    .line 62
    :cond_1
    if-nez p2, :cond_5

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_3

    .line 81
    .line 82
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 83
    .line 84
    const-string v0, "normal"

    .line 85
    .line 86
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-eqz p1, :cond_2

    .line 91
    .line 92
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->b:Lv/VDraweeView;

    .line 95
    .line 96
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->aspectRatioBiggest()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-virtual {p1, v0, p2}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_2
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->b:Lv/VDraweeView;

    .line 107
    .line 108
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {p1, v0, p2}, Ll/fsb0;->i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_3
    iget-object p2, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 115
    .line 116
    const-string v0, "http"

    .line 117
    .line 118
    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    if-nez p2, :cond_4

    .line 123
    .line 124
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->b:Lv/VDraweeView;

    .line 127
    .line 128
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {p2, v0, p1}, Ll/fsb0;->i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->b:Lv/VDraweeView;

    .line 135
    .line 136
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    sget v0, Ll/b9c0;->a:I

    .line 141
    .line 142
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 147
    .line 148
    .line 149
    :cond_5
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public G()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->v:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->o:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->p:Ll/ie80;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->p:Ll/ie80;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/ie80;->stop()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/RelativeLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->t:Z

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->s()V

    .line 9
    .line 10
    .line 11
    :cond_0
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
    const/4 p1, 0x4

    .line 5
    if-ne p2, p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->p:Ll/ie80;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->p:Ll/ie80;

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-interface {p0, p1}, Ll/ie80;->f(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/mh80;->b(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r(Ll/ie80$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->l:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final s()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-lez v0, :cond_5

    .line 10
    .line 11
    if-lez v1, :cond_5

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->n:Lcom/p1/mobile/putong/data/Video;

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :cond_0
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 27
    .line 28
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 35
    .line 36
    iget v3, v2, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 37
    .line 38
    if-lez v3, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->n:Lcom/p1/mobile/putong/data/Video;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 44
    .line 45
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_2

    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->n:Lcom/p1/mobile/putong/data/Video;

    .line 52
    .line 53
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 54
    .line 55
    iget v3, v2, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 56
    .line 57
    if-lez v3, :cond_2

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    new-instance v2, Lcom/p1/mobile/putong/data/Dimension;

    .line 61
    .line 62
    const/16 v3, 0x168

    .line 63
    .line 64
    const/16 v4, 0x280

    .line 65
    .line 66
    invoke-direct {v2, v3, v4}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 67
    .line 68
    .line 69
    :goto_0
    iget v3, v2, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 70
    .line 71
    int-to-float v3, v3

    .line 72
    iget v2, v2, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 73
    .line 74
    int-to-float v2, v2

    .line 75
    div-float/2addr v3, v2

    .line 76
    int-to-float v2, v0

    .line 77
    int-to-float v4, v1

    .line 78
    div-float v5, v2, v4

    .line 79
    .line 80
    cmpl-float v5, v5, v3

    .line 81
    .line 82
    if-lez v5, :cond_3

    .line 83
    .line 84
    mul-float/2addr v4, v3

    .line 85
    float-to-int v0, v4

    .line 86
    goto :goto_1

    .line 87
    :cond_3
    div-float/2addr v2, v3

    .line 88
    float-to-int v1, v2

    .line 89
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->b:Lv/VDraweeView;

    .line 90
    .line 91
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 96
    .line 97
    if-ne v3, v0, :cond_4

    .line 98
    .line 99
    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 100
    .line 101
    if-eq v3, v1, :cond_5

    .line 102
    .line 103
    :cond_4
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 104
    .line 105
    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->b:Lv/VDraweeView;

    .line 108
    .line 109
    new-instance v1, Ll/yg80;

    .line 110
    .line 111
    invoke-direct {v1, p0}, Ll/yg80;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 115
    .line 116
    .line 117
    :cond_5
    :goto_2
    return-void
.end method

.method public setLoopMode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->r:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPlayer(Ll/ie80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->p:Ll/ie80;

    .line 2
    .line 3
    return-void
.end method

.method public setProgressBarsEnabled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->q:Z

    .line 2
    .line 3
    return-void
.end method

.method public setRadius(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->a:Landroid/view/TextureView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$b;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$b;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;F)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->a:Landroid/view/TextureView;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->a:Landroid/view/TextureView;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p1, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->b:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->b:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public setVideo(Lcom/p1/mobile/putong/data/Video;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->F(Lcom/p1/mobile/putong/data/Video;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public t(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->n:Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 23
    .line 24
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 25
    .line 26
    if-lez v1, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->n:Lcom/p1/mobile/putong/data/Video;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->n:Lcom/p1/mobile/putong/data/Video;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 42
    .line 43
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 44
    .line 45
    if-lez v1, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    new-instance v0, Lcom/p1/mobile/putong/data/Dimension;

    .line 49
    .line 50
    const/16 v1, 0x168

    .line 51
    .line 52
    const/16 v2, 0x280

    .line 53
    .line 54
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 55
    .line 56
    .line 57
    :goto_0
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 58
    .line 59
    int-to-float v1, v1

    .line 60
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 61
    .line 62
    int-to-float v0, v0

    .line 63
    div-float/2addr v1, v0

    .line 64
    int-to-float v0, p1

    .line 65
    int-to-float v2, p2

    .line 66
    div-float v3, v0, v2

    .line 67
    .line 68
    cmpl-float v3, v3, v1

    .line 69
    .line 70
    if-lez v3, :cond_3

    .line 71
    .line 72
    mul-float/2addr v2, v1

    .line 73
    float-to-int p1, v2

    .line 74
    goto :goto_1

    .line 75
    :cond_3
    div-float/2addr v0, v1

    .line 76
    float-to-int p2, v0

    .line 77
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->b:Lv/VDraweeView;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 84
    .line 85
    if-ne v1, p1, :cond_5

    .line 86
    .line 87
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 88
    .line 89
    if-eq v1, p2, :cond_4

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_4
    :goto_2
    return-void

    .line 93
    :cond_5
    :goto_3
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 94
    .line 95
    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->b:Lv/VDraweeView;

    .line 98
    .line 99
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final u(I)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 4
    .line 5
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-ne p1, v3, :cond_0

    .line 22
    .line 23
    const/4 v3, 0x1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    move v3, v0

    .line 26
    :goto_1
    invoke-static {v2, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return-void
.end method

.method public final v(I)Ljava/lang/String;
    .locals 5

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->n:Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 4
    .line 5
    float-to-int p0, p0

    .line 6
    div-int/lit8 p0, p0, 0x3c

    .line 7
    .line 8
    div-int/lit8 p0, p0, 0x3c

    .line 9
    .line 10
    if-lez p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    :goto_0
    new-instance v0, Ljava/text/DecimalFormat;

    .line 16
    .line 17
    const-string v1, "00"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    div-int/lit16 p1, p1, 0x3e8

    .line 23
    .line 24
    rem-int/lit8 v1, p1, 0x3c

    .line 25
    .line 26
    div-int/lit8 p1, p1, 0x3c

    .line 27
    .line 28
    rem-int/lit8 v2, p1, 0x3c

    .line 29
    .line 30
    div-int/lit8 p1, p1, 0x3c

    .line 31
    .line 32
    new-instance v3, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    const/16 v4, 0x3a

    .line 38
    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    :cond_1
    if-eqz p0, :cond_2

    .line 48
    .line 49
    int-to-long p0, v2

    .line 50
    invoke-virtual {v0, p0, p1}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    :goto_1
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    int-to-long p0, v1

    .line 66
    invoke-virtual {v0, p0, p1}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0
.end method

.method public final w()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->u:Landroid/view/View$OnClickListener;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/hh80;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/hh80;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->a:Landroid/view/TextureView;

    .line 28
    .line 29
    new-instance v1, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$a;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView$a;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public x()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic y()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->x()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->C()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->D()V

    .line 12
    .line 13
    .line 14
    return-void
.end method
