.class public final Ll/p4c$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/p4c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0006\u001a\u00020\u00002\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\r\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\t\u0010\nR\u0014\u0010\u000c\u001a\u00020\u00088\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\t\u0010\u000b\u00a8\u0006\r"
    }
    d2 = {
        "Ll/p4c$a;",
        "",
        "<init>",
        "()V",
        "",
        "e",
        "b",
        "(Ljava/lang/Throwable;)Ll/p4c$a;",
        "Ll/p4c;",
        "a",
        "()Ll/p4c;",
        "Ll/p4c;",
        "data",
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


# instance fields
.field public final a:Ll/p4c;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/p4c;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/p4c;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/p4c$a;->a:Ll/p4c;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a()Ll/p4c;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p4c$a;->a:Ll/p4c;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Ljava/lang/Throwable;)Ll/p4c$a;
    .locals 1
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/p4c$a;->a:Ll/p4c;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/p4c;->a(Ll/p4c;Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
