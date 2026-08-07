.class public Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$CommonStatusCodes;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CommonStatusCodes"
.end annotation


# static fields
.field public static final APP_DISABLE_EXCEPTION:I = 0x3f3

.field public static final AUTHCODE_EXPECTED:I = 0x3ec

.field public static final AUTHCODE_INVALID:I = 0x3ef

.field public static final AUTHCODE_NOT_INIT:I = -0x2

.field public static final AUTHCODE_NOT_SUPPORT:I = -0x3

.field public static final AUTHCODE_NO_PERMISSION:I = -0x1

.field public static final AUTHCODE_RECYCLE:I = 0x3ee

.field public static final AUTHENTICATE_FAIL:I = 0x3ea

.field public static final AUTHENTICATE_SUCCESS:I = 0x3e9

.field public static final CAPABILITY_EXCEPTION:I = 0x3f0

.field public static final INTERNAL_EXCEPTION:I = 0x3f2

.field public static final STATUS_EXCEPTION:I = 0x3f1

.field public static final TIME_EXPIRED:I = 0x3eb

.field public static final VERSION_INCOMPATIBLE:I = 0x3ed


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
