.class public Ll/ctb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/uni0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ctb$a;
    }
.end annotation


# instance fields
.field public a:J

.field public b:J

.field public c:I

.field public d:J

.field public e:J

.field public f:I

.field public g:Z

.field public h:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x7530

    .line 5
    .line 6
    iput-wide v0, p0, Ll/ctb;->a:J

    .line 7
    .line 8
    const-wide/16 v0, 0x2710

    .line 9
    .line 10
    iput-wide v0, p0, Ll/ctb;->b:J

    .line 11
    .line 12
    const/16 v2, 0x28

    .line 13
    .line 14
    iput v2, p0, Ll/ctb;->c:I

    .line 15
    .line 16
    iput-wide v0, p0, Ll/ctb;->d:J

    .line 17
    .line 18
    const-wide/16 v0, 0x1388

    .line 19
    .line 20
    iput-wide v0, p0, Ll/ctb;->e:J

    .line 21
    .line 22
    const/16 v0, 0xa

    .line 23
    .line 24
    iput v0, p0, Ll/ctb;->f:I

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Ll/ctb;->g:Z

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Ll/ctb;->h:Z

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic c(Ll/ctb;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ctb;->a:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic d(Ll/ctb;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ctb;->g:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic e(Ll/ctb;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/ctb;->f:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic f(Ll/ctb;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ctb;->e:J

    .line 2
    .line 3
    return-wide p1
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ctb;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ctb;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public g()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ctb;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ctb;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public i()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ctb;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public j()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ctb;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public k()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ctb;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public l()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ctb;->e:J

    .line 2
    .line 3
    return-wide v0
.end method
