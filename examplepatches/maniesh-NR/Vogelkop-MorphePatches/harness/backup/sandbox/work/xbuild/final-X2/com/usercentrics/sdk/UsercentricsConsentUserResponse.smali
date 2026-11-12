.class public final Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u000c\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u0086\u0008\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0002\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003H\u00c6\u0003J\u000f\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005H\u00c6\u0003J\t\u0010\u0012\u001a\u00020\u0008H\u00c6\u0003J-\u0010\u0013\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u000e\u0008\u0002\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u00052\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0008H\u00c6\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u0017\u001a\u00020\u0018H\u00d6\u0001J\t\u0010\u0019\u001a\u00020\u0008H\u00d6\u0001R\u0017\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0011\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;",
        "",
        "userInteraction",
        "Lcom/usercentrics/sdk/UsercentricsUserInteraction;",
        "consents",
        "",
        "Lcom/usercentrics/sdk/UsercentricsServiceConsent;",
        "controllerId",
        "",
        "(Lcom/usercentrics/sdk/UsercentricsUserInteraction;Ljava/util/List;Ljava/lang/String;)V",
        "getConsents",
        "()Ljava/util/List;",
        "getControllerId",
        "()Ljava/lang/String;",
        "getUserInteraction",
        "()Lcom/usercentrics/sdk/UsercentricsUserInteraction;",
        "component1",
        "component2",
        "component3",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
        "",
        "toString",
        "usercentrics-ui_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final consents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/usercentrics/sdk/UsercentricsServiceConsent;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final controllerId:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final userInteraction:Lcom/usercentrics/sdk/UsercentricsUserInteraction;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/usercentrics/sdk/UsercentricsUserInteraction;Ljava/util/List;Ljava/lang/String;)V
    .registers 4
    .param p1    # Lcom/usercentrics/sdk/UsercentricsUserInteraction;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/usercentrics/sdk/UsercentricsUserInteraction;",
            "Ljava/util/List<",
            "Lcom/usercentrics/sdk/UsercentricsServiceConsent;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->userInteraction:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    iput-object p2, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->consents:Ljava/util/List;

    iput-object p3, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->controllerId:Ljava/lang/String;

    return-void
.end method

.method public static synthetic copy$default(Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;Lcom/usercentrics/sdk/UsercentricsUserInteraction;Ljava/util/List;Ljava/lang/String;ILjava/lang/Object;)Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;
    .registers 6

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_6

    iget-object p1, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->userInteraction:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    :cond_6
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_c

    iget-object p2, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->consents:Ljava/util/List;

    :cond_c
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_12

    iget-object p3, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->controllerId:Ljava/lang/String;

    :cond_12
    invoke-virtual {p0, p1, p2, p3}, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->copy(Lcom/usercentrics/sdk/UsercentricsUserInteraction;Ljava/util/List;Ljava/lang/String;)Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Lcom/usercentrics/sdk/UsercentricsUserInteraction;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->userInteraction:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    return-object p0
.end method

.method public final component2()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/usercentrics/sdk/UsercentricsServiceConsent;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->consents:Ljava/util/List;

    return-object p0
.end method

.method public final component3()Ljava/lang/String;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->controllerId:Ljava/lang/String;

    return-object p0
.end method

.method public final copy(Lcom/usercentrics/sdk/UsercentricsUserInteraction;Ljava/util/List;Ljava/lang/String;)Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;
    .registers 4
    .param p1    # Lcom/usercentrics/sdk/UsercentricsUserInteraction;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/usercentrics/sdk/UsercentricsUserInteraction;",
            "Ljava/util/List<",
            "Lcom/usercentrics/sdk/UsercentricsServiceConsent;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;

    invoke-direct {p0, p1, p2, p3}, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;-><init>(Lcom/usercentrics/sdk/UsercentricsUserInteraction;Ljava/util/List;Ljava/lang/String;)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;

    iget-object v1, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->userInteraction:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    iget-object v3, p1, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->userInteraction:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->consents:Ljava/util/List;

    iget-object v3, p1, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->consents:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v2

    :cond_1e
    iget-object p0, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->controllerId:Ljava/lang/String;

    iget-object p1, p1, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->controllerId:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29

    return v2

    :cond_29
    return v0
.end method

.method public final getConsents()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/usercentrics/sdk/UsercentricsServiceConsent;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->consents:Ljava/util/List;

    return-object p0
.end method

.method public final getControllerId()Ljava/lang/String;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->controllerId:Ljava/lang/String;

    return-object p0
.end method

.method public final getUserInteraction()Lcom/usercentrics/sdk/UsercentricsUserInteraction;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->userInteraction:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    return-object p0
.end method

.method public hashCode()I
    .registers 4

    iget-object v0, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->userInteraction:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->consents:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-object p0, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->controllerId:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .registers 5
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object v0, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->userInteraction:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    iget-object v1, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->consents:Ljava/util/List;

    iget-object p0, p0, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->controllerId:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "UsercentricsConsentUserResponse(userInteraction="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", consents="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", controllerId="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-static {v2, p0, v0}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
