.class public final Ll/m460$c;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/m460;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final e:J

.field public final f:Ll/m460$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/m460$d<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(JLl/m460$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ll/m460$d<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/m460$c;->e:J

    .line 5
    .line 6
    iput-object p3, p0, Ll/m460$c;->f:Ll/m460$d;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic g(Ll/m460$c;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/m460$c;->e:J

    .line 2
    .line 3
    return-wide v0
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/m460$c;->f:Ll/m460$d;

    .line 2
    .line 3
    iget-wide v1, p0, Ll/m460$c;->e:J

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1, v2}, Ll/m460$d;->o(Ll/vk90;J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onCompleted()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/m460$c;->f:Ll/m460$d;

    .line 2
    .line 3
    iget-wide v1, p0, Ll/m460$c;->e:J

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2}, Ll/m460$d;->j(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/m460$c;->f:Ll/m460$d;

    .line 2
    .line 3
    iget-wide v1, p0, Ll/m460$c;->e:J

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1, v2}, Ll/m460$d;->m(Ljava/lang/Throwable;J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/m460$c;->f:Ll/m460$d;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p0}, Ll/m460$d;->l(Ljava/lang/Object;Ll/m460$c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
