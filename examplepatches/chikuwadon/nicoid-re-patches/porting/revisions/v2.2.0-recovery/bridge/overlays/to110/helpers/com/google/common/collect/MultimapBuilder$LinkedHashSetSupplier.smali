.class final Lcom/google/common/collect/MultimapBuilder$LinkedHashSetSupplier;
.super Ljava/lang/Object;
.source "MultimapBuilder.java"

# interfaces
.implements Lcom/google/common/base/Supplier;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/MultimapBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LinkedHashSetSupplier"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Supplier<",
        "Ljava/util/Set<",
        "TV;>;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x1a2f3b48cb810702L


# instance fields
.field private final expectedValuesPerKey:I


# direct methods
.method constructor <init>(I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedValuesPerKey"
        }
    .end annotation

    .line 237
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 238
    const-string v0, "expectedValuesPerKey"

    invoke-static {p1, v0}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/google/common/collect/MultimapBuilder$LinkedHashSetSupplier;->expectedValuesPerKey:I

    return-void
.end method


# virtual methods
.method public bridge synthetic get()Ljava/lang/Object;
    .registers 1

    .line 233
    invoke-virtual {p0}, Lcom/google/common/collect/MultimapBuilder$LinkedHashSetSupplier;->get()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public get()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TV;>;"
        }
    .end annotation

    .line 243
    iget p0, p0, Lcom/google/common/collect/MultimapBuilder$LinkedHashSetSupplier;->expectedValuesPerKey:I

    invoke-static {p0}, Lcom/google/common/collect/Platform;->newLinkedHashSetWithExpectedSize(I)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method
