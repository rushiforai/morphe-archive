.class public final Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAdditionOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;",
        "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAdditionOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->g()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

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

.method public synthetic constructor <init>(Ll/c6r0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearColor()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearGender()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->b(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->getColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->getColorBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getGender()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->getGender()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getGenderBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->getGenderBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setColor(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->c(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setColorBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->d(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGender(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->e(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGenderBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->f(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
