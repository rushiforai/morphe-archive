.class final Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;
.super Ljava/lang/Object;
.source "ImmutableMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ImmutableMap$Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DuplicateKey"
.end annotation


# instance fields
.field private final key:Ljava/lang/Object;

.field private final value1:Ljava/lang/Object;

.field private final value2:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "key",
            "value1",
            "value2"
        }
    .end annotation

    .line 708
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 709
    iput-object p1, p0, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;->key:Ljava/lang/Object;

    .line 710
    iput-object p2, p0, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;->value1:Ljava/lang/Object;

    .line 711
    iput-object p3, p0, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;->value2:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method exception()Ljava/lang/IllegalArgumentException;
    .registers 5

    .line 715
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Multiple entries with same key: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;->key:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;->value1:Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " and "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;->key:Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;->value2:Ljava/lang/Object;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
