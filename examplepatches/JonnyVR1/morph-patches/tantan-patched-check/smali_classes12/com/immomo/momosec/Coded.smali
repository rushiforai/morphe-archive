.class public Lcom/immomo/momosec/Coded;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final MOMOSEC_GET_BOOT_ID_SYNC_FILE:I = 0x6a

.field public static final MOMOSEC_GET_BUILDINFO:I = 0x65

.field public static final MOMOSEC_GET_DECRYPT_DATA:I = 0x67

.field public static final MOMOSEC_GET_ENCRYPT_DATA:I = 0x66

.field public static final MOMOSEC_GET_FILE_STAT:I = 0x6b

.field public static final MOMOSEC_GET_MACADDRESS:I = 0x64

.field public static final MOMOSEC_READ_LOCAL_BOOT_ID:I = 0x68

.field public static final MOMOSEC_TEST:I = 0x6e


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "mmsmses"

    .line 2
    .line 3
    invoke-static {v0}, Ll/udr;->d(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
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

.method public static native doCommand([BI)[B
.end method
