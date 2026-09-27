.class public Lkotlin/jvm/internal/MutableLocalVariableReference;
.super Lkotlin/jvm/internal/MutablePropertyReference0;
.source "localVariableReferences.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0017\u0018\u00002\u00020\u0001B\t\u0008F\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u0004\u001a\u00020\u0005H\u0016J\u000c\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0096\u0080\u0004J\u0014\u0010\u0008\u001a\u00020\t2\u0008\u0010\n\u001a\u0004\u0018\u00010\u0007H\u0096\u0080\u0004\u00ca\u0001\u000c\u0008\u000c\u0012\u0008\u0008\r\u0012\u0004\u0008\u0008(\u000e\u00a8\u0006\u000b"
    }
    d2 = {
        "Lkotlin/jvm/internal/MutableLocalVariableReference;",
        "Lkotlin/jvm/internal/MutablePropertyReference0;",
        "<init>",
        "()V",
        "getOwner",
        "Lkotlin/reflect/KDeclarationContainer;",
        "get",
        "",
        "set",
        "",
        "value",
        "kotlin-stdlib",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.1"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Lkotlin/jvm/internal/MutablePropertyReference0;-><init>()V

    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .registers 1

    .line 28
    # invokes: Lkotlin/jvm/internal/LocalVariableReferencesKt;->notSupportedError()Ljava/lang/Void;
    invoke-static {}, Lkotlin/jvm/internal/LocalVariableReferencesKt;->access$notSupportedError()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public getOwner()Lkotlin/reflect/KDeclarationContainer;
    .registers 1

    .line 26
    # invokes: Lkotlin/jvm/internal/LocalVariableReferencesKt;->notSupportedError()Ljava/lang/Void;
    invoke-static {}, Lkotlin/jvm/internal/LocalVariableReferencesKt;->access$notSupportedError()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public set(Ljava/lang/Object;)V
    .registers 2

    .line 30
    # invokes: Lkotlin/jvm/internal/LocalVariableReferencesKt;->notSupportedError()Ljava/lang/Void;
    invoke-static {}, Lkotlin/jvm/internal/LocalVariableReferencesKt;->access$notSupportedError()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method
