.class public Lcom/tencent/liteav/h;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:F

.field public c:F

.field public d:I

.field public e:I

.field public f:I

.field public g:Z

.field public h:Z

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:Ljava/lang/String;

.field public m:I

.field public n:Ljava/lang/String;

.field public o:I

.field public p:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public q:I

.field public r:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x40a00000    # 5.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/tencent/liteav/h;->a:F

    .line 7
    .line 8
    iput v0, p0, Lcom/tencent/liteav/h;->b:F

    .line 9
    .line 10
    const/high16 v0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    iput v0, p0, Lcom/tencent/liteav/h;->c:F

    .line 13
    .line 14
    const/16 v0, 0x320

    .line 15
    .line 16
    iput v0, p0, Lcom/tencent/liteav/h;->d:I

    .line 17
    .line 18
    const/4 v0, 0x5

    .line 19
    iput v0, p0, Lcom/tencent/liteav/h;->e:I

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput v0, p0, Lcom/tencent/liteav/h;->f:I

    .line 23
    .line 24
    iput-boolean v0, p0, Lcom/tencent/liteav/h;->g:Z

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/tencent/liteav/h;->h:Z

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/tencent/liteav/h;->i:Z

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    iput-boolean v1, p0, Lcom/tencent/liteav/h;->j:Z

    .line 32
    .line 33
    iput-boolean v1, p0, Lcom/tencent/liteav/h;->k:Z

    .line 34
    .line 35
    const-string v1, ""

    .line 36
    .line 37
    iput-object v1, p0, Lcom/tencent/liteav/h;->l:Ljava/lang/String;

    .line 38
    .line 39
    iput v0, p0, Lcom/tencent/liteav/h;->m:I

    .line 40
    .line 41
    const/16 v0, 0xa

    .line 42
    .line 43
    iput v0, p0, Lcom/tencent/liteav/h;->q:I

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    iput-object v0, p0, Lcom/tencent/liteav/h;->r:Lorg/json/JSONArray;

    .line 47
    .line 48
    return-void
.end method
