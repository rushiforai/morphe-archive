.class public Ll/hh3;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hh3$a;
    }
.end annotation


# instance fields
.field private a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/hh3$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(I)[B
    .locals 5

    .line 1
    iget-object v0, p0, Ll/hh3;->a:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/hh3;->a:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/hh3;->a:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x1

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Ll/hh3;->a:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Ll/hh3$a;

    .line 38
    .line 39
    iget-boolean v3, v2, Ll/hh3$a;->b:Z

    .line 40
    .line 41
    if-nez v3, :cond_1

    .line 42
    .line 43
    iget-object v3, v2, Ll/hh3$a;->a:[B

    .line 44
    .line 45
    if-eqz v3, :cond_1

    .line 46
    .line 47
    array-length v4, v3

    .line 48
    if-ne v4, p1, :cond_1

    .line 49
    .line 50
    iput-boolean v1, v2, Ll/hh3$a;->b:Z

    .line 51
    .line 52
    return-object v3

    .line 53
    :cond_2
    new-instance v0, Ll/hh3$a;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Ll/hh3$a;-><init>(Ll/hh3;)V

    .line 56
    .line 57
    .line 58
    new-array p1, p1, [B

    .line 59
    .line 60
    iput-object p1, v0, Ll/hh3$a;->a:[B

    .line 61
    .line 62
    iput-boolean v1, v0, Ll/hh3$a;->b:Z

    .line 63
    .line 64
    iget-object p0, p0, Ll/hh3;->a:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    iget-object p0, v0, Ll/hh3$a;->a:[B

    .line 70
    .line 71
    return-object p0
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hh3;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/hh3;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/hh3$a;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    iput-boolean v1, v0, Ll/hh3$a;->b:Z

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method
