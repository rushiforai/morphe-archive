.class public final Ll/e560;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/e560$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "Ljava/util/List<",
        "TT;>;TT;>;"
    }
.end annotation


# static fields
.field public static final c:Ljava/util/Comparator;


# instance fields
.field public final a:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "-TT;>;"
        }
    .end annotation
.end field

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/e560$c;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/e560$c;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/e560;->c:Ljava/util/Comparator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    sget-object v0, Ll/e560;->c:Ljava/util/Comparator;

    iput-object v0, p0, Ll/e560;->a:Ljava/util/Comparator;

    .line 16
    iput p1, p0, Ll/e560;->b:I

    return-void
.end method

.method public constructor <init>(Ll/rcj;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rcj<",
            "-TT;-TT;",
            "Ljava/lang/Integer;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Ll/e560;->b:I

    .line 5
    .line 6
    new-instance p2, Ll/e560$a;

    .line 7
    .line 8
    invoke-direct {p2, p0, p1}, Ll/e560$a;-><init>(Ll/e560;Ll/rcj;)V

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Ll/e560;->a:Ljava/util/Comparator;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Ljava/util/List<",
            "TT;>;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/producers/SingleDelayedProducer;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lrx/internal/producers/SingleDelayedProducer;-><init>(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/e560$b;

    .line 7
    .line 8
    invoke-direct {v1, p0, v0, p1}, Ll/e560$b;-><init>(Ll/e560;Lrx/internal/producers/SingleDelayedProducer;Ll/gcg0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 15
    .line 16
    .line 17
    return-object v1
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e560;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
