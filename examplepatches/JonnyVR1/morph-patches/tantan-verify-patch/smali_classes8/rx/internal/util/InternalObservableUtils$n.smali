.class public final Lrx/internal/util/InternalObservableUtils$n;
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
    name = "n"
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
.field public final a:J

.field public final b:Ljava/util/concurrent/TimeUnit;

.field public final c:Ll/f2e0;

.field public final d:I

.field public final e:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/c;IJLjava/util/concurrent/TimeUnit;Ll/f2e0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TT;>;IJ",
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
    iput-wide p3, p0, Lrx/internal/util/InternalObservableUtils$n;->a:J

    .line 5
    .line 6
    iput-object p5, p0, Lrx/internal/util/InternalObservableUtils$n;->b:Ljava/util/concurrent/TimeUnit;

    .line 7
    .line 8
    iput-object p6, p0, Lrx/internal/util/InternalObservableUtils$n;->c:Ll/f2e0;

    .line 9
    .line 10
    iput p2, p0, Lrx/internal/util/InternalObservableUtils$n;->d:I

    .line 11
    .line 12
    iput-object p1, p0, Lrx/internal/util/InternalObservableUtils$n;->e:Lrx/c;

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(Lrx/c;IJLjava/util/concurrent/TimeUnit;Ll/f2e0;Lrx/internal/util/InternalObservableUtils$a;)V
    .locals 0

    .line 15
    invoke-direct/range {p0 .. p6}, Lrx/internal/util/InternalObservableUtils$n;-><init>(Lrx/c;IJLjava/util/concurrent/TimeUnit;Ll/f2e0;)V

    return-void
.end method


# virtual methods
.method public a()Ll/ax5;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/util/InternalObservableUtils$n;->e:Lrx/c;

    .line 2
    .line 3
    iget v1, p0, Lrx/internal/util/InternalObservableUtils$n;->d:I

    .line 4
    .line 5
    iget-wide v2, p0, Lrx/internal/util/InternalObservableUtils$n;->a:J

    .line 6
    .line 7
    iget-object v4, p0, Lrx/internal/util/InternalObservableUtils$n;->b:Ljava/util/concurrent/TimeUnit;

    .line 8
    .line 9
    iget-object v5, p0, Lrx/internal/util/InternalObservableUtils$n;->c:Ll/f2e0;

    .line 10
    .line 11
    invoke-virtual/range {v0 .. v5}, Lrx/c;->replay(IJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Ll/ax5;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lrx/internal/util/InternalObservableUtils$n;->a()Ll/ax5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
