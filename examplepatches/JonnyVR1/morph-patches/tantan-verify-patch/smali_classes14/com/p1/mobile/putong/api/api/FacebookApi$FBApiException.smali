.class Lcom/p1/mobile/putong/api/api/FacebookApi$FBApiException;
.super Ljava/lang/Throwable;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/api/api/FacebookApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FBApiException"
.end annotation


# static fields
.field public static PERMISSION_DENIED:I = 0xa

.field public static TOKEN_EXPIRED:I = 0xbe


# instance fields
.field error:Lcom/facebook/FacebookRequestError;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Throwable;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
