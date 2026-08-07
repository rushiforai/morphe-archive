.class public Lcom/tencent/rtmp/sharp/jni/TraeAudioCodecList$CodecInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/rtmp/sharp/jni/TraeAudioCodecList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CodecInfo"
.end annotation


# instance fields
.field public _tempBufdec:[B

.field public audioDecoder:Lcom/tencent/rtmp/sharp/jni/AudioDecoder;

.field public sessionId:J

.field final synthetic this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioCodecList;


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/sharp/jni/TraeAudioCodecList;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioCodecList$CodecInfo;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioCodecList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
