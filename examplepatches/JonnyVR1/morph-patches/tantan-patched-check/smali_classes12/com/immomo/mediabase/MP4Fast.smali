.class public Lcom/immomo/mediabase/MP4Fast;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static sInstance:Lcom/immomo/mediabase/MP4Fast;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "mediabase"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getInstance()Lcom/immomo/mediabase/MP4Fast;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mediabase/MP4Fast;->sInstance:Lcom/immomo/mediabase/MP4Fast;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/immomo/mediabase/MP4Fast;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/immomo/mediabase/MP4Fast;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/immomo/mediabase/MP4Fast;->sInstance:Lcom/immomo/mediabase/MP4Fast;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Lcom/immomo/mediabase/MP4Fast;->sInstance:Lcom/immomo/mediabase/MP4Fast;

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
    invoke-direct {p0, p1, p2}, Lcom/immomo/mediabase/MP4Fast;->nativeMP4Fast(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
