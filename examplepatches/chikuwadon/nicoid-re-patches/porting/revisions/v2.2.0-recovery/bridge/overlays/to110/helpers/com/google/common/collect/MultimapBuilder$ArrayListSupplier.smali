.class final Lcom/google/common/collect/MultimapBuilder$ArrayListSupplier;
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
    name = "ArrayListSupplier"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Supplier<",
        "Ljava/util/List<",
        "TV;>;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x50571a0472a7218eL


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

    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 188
    const-string v0, "expectedValuesPerKey"

    invoke-static {p1, v0}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/google/common/collect/MultimapBuilder$ArrayListSupplier;->expectedValuesPerKey:I

    return-void
.end method


# virtual methods
.method public bridge synthetic get()Ljava/lang/Object;
    .registers 1

    .line 183
    invoke-virtual {p0}, Lcom/google/common/collect/MultimapBuilder$ArrayListSupplier;->get()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public get()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TV;>;"
        }
    .end annotation

    .line 193
    new-instance v0, Ljava/util/ArrayList;

    iget p0, p0, Lcom/google/common/collect/MultimapBuilder$ArrayListSupplier;->expectedValuesPerKey:I

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(I)V

    return-object v0
.end method
