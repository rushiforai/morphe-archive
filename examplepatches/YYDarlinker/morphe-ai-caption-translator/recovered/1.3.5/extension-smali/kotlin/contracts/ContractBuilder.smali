.class public interface abstract Lkotlin/contracts/ContractBuilder;
.super Ljava/lang/Object;
.source "ContractBuilder.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/contracts/ContractBuilder$DefaultImpls;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000R\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\u0008g\u0018\u00002\u00020\u0001J\u000e\u0010\u0002\u001a\u00020\u0003H\u00a7\u0080\u0004b\u0002\u0008\u0004J\u0018\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0001H\u00a7\u0080\u0004b\u0002\u0008\u0004J\u000e\u0010\u0006\u001a\u00020\u0007H\u00a7\u0080\u0004b\u0002\u0008\u0004J,\u0010\u0008\u001a\u00020\t\"\u0004\u0008\u0000\u0010\n2\u000c\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u0002H\n0\u000c2\u0008\u0008\u0002\u0010\r\u001a\u00020\u000eH\u00a7\u0080\u0004b\u0002\u0008\u0004J,\u0010\u000f\u001a\u00020\u0010*\u00020\u00112\u0006\u0010\u0005\u001a\u00020\u0007H\u00a7\u0084\u0004b\u0002\u0008\u0012b\u0002\u0008\u0004b\u000c\u0008\u0013\u0012\u0008\u0008\u0014\u0012\u0004\u0008\u0008(\u0015J8\u0010\u0016\u001a\u00020\u0017\"\u0004\u0008\u0000\u0010\n*\u00020\u00112\u000c\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u0002H\n0\u000cH\u00a7\u0084\u0004b\u0002\u0008\u0012b\u0002\u0008\u0004b\u000c\u0008\u0013\u0012\u0008\u0008\u0014\u0012\u0004\u0008\u0008(\u0015J0\u0010\u0018\u001a\u00020\u0010\"\u0004\u0008\u0000\u0010\n2\u000c\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u0002H\n0\u000cH\u00a7\u0080\u0004b\u0002\u0008\u0004b\u000c\u0008\u0013\u0012\u0008\u0008\u0014\u0012\u0004\u0008\u0008(\u0019\u00ca\u0001\u0002\u0008\u0004\u00ca\u0001\u0002\u0008\u001b\u00ca\u0001\u000c\u0008\u0013\u0012\u0008\u0008\u0014\u0012\u0004\u0008\u0008(\u001c\u00a8\u0006\u001a"
    }
    d2 = {
        "Lkotlin/contracts/ContractBuilder;",
        "",
        "returns",
        "Lkotlin/contracts/Returns;",
        "Lkotlin/internal/ContractsDsl;",
        "value",
        "returnsNotNull",
        "Lkotlin/contracts/ReturnsNotNull;",
        "callsInPlace",
        "Lkotlin/contracts/CallsInPlace;",
        "R",
        "lambda",
        "Lkotlin/Function;",
        "kind",
        "Lkotlin/contracts/InvocationKind;",
        "implies",
        "",
        "",
        "Lkotlin/contracts/ExperimentalExtendedContracts;",
        "Lkotlin/SinceKotlin;",
        "version",
        "2.2",
        "holdsIn",
        "Lkotlin/contracts/HoldsIn;",
        "returnsResultOf",
        "2.4",
        "kotlin-stdlib",
        "Lkotlin/contracts/ExperimentalContracts;",
        "1.3"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# virtual methods
.method public abstract callsInPlace(Lkotlin/Function;Lkotlin/contracts/InvocationKind;)Lkotlin/contracts/CallsInPlace;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lkotlin/Function<",
            "+TR;>;",
            "Lkotlin/contracts/InvocationKind;",
            ")",
            "Lkotlin/contracts/CallsInPlace;"
        }
    .end annotation
.end method

.method public abstract holdsIn(ZLkotlin/Function;)Lkotlin/contracts/HoldsIn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(Z",
            "Lkotlin/Function<",
            "+TR;>;)",
            "Lkotlin/contracts/HoldsIn;"
        }
    .end annotation
.end method

.method public abstract implies(ZLkotlin/contracts/ReturnsNotNull;)V
.end method

.method public abstract returns()Lkotlin/contracts/Returns;
.end method

.method public abstract returns(Ljava/lang/Object;)Lkotlin/contracts/Returns;
.end method

.method public abstract returnsNotNull()Lkotlin/contracts/ReturnsNotNull;
.end method

.method public abstract returnsResultOf(Lkotlin/Function;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lkotlin/Function<",
            "+TR;>;)V"
        }
    .end annotation
.end method
