.class public abstract Ll/sz90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j7q;


# instance fields
.field public final a:Ll/u3m;

.field public b:Ll/ner;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/on2<",
            "Ll/t3m;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/u3m;Ll/ner;)V
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
    iput-object v0, p0, Ll/sz90;->c:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/sz90;->a:Ll/u3m;

    .line 12
    .line 13
    iput-object p2, p0, Ll/sz90;->b:Ll/ner;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic b(Ljava/lang/Class;Ll/on2;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public c()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/on2<",
            "Ll/t3m;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/sz90;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/sz90;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, v0}, Ll/j7q;->a(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/sz90;->c:Ljava/util/List;

    .line 15
    .line 16
    return-object p0
.end method

.method public d(Ljava/lang/Class;)Ll/on2;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Ll/on2<",
            "Ll/t3m;",
            ">;>;)",
            "Ll/on2;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sz90;->c:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/rz90;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/rz90;-><init>(Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/on2;

    .line 13
    .line 14
    return-object p0
.end method
