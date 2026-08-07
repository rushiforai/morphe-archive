.class public final Lrx/internal/operators/NotificationLite;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/NotificationLite$OnErrorSentinel;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final INSTANCE:Lrx/internal/operators/NotificationLite;

.field public static final a:Ljava/lang/Object;

.field public static final b:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lrx/internal/operators/NotificationLite;

    .line 2
    .line 3
    invoke-direct {v0}, Lrx/internal/operators/NotificationLite;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lrx/internal/operators/NotificationLite;->INSTANCE:Lrx/internal/operators/NotificationLite;

    .line 7
    .line 8
    new-instance v0, Lrx/internal/operators/NotificationLite$1;

    .line 9
    .line 10
    invoke-direct {v0}, Lrx/internal/operators/NotificationLite$1;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lrx/internal/operators/NotificationLite;->a:Ljava/lang/Object;

    .line 14
    .line 15
    new-instance v0, Lrx/internal/operators/NotificationLite$2;

    .line 16
    .line 17
    invoke-direct {v0}, Lrx/internal/operators/NotificationLite$2;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lrx/internal/operators/NotificationLite;->b:Ljava/lang/Object;

    .line 21
    .line 22
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

.method public static f()Lrx/internal/operators/NotificationLite;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/internal/operators/NotificationLite<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lrx/internal/operators/NotificationLite;->INSTANCE:Lrx/internal/operators/NotificationLite;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ll/bb50;Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bb50<",
            "-TT;>;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .line 1
    sget-object p0, Lrx/internal/operators/NotificationLite;->a:Ljava/lang/Object;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p2, p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 7
    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    sget-object p0, Lrx/internal/operators/NotificationLite;->b:Ljava/lang/Object;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    if-ne p2, p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    if-eqz p2, :cond_3

    .line 21
    .line 22
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-class v2, Lrx/internal/operators/NotificationLite$OnErrorSentinel;

    .line 27
    .line 28
    if-ne p0, v2, :cond_2

    .line 29
    .line 30
    check-cast p2, Lrx/internal/operators/NotificationLite$OnErrorSentinel;

    .line 31
    .line 32
    iget-object p0, p2, Lrx/internal/operators/NotificationLite$OnErrorSentinel;->e:Ljava/lang/Throwable;

    .line 33
    .line 34
    invoke-interface {p1, p0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    return v0

    .line 38
    :cond_2
    invoke-interface {p1, p2}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return v1

    .line 42
    :cond_3
    const-string p0, "The lite notification can not be null"

    .line 43
    .line 44
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return v1
.end method

.method public b()Ljava/lang/Object;
    .locals 0

    .line 1
    sget-object p0, Lrx/internal/operators/NotificationLite;->a:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/Throwable;)Ljava/lang/Object;
    .locals 0

    .line 1
    new-instance p0, Lrx/internal/operators/NotificationLite$OnErrorSentinel;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lrx/internal/operators/NotificationLite$OnErrorSentinel;-><init>(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public d(Ljava/lang/Object;)Ljava/lang/Throwable;
    .locals 0

    .line 1
    check-cast p1, Lrx/internal/operators/NotificationLite$OnErrorSentinel;

    .line 2
    .line 3
    iget-object p0, p1, Lrx/internal/operators/NotificationLite$OnErrorSentinel;->e:Ljava/lang/Throwable;

    .line 4
    .line 5
    return-object p0
.end method

.method public e(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .line 1
    sget-object p0, Lrx/internal/operators/NotificationLite;->b:Ljava/lang/Object;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    return-object p1
.end method

.method public g(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    sget-object p0, Lrx/internal/operators/NotificationLite;->a:Ljava/lang/Object;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public h(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lrx/internal/operators/NotificationLite$OnErrorSentinel;

    .line 2
    .line 3
    return p0
.end method

.method public i(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/NotificationLite;->h(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lrx/internal/operators/NotificationLite;->g(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public j(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lrx/internal/operators/NotificationLite;->b:Ljava/lang/Object;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    return-object p1
.end method
