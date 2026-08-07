.class public final Ll/bhq0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/bhq0$d;,
        Ll/bhq0$e;,
        Ll/bhq0$c;,
        Ll/bhq0$b;,
        Ll/bhq0$a;
    }
.end annotation


# instance fields
.field public final a:Ll/bhq0$e;


# direct methods
.method public constructor <init>(Landroid/view/Window;Landroid/view/View;)V
    .locals 2
    .param p1    # Landroid/view/Window;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/otf0;

    .line 5
    .line 6
    invoke-direct {v0, p2}, Ll/otf0;-><init>(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 10
    .line 11
    const/16 v1, 0x1e

    .line 12
    .line 13
    if-lt p2, v1, :cond_0

    .line 14
    .line 15
    new-instance p2, Ll/bhq0$d;

    .line 16
    .line 17
    invoke-direct {p2, p1, p0, v0}, Ll/bhq0$d;-><init>(Landroid/view/Window;Ll/bhq0;Ll/otf0;)V

    .line 18
    .line 19
    .line 20
    iput-object p2, p0, Ll/bhq0;->a:Ll/bhq0$e;

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/16 v1, 0x1a

    .line 24
    .line 25
    if-lt p2, v1, :cond_1

    .line 26
    .line 27
    new-instance p2, Ll/bhq0$c;

    .line 28
    .line 29
    invoke-direct {p2, p1, v0}, Ll/bhq0$c;-><init>(Landroid/view/Window;Ll/otf0;)V

    .line 30
    .line 31
    .line 32
    iput-object p2, p0, Ll/bhq0;->a:Ll/bhq0$e;

    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    new-instance p2, Ll/bhq0$b;

    .line 36
    .line 37
    invoke-direct {p2, p1, v0}, Ll/bhq0$b;-><init>(Landroid/view/Window;Ll/otf0;)V

    .line 38
    .line 39
    .line 40
    iput-object p2, p0, Ll/bhq0;->a:Ll/bhq0$e;

    .line 41
    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/view/WindowInsetsController;)V
    .locals 2
    .param p1    # Landroid/view/WindowInsetsController;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1e
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ll/bhq0$d;

    new-instance v1, Ll/otf0;

    invoke-direct {v1, p1}, Ll/otf0;-><init>(Landroid/view/WindowInsetsController;)V

    invoke-direct {v0, p1, p0, v1}, Ll/bhq0$d;-><init>(Landroid/view/WindowInsetsController;Ll/bhq0;Ll/otf0;)V

    iput-object v0, p0, Ll/bhq0;->a:Ll/bhq0$e;

    return-void
.end method

.method public static c(Landroid/view/WindowInsetsController;)Ll/bhq0;
    .locals 1
    .param p0    # Landroid/view/WindowInsetsController;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1e
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Ll/bhq0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bhq0;-><init>(Landroid/view/WindowInsetsController;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bhq0;->a:Ll/bhq0$e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bhq0$e;->a(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bhq0;->a:Ll/bhq0$e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bhq0$e;->b(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
