.class public interface abstract Lkotlin/reflect/KType;
.super Ljava/lang/Object;
.source "KType.kt"

# interfaces
.implements Lkotlin/reflect/KAnnotatedElement;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/reflect/KType$DefaultImpls;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0002\u0008f\u0018\u00002\u00020\u0001R+\u0010\u0002\u001a\u0004\u0018\u00010\u00038&X\u00a7\u0084\u0008r\u000c\u0008\u0008\u0012\u0008\u0008\t\u0012\u0004\u0008\u0008(\n\u00a2\u0006\u000c\u0012\u0004\u0008\u0004\u0010\u0005\u001a\u0004\u0008\u0006\u0010\u0007R/\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000c8&X\u00a7\u0084\u0008r\u000c\u0008\u0008\u0012\u0008\u0008\t\u0012\u0004\u0008\u0008(\n\u00a2\u0006\u000c\u0012\u0004\u0008\u000e\u0010\u0005\u001a\u0004\u0008\u000f\u0010\u0010R\u0013\u0010\u0011\u001a\u00020\u0012X\u00a6\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0011\u0010\u0013\u00a8\u0006\u0014"
    }
    d2 = {
        "Lkotlin/reflect/KType;",
        "Lkotlin/reflect/KAnnotatedElement;",
        "classifier",
        "Lkotlin/reflect/KClassifier;",
        "getClassifier$annotations",
        "()V",
        "getClassifier",
        "()Lkotlin/reflect/KClassifier;",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.1",
        "arguments",
        "",
        "Lkotlin/reflect/KTypeProjection;",
        "getArguments$annotations",
        "getArguments",
        "()Ljava/util/List;",
        "isMarkedNullable",
        "",
        "()Z",
        "kotlin-stdlib"
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
.method public abstract getArguments()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lkotlin/reflect/KTypeProjection;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getClassifier()Lkotlin/reflect/KClassifier;
.end method

.method public abstract isMarkedNullable()Z
.end method
