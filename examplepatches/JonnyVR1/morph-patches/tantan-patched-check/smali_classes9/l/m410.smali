.class public Ll/m410;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/ViewGroup;

.field public b:Landroid/view/TextureView;

.field public c:Z

.field public final d:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field public e:I

.field public f:I

.field public g:Z

.field public h:Landroid/view/Surface;

.field public i:I

.field public j:Ll/b30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/b30<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/m410;->i:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/m410;->j:Ll/b30;

    .line 9
    .line 10
    new-instance v0, Ll/m410$b;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/m410$b;-><init>(Ll/m410;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/m410;->k:Ljava/lang/Runnable;

    .line 16
    .line 17
    new-instance v0, Ll/l410;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/l410;-><init>(Ll/m410;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/m410;->d:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a(Ll/m410;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m410;->o()V

    return-void
.end method

.method public static bridge synthetic b(Ll/m410;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/m410;->i:I

    return p0
.end method

.method public static bridge synthetic c(Ll/m410;)Ll/b30;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m410;->j:Ll/b30;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/m410;)Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m410;->h:Landroid/view/Surface;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/m410;Landroid/view/Surface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m410;->h:Landroid/view/Surface;

    return-void
.end method

.method public static bridge synthetic f(Ll/m410;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m410;->p()Z

    move-result p0

    return p0
.end method

.method public static h(Landroid/content/Context;Landroid/view/Window;)Z
    .locals 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/view/Window;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/view/Window;->getWindowManager()Landroid/view/WindowManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Landroid/graphics/Point;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/4 v0, 0x2

    .line 30
    iget p0, p0, Landroid/content/res/Configuration;->orientation:I

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    const/4 v3, 0x1

    .line 34
    if-ne v0, p0, :cond_1

    .line 35
    .line 36
    const p0, 0x1020002

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iget p1, v1, Landroid/graphics/Point;->x:I

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eq p1, p0, :cond_0

    .line 50
    .line 51
    return v3

    .line 52
    :cond_0
    return v2

    .line 53
    :cond_1
    new-instance p0, Landroid/graphics/Rect;

    .line 54
    .line 55
    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, p0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 59
    .line 60
    .line 61
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 62
    .line 63
    iget p1, v1, Landroid/graphics/Point;->y:I

    .line 64
    .line 65
    if-eq p0, p1, :cond_2

    .line 66
    .line 67
    return v3

    .line 68
    :cond_2
    return v2
.end method


# virtual methods
.method public final g()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/m410;->k:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 7
    .line 8
    iget-object v1, p0, Ll/m410;->k:Ljava/lang/Runnable;

    .line 9
    .line 10
    const-wide/16 v2, 0x7d0

    .line 11
    .line 12
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Ll/v2t;->c:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "first CTYP: "

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget v2, p0, Ll/m410;->i:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v2, ", size = "

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v2, p0, Ll/m410;->e:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v2, " x "

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget p0, p0, Ll/m410;->f:I

    .line 45
    .line 46
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/m410;->i()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/m410;->d:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/m410;->b:Landroid/view/TextureView;

    .line 3
    .line 4
    return-void
.end method

.method public l()F
    .locals 1

    .line 1
    iget v0, p0, Ll/m410;->f:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Ll/m410;->e:I

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    int-to-float p0, p0

    .line 10
    int-to-float v0, v0

    .line 11
    div-float/2addr p0, v0

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public n(Landroid/content/Context;Ll/pcj;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/pcj<",
            "Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/m410;->i()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/view/TextureView;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/m410;->b:Landroid/view/TextureView;

    .line 10
    .line 11
    iget-object p1, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 16
    .line 17
    sget v2, Ll/bnl0;->e:I

    .line 18
    .line 19
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Ll/m410;->b:Landroid/view/TextureView;

    .line 26
    .line 27
    new-instance v0, Ll/m410$a;

    .line 28
    .line 29
    invoke-direct {v0, p0, p2}, Ll/m410$a;-><init>(Ll/m410;Ll/pcj;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic o()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/m410;->y(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final p()Z
    .locals 5

    .line 1
    iget v0, p0, Ll/m410;->e:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    const/high16 v1, 0x3f800000    # 1.0f

    .line 5
    .line 6
    mul-float/2addr v0, v1

    .line 7
    iget v2, p0, Ll/m410;->f:I

    .line 8
    .line 9
    int-to-float v2, v2

    .line 10
    div-float/2addr v0, v2

    .line 11
    iget p0, p0, Ll/m410;->i:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, 0x1

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    cmpg-float p0, v0, v1

    .line 18
    .line 19
    if-gez p0, :cond_0

    .line 20
    .line 21
    return v3

    .line 22
    :cond_0
    return v2

    .line 23
    :cond_1
    if-ne p0, v3, :cond_3

    .line 24
    .line 25
    cmpl-float p0, v0, v1

    .line 26
    .line 27
    if-lez p0, :cond_2

    .line 28
    .line 29
    return v3

    .line 30
    :cond_2
    return v2

    .line 31
    :cond_3
    const/4 v4, 0x2

    .line 32
    if-ne p0, v4, :cond_6

    .line 33
    .line 34
    cmpl-float p0, v0, v1

    .line 35
    .line 36
    if-gtz p0, :cond_5

    .line 37
    .line 38
    cmpg-float p0, v0, v1

    .line 39
    .line 40
    if-gez p0, :cond_4

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_4
    return v2

    .line 44
    :cond_5
    :goto_0
    return v3

    .line 45
    :cond_6
    const/4 v4, 0x3

    .line 46
    if-ne p0, v4, :cond_8

    .line 47
    .line 48
    cmpl-float p0, v0, v1

    .line 49
    .line 50
    if-nez p0, :cond_7

    .line 51
    .line 52
    return v3

    .line 53
    :cond_7
    return v2

    .line 54
    :cond_8
    return v3
.end method

.method public q(Landroid/content/Context;Landroid/view/ViewGroup;Ll/pcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/view/ViewGroup;",
            "Ll/pcj<",
            "Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/m410;->i()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/m410;->k()V

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-object v0, p0, Ll/m410;->d:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 14
    .line 15
    invoke-virtual {p2, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1, p3}, Ll/m410;->n(Landroid/content/Context;Ll/pcj;)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    invoke-virtual {p0, p1}, Ll/m410;->x(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Ll/m410;->i:I

    .line 3
    .line 4
    iget-object v0, p0, Ll/m410;->k:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/m410;->j()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Ll/m410;->f:I

    .line 14
    .line 15
    iput v0, p0, Ll/m410;->e:I

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Ll/m410;->h:Landroid/view/Surface;

    .line 19
    .line 20
    return-void
.end method

.method public final s(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v1, p0, Ll/m410;->c:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Ll/bnl0;->I(Landroid/content/Context;)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    sub-int/2addr p1, v1

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 33
    .line 34
    invoke-static {}, Ll/ynp0;->p()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-direct {v0, v1, p1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 39
    .line 40
    .line 41
    :cond_1
    invoke-static {}, Ll/ynp0;->p()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 46
    .line 47
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 48
    .line 49
    iget-object p0, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public t(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/m410;->i:I

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/m410;->g()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/m410;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public v(Landroid/view/ViewGroup;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p0, Ll/m410;->d:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/m410;->i()V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/m410;->b:Landroid/view/TextureView;

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 25
    .line 26
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 27
    .line 28
    sget v2, Ll/bnl0;->e:I

    .line 29
    .line 30
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 31
    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {v0, p1, v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    const/4 p1, 0x1

    .line 38
    invoke-virtual {p0, p1}, Ll/m410;->y(Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public w(Ll/b30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/b30<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/m410;->j:Ll/b30;

    .line 2
    .line 3
    return-void
.end method

.method public x(Z)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_c

    .line 4
    .line 5
    iget-object v1, p0, Ll/m410;->b:Landroid/view/TextureView;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_4

    .line 10
    .line 11
    :cond_0
    iget v1, p0, Ll/m410;->e:I

    .line 12
    .line 13
    if-lez v1, :cond_c

    .line 14
    .line 15
    iget v1, p0, Ll/m410;->f:I

    .line 16
    .line 17
    if-gtz v1, :cond_1

    .line 18
    .line 19
    goto/16 :goto_4

    .line 20
    .line 21
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 26
    .line 27
    iget-object v1, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 34
    .line 35
    iget v2, p0, Ll/m410;->e:I

    .line 36
    .line 37
    int-to-float v2, v2

    .line 38
    iget v3, p0, Ll/m410;->f:I

    .line 39
    .line 40
    int-to-float v3, v3

    .line 41
    div-float/2addr v2, v3

    .line 42
    int-to-float v3, v0

    .line 43
    int-to-float v4, v1

    .line 44
    div-float v5, v3, v4

    .line 45
    .line 46
    sub-float v6, v2, v5

    .line 47
    .line 48
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    float-to-double v6, v6

    .line 53
    const-wide v8, 0x3eb0c6f7a0b5ed8dL    # 1.0E-6

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    cmpg-double v6, v6, v8

    .line 59
    .line 60
    if-gez v6, :cond_2

    .line 61
    .line 62
    move v3, v0

    .line 63
    :goto_0
    move v4, v1

    .line 64
    goto :goto_2

    .line 65
    :cond_2
    cmpl-float v6, v2, v5

    .line 66
    .line 67
    if-gtz v6, :cond_4

    .line 68
    .line 69
    const v6, 0x3f4ccccd    # 0.8f

    .line 70
    .line 71
    .line 72
    cmpl-float v6, v5, v6

    .line 73
    .line 74
    if-lez v6, :cond_3

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_3
    div-float/2addr v3, v2

    .line 78
    float-to-int v3, v3

    .line 79
    move v4, v3

    .line 80
    move v3, v0

    .line 81
    goto :goto_2

    .line 82
    :cond_4
    :goto_1
    mul-float/2addr v4, v2

    .line 83
    float-to-int v3, v4

    .line 84
    goto :goto_0

    .line 85
    :goto_2
    iget v6, p0, Ll/m410;->i:I

    .line 86
    .line 87
    const/4 v7, 0x3

    .line 88
    if-eq v6, v7, :cond_5

    .line 89
    .line 90
    const/16 v8, 0x64

    .line 91
    .line 92
    if-ne v6, v8, :cond_6

    .line 93
    .line 94
    :cond_5
    invoke-static {}, Ll/ynp0;->p()I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    invoke-static {}, Ll/ynp0;->p()I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    iget-boolean v6, p0, Ll/m410;->g:Z

    .line 103
    .line 104
    if-eqz v6, :cond_6

    .line 105
    .line 106
    move v3, v0

    .line 107
    move v4, v1

    .line 108
    :cond_6
    if-nez p1, :cond_7

    .line 109
    .line 110
    if-ne v3, v0, :cond_7

    .line 111
    .line 112
    if-eq v4, v1, :cond_c

    .line 113
    .line 114
    :cond_7
    iget-object p1, p0, Ll/m410;->b:Landroid/view/TextureView;

    .line 115
    .line 116
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 121
    .line 122
    iput v3, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 123
    .line 124
    iput v4, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 125
    .line 126
    const/4 v6, 0x0

    .line 127
    iput v6, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 128
    .line 129
    const/16 v8, 0x11

    .line 130
    .line 131
    iput v8, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 132
    .line 133
    int-to-float v3, v3

    .line 134
    int-to-float v4, v4

    .line 135
    div-float/2addr v3, v4

    .line 136
    const/high16 v4, 0x3f800000    # 1.0f

    .line 137
    .line 138
    cmpl-float v3, v3, v4

    .line 139
    .line 140
    const v4, 0x800003

    .line 141
    .line 142
    .line 143
    if-lez v3, :cond_9

    .line 144
    .line 145
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 146
    .line 147
    int-to-float v3, v0

    .line 148
    div-float/2addr v3, v2

    .line 149
    float-to-int v3, v3

    .line 150
    iput v3, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 151
    .line 152
    iget-boolean v3, p0, Ll/m410;->g:Z

    .line 153
    .line 154
    if-eqz v3, :cond_8

    .line 155
    .line 156
    iput v6, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :cond_8
    invoke-static {v6}, Ll/fct;->a(Z)I

    .line 160
    .line 161
    .line 162
    move-result v3

    .line 163
    iput v3, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 164
    .line 165
    iput v4, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 166
    .line 167
    iget v3, p0, Ll/m410;->i:I

    .line 168
    .line 169
    if-nez v3, :cond_9

    .line 170
    .line 171
    const/high16 v3, 0x43390000    # 185.0f

    .line 172
    .line 173
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    iput v3, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 178
    .line 179
    :cond_9
    :goto_3
    iget v3, p0, Ll/m410;->i:I

    .line 180
    .line 181
    if-ne v3, v7, :cond_a

    .line 182
    .line 183
    invoke-static {v6}, Ll/cd10;->a(Z)I

    .line 184
    .line 185
    .line 186
    move-result v3

    .line 187
    iput v3, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 188
    .line 189
    iput v4, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 190
    .line 191
    :cond_a
    iget-boolean v3, p0, Ll/m410;->g:Z

    .line 192
    .line 193
    if-eqz v3, :cond_b

    .line 194
    .line 195
    iput v6, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 196
    .line 197
    :cond_b
    iget-object p0, p0, Ll/m410;->b:Landroid/view/TextureView;

    .line 198
    .line 199
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 200
    .line 201
    .line 202
    sget-object p0, Ll/v2t;->c:Ljava/lang/String;

    .line 203
    .line 204
    new-instance v3, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    const-string v4, "player textureView:oldWH:"

    .line 207
    .line 208
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    const-string v0, ":"

    .line 215
    .line 216
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    const-string v1, ":params"

    .line 223
    .line 224
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    iget v1, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 228
    .line 229
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    iget v1, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 236
    .line 237
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    iget p1, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 244
    .line 245
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    invoke-static {p0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    :cond_c
    :goto_4
    return-void
.end method

.method public final y(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v0, v0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v0, v1}, Ll/m410;->h(Landroid/content/Context;Landroid/view/Window;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget-boolean v1, p0, Ll/m410;->c:Z

    .line 36
    .line 37
    if-ne v0, v1, :cond_1

    .line 38
    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return-void

    .line 43
    :cond_1
    :goto_0
    iput-boolean v0, p0, Ll/m410;->c:Z

    .line 44
    .line 45
    iget-object p1, p0, Ll/m410;->a:Landroid/view/ViewGroup;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ll/m410;->s(Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    invoke-virtual {p0, p1}, Ll/m410;->x(Z)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    invoke-virtual {p0, p1}, Ll/m410;->x(Z)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public z(II)V
    .locals 0

    .line 1
    iput p1, p0, Ll/m410;->e:I

    .line 2
    .line 3
    iput p2, p0, Ll/m410;->f:I

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/m410;->g()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
