.class public Ll/t4g0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:J

.field public d:J

.field public e:J

.field public f:J


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/t4g0;->b:I

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Ll/t4g0;->c:J

    .line 10
    .line 11
    iput-wide v0, p0, Ll/t4g0;->d:J

    .line 12
    .line 13
    iput p1, p0, Ll/t4g0;->a:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(JI)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/t4g0;->d:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iput-wide p1, p0, Ll/t4g0;->d:J

    .line 10
    .line 11
    iput p3, p0, Ll/t4g0;->b:I

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public b(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/t4g0;->c:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iput-wide p1, p0, Ll/t4g0;->c:J

    .line 10
    .line 11
    :cond_0
    return-void
.end method
