.class public Ll/w460$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/w460;->a(Ll/gcg0;)Ll/gcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public e:J

.field public final synthetic f:Ll/gcg0;

.field public final synthetic g:Ll/w460;


# direct methods
.method public constructor <init>(Ll/w460;Ll/gcg0;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w460$a;->g:Ll/w460;

    .line 2
    .line 3
    iput-object p3, p0, Ll/w460$a;->f:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Ll/w460;->a:Ll/f2e0;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/f2e0;->now()J

    .line 11
    .line 12
    .line 13
    move-result-wide p1

    .line 14
    iput-wide p1, p0, Ll/w460$a;->e:J

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w460$a;->f:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w460$a;->f:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/w460$a;->g:Ll/w460;

    .line 2
    .line 3
    iget-object v0, v0, Ll/w460;->a:Ll/f2e0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/f2e0;->now()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-object v2, p0, Ll/w460$a;->f:Ll/gcg0;

    .line 10
    .line 11
    new-instance v3, Ll/qzi0;

    .line 12
    .line 13
    iget-wide v4, p0, Ll/w460$a;->e:J

    .line 14
    .line 15
    sub-long v4, v0, v4

    .line 16
    .line 17
    invoke-direct {v3, v4, v5, p1}, Ll/qzi0;-><init>(JLjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v2, v3}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iput-wide v0, p0, Ll/w460$a;->e:J

    .line 24
    .line 25
    return-void
.end method
