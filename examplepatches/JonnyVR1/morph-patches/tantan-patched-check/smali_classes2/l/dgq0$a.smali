.class public final Ll/dgq0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dgq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/dgq0$e;


# direct methods
.method public constructor <init>()V
    .locals 2

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
    new-instance v0, Ll/dgq0$d;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/dgq0$d;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/dgq0$a;->a:Ll/dgq0$e;

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/16 v1, 0x1d

    .line 19
    .line 20
    if-lt v0, v1, :cond_1

    .line 21
    .line 22
    new-instance v0, Ll/dgq0$c;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/dgq0$c;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/dgq0$a;->a:Ll/dgq0$e;

    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    new-instance v0, Ll/dgq0$b;

    .line 31
    .line 32
    invoke-direct {v0}, Ll/dgq0$b;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/dgq0$a;->a:Ll/dgq0$e;

    .line 36
    .line 37
    return-void
.end method

.method public constructor <init>(Ll/dgq0;)V
    .locals 2
    .param p1    # Ll/dgq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    .line 40
    new-instance v0, Ll/dgq0$d;

    invoke-direct {v0, p1}, Ll/dgq0$d;-><init>(Ll/dgq0;)V

    iput-object v0, p0, Ll/dgq0$a;->a:Ll/dgq0$e;

    return-void

    :cond_0
    const/16 v1, 0x1d

    if-lt v0, v1, :cond_1

    .line 41
    new-instance v0, Ll/dgq0$c;

    invoke-direct {v0, p1}, Ll/dgq0$c;-><init>(Ll/dgq0;)V

    iput-object v0, p0, Ll/dgq0$a;->a:Ll/dgq0$e;

    return-void

    .line 42
    :cond_1
    new-instance v0, Ll/dgq0$b;

    invoke-direct {v0, p1}, Ll/dgq0$b;-><init>(Ll/dgq0;)V

    iput-object v0, p0, Ll/dgq0$a;->a:Ll/dgq0$e;

    return-void
.end method


# virtual methods
.method public a()Ll/dgq0;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dgq0$a;->a:Ll/dgq0$e;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dgq0$e;->b()Ll/dgq0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(ILl/svm;)Ll/dgq0$a;
    .locals 1
    .param p2    # Ll/svm;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dgq0$a;->a:Ll/dgq0$e;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/dgq0$e;->c(ILl/svm;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public c(Ll/svm;)Ll/dgq0$a;
    .locals 1
    .param p1    # Ll/svm;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dgq0$a;->a:Ll/dgq0$e;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/dgq0$e;->f(Ll/svm;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
