.class public final Ll/yn50$c;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/yn50;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ll/gcg0<",
        "TR;>;"
    }
.end annotation


# instance fields
.field public final e:Ll/yn50$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/yn50$d<",
            "TT;TR;>;"
        }
    .end annotation
.end field

.field public f:J


# direct methods
.method public constructor <init>(Ll/yn50$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/yn50$d<",
            "TT;TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yn50$c;->e:Ll/yn50$d;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yn50$c;->e:Ll/yn50$d;

    .line 2
    .line 3
    iget-object p0, p0, Ll/yn50$d;->h:Ll/xk90;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xk90;->c(Ll/vk90;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onCompleted()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yn50$c;->e:Ll/yn50$d;

    .line 2
    .line 3
    iget-wide v1, p0, Ll/yn50$c;->f:J

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2}, Ll/yn50$d;->i(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yn50$c;->e:Ll/yn50$d;

    .line 2
    .line 3
    iget-wide v1, p0, Ll/yn50$c;->f:J

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1, v2}, Ll/yn50$d;->j(Ljava/lang/Throwable;J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Ll/yn50$c;->f:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Ll/yn50$c;->f:J

    .line 7
    .line 8
    iget-object p0, p0, Ll/yn50$c;->e:Ll/yn50$d;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/yn50$d;->k(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
