.class public Ltech/sud/runtime/component/i/b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ltech/sud/runtime/component/i/c;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Landroid/widget/FrameLayout;

.field private final c:Ltech/sud/runtime/core/g;

.field private d:Ltech/sud/runtime/component/i/d;


# direct methods
.method public constructor <init>(Landroid/widget/FrameLayout;Ltech/sud/runtime/core/g;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    const/16 v1, 0xa

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ltech/sud/runtime/component/i/b;->a:Ljava/util/Map;

    .line 12
    .line 13
    new-instance v0, Ltech/sud/runtime/component/i/b$1;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/i/b$1;-><init>(Ltech/sud/runtime/component/i/b;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ltech/sud/runtime/component/i/b;->d:Ltech/sud/runtime/component/i/d;

    .line 19
    .line 20
    iput-object p1, p0, Ltech/sud/runtime/component/i/b;->b:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    iput-object p2, p0, Ltech/sud/runtime/component/i/b;->c:Ltech/sud/runtime/core/g;

    .line 23
    .line 24
    return-void
.end method

.method private a(III)V
    .locals 1

    .line 55
    iget-object p0, p0, Ltech/sud/runtime/component/i/b;->c:Ltech/sud/runtime/core/g;

    .line 56
    const-string v0, ""

    invoke-static {p3, v0}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const/4 v0, 0x3

    .line 57
    invoke-virtual {p0, v0, p1, p2, p3}, Ltech/sud/runtime/core/g;->a(IIILjava/lang/String;)V

    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/i/b;I)V
    .locals 0

    .line 40
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/i/b;->d(I)V

    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/i/b;III)V
    .locals 0

    .line 41
    invoke-direct {p0, p1, p2, p3}, Ltech/sud/runtime/component/i/b;->a(III)V

    return-void
.end method

.method public static synthetic b(Ltech/sud/runtime/component/i/b;I)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/i/b;->e(I)V

    return-void
.end method

.method private d(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/i/b;->c:Ltech/sud/runtime/core/g;

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    invoke-virtual {p0, v0, p1}, Ltech/sud/runtime/core/g;->b(II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private e(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/i/b;->c:Ltech/sud/runtime/core/g;

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    invoke-virtual {p0, v0, p1}, Ltech/sud/runtime/core/g;->b(II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 50
    return-void
.end method

.method public a(I)V
    .locals 2

    .line 46
    iget-object v0, p0, Ltech/sud/runtime/component/i/b;->a:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltech/sud/runtime/component/i/c;

    if-nez v0, :cond_0

    return-void

    .line 47
    :cond_0
    invoke-virtual {v0}, Ltech/sud/runtime/component/i/c;->getVideoControlView()Ltech/sud/runtime/component/i/a;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 48
    invoke-virtual {v0}, Ltech/sud/runtime/component/i/a;->a()V

    .line 49
    :cond_1
    iget-object p0, p0, Ltech/sud/runtime/component/i/b;->a:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public a(IF)V
    .locals 0

    .line 53
    iget-object p0, p0, Ltech/sud/runtime/component/i/b;->a:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltech/sud/runtime/component/i/c;

    if-nez p0, :cond_0

    return-void

    .line 54
    :cond_0
    invoke-virtual {p0, p2}, Ltech/sud/runtime/component/i/c;->setVolume(F)V

    return-void
.end method

.method public a(II)V
    .locals 0

    .line 51
    iget-object p0, p0, Ltech/sud/runtime/component/i/b;->a:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltech/sud/runtime/component/i/c;

    if-nez p0, :cond_0

    return-void

    .line 52
    :cond_0
    invoke-virtual {p0, p2}, Ltech/sud/runtime/component/i/c;->seekTo(I)V

    return-void
.end method

.method public a(ILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/i/b;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/component/i/b;->a:Ljava/util/Map;

    .line 7
    .line 8
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ltech/sud/runtime/component/i/c;

    .line 17
    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    :goto_0
    return-void

    .line 21
    :cond_1
    invoke-virtual {p1, p2}, Ltech/sud/runtime/component/i/c;->setVideoFileName(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-direct {p2, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ltech/sud/runtime/component/i/b;->b:Landroid/widget/FrameLayout;

    .line 31
    .line 32
    invoke-virtual {p1}, Ltech/sud/runtime/component/i/c;->getVideoControlView()Ltech/sud/runtime/component/i/a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public a(Landroid/content/Context;I)V
    .locals 1

    .line 42
    new-instance v0, Ltech/sud/runtime/component/i/c;

    invoke-direct {v0, p1, p2}, Ltech/sud/runtime/component/i/c;-><init>(Landroid/content/Context;I)V

    const/4 p1, 0x1

    .line 43
    invoke-virtual {v0, p1}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 44
    iget-object p1, p0, Ltech/sud/runtime/component/i/b;->d:Ltech/sud/runtime/component/i/d;

    invoke-virtual {v0, p1}, Ltech/sud/runtime/component/i/c;->setEventCallback(Ltech/sud/runtime/component/i/d;)V

    .line 45
    iget-object p0, p0, Ltech/sud/runtime/component/i/b;->a:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public b(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/i/b;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ltech/sud/runtime/component/i/c;

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p1, v0}, Ltech/sud/runtime/component/i/c;->setKeepRatio(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ltech/sud/runtime/component/i/b;->c:Ltech/sud/runtime/core/g;

    .line 21
    .line 22
    invoke-virtual {v1}, Ltech/sud/runtime/core/g;->c()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    iget-object p0, p0, Ltech/sud/runtime/component/i/b;->c:Ltech/sud/runtime/core/g;

    .line 27
    .line 28
    invoke-virtual {p0}, Ltech/sud/runtime/core/g;->d()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p1, v0, v1, p0}, Ltech/sud/runtime/component/i/c;->a(ZII)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ltech/sud/runtime/component/i/c;->start()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public c(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/i/b;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ltech/sud/runtime/component/i/c;

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0}, Ltech/sud/runtime/component/i/c;->pause()V

    .line 17
    .line 18
    .line 19
    return-void
.end method
