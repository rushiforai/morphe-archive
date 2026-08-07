.class public final Ll/iyk0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/iyk0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0015\u0010\u0008\u001a\u00020\u00002\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0015\u0010\u000c\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0017\u0010\u0010\u001a\u00020\u00002\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\r\u0010\u0013\u001a\u00020\u0012\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\r\u0010\u0016\u001a\u00020\u0015\u00a2\u0006\u0004\u0008\u0016\u0010\u0017R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u0018R\u0018\u0010\u000f\u001a\u0004\u0018\u00010\u000e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000c\u0010\u0019R\u0018\u0010\u001c\u001a\u0004\u0018\u00010\u001a8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010\u001bR\u0016\u0010\u0007\u001a\u00020\u00068\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u0008\u0010\u001dR\u0016\u0010\u000b\u001a\u00020\n8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u001e\u00a8\u0006\u001f"
    }
    d2 = {
        "Ll/iyk0$a;",
        "",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;)V",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        "merchandise",
        "d",
        "(Lcom/p1/mobile/putong/core/data/Merchandise;)Ll/iyk0$a;",
        "Lcom/p1/mobile/putong/core/data/Coupon;",
        "coupon",
        "b",
        "(Lcom/p1/mobile/putong/core/data/Coupon;)Ll/iyk0$a;",
        "",
        "from",
        "c",
        "(Ljava/lang/String;)Ll/iyk0$a;",
        "Ll/iyk0;",
        "a",
        "()Ll/iyk0;",
        "",
        "e",
        "()V",
        "Lcom/p1/mobile/android/app/Act;",
        "Ljava/lang/String;",
        "Ll/x20;",
        "Ll/x20;",
        "dismiss",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        "Lcom/p1/mobile/putong/core/data/Coupon;",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public c:Ll/x20;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public e:Lcom/p1/mobile/putong/core/data/Coupon;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/iyk0$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a()Ll/iyk0;
    .locals 6
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/iyk0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/iyk0$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object v2, p0, Ll/iyk0$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Ll/iyk0$a;->d:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    const-string v3, "merchandise"

    .line 13
    .line 14
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    move-object v3, v4

    .line 18
    :cond_0
    iget-object v5, p0, Ll/iyk0$a;->e:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 19
    .line 20
    if-nez v5, :cond_1

    .line 21
    .line 22
    const-string v5, "coupon"

    .line 23
    .line 24
    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move-object v4, v5

    .line 29
    :goto_0
    invoke-direct {v0, v1, v2, v3, v4}, Ll/iyk0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/iyk0$a;->c:Ll/x20;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ll/iyk0;->e0(Ll/x20;)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public final b(Lcom/p1/mobile/putong/core/data/Coupon;)Ll/iyk0$a;
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/Coupon;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/iyk0$a;->e:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 5
    .line 6
    return-object p0
.end method

.method public final c(Ljava/lang/String;)Ll/iyk0$a;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Ll/iyk0$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(Lcom/p1/mobile/putong/core/data/Merchandise;)Ll/iyk0$a;
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/Merchandise;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/iyk0$a;->d:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 5
    .line 6
    return-object p0
.end method

.method public final e()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/iyk0$a;->a()Ll/iyk0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/g1e;->show()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
