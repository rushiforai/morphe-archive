.class public final Ll/txf0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/txf0$b;,
        Ll/txf0$c;
    }
.end annotation


# instance fields
.field public final a:Ll/xs4;

.field public final b:Z

.field public final c:Ll/txf0$c;

.field public final d:I


# direct methods
.method public constructor <init>(Ll/txf0$c;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/xs4;->i()Ll/xs4;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7fffffff

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {p0, p1, v2, v0, v1}, Ll/txf0;-><init>(Ll/txf0$c;ZLl/xs4;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Ll/txf0$c;ZLl/xs4;I)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Ll/txf0;->c:Ll/txf0$c;

    .line 15
    iput-boolean p2, p0, Ll/txf0;->b:Z

    .line 16
    iput-object p3, p0, Ll/txf0;->a:Ll/xs4;

    .line 17
    iput p4, p0, Ll/txf0;->d:I

    return-void
.end method

.method public static synthetic a(Ll/txf0;)Ll/xs4;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/txf0;->a:Ll/xs4;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/txf0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/txf0;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Ll/txf0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/txf0;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public static d(C)Ll/txf0;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/xs4;->f(C)Ll/xs4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/txf0;->e(Ll/xs4;)Ll/txf0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static e(Ll/xs4;)Ll/txf0;
    .locals 2

    .line 1
    invoke-static {p0}, Ll/xn80;->p(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/txf0;

    .line 5
    .line 6
    new-instance v1, Ll/txf0$a;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/txf0$a;-><init>(Ll/xs4;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Ll/txf0;-><init>(Ll/txf0$c;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/CharSequence;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/xn80;->p(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/txf0;->g(Ljava/lang/CharSequence;)Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance p1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public final g(Ljava/lang/CharSequence;)Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/txf0;->c:Ll/txf0$c;

    .line 2
    .line 3
    invoke-interface {v0, p0, p1}, Ll/txf0$c;->a(Ll/txf0;Ljava/lang/CharSequence;)Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
