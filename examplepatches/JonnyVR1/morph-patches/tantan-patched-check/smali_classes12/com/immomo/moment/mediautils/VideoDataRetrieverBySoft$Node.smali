.class public Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Node"
.end annotation


# instance fields
.field public bmp:Landroid/graphics/Bitmap;

.field public byteBuffer:[B

.field public dstHeight:I

.field public dstWidth:I

.field public intBuffer:[I

.field public pts:J

.field public seqNum:I


# direct methods
.method public constructor <init>(JI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->pts:J

    .line 5
    .line 6
    iput p3, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->seqNum:I

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->dstWidth:I

    .line 10
    .line 11
    iput p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->dstHeight:I

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(JIII)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->pts:J

    .line 16
    iput p3, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->seqNum:I

    .line 17
    iput p4, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->dstWidth:I

    .line 18
    iput p5, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->dstHeight:I

    return-void
.end method
