.class public Ll/ti20;
.super Ll/si20;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/si20<",
        "Lcom/p1/mobile/putong/data/Envelope;",
        ">;"
    }
.end annotation


# static fields
.field public static a:Ll/byd0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/byd0;

    .line 2
    .line 3
    const-wide/16 v1, -0x1

    .line 4
    .line 5
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "latest_api_request_time"

    .line 10
    .line 11
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/ti20;->a:Ll/byd0;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Ll/pcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 14
    invoke-direct {p0, p1, v0}, Ll/ti20;-><init>(Ll/pcj;Z)V

    return-void
.end method

.method public constructor <init>(Ll/pcj;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;I)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, p1, p2, v0}, Ll/ti20;-><init>(Ll/pcj;IZ)V

    return-void
.end method

.method public constructor <init>(Ll/pcj;IZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;IZ)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Ll/ti20$a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/data/Envelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 4
    .line 5
    invoke-direct {v0, v1, p2}, Ll/ti20$a;-><init>(Lcom/tantanapp/common/data/JsonAdapter;I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1, v0, p3}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Ll/pcj;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;Z)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 12
    sget v0, Ll/xi5;->MESSAGE_IN_CONVERSATION:I

    sget v1, Ll/xi5;->INFER_INVALID_MOMENT_REFERENCE:I

    or-int/2addr v0, v1

    invoke-direct {p0, p1, v0, p2}, Ll/ti20;-><init>(Ll/pcj;IZ)V

    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/data/Envelope;I)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/data/Envelope;->localOptions:I

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/ti20;->c(Lcom/p1/mobile/putong/data/Envelope;I)Lcom/p1/mobile/putong/data/Envelope;

    .line 4
    .line 5
    .line 6
    sget-object p1, Ll/xi5;->API_VERSION_V2:Ljava/lang/String;

    .line 7
    .line 8
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/putong/data/Envelope;I)Lcom/p1/mobile/putong/data/Envelope;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/data/Envelope;->localOptions:I

    .line 7
    .line 8
    sget-object v1, Ll/uqb0;->j0:Ll/dg00;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const-string v2, "feed"

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ll/dg00;->z(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 21
    .line 22
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v0, p0, v1}, Ll/bn5;->O0(Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/Integer;)Ljava/util/HashSet;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    :cond_0
    sget-object v1, Ll/uqb0;->j0:Ll/dg00;

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    const-string v2, "core"

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ll/dg00;->z(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 43
    .line 44
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-interface {v1, p0, v0, p1}, Ll/bn5;->T3(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/HashSet;Ljava/lang/Integer;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-object p0
.end method
