.class public abstract Lcom/effectsar/labcv/effectsdk/ReflectResourceFinder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bef/effectsdk/ResourceFinder;


# instance fields
.field private mModelsDir:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/ReflectResourceFinder;->mModelsDir:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private native nativeCreateReflectResourceFinder(J)J
.end method


# virtual methods
.method public createNativeResourceFinder(J)J
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/ReflectResourceFinder;->nativeCreateReflectResourceFinder(J)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public abstract findResource(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public release(J)V
    .locals 0

    return-void
.end method
