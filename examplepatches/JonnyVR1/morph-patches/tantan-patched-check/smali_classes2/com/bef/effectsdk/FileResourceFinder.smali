.class public final Lcom/bef/effectsdk/FileResourceFinder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bef/effectsdk/ResourceFinder;


# instance fields
.field private final mDir:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/bef/effectsdk/FileResourceFinder;->mDir:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private static native nativeCreateFileResourceFinder(JLjava/lang/String;)J
.end method


# virtual methods
.method public createNativeResourceFinder(J)J
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/FileResourceFinder;->mDir:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p2, p0}, Lcom/bef/effectsdk/FileResourceFinder;->nativeCreateFileResourceFinder(JLjava/lang/String;)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public release(J)V
    .locals 0

    return-void
.end method
