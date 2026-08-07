.class public Ll/bbh0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/SurfaceView;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:Z

.field public d:Z

.field public e:I

.field public f:Ll/xvx;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/xvx;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/bbh0;->e:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/bbh0;->b:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iput-object p2, p0, Ll/bbh0;->f:Ll/xvx;

    .line 10
    .line 11
    new-instance p2, Landroid/view/SurfaceView;

    .line 12
    .line 13
    invoke-direct {p2, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ll/bbh0;->a:Landroid/view/SurfaceView;

    .line 17
    .line 18
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    const/4 v0, -0x1

    .line 21
    invoke-direct {p1, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    const/high16 p1, 0x41800000    # 16.0f

    .line 28
    .line 29
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    int-to-float p1, p1

    .line 34
    invoke-virtual {p0, p1}, Ll/bbh0;->l(F)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static bridge synthetic a(Ll/bbh0;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bbh0;->b:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/bbh0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/bbh0;->e:I

    return p0
.end method

.method public static bridge synthetic c(Ll/bbh0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bbh0;->d:Z

    return p0
.end method

.method public static bridge synthetic d(Ll/bbh0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bbh0;->c:Z

    return p0
.end method

.method public static bridge synthetic e(Ll/bbh0;)Ll/xvx;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bbh0;->f:Ll/xvx;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/bbh0;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/bbh0;->e:I

    return-void
.end method

.method public static bridge synthetic g(Ll/bbh0;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bbh0;->d:Z

    return-void
.end method

.method public static bridge synthetic h(Ll/bbh0;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bbh0;->c:Z

    return-void
.end method


# virtual methods
.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bbh0;->a:Landroid/view/SurfaceView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/bbh0$a;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/bbh0$a;-><init>(Ll/bbh0;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public j()Landroid/view/SurfaceView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bbh0;->a:Landroid/view/SurfaceView;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bbh0;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public l(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bbh0;->a:Landroid/view/SurfaceView;

    .line 2
    .line 3
    new-instance v1, Ll/bbh0$b;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/bbh0$b;-><init>(Ll/bbh0;F)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/bbh0;->a:Landroid/view/SurfaceView;

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
