.class public final Lnxd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I

.field public c:J

.field public d:J

.field public e:J

.field public f:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;IJJJZ)V
    .registers 10

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lnxd;->a:Ljava/lang/String;

    .line 30
    iput p2, p0, Lnxd;->b:I

    .line 31
    iput-wide p3, p0, Lnxd;->c:J

    .line 32
    iput-wide p5, p0, Lnxd;->d:J

    .line 33
    iput-wide p7, p0, Lnxd;->e:J

    .line 34
    iput-boolean p9, p0, Lnxd;->f:Z

    return-void
.end method

.method public constructor <init>(Lnxd;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lnxd;->a:Ljava/lang/String;

    iput-object v0, p0, Lnxd;->a:Ljava/lang/String;

    iget v0, p1, Lnxd;->b:I

    iput v0, p0, Lnxd;->b:I

    iget-wide v0, p1, Lnxd;->c:J

    iput-wide v0, p0, Lnxd;->c:J

    iget-wide v0, p1, Lnxd;->d:J

    iput-wide v0, p0, Lnxd;->d:J

    iget-wide v0, p1, Lnxd;->e:J

    iput-wide v0, p0, Lnxd;->e:J

    iget-boolean p1, p1, Lnxd;->f:Z

    iput-boolean p1, p0, Lnxd;->f:Z

    return-void
.end method
