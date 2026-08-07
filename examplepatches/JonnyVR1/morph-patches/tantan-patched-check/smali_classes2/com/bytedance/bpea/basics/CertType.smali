.class public final enum Lcom/bytedance/bpea/basics/CertType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/bytedance/bpea/basics/CertType;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0006\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/bytedance/bpea/basics/CertType;",
        "",
        "type",
        "",
        "(Ljava/lang/String;II)V",
        "getType",
        "()I",
        "PRIVACY_CERT",
        "TOKEN_CERT",
        "basics_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/bytedance/bpea/basics/CertType;

.field public static final enum PRIVACY_CERT:Lcom/bytedance/bpea/basics/CertType;

.field public static final enum TOKEN_CERT:Lcom/bytedance/bpea/basics/CertType;


# instance fields
.field private final type:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/bytedance/bpea/basics/CertType;

    .line 2
    .line 3
    const-string v1, "PRIVACY_CERT"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/bytedance/bpea/basics/CertType;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/bytedance/bpea/basics/CertType;->PRIVACY_CERT:Lcom/bytedance/bpea/basics/CertType;

    .line 11
    .line 12
    new-instance v1, Lcom/bytedance/bpea/basics/CertType;

    .line 13
    .line 14
    const-string v2, "TOKEN_CERT"

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    invoke-direct {v1, v2, v3, v4}, Lcom/bytedance/bpea/basics/CertType;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/bytedance/bpea/basics/CertType;->TOKEN_CERT:Lcom/bytedance/bpea/basics/CertType;

    .line 21
    .line 22
    filled-new-array {v0, v1}, [Lcom/bytedance/bpea/basics/CertType;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Lcom/bytedance/bpea/basics/CertType;->$VALUES:[Lcom/bytedance/bpea/basics/CertType;

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
    iput p3, p0, Lcom/bytedance/bpea/basics/CertType;->type:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bytedance/bpea/basics/CertType;
    .locals 1

    const-class v0, Lcom/bytedance/bpea/basics/CertType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/bytedance/bpea/basics/CertType;

    return-object p0
.end method

.method public static values()[Lcom/bytedance/bpea/basics/CertType;
    .locals 1

    sget-object v0, Lcom/bytedance/bpea/basics/CertType;->$VALUES:[Lcom/bytedance/bpea/basics/CertType;

    invoke-virtual {v0}, [Lcom/bytedance/bpea/basics/CertType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/bytedance/bpea/basics/CertType;

    return-object v0
.end method


# virtual methods
.method public final getType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/bpea/basics/CertType;->type:I

    .line 2
    .line 3
    return p0
.end method
