.class public final Lcom/immomo/hdata/BuildConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final BUILD_TYPE:Ljava/lang/String;

.field public static final DEBUG:Z = false

.field public static final LIBRARY_PACKAGE_NAME:Ljava/lang/String;

.field public static final SDK_VERSION:Ljava/lang/String;

.field public static final UPLOAD_URL_CODE:I = 0x1e


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/immomo/hdata/BuildConfig;->LIBRARY_PACKAGE_NAME:Ljava/lang/String;

    const/4 v0, 0x7

    new-array v0, v0, [B

    fill-array-data v0, :array_1

    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/immomo/hdata/BuildConfig;->BUILD_TYPE:Ljava/lang/String;

    const/4 v0, 0x5

    new-array v0, v0, [B

    fill-array-data v0, :array_2

    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/immomo/hdata/BuildConfig;->SDK_VERSION:Ljava/lang/String;

    return-void

    :array_0
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x8t
        0xbt
        0x5dt
        0x9t
        0x5ct
        0x58t
        0x4ft
        0xet
        0x54t
        0x7t
        0x45t
        0x56t
    .end array-data

    :array_1
    .array-data 1
        0x42t
        0x3t
        0x5dt
        0x52t
        0x0t
        0x15t
        0x55t
    .end array-data

    :array_2
    .array-data 1
        0x2t
        0x48t
        0x2t
        0x19t
        0x50t
    .end array-data
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
