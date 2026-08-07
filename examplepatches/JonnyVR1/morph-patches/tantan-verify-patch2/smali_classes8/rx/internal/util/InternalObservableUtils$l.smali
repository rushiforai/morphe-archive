.class public final Lrx/internal/util/InternalObservableUtils$l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/util/InternalObservableUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "l"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/pcj<",
        "Ll/ax5<",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field public final a:Ljava/util/concurrent/TimeUnit;

.field public final b:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final c:J

.field public final d:Ll/f2e0;


# direct methods
.method public constructor <init>(Lrx/c;JLjava/util/concurrent/TimeUnit;Ll/f2e0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p4, p0, Lrx/internal/util/InternalObservableUtils$l;->a:Ljava/util/concurrent/TimeUnit;

    .line 5
    .line 6
    iput-object p1, p0, Lrx/internal/util/InternalObservableUtils$l;->b:Lrx/c;

    .line 7
    .line 8
    iput-wide p2, p0, Lrx/internal/util/InternalObservableUtils$l;->c:J

    .line 9
    .line 10
    iput-object p5, p0, Lrx/internal/util/InternalObservableUtils$l;->d:Ll/f2e0;

    .line 11
    .line 12
    return-void
.end method

.method public synthetic constructor <init>(Lrx/c;JLjava/util/concurrent/TimeUnit;Ll/f2e0;Lrx/internal/util/InternalObservableUtils$a;)V
    .locals 0

    .line 13
    invoke-direct/range {p0 .. p5}, Lrx/internal/util/InternalObservableUtils$l;-><init>(Lrx/c;JLjava/util/concurrent/TimeUnit;Ll/f2e0;)V

    return-void
.end method


# virtual methods
.method public a()Ll/ax5;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/util/InternalObservableUtils$l;->b:Lrx/c;

    .line 2
    .line 3
    iget-wide v1, p0, Lrx/internal/util/InternalObservableUtils$l;->c:J

    .line 4
    .line 5
    iget-object v3, p0, Lrx/internal/util/InternalObservableUtils$l;->a:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    iget-object p0, p0, Lrx/internal/util/InternalObservableUtils$l;->d:Ll/f2e0;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, v3, p0}, Lrx/c;->replay(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Ll/ax5;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lrx/internal/util/InternalObservableUtils$l;->a()Ll/ax5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
