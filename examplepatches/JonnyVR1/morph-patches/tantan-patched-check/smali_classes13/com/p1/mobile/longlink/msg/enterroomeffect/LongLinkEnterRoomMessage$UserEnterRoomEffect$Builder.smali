.class public final Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffectOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;",
        "Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffectOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->Z0()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

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

.method public synthetic constructor <init>(Ll/m2w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllAvatarGradients(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->a(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAllBackgroundGradients(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->b(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAllDynamicEffectExtends(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->c(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAllUserNameGradientColors(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->d(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAllVideoEffectExtras(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->e(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAvatarGradients(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->f(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAvatarGradientsBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->g(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addBackgroundGradients(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->h(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addBackgroundGradientsBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->i(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addDynamicEffectExtends(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend$Builder;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->j(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend$Builder;)V

    return-object p0
.end method

.method public addDynamicEffectExtends(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->k(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;)V

    return-object p0
.end method

.method public addDynamicEffectExtends(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend$Builder;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->l(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend$Builder;)V

    return-object p0
.end method

.method public addDynamicEffectExtends(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->m(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addUserNameGradientColors(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->n(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addUserNameGradientColorsBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->o(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addVideoEffectExtras(ILcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra$Builder;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->p(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;ILcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra$Builder;)V

    return-object p0
.end method

.method public addVideoEffectExtras(ILcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->q(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;ILcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra;)V

    return-object p0
.end method

.method public addVideoEffectExtras(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra$Builder;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->r(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra$Builder;)V

    return-object p0
.end method

.method public addVideoEffectExtras(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->s(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearAnimationSizeType()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->t(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearAvatarGradientDirection()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->u(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearAvatarGradients()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->v(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearBackgroundGradientDirection()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->w(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearBackgroundGradients()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->x(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearBackgroundUrl()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->y(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearBackgroundUrlEndMargin()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->z(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearDynamicEffectExtends()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->A(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearEffectId()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->B(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearEnterVersion()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->C(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearExpireTime()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->D(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearFixedBackgroundUrl()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->E(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearFloatingUrl()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->F(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearHierarchys()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->G(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearInternalText()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->H(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearIsWealthHierarchy()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->I(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearNewFloatingUrl()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->J(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearNewResourceId()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->K(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPlaceType()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->L(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearResourceId()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->M(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRoomId()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->N(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearShowDuration()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->O(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearText()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->P(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTextColor()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->Q(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserId()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->R(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserImage()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->S(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserName()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->T(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserNameColor()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->U(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserNameGradientColors()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->V(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearVideoEffectExtras()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->W(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAnimationSizeType()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getAnimationSizeType()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getAvatarGradientDirection()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$EnterRoomEffectGradientDirection;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getAvatarGradientDirection()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$EnterRoomEffectGradientDirection;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAvatarGradientDirectionValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getAvatarGradientDirectionValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getAvatarGradients(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getAvatarGradients(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAvatarGradientsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getAvatarGradientsBytes(I)Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAvatarGradientsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getAvatarGradientsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getAvatarGradientsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getAvatarGradientsList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getBackgroundGradientDirection()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$EnterRoomEffectGradientDirection;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getBackgroundGradientDirection()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$EnterRoomEffectGradientDirection;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getBackgroundGradientDirectionValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getBackgroundGradientDirectionValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getBackgroundGradients(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getBackgroundGradients(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getBackgroundGradientsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getBackgroundGradientsBytes(I)Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getBackgroundGradientsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getBackgroundGradientsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getBackgroundGradientsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getBackgroundGradientsList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getBackgroundUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getBackgroundUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getBackgroundUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getBackgroundUrlBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getBackgroundUrlEndMargin()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getBackgroundUrlEndMargin()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getDynamicEffectExtends(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getDynamicEffectExtends(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getDynamicEffectExtendsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getDynamicEffectExtendsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getDynamicEffectExtendsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getDynamicEffectExtendsList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getEffectId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getEffectId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getEffectIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getEffectIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getEnterVersion()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getEnterVersion()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getExpireTime()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getExpireTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getFixedBackgroundUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getFixedBackgroundUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getFixedBackgroundUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getFixedBackgroundUrlBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getFloatingUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getFloatingUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getFloatingUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getFloatingUrlBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getHierarchys()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchys;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getHierarchys()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchys;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getInternalText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getInternalText()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getInternalTextBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getInternalTextBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIsWealthHierarchy()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getIsWealthHierarchy()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getNewFloatingUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getNewFloatingUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getNewFloatingUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getNewFloatingUrlBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getNewResourceId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getNewResourceId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getNewResourceIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getNewResourceIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPlaceType()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$PlaceType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getPlaceType()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$PlaceType;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPlaceTypeValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getPlaceTypeValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getResourceId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getResourceId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getResourceIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getResourceIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getRoomIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getShowDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getShowDuration()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getText()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTextBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getTextBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTextColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getTextColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTextColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getTextColorBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserImage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserImage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserImageBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserImageBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserNameBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserNameColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserNameColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserNameColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserNameColorBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserNameGradientColors(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserNameGradientColors(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserNameGradientColorsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserNameGradientColorsBytes(I)Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserNameGradientColorsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserNameGradientColorsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getUserNameGradientColorsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserNameGradientColorsList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getVideoEffectExtras(I)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getVideoEffectExtras(I)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getVideoEffectExtrasCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getVideoEffectExtrasCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getVideoEffectExtrasList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getVideoEffectExtrasList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public hasHierarchys()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->hasHierarchys()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeHierarchys(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchys;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->X(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchys;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public removeDynamicEffectExtends(I)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->Y(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public removeVideoEffectExtras(I)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->Z(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAnimationSizeType(J)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->a0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAvatarGradientDirection(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$EnterRoomEffectGradientDirection;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->b0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$EnterRoomEffectGradientDirection;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAvatarGradientDirectionValue(I)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->c0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAvatarGradients(ILjava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->d0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setBackgroundGradientDirection(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$EnterRoomEffectGradientDirection;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->e0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$EnterRoomEffectGradientDirection;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setBackgroundGradientDirectionValue(I)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->f0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setBackgroundGradients(ILjava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->g0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setBackgroundUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->h0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setBackgroundUrlBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->i0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setBackgroundUrlEndMargin(J)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->j0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setDynamicEffectExtends(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend$Builder;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->k0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend$Builder;)V

    return-object p0
.end method

.method public setDynamicEffectExtends(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->l0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEffectId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->m0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEffectIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->n0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEnterVersion(J)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->o0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setExpireTime(J)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->p0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setFixedBackgroundUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->q0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setFixedBackgroundUrlBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->r0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setFloatingUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->s0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setFloatingUrlBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->t0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setHierarchys(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchys$Builder;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->u0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchys$Builder;)V

    return-object p0
.end method

.method public setHierarchys(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchys;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->v0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchys;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setInternalText(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->w0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setInternalTextBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->x0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIsWealthHierarchy(Z)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->y0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setNewFloatingUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->z0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setNewFloatingUrlBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->A0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setNewResourceId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->B0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setNewResourceIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->C0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPlaceType(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$PlaceType;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->D0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$PlaceType;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPlaceTypeValue(I)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->E0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setResourceId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->F0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setResourceIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->G0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->H0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->I0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setShowDuration(J)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->J0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setText(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->K0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTextBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->L0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTextColor(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->M0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTextColorBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->N0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->O0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->P0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserImage(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->Q0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserImageBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->R0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserName(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->S0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserNameBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->T0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserNameColor(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->U0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserNameColorBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->V0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserNameGradientColors(ILjava/lang/String;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->W0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setVideoEffectExtras(ILcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra$Builder;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->X0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;ILcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra$Builder;)V

    return-object p0
.end method

.method public setVideoEffectExtras(ILcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra;)Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->Y0(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;ILcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
