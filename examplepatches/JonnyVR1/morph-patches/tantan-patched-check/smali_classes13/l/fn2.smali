.class public Ll/fn2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final hookList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a30<",
            "Ljava/lang/String;",
            "Ll/qim;",
            "Landroid/graphics/drawable/Animatable;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/fn2;->hookList:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;Ll/a30;)V
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-interface {p3, p0, p1, p2}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static i(Ll/fn2;Ll/a30;)Ll/fn2;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fn2;",
            "Ll/a30<",
            "Ljava/lang/String;",
            "Ll/qim;",
            "Landroid/graphics/drawable/Animatable;",
            ">;)",
            "Ll/fn2;"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fn2;->b(Ll/a30;)V

    .line 4
    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    new-instance p0, Ll/fn2;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/fn2;->b(Ll/a30;)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method


# virtual methods
.method public final b(Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Ljava/lang/String;",
            "Ll/qim;",
            "Landroid/graphics/drawable/Animatable;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fn2;->hookList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ljava/lang/String;Ll/qim;)V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fn2;->hookList:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/en2;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2, p3}, Ll/en2;-><init>(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
