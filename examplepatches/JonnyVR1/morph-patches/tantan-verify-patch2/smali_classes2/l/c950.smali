.class public Ll/c950;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/c950$b;
    }
.end annotation


# instance fields
.field private a:Lcom/momocv/objectdetect/ObjectDetect;

.field private b:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/c950$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c950;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b()Ll/c950;
    .locals 1

    .line 1
    invoke-static {}, Ll/c950$b;->a()Ll/c950;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c950;->a:Lcom/momocv/objectdetect/ObjectDetect;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/momocv/objectdetect/ObjectDetect;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/momocv/objectdetect/ObjectDetect;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/c950;->a:Lcom/momocv/objectdetect/ObjectDetect;

    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/c950;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/c950;->b:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/c950;->b:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/c950;->d(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public d(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c950;->c()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/c950;->b:Ljava/lang/String;

    .line 5
    .line 6
    iget-object p0, p0, Ll/c950;->a:Lcom/momocv/objectdetect/ObjectDetect;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/momocv/objectdetect/ObjectDetect;->LoadModel(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public e(Lcom/momocv/MMFrame;Lcom/momocv/objectdetect/ObjectDetectParams;Lcom/momocv/objectdetect/ObjectDetectInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c950;->a:Lcom/momocv/objectdetect/ObjectDetect;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/momocv/objectdetect/ObjectDetect;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/objectdetect/ObjectDetectParams;Lcom/momocv/objectdetect/ObjectDetectInfo;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c950;->a:Lcom/momocv/objectdetect/ObjectDetect;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momocv/objectdetect/ObjectDetect;->Release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/c950;->a:Lcom/momocv/objectdetect/ObjectDetect;

    .line 10
    .line 11
    :cond_0
    return-void
.end method
