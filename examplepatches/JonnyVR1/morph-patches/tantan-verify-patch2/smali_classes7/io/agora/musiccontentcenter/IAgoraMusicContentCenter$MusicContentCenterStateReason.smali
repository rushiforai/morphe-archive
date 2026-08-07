.class Lio/agora/musiccontentcenter/IAgoraMusicContentCenter$MusicContentCenterStateReason;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/musiccontentcenter/IAgoraMusicContentCenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MusicContentCenterStateReason"
.end annotation


# static fields
.field public static final MUSIC_CONTENT_CENTER_STATE_REASON_ERROR:I = 0x1

.field public static final MUSIC_CONTENT_CENTER_STATE_REASON_GATEWAY:I = 0x2

.field public static final MUSIC_CONTENT_CENTER_STATE_REASON_HTTP_INTERNAL:I = 0x7

.field public static final MUSIC_CONTENT_CENTER_STATE_REASON_INTERNAL_DATA_PARSE:I = 0x4

.field public static final MUSIC_CONTENT_CENTER_STATE_REASON_MUSIC_DECRYPTION:I = 0x6

.field public static final MUSIC_CONTENT_CENTER_STATE_REASON_MUSIC_LOADING:I = 0x5

.field public static final MUSIC_CONTENT_CENTER_STATE_REASON_OK:I = 0x0

.field public static final MUSIC_CONTENT_CENTER_STATE_REASON_PERMISSION_AND_RESOURCE:I = 0x3


# instance fields
.field final synthetic this$0:Lio/agora/musiccontentcenter/IAgoraMusicContentCenter;


# direct methods
.method private constructor <init>(Lio/agora/musiccontentcenter/IAgoraMusicContentCenter;)V
    .locals 0

    iput-object p1, p0, Lio/agora/musiccontentcenter/IAgoraMusicContentCenter$MusicContentCenterStateReason;->this$0:Lio/agora/musiccontentcenter/IAgoraMusicContentCenter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
