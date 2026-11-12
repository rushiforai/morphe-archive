.class public final Lech;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/concurrent/atomic/AtomicReference;

.field public final b:Lxg;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lech;->a:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Lxg;

    invoke-direct {v0}, Lxg;-><init>()V

    iput-object v0, p0, Lech;->b:Lxg;

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 4

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    and-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_15

    new-instance p1, Ltch;

    sget-object v1, Lsch;->a:Lsch;

    sget-object v1, Lsnf;->a:Ljava/lang/String;

    invoke-direct {p1, v1}, Ltch;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_15
    new-instance p1, Lpv1;

    const/4 v1, 0x6

    iget-object p0, p0, Lech;->b:Lxg;

    invoke-direct {p1, p0, v1}, Lpv1;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, p1}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    return-void
.end method
