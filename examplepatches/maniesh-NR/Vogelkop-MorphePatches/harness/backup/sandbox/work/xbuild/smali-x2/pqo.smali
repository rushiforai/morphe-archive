.class public final Lpqo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:D

.field public c:D

.field public d:Ldro;

.field public e:B

.field public f:Z


# direct methods
.method public constructor <init>(Lpqo;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lpqo;->a:Ljava/lang/String;

    iput-object v0, p0, Lpqo;->a:Ljava/lang/String;

    iget-wide v0, p1, Lpqo;->b:D

    iput-wide v0, p0, Lpqo;->b:D

    iget-wide v0, p1, Lpqo;->c:D

    iput-wide v0, p0, Lpqo;->c:D

    iget-object v0, p1, Lpqo;->d:Ldro;

    iput-object v0, p0, Lpqo;->d:Ldro;

    iget-byte v0, p1, Lpqo;->e:B

    iput-byte v0, p0, Lpqo;->e:B

    iget-boolean p1, p1, Lpqo;->f:Z

    iput-boolean p1, p0, Lpqo;->f:Z

    return-void
.end method
