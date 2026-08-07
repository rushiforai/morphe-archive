.class Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/FFVideoDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AVFrame"
.end annotation


# instance fields
.field frame:[B

.field pts:J

.field size:I

.field final synthetic this$0:Lcom/immomo/moment/mediautils/FFVideoDecoder;


# direct methods
.method private constructor <init>(Lcom/immomo/moment/mediautils/FFVideoDecoder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;->this$0:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/immomo/moment/mediautils/FFVideoDecoder;Lcom/immomo/moment/mediautils/FFVideoDecoder$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/FFVideoDecoder$AVFrame;-><init>(Lcom/immomo/moment/mediautils/FFVideoDecoder;)V

    return-void
.end method
