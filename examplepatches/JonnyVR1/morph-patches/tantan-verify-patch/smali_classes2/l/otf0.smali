.class public final Ll/otf0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/otf0$b;,
        Ll/otf0$c;,
        Ll/otf0$a;
    }
.end annotation


# instance fields
.field public final a:Ll/otf0$c;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
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
    new-instance v0, Ll/otf0$b;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Ll/otf0$b;-><init>(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/otf0;->a:Ll/otf0$c;

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    new-instance v0, Ll/otf0$a;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Ll/otf0$a;-><init>(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/otf0;->a:Ll/otf0$c;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/view/WindowInsetsController;)V
    .locals 1
    .param p1    # Landroid/view/WindowInsetsController;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1e
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ll/otf0$b;

    invoke-direct {v0, p1}, Ll/otf0$b;-><init>(Landroid/view/WindowInsetsController;)V

    iput-object v0, p0, Ll/otf0;->a:Ll/otf0$c;

    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/otf0;->a:Ll/otf0$c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/otf0$c;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
