.class Lcom/tencent/liteav/basic/license/LicenceCheck$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/basic/license/LicenceCheck;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field a:Ljava/lang/String;

.field b:Ljava/lang/String;

.field c:Ljava/lang/String;

.field d:Ljava/lang/String;

.field e:Ljava/lang/String;

.field f:Z

.field g:Z

.field h:I

.field i:Ljava/lang/String;

.field final synthetic j:Lcom/tencent/liteav/basic/license/LicenceCheck;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/basic/license/LicenceCheck;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->j:Lcom/tencent/liteav/basic/license/LicenceCheck;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    new-instance p1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p2, ".tmp"

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->b:Ljava/lang/String;

    .line 26
    .line 27
    const-string p1, ""

    .line 28
    .line 29
    iput-object p1, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->c:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p1, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->d:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p1, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->e:Ljava/lang/String;

    .line 34
    .line 35
    const/4 p2, 0x0

    .line 36
    iput-boolean p2, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->f:Z

    .line 37
    .line 38
    iput-boolean p2, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->g:Z

    .line 39
    .line 40
    const/4 p2, -0x1

    .line 41
    iput p2, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->h:I

    .line 42
    .line 43
    iput-object p1, p0, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->i:Ljava/lang/String;

    .line 44
    .line 45
    return-void
.end method
