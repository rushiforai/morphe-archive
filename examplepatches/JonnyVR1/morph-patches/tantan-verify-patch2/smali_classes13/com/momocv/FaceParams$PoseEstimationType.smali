.class public Lcom/momocv/FaceParams$PoseEstimationType;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momocv/FaceParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "PoseEstimationType"
.end annotation


# static fields
.field public static final POSE_ESTIMATION_MORE_PRECISE:I = 0x1

.field public static final POSE_ESTIMATION_NORMAL:I = 0x0

.field public static final POSE_ESTIMATION_NORMAL_BY87POINTS:I = 0x2

.field public static final POSE_ESTIMATION_WITH_EULERS:I = 0x3


# instance fields
.field final synthetic this$0:Lcom/momocv/FaceParams;


# direct methods
.method public constructor <init>(Lcom/momocv/FaceParams;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momocv/FaceParams$PoseEstimationType;->this$0:Lcom/momocv/FaceParams;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
