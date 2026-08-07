.class public Ll/jct;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput p1, p0, Ll/jct;->a:I

    return-void
.end method

.method public constructor <init>(ILcom/p1/mobile/putong/live/base/data/BLivePkStage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/jct;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/jct;->b:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 7
    .line 8
    return-void
.end method

.method public static a(I)Ll/jct;
    .locals 1

    .line 1
    new-instance v0, Ll/jct;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jct;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static b(ILcom/p1/mobile/putong/live/base/data/BLivePkStage;)Ll/jct;
    .locals 1

    .line 1
    new-instance v0, Ll/jct;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/jct;-><init>(ILcom/p1/mobile/putong/live/base/data/BLivePkStage;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
