.class public interface abstract Ll/cj80;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/cj80$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\r\u0008f\u0018\u0000 \u00132\u00020\u0001:\u0001\u000fJ\u001b\u0010\u0005\u001a\u00020\u00042\n\u0010\u0003\u001a\u0006\u0012\u0002\u0008\u00030\u0002H&\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\t\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u0007H&\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0004H&\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\r\u001a\u00020\u0004H&\u00a2\u0006\u0004\u0008\r\u0010\u000cJ\u0017\u0010\u000f\u001a\u00020\u00042\u0006\u0010\u000e\u001a\u00020\u0007H&\u00a2\u0006\u0004\u0008\u000f\u0010\nJ\u0017\u0010\u0011\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u0007H&\u00a2\u0006\u0004\u0008\u0011\u0010\nJ\u0017\u0010\u0012\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u0007H&\u00a2\u0006\u0004\u0008\u0012\u0010\n\u00a8\u0006\u0014"
    }
    d2 = {
        "Ll/cj80;",
        "",
        "Lcom/facebook/imagepipeline/memory/BasePool;",
        "basePool",
        "",
        "g",
        "(Lcom/facebook/imagepipeline/memory/BasePool;)V",
        "",
        "bucketedSize",
        "b",
        "(I)V",
        "d",
        "()V",
        "c",
        "size",
        "a",
        "sizeInBytes",
        "e",
        "f",
        "Companion",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ll/cj80$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/cj80$a;->a:Ll/cj80$a;

    .line 2
    .line 3
    sput-object v0, Ll/cj80;->Companion:Ll/cj80$a;

    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public abstract a(I)V
.end method

.method public abstract b(I)V
.end method

.method public abstract c()V
.end method

.method public abstract d()V
.end method

.method public abstract e(I)V
.end method

.method public abstract f(I)V
.end method

.method public abstract g(Lcom/facebook/imagepipeline/memory/BasePool;)V
    .param p1    # Lcom/facebook/imagepipeline/memory/BasePool;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/memory/BasePool<",
            "*>;)V"
        }
    .end annotation
.end method
