.class public final Ll/xhy;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:J

.field private c:Z

.field private d:Z

.field private e:J

.field private f:J

.field private g:Z


# direct methods
.method public constructor <init>(JI)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/xhy;->e:J

    .line 7
    .line 8
    iput-wide v0, p0, Ll/xhy;->f:J

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Ll/xhy;->g:Z

    .line 12
    .line 13
    iput-wide p1, p0, Ll/xhy;->b:J

    .line 14
    .line 15
    iput p3, p0, Ll/xhy;->a:I

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/xhy;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/xhy;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/xhy;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/xhy;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/xhy;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public f(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/xhy;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public g(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/xhy;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public h(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/xhy;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public i(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/xhy;->f:J

    .line 2
    .line 3
    return-void
.end method

.method public j(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/xhy;->e:J

    .line 2
    .line 3
    return-void
.end method
