.class public final enum Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "InternalLocalProxyType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

.field public static final enum HTTP_TUNNEL:Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

.field public static final enum SOCKS5:Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

    .line 2
    .line 3
    const-string v1, "SOCKS5"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;->SOCKS5:Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

    .line 11
    .line 12
    new-instance v1, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

    .line 13
    .line 14
    const-string v2, "HTTP_TUNNEL"

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    invoke-direct {v1, v2, v3, v4}, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;->HTTP_TUNNEL:Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

    .line 21
    .line 22
    filled-new-array {v0, v1}, [Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;->$VALUES:[Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

    .line 27
    .line 28
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;->$VALUES:[Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getIntValue()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "InternalLocalProxyType"
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;->value:I

    .line 2
    .line 3
    return p0
.end method
