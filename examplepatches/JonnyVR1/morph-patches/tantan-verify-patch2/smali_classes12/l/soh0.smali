.class public Ll/soh0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public b:J

.field public c:J

.field public d:J

.field public e:J

.field public f:J

.field public g:J

.field public h:Z

.field public i:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/soh0;->h:Z

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Ll/soh0;->i:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()J
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/soh0;->a:J

    .line 2
    .line 3
    iget-wide v2, p0, Ll/soh0;->b:J

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iget-wide v2, p0, Ll/soh0;->c:J

    .line 7
    .line 8
    add-long/2addr v0, v2

    .line 9
    iget-wide v2, p0, Ll/soh0;->d:J

    .line 10
    .line 11
    add-long/2addr v0, v2

    .line 12
    iget-wide v2, p0, Ll/soh0;->e:J

    .line 13
    .line 14
    add-long/2addr v0, v2

    .line 15
    iget-wide v2, p0, Ll/soh0;->f:J

    .line 16
    .line 17
    add-long/2addr v0, v2

    .line 18
    iget-wide v2, p0, Ll/soh0;->g:J

    .line 19
    .line 20
    add-long/2addr v0, v2

    .line 21
    return-wide v0
.end method
