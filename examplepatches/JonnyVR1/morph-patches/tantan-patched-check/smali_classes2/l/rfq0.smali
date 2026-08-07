.class public final Ll/rfq0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/rfq0$d;,
        Ll/rfq0$e;,
        Ll/rfq0$c;,
        Ll/rfq0$b;,
        Ll/rfq0$a;
    }
.end annotation


# instance fields
.field public a:Ll/rfq0$e;


# direct methods
.method public constructor <init>(ILandroid/view/animation/Interpolator;J)V
    .locals 2
    .param p2    # Landroid/view/animation/Interpolator;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5
    .line 6
    const/16 v1, 0x1e

    .line 7
    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    new-instance v0, Ll/rfq0$d;

    .line 11
    .line 12
    invoke-direct {v0, p1, p2, p3, p4}, Ll/rfq0$d;-><init>(ILandroid/view/animation/Interpolator;J)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/rfq0;->a:Ll/rfq0$e;

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    new-instance v0, Ll/rfq0$c;

    .line 19
    .line 20
    invoke-direct {v0, p1, p2, p3, p4}, Ll/rfq0$c;-><init>(ILandroid/view/animation/Interpolator;J)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/rfq0;->a:Ll/rfq0$e;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/view/WindowInsetsAnimation;)V
    .locals 4
    .param p1    # Landroid/view/WindowInsetsAnimation;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1e
    .end annotation

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    .line 26
    invoke-direct {p0, v3, v0, v1, v2}, Ll/rfq0;-><init>(ILandroid/view/animation/Interpolator;J)V

    .line 27
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    .line 28
    new-instance v0, Ll/rfq0$d;

    invoke-direct {v0, p1}, Ll/rfq0$d;-><init>(Landroid/view/WindowInsetsAnimation;)V

    iput-object v0, p0, Ll/rfq0;->a:Ll/rfq0$e;

    :cond_0
    return-void
.end method

.method public static c(Landroid/view/View;Ll/rfq0$b;)V
    .locals 2
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/rfq0$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1e

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/rfq0$d;->g(Landroid/view/View;Ll/rfq0$b;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {p0, p1}, Ll/rfq0$c;->o(Landroid/view/View;Ll/rfq0$b;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static e(Landroid/view/WindowInsetsAnimation;)Ll/rfq0;
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1e
    .end annotation

    .line 1
    new-instance v0, Ll/rfq0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rfq0;-><init>(Landroid/view/WindowInsetsAnimation;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/rfq0;->a:Ll/rfq0$e;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rfq0$e;->a()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public b()F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rfq0;->a:Ll/rfq0$e;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rfq0$e;->b()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(F)V
    .locals 0
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = 1.0
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/rfq0;->a:Ll/rfq0$e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rfq0$e;->c(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
