.class public Ll/ti20$a;
.super Lcom/tantanapp/common/data/ConvertedJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ti20;-><init>(Ll/pcj;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/ConvertedJsonAdapter<",
        "Lcom/p1/mobile/putong/data/Envelope;",
        "Lcom/p1/mobile/putong/data/Envelope;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:I


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/JsonAdapter;I)V
    .locals 0

    .line 1
    iput p2, p0, Ll/ti20$a;->a:I

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/ConvertedJsonAdapter;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    return-object p1
.end method

.method public b(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 3

    .line 1
    sget-object v0, Ll/ti20;->a:Ll/byd0;

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    iget p0, p0, Ll/ti20$a;->a:I

    .line 17
    .line 18
    invoke-static {p1, p0}, Ll/ti20;->b(Lcom/p1/mobile/putong/data/Envelope;I)Lcom/p1/mobile/putong/data/Envelope;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public bridge synthetic from(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ti20$a;->a(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic to(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ti20$a;->b(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
