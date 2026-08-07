.class public Lcom/mm/mediasdk/bean/RecorderInitConfig$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mm/mediasdk/bean/RecorderInitConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private a:Z

.field private b:Ljava/lang/String;

.field private c:I

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->a:Z

    .line 6
    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->f:J

    .line 10
    .line 11
    iput-object p1, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->b:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Lcom/mm/mediasdk/bean/RecorderInitConfig$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/mm/mediasdk/bean/RecorderInitConfig$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Lcom/mm/mediasdk/bean/RecorderInitConfig$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/mm/mediasdk/bean/RecorderInitConfig$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/mm/mediasdk/bean/RecorderInitConfig$b;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic f(Lcom/mm/mediasdk/bean/RecorderInitConfig$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->a:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public g()Lcom/mm/mediasdk/bean/RecorderInitConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/mm/mediasdk/bean/RecorderInitConfig;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/mm/mediasdk/bean/RecorderInitConfig;-><init>(Lcom/mm/mediasdk/bean/RecorderInitConfig$b;Lcom/mm/mediasdk/bean/RecorderInitConfig$a;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public h(I)Lcom/mm/mediasdk/bean/RecorderInitConfig$b;
    .locals 2

    .line 1
    const v0, 0xea60

    .line 2
    .line 3
    .line 4
    mul-int/2addr p1, v0

    .line 5
    int-to-long v0, p1

    .line 6
    iput-wide v0, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->f:J

    .line 7
    .line 8
    return-object p0
.end method

.method public i(Ljava/lang/String;)Lcom/mm/mediasdk/bean/RecorderInitConfig$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(I)Lcom/mm/mediasdk/bean/RecorderInitConfig$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ljava/lang/String;)Lcom/mm/mediasdk/bean/RecorderInitConfig$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mediasdk/bean/RecorderInitConfig$b;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
