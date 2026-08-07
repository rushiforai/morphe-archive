.class public Ll/pvh0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/hyh0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/pvh0;->a:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Z
    .locals 1

    .line 1
    sget-object v0, Ll/pvh0;->a:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    return v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return v0
.end method

.method public static b(Landroid/content/Context;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ll/hyh0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/pvh0;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/pvh0;->a:Ljava/util/List;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 v0, 0x3

    .line 11
    invoke-static {p0, v0}, Ll/biw;->v(Landroid/content/Context;I)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Ll/erf0;

    .line 37
    .line 38
    new-instance v2, Ll/hyh0;

    .line 39
    .line 40
    invoke-virtual {v1}, Ll/erf0;->b()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-virtual {v1}, Ll/erf0;->a()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-direct {v2, v3, v1}, Ll/hyh0;-><init>(II)V

    .line 49
    .line 50
    .line 51
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    sput-object v0, Ll/pvh0;->a:Ljava/util/List;

    .line 56
    .line 57
    return-object v0
.end method

.method public static c(Landroid/content/Context;Ll/hyh0;IF)Ll/hyh0;
    .locals 4

    .line 1
    invoke-static {p0}, Ll/pvh0;->b(Landroid/content/Context;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ll/hyh0;

    .line 25
    .line 26
    new-instance v2, Ll/erf0;

    .line 27
    .line 28
    iget v3, v1, Ll/hyh0;->a:I

    .line 29
    .line 30
    iget v1, v1, Ll/hyh0;->b:I

    .line 31
    .line 32
    invoke-direct {v2, v3, v1}, Ll/erf0;-><init>(II)V

    .line 33
    .line 34
    .line 35
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    new-instance p0, Ll/erf0;

    .line 40
    .line 41
    iget v1, p1, Ll/hyh0;->a:I

    .line 42
    .line 43
    iget p1, p1, Ll/hyh0;->b:I

    .line 44
    .line 45
    invoke-direct {p0, v1, p1}, Ll/erf0;-><init>(II)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, p0, p2, p3}, Lcom/core/glcore/util/CameraHelper;->seletecMatchSize(Ljava/util/List;Ll/erf0;IF)Ll/erf0;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const/4 p1, 0x0

    .line 53
    if-nez p0, :cond_1

    .line 54
    .line 55
    move p2, p1

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    invoke-virtual {p0}, Ll/erf0;->b()I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    :goto_1
    if-nez p0, :cond_2

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_2
    invoke-virtual {p0}, Ll/erf0;->a()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    :goto_2
    new-instance p0, Ll/hyh0;

    .line 69
    .line 70
    invoke-direct {p0, p2, p1}, Ll/hyh0;-><init>(II)V

    .line 71
    .line 72
    .line 73
    return-object p0
.end method
