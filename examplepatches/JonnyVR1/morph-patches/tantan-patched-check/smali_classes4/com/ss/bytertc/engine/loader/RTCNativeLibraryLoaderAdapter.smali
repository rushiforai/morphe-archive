.class public Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderAdapter;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field protected static mRtcNativeLibraryLoader:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoader;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderImpl;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderImpl;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderAdapter;->mRtcNativeLibraryLoader:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoader;

    .line 7
    .line 8
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

.method public static getRtcNativeLibraryLoader()Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoader;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderAdapter;->mRtcNativeLibraryLoader:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoader;

    .line 2
    .line 3
    return-object v0
.end method

.method public static setRtcNativeLibraryLoader(Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoader;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderAdapter;->mRtcNativeLibraryLoader:Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoader;

    .line 2
    .line 3
    return-void
.end method
