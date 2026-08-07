.class Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/l$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/protobuf/l$d<",
        "Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;",
        ">;"
    }
.end annotation


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


# virtual methods
.method public bridge synthetic findValueByNumber(I)Lcom/google/protobuf/l$c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType$1;->findValueByNumber(I)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public findValueByNumber(I)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;
    .locals 0

    .line 6
    invoke-static {p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;->forNumber(I)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;

    move-result-object p0

    return-object p0
.end method
