.class public final Ll/mxf;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mxf$e;,
        Ll/mxf$f;,
        Ll/mxf$g;,
        Ll/mxf$d;
    }
.end annotation


# static fields
.field private static final a:Ll/mxf$g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/mxf$g<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/mxf$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/mxf$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/mxf;->a:Ll/mxf$g;

    .line 7
    .line 8
    return-void
.end method

.method private static a(Ll/nj80;Ll/mxf$d;)Ll/nj80;
    .locals 1
    .param p0    # Ll/nj80;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/mxf$d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ll/mxf$f;",
            ">(",
            "Ll/nj80<",
            "TT;>;",
            "Ll/mxf$d<",
            "TT;>;)",
            "Ll/nj80<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/mxf;->c()Ll/mxf$g;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, p1, v0}, Ll/mxf;->b(Ll/nj80;Ll/mxf$d;Ll/mxf$g;)Ll/nj80;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private static b(Ll/nj80;Ll/mxf$d;Ll/mxf$g;)Ll/nj80;
    .locals 1
    .param p0    # Ll/nj80;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/mxf$d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/mxf$g;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/nj80<",
            "TT;>;",
            "Ll/mxf$d<",
            "TT;>;",
            "Ll/mxf$g<",
            "TT;>;)",
            "Ll/nj80<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/mxf$e;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/mxf$e;-><init>(Ll/nj80;Ll/mxf$d;Ll/mxf$g;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private static c()Ll/mxf$g;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/mxf$g<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/mxf;->a:Ll/mxf$g;

    .line 2
    .line 3
    return-object v0
.end method

.method public static d(ILl/mxf$d;)Ll/nj80;
    .locals 1
    .param p1    # Ll/mxf$d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ll/mxf$f;",
            ">(I",
            "Ll/mxf$d<",
            "TT;>;)",
            "Ll/nj80<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/rj80;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rj80;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0, p1}, Ll/mxf;->a(Ll/nj80;Ll/mxf$d;)Ll/nj80;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static e()Ll/nj80;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/nj80<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    const/16 v0, 0x14

    .line 2
    .line 3
    invoke-static {v0}, Ll/mxf;->f(I)Ll/nj80;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static f(I)Ll/nj80;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)",
            "Ll/nj80<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/rj80;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rj80;-><init>(I)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ll/mxf$b;

    .line 7
    .line 8
    invoke-direct {p0}, Ll/mxf$b;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/mxf$c;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/mxf$c;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, p0, v1}, Ll/mxf;->b(Ll/nj80;Ll/mxf$d;Ll/mxf$g;)Ll/nj80;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
