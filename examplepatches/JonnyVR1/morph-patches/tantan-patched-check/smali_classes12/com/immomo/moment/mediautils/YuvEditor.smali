.class public Lcom/immomo/moment/mediautils/YuvEditor;
.super Ll/n7y;
.source "SourceFile"


# static fields
.field private static sInstance:Lcom/immomo/moment/mediautils/YuvEditor;


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

.method public static getDefault()Lcom/immomo/moment/mediautils/YuvEditor;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/moment/mediautils/YuvEditor;->sInstance:Lcom/immomo/moment/mediautils/YuvEditor;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/immomo/moment/mediautils/YuvEditor;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/YuvEditor;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/immomo/moment/mediautils/YuvEditor;->sInstance:Lcom/immomo/moment/mediautils/YuvEditor;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Lcom/immomo/moment/mediautils/YuvEditor;->sInstance:Lcom/immomo/moment/mediautils/YuvEditor;

    .line 13
    .line 14
    return-object v0
.end method

.method private native nativeArgb2Nv21([III)[B
.end method

.method private native nativeNV21toARGB([BII)[B
.end method


# virtual methods
.method public ConvertARGBToNV21([III)[B
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/moment/mediautils/YuvEditor;->nativeArgb2Nv21([III)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public ConvertNV21ToARGB([BII)[B
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/moment/mediautils/YuvEditor;->nativeNV21toARGB([BII)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
