.class public interface abstract Lkotlin/reflect/KCallable;
.super Ljava/lang/Object;
.source "KCallable.kt"

# interfaces
.implements Lkotlin/reflect/KAnnotatedElement;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/reflect/KCallable$DefaultImpls;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lkotlin/reflect/KAnnotatedElement;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0011\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010$\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\n\u0008f\u0018\u0000*\u0006\u0008\u0000\u0010\u0001 \u00012\u00020\u0002J\'\u0010\u001a\u001a\u00028\u00002\u0016\u0010\u001b\u001a\u000c\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\u001d0\u001c\"\u0004\u0018\u00010\u001dH\u00a6\u0080\u0004\u00a2\u0006\u0002\u0010\u001eJ%\u0010\u001f\u001a\u00028\u00002\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u000c\u0012\u0006\u0012\u0004\u0018\u00010\u001d0 H\u00a6\u0080\u0004\u00a2\u0006\u0002\u0010!R\u001f\u0010\u0003\u001a\u00020\u00048&X\u00a7\u0084\u0008r\u0002\u0008\t\u00a2\u0006\u000c\u0012\u0004\u0008\u0005\u0010\u0006\u001a\u0004\u0008\u0007\u0010\u0008R\u0019\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000bX\u00a6\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\r\u0010\u000eR\u0013\u0010\u000f\u001a\u00020\u0010X\u00a6\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0011\u0010\u0012R/\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00020\u00140\u000b8&X\u00a7\u0084\u0008r\u000c\u0008\u0017\u0012\u0008\u0008\u0018\u0012\u0004\u0008\u0008(\u0019\u00a2\u0006\u000c\u0012\u0004\u0008\u0015\u0010\u0006\u001a\u0004\u0008\u0016\u0010\u000eR+\u0010\"\u001a\u0004\u0018\u00010#8&X\u00a7\u0084\u0008r\u000c\u0008\u0017\u0012\u0008\u0008\u0018\u0012\u0004\u0008\u0008(\u0019\u00a2\u0006\u000c\u0012\u0004\u0008$\u0010\u0006\u001a\u0004\u0008%\u0010&R)\u0010\'\u001a\u00020(8&X\u00a7\u0084\u0008r\u000c\u0008\u0017\u0012\u0008\u0008\u0018\u0012\u0004\u0008\u0008(\u0019\u00a2\u0006\u000c\u0012\u0004\u0008)\u0010\u0006\u001a\u0004\u0008\'\u0010*R)\u0010+\u001a\u00020(8&X\u00a7\u0084\u0008r\u000c\u0008\u0017\u0012\u0008\u0008\u0018\u0012\u0004\u0008\u0008(\u0019\u00a2\u0006\u000c\u0012\u0004\u0008,\u0010\u0006\u001a\u0004\u0008+\u0010*R)\u0010-\u001a\u00020(8&X\u00a7\u0084\u0008r\u000c\u0008\u0017\u0012\u0008\u0008\u0018\u0012\u0004\u0008\u0008(\u0019\u00a2\u0006\u000c\u0012\u0004\u0008.\u0010\u0006\u001a\u0004\u0008-\u0010*R)\u0010/\u001a\u00020(8&X\u00a7\u0084\u0008r\u000c\u0008\u0017\u0012\u0008\u0008\u0018\u0012\u0004\u0008\u0008(1\u00a2\u0006\u000c\u0012\u0004\u00080\u0010\u0006\u001a\u0004\u0008/\u0010*\u00a8\u00062"
    }
    d2 = {
        "Lkotlin/reflect/KCallable;",
        "R",
        "Lkotlin/reflect/KAnnotatedElement;",
        "name",
        "",
        "getName$annotations",
        "()V",
        "getName",
        "()Ljava/lang/String;",
        "Lkotlin/internal/IntrinsicConstEvaluation;",
        "parameters",
        "",
        "Lkotlin/reflect/KParameter;",
        "getParameters",
        "()Ljava/util/List;",
        "returnType",
        "Lkotlin/reflect/KType;",
        "getReturnType",
        "()Lkotlin/reflect/KType;",
        "typeParameters",
        "Lkotlin/reflect/KTypeParameter;",
        "getTypeParameters$annotations",
        "getTypeParameters",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.1",
        "call",
        "args",
        "",
        "",
        "([Ljava/lang/Object;)Ljava/lang/Object;",
        "callBy",
        "",
        "(Ljava/util/Map;)Ljava/lang/Object;",
        "visibility",
        "Lkotlin/reflect/KVisibility;",
        "getVisibility$annotations",
        "getVisibility",
        "()Lkotlin/reflect/KVisibility;",
        "isFinal",
        "",
        "isFinal$annotations",
        "()Z",
        "isOpen",
        "isOpen$annotations",
        "isAbstract",
        "isAbstract$annotations",
        "isSuspend",
        "isSuspend$annotations",
        "1.3",
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
.method public varargs abstract call([Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")TR;"
        }
    .end annotation
.end method

.method public abstract callBy(Ljava/util/Map;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lkotlin/reflect/KParameter;",
            "+",
            "Ljava/lang/Object;",
            ">;)TR;"
        }
    .end annotation
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getParameters()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lkotlin/reflect/KParameter;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getReturnType()Lkotlin/reflect/KType;
.end method

.method public abstract getTypeParameters()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lkotlin/reflect/KTypeParameter;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getVisibility()Lkotlin/reflect/KVisibility;
.end method

.method public abstract isAbstract()Z
.end method

.method public abstract isFinal()Z
.end method

.method public abstract isOpen()Z
.end method

.method public abstract isSuspend()Z
.end method
