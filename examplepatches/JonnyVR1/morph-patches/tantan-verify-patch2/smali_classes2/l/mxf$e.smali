.class final Ll/mxf$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nj80;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mxf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/nj80<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final a:Ll/mxf$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/mxf$d<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final b:Ll/mxf$g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/mxf$g<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final c:Ll/nj80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nj80<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/nj80;Ll/mxf$d;Ll/mxf$g;)V
    .locals 0
    .param p1    # Ll/nj80;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/mxf$d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/mxf$g;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nj80<",
            "TT;>;",
            "Ll/mxf$d<",
            "TT;>;",
            "Ll/mxf$g<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mxf$e;->c:Ll/nj80;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mxf$e;->a:Ll/mxf$d;

    .line 7
    .line 8
    iput-object p3, p0, Ll/mxf$e;->b:Ll/mxf$g;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public acquire()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mxf$e;->c:Ll/nj80;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/nj80;->acquire()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/mxf$e;->a:Ll/mxf$d;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/mxf$d;->create()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string p0, "FactoryPools"

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    invoke-static {p0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    :cond_0
    instance-of p0, v0, Ll/mxf$f;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    move-object p0, v0

    .line 36
    check-cast p0, Ll/mxf$f;

    .line 37
    .line 38
    invoke-interface {p0}, Ll/mxf$f;->b()Ll/x3g0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {p0, v1}, Ll/x3g0;->b(Z)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-object v0
.end method

.method public release(Ljava/lang/Object;)Z
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ll/mxf$f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Ll/mxf$f;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/mxf$f;->b()Ll/x3g0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Ll/x3g0;->b(Z)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/mxf$e;->b:Ll/mxf$g;

    .line 17
    .line 18
    invoke-interface {v0, p1}, Ll/mxf$g;->a(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/mxf$e;->c:Ll/nj80;

    .line 22
    .line 23
    invoke-interface {p0, p1}, Ll/nj80;->release(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method
