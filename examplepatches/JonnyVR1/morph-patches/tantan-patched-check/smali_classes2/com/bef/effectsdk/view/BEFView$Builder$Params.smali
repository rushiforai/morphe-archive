.class Lcom/bef/effectsdk/view/BEFView$Builder$Params;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bef/effectsdk/view/BEFView$Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Params"
.end annotation


# instance fields
.field private mFPS:D

.field private mFitMode:Lcom/bef/effectsdk/view/BEFView$FitMode;

.field private mKeepStatusAtPause:Z

.field private mNeglectTouchEvent:Z

.field private mRenderHeight:I

.field private mRenderWidth:I

.field private mResourceFinder:Lcom/bef/effectsdk/ResourceFinder;

.field private mSceneKey:Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;

.field final synthetic this$0:Lcom/bef/effectsdk/view/BEFView$Builder;


# direct methods
.method private constructor <init>(Lcom/bef/effectsdk/view/BEFView$Builder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->this$0:Lcom/bef/effectsdk/view/BEFView$Builder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/bef/effectsdk/view/BEFView$Builder;Lcom/bef/effectsdk/view/BEFView$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;-><init>(Lcom/bef/effectsdk/view/BEFView$Builder;)V

    return-void
.end method

.method public static synthetic access$100(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->mRenderWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$102(Lcom/bef/effectsdk/view/BEFView$Builder$Params;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->mRenderWidth:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$200(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->mRenderHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$202(Lcom/bef/effectsdk/view/BEFView$Builder$Params;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->mRenderHeight:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$300(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->mFPS:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$302(Lcom/bef/effectsdk/view/BEFView$Builder$Params;D)D
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->mFPS:D

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$400(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Lcom/bef/effectsdk/view/BEFView$FitMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->mFitMode:Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$402(Lcom/bef/effectsdk/view/BEFView$Builder$Params;Lcom/bef/effectsdk/view/BEFView$FitMode;)Lcom/bef/effectsdk/view/BEFView$FitMode;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->mFitMode:Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$500(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Lcom/bef/effectsdk/ResourceFinder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->mResourceFinder:Lcom/bef/effectsdk/ResourceFinder;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$502(Lcom/bef/effectsdk/view/BEFView$Builder$Params;Lcom/bef/effectsdk/ResourceFinder;)Lcom/bef/effectsdk/ResourceFinder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->mResourceFinder:Lcom/bef/effectsdk/ResourceFinder;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$600(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->mSceneKey:Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$602(Lcom/bef/effectsdk/view/BEFView$Builder$Params;Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;)Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->mSceneKey:Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$700(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->mNeglectTouchEvent:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$702(Lcom/bef/effectsdk/view/BEFView$Builder$Params;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->mNeglectTouchEvent:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$800(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->mKeepStatusAtPause:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$802(Lcom/bef/effectsdk/view/BEFView$Builder$Params;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->mKeepStatusAtPause:Z

    .line 2
    .line 3
    return p1
.end method
