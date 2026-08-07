.class public final Ll/c4f0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/c4f0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\r\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0007\u0010\t\u001a\u0004\u0008\n\u0010\u000bR\u0014\u0010\u000e\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000f"
    }
    d2 = {
        "Ll/c4f0$b;",
        "",
        "Landroid/content/Context;",
        "context",
        "<init>",
        "(Landroid/content/Context;)V",
        "Ll/c4f0;",
        "a",
        "()Ll/c4f0;",
        "Landroid/content/Context;",
        "getContext",
        "()Landroid/content/Context;",
        "b",
        "Ll/c4f0;",
        "managerImpl",
        "sharedlibrarymanager_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final a:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ll/c4f0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
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
    iput-object p1, p0, Ll/c4f0$b;->a:Landroid/content/Context;

    .line 8
    .line 9
    new-instance v0, Ll/d4f0;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/d4f0;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/c4f0$b;->b:Ll/c4f0;

    .line 15
    .line 16
    new-instance p0, Ll/uw5;

    .line 17
    .line 18
    invoke-direct {p0, p1}, Ll/uw5;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ll/c4f0;->g(Ll/uw5;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/u5c;

    .line 25
    .line 26
    invoke-direct {p0, p1}, Ll/u5c;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ll/c4f0;->i(Ll/u5c;)V

    .line 30
    .line 31
    .line 32
    sget-object p0, Ll/viq0;->j:Ll/viq0$a;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/viq0$a;->a(Landroid/content/Context;)Ll/viq0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0}, Ll/c4f0;->d()Ll/uw5;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p0, v1}, Ll/viq0;->e(Ll/uw5;)Ll/viq0;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0}, Ll/c4f0;->e()Ll/u5c;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {p0, v1}, Ll/viq0;->g(Ll/u5c;)Ll/viq0;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Ll/c4f0;->j(Ll/viq0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p1}, Ll/c4f0;->h(Landroid/content/Context;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method


# virtual methods
.method public final a()Ll/c4f0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/c4f0$b;->b:Ll/c4f0;

    .line 2
    .line 3
    return-object p0
.end method
