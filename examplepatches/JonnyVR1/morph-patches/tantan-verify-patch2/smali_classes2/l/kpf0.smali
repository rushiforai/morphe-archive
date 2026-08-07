.class public Ll/kpf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/t4b0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/kpf0$a;,
        Ll/kpf0$b;
    }
.end annotation


# instance fields
.field public final a:Ll/kpf0$b;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 13
    new-instance v0, Ll/kpf0$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ll/kpf0$a;-><init>(Ll/lpf0;)V

    invoke-direct {p0, v0}, Ll/kpf0;-><init>(Ll/kpf0$b;)V

    return-void
.end method

.method public constructor <init>(Ll/kpf0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ll/kpf0$b;

    .line 9
    .line 10
    iput-object p1, p0, Ll/kpf0;->a:Ll/kpf0$b;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(I)I
    .locals 2

    .line 1
    iget-object p0, p0, Ll/kpf0;->a:Ll/kpf0$b;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kpf0$b;->a()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_3

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-ge v0, v1, :cond_2

    .line 22
    .line 23
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/Integer;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-le v1, p1, :cond_1

    .line 34
    .line 35
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ljava/lang/Integer;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    const p0, 0x7fffffff

    .line 50
    .line 51
    .line 52
    return p0

    .line 53
    :cond_3
    :goto_1
    add-int/lit8 p1, p1, 0x1

    .line 54
    .line 55
    return p1
.end method

.method public b(I)Ll/qvb0;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kpf0;->a:Ll/kpf0$b;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kpf0$b;->b()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x0

    .line 8
    if-lt p1, p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move p0, v0

    .line 13
    :goto_0
    invoke-static {p1, p0, v0}, Ll/anm;->d(IZZ)Ll/qvb0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public c()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
