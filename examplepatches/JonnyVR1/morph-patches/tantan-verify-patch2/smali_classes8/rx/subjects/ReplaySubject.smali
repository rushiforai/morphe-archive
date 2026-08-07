.class public final Lrx/subjects/ReplaySubject;
.super Ll/wbg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/subjects/ReplaySubject$ReplayProducer;,
        Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;,
        Lrx/subjects/ReplaySubject$b;,
        Lrx/subjects/ReplaySubject$a;,
        Lrx/subjects/ReplaySubject$ReplayState;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/wbg0<",
        "TT;TT;>;"
    }
.end annotation


# static fields
.field public static final b:[Ljava/lang/Object;


# instance fields
.field public final a:Lrx/subjects/ReplaySubject$ReplayState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/ReplaySubject$ReplayState<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    sput-object v0, Lrx/subjects/ReplaySubject;->b:[Ljava/lang/Object;

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Lrx/subjects/ReplaySubject$ReplayState;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/ReplaySubject$ReplayState<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/wbg0;-><init>(Lrx/c$a;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/subjects/ReplaySubject;->a:Lrx/subjects/ReplaySubject$ReplayState;

    .line 5
    .line 6
    return-void
.end method

.method public static b()Lrx/subjects/ReplaySubject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/subjects/ReplaySubject<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    invoke-static {v0}, Lrx/subjects/ReplaySubject;->c(I)Lrx/subjects/ReplaySubject;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static c(I)Lrx/subjects/ReplaySubject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)",
            "Lrx/subjects/ReplaySubject<",
            "TT;>;"
        }
    .end annotation

    .line 1
    if-lez p0, :cond_0

    .line 2
    .line 3
    new-instance v0, Lrx/subjects/ReplaySubject$b;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lrx/subjects/ReplaySubject$b;-><init>(I)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Lrx/subjects/ReplaySubject$ReplayState;

    .line 9
    .line 10
    invoke-direct {p0, v0}, Lrx/subjects/ReplaySubject$ReplayState;-><init>(Lrx/subjects/ReplaySubject$a;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Lrx/subjects/ReplaySubject;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Lrx/subjects/ReplaySubject;-><init>(Lrx/subjects/ReplaySubject$ReplayState;)V

    .line 16
    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_0
    const-string v0, "capacity > 0 required but it was "

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public static d(I)Lrx/subjects/ReplaySubject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)",
            "Lrx/subjects/ReplaySubject<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/subjects/ReplaySubject$ReplaySizeBoundBuffer;-><init>(I)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lrx/subjects/ReplaySubject$ReplayState;

    .line 7
    .line 8
    invoke-direct {p0, v0}, Lrx/subjects/ReplaySubject$ReplayState;-><init>(Lrx/subjects/ReplaySubject$a;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lrx/subjects/ReplaySubject;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lrx/subjects/ReplaySubject;-><init>(Lrx/subjects/ReplaySubject$ReplayState;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method


# virtual methods
.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/subjects/ReplaySubject;->a:Lrx/subjects/ReplaySubject$ReplayState;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/ReplaySubject$ReplayState;->onCompleted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/subjects/ReplaySubject;->a:Lrx/subjects/ReplaySubject$ReplayState;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/ReplaySubject$ReplayState;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lrx/subjects/ReplaySubject;->a:Lrx/subjects/ReplaySubject$ReplayState;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/ReplaySubject$ReplayState;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
