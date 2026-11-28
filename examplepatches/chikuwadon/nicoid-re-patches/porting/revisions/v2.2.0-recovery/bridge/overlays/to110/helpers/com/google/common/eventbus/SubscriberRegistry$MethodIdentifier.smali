.class final Lcom/google/common/eventbus/SubscriberRegistry$MethodIdentifier;
.super Ljava/lang/Object;
.source "SubscriberRegistry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/eventbus/SubscriberRegistry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MethodIdentifier"
.end annotation


# instance fields
.field private final name:Ljava/lang/String;

.field private final parameterTypes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/reflect/Method;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "method"
        }
    .end annotation

    .line 249
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 250
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/eventbus/SubscriberRegistry$MethodIdentifier;->name:Ljava/lang/String;

    .line 251
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/eventbus/SubscriberRegistry$MethodIdentifier;->parameterTypes:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 261
    instance-of v0, p1, Lcom/google/common/eventbus/SubscriberRegistry$MethodIdentifier;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 262
    check-cast p1, Lcom/google/common/eventbus/SubscriberRegistry$MethodIdentifier;

    .line 263
    iget-object v0, p0, Lcom/google/common/eventbus/SubscriberRegistry$MethodIdentifier;->name:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/common/eventbus/SubscriberRegistry$MethodIdentifier;->name:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/common/eventbus/SubscriberRegistry$MethodIdentifier;->parameterTypes:Ljava/util/List;

    iget-object p1, p1, Lcom/google/common/eventbus/SubscriberRegistry$MethodIdentifier;->parameterTypes:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v1
.end method

.method public hashCode()I
    .registers 2

    .line 256
    iget-object v0, p0, Lcom/google/common/eventbus/SubscriberRegistry$MethodIdentifier;->name:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/common/eventbus/SubscriberRegistry$MethodIdentifier;->parameterTypes:Ljava/util/List;

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
