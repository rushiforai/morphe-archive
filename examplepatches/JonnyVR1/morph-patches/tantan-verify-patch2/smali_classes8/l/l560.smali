.class public final Ll/l560;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/l560$b;,
        Ll/l560$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TR;>;"
    }
.end annotation


# instance fields
.field public final a:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final b:[Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lrx/c<",
            "*>;"
        }
    .end annotation
.end field

.field public final c:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable<",
            "Lrx/c<",
            "*>;>;"
        }
    .end annotation
.end field

.field public final d:Ll/zcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/zcj<",
            "TR;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/c;[Lrx/c;Ljava/lang/Iterable;Ll/zcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TT;>;[",
            "Lrx/c<",
            "*>;",
            "Ljava/lang/Iterable<",
            "Lrx/c<",
            "*>;>;",
            "Ll/zcj<",
            "TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l560;->a:Lrx/c;

    .line 5
    .line 6
    iput-object p2, p0, Ll/l560;->b:[Lrx/c;

    .line 7
    .line 8
    iput-object p3, p0, Ll/l560;->c:Ljava/lang/Iterable;

    .line 9
    .line 10
    iput-object p4, p0, Ll/l560;->d:Ll/zcj;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/are0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/are0;-><init>(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/l560;->b:[Lrx/c;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    array-length v3, v1

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    const/16 v1, 0x8

    .line 14
    .line 15
    new-array v1, v1, [Lrx/c;

    .line 16
    .line 17
    iget-object v3, p0, Ll/l560;->c:Ljava/lang/Iterable;

    .line 18
    .line 19
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    move v4, v2

    .line 24
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    if-eqz v5, :cond_2

    .line 29
    .line 30
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    check-cast v5, Lrx/c;

    .line 35
    .line 36
    array-length v6, v1

    .line 37
    if-ne v4, v6, :cond_1

    .line 38
    .line 39
    shr-int/lit8 v6, v4, 0x2

    .line 40
    .line 41
    add-int/2addr v6, v4

    .line 42
    invoke-static {v1, v6}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, [Lrx/c;

    .line 47
    .line 48
    :cond_1
    add-int/lit8 v6, v4, 0x1

    .line 49
    .line 50
    aput-object v5, v1, v4

    .line 51
    .line 52
    move v4, v6

    .line 53
    goto :goto_0

    .line 54
    :cond_2
    move v3, v4

    .line 55
    :goto_1
    new-instance v4, Ll/l560$a;

    .line 56
    .line 57
    iget-object v5, p0, Ll/l560;->d:Ll/zcj;

    .line 58
    .line 59
    invoke-direct {v4, p1, v5, v3}, Ll/l560$a;-><init>(Ll/gcg0;Ll/zcj;I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v4}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 63
    .line 64
    .line 65
    :goto_2
    if-ge v2, v3, :cond_4

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/gcg0;->isUnsubscribed()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_3

    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    new-instance p1, Ll/l560$b;

    .line 75
    .line 76
    add-int/lit8 v5, v2, 0x1

    .line 77
    .line 78
    invoke-direct {p1, v4, v5}, Ll/l560$b;-><init>(Ll/l560$a;I)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v4, p1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 82
    .line 83
    .line 84
    aget-object v2, v1, v2

    .line 85
    .line 86
    invoke-virtual {v2, p1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    move v2, v5

    .line 90
    goto :goto_2

    .line 91
    :cond_4
    iget-object p0, p0, Ll/l560;->a:Lrx/c;

    .line 92
    .line 93
    invoke-virtual {p0, v4}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/l560;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
