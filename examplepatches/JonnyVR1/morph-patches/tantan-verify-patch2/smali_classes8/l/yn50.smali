.class public final Ll/yn50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/yn50$b;,
        Ll/yn50$c;,
        Ll/yn50$d;
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
            "+TT;>;"
        }
    .end annotation
.end field

.field public final b:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TR;>;>;"
        }
    .end annotation
.end field

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(Lrx/c;Ll/qcj;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TT;>;",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TR;>;>;II)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yn50;->a:Lrx/c;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yn50;->b:Ll/qcj;

    .line 7
    .line 8
    iput p3, p0, Ll/yn50;->c:I

    .line 9
    .line 10
    iput p4, p0, Ll/yn50;->d:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/yn50;->d:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/are0;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/are0;-><init>(Ll/gcg0;)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object v0, p1

    .line 12
    :goto_0
    new-instance v1, Ll/yn50$d;

    .line 13
    .line 14
    iget-object v2, p0, Ll/yn50;->b:Ll/qcj;

    .line 15
    .line 16
    iget v3, p0, Ll/yn50;->c:I

    .line 17
    .line 18
    iget v4, p0, Ll/yn50;->d:I

    .line 19
    .line 20
    invoke-direct {v1, v0, v2, v3, v4}, Ll/yn50$d;-><init>(Ll/gcg0;Ll/qcj;II)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, v1, Ll/yn50$d;->l:Ll/wqe0;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/yn50$a;

    .line 32
    .line 33
    invoke-direct {v0, p0, v1}, Ll/yn50$a;-><init>(Ll/yn50;Ll/yn50$d;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Ll/gcg0;->isUnsubscribed()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    iget-object p0, p0, Ll/yn50;->a:Lrx/c;

    .line 46
    .line 47
    invoke-virtual {p0, v1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yn50;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
