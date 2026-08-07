.class public Ll/i4j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/uni0;


# instance fields
.field public a:Z

.field public b:Z

.field public c:I

.field public d:I

.field public e:I

.field public f:J

.field public g:J

.field public h:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/i4j;->a:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/i4j;->b:Z

    .line 9
    .line 10
    const/16 v0, 0x2a

    .line 11
    .line 12
    iput v0, p0, Ll/i4j;->c:I

    .line 13
    .line 14
    const/16 v0, 0x18

    .line 15
    .line 16
    iput v0, p0, Ll/i4j;->d:I

    .line 17
    .line 18
    const/16 v0, 0x9

    .line 19
    .line 20
    iput v0, p0, Ll/i4j;->e:I

    .line 21
    .line 22
    const-wide/32 v0, 0x927c0

    .line 23
    .line 24
    .line 25
    iput-wide v0, p0, Ll/i4j;->f:J

    .line 26
    .line 27
    const-wide/16 v0, 0x2710

    .line 28
    .line 29
    iput-wide v0, p0, Ll/i4j;->g:J

    .line 30
    .line 31
    const/16 v0, 0x32

    .line 32
    .line 33
    iput v0, p0, Ll/i4j;->h:I

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/i4j;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/i4j;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/i4j;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/i4j;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/i4j;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public f()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/i4j;->g:J

    .line 2
    .line 3
    return-wide v0
.end method
