.class public Ll/bhq0$d;
.super Ll/bhq0$e;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x1e
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/bhq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public final a:Ll/bhq0;

.field public final b:Landroid/view/WindowInsetsController;

.field public final c:Ll/otf0;

.field public final d:Ll/oof0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/oof0<",
            "Ljava/lang/Object;",
            "Landroid/view/WindowInsetsController$OnControllableInsetsChangedListener;",
            ">;"
        }
    .end annotation
.end field

.field public e:Landroid/view/Window;


# direct methods
.method public constructor <init>(Landroid/view/Window;Ll/bhq0;Ll/otf0;)V
    .locals 1
    .param p1    # Landroid/view/Window;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/bhq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/otf0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 18
    invoke-static {p1}, Ll/chq0;->a(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Ll/bhq0$d;-><init>(Landroid/view/WindowInsetsController;Ll/bhq0;Ll/otf0;)V

    .line 19
    iput-object p1, p0, Ll/bhq0$d;->e:Landroid/view/Window;

    return-void
.end method

.method public constructor <init>(Landroid/view/WindowInsetsController;Ll/bhq0;Ll/otf0;)V
    .locals 1
    .param p1    # Landroid/view/WindowInsetsController;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/bhq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/otf0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/bhq0$e;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/oof0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/oof0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/bhq0$d;->d:Ll/oof0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/bhq0$d;->b:Landroid/view/WindowInsetsController;

    .line 12
    .line 13
    iput-object p2, p0, Ll/bhq0$d;->a:Ll/bhq0;

    .line 14
    .line 15
    iput-object p3, p0, Ll/bhq0$d;->c:Ll/otf0;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 1

    .line 1
    and-int/lit8 v0, p1, 0x8

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/bhq0$d;->c:Ll/otf0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/otf0;->a()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Ll/bhq0$d;->b:Landroid/view/WindowInsetsController;

    .line 11
    .line 12
    and-int/lit8 p1, p1, -0x9

    .line 13
    .line 14
    invoke-static {p0, p1}, Ll/ttf0;->a(Landroid/view/WindowInsetsController;I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public b(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bhq0$d;->e:Landroid/view/Window;

    .line 2
    .line 3
    const/16 v1, 0x2000

    .line 4
    .line 5
    const/16 v2, 0x8

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Ll/bhq0$d;->c(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/bhq0$d;->b:Landroid/view/WindowInsetsController;

    .line 15
    .line 16
    invoke-static {p0, v2, v2}, Ll/dhq0;->a(Landroid/view/WindowInsetsController;II)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Ll/bhq0$d;->d(I)V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object p0, p0, Ll/bhq0$d;->b:Landroid/view/WindowInsetsController;

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-static {p0, p1, v2}, Ll/dhq0;->a(Landroid/view/WindowInsetsController;II)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public c(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bhq0$d;->e:Landroid/view/Window;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    or-int/2addr p1, v0

    .line 12
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public d(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bhq0$d;->e:Landroid/view/Window;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    not-int p1, p1

    .line 12
    and-int/2addr p1, v0

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
