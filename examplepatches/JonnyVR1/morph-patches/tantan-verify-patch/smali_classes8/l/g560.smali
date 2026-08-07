.class public final Ll/g560;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/g560$a;,
        Ll/g560$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "Lrx/c<",
        "TT;>;TT;>;"
    }
.end annotation


# static fields
.field public static final b:Ljava/lang/Object;

.field public static final c:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TU;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/g560;->b:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Ll/g560;->c:Lrx/internal/operators/NotificationLite;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Lrx/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TU;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/g560;->a:Lrx/c;

    .line 5
    .line 6
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
            "Lrx/c<",
            "TT;>;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/g560$b;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/g560$b;-><init>(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/g560$a;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/g560$a;-><init>(Ll/g560$b;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ll/g560$b;->m()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/g560;->a:Lrx/c;

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/g560;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
