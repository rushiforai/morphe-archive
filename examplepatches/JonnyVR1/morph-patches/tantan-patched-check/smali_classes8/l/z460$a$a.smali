.class public Ll/z460$a$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/z460$a;->b(Ll/y460$c;Ljava/lang/Long;Ll/f2e0$a;)Ll/kcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TU;>;"
    }
.end annotation


# instance fields
.field public final synthetic e:Ll/y460$c;

.field public final synthetic f:Ljava/lang/Long;

.field public final synthetic g:Ll/z460$a;


# direct methods
.method public constructor <init>(Ll/z460$a;Ll/y460$c;Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z460$a$a;->g:Ll/z460$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/z460$a$a;->e:Ll/y460$c;

    .line 4
    .line 5
    iput-object p3, p0, Ll/z460$a$a;->f:Ljava/lang/Long;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/z460$a$a;->e:Ll/y460$c;

    .line 2
    .line 3
    iget-object p0, p0, Ll/z460$a$a;->f:Ljava/lang/Long;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {v0, v1, v2}, Ll/y460$c;->g(J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z460$a$a;->e:Ll/y460$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y460$c;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TU;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Ll/z460$a$a;->e:Ll/y460$c;

    .line 2
    .line 3
    iget-object p0, p0, Ll/z460$a$a;->f:Ljava/lang/Long;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-virtual {p1, v0, v1}, Ll/y460$c;->g(J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
