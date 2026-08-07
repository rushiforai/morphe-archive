.class public final Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTrayOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTrayOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->g()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$b;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/o2w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearBackground()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSvg()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->b(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getBackground()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->getBackground()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getBackgroundBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->getBackgroundBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSvg()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->getSvg()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSvgBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->getSvgBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setBackground(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->c(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setBackgroundBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->d(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSvg(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->e(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSvgBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->f(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
