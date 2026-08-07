.class public Lio/agora/rtc2/internal/SimpleMediaPlayerSource$MediaStreamInfoWrapper;
.super Lio/agora/mediaplayer/data/MediaStreamInfo;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/SimpleMediaPlayerSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaStreamInfoWrapper"
.end annotation


# instance fields
.field private format:Landroid/media/MediaFormat;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/media/MediaFormat;)V
    .locals 0
    .param p1    # Landroid/media/MediaFormat;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Lio/agora/mediaplayer/data/MediaStreamInfo;-><init>()V

    iput-object p1, p0, Lio/agora/rtc2/internal/SimpleMediaPlayerSource$MediaStreamInfoWrapper;->format:Landroid/media/MediaFormat;

    return-void
.end method


# virtual methods
.method public getFormat()Landroid/media/MediaFormat;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/internal/SimpleMediaPlayerSource$MediaStreamInfoWrapper;->format:Landroid/media/MediaFormat;

    return-object p0
.end method
