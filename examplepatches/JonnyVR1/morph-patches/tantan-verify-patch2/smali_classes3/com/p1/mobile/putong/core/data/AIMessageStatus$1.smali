.class Lcom/p1/mobile/putong/core/data/AIMessageStatus$1;
.super Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/AIMessageStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/AIMessageStatus;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/core/data/AIMessageStatus;
    .locals 0

    .line 6
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/data/AIMessageStatus;->a(Ljava/lang/String;I)Lcom/p1/mobile/putong/core/data/AIMessageStatus;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/AIMessageStatus$1;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/core/data/AIMessageStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
