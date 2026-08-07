.class public Lcom/immomo/moment/mediautils/MP4Fast;
.super Ll/n7y;
.source "SourceFile"


# static fields
.field private static sInstance:Lcom/immomo/moment/mediautils/MP4Fast;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/n7y;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getInstance()Lcom/immomo/moment/mediautils/MP4Fast;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/moment/mediautils/MP4Fast;->sInstance:Lcom/immomo/moment/mediautils/MP4Fast;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/immomo/moment/mediautils/MP4Fast;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/MP4Fast;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/immomo/moment/mediautils/MP4Fast;->sInstance:Lcom/immomo/moment/mediautils/MP4Fast;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Lcom/immomo/moment/mediautils/MP4Fast;->sInstance:Lcom/immomo/moment/mediautils/MP4Fast;

    .line 13
    .line 14
    return-object v0
.end method

.method private native nativeMP4Fast(Ljava/lang/String;Ljava/lang/String;)I
.end method


# virtual methods
.method public mp4Fast(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/MP4Fast;->nativeMP4Fast(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
