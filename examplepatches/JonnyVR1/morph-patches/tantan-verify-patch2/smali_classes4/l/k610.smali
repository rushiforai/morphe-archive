.class public final Ll/k610;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gyl;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u0011\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0001\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u0017\u0010\u0008\u001a\u00020\u00072\u0006\u0010\u0006\u001a\u00020\u0005H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tR$\u0010\u0002\u001a\u0004\u0018\u00010\u00018\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0008\u0010\n\u001a\u0004\u0008\u000b\u0010\u000c\"\u0004\u0008\r\u0010\u0004\u00a8\u0006\u000e"
    }
    d2 = {
        "Ll/k610;",
        "Ll/gyl;",
        "monitor",
        "<init>",
        "(Ll/gyl;)V",
        "Ll/p4c;",
        "data",
        "",
        "a",
        "(Ll/p4c;)V",
        "Ll/gyl;",
        "getMonitor",
        "()Ll/gyl;",
        "setMonitor",
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
.field public a:Ll/gyl;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/gyl;)V
    .locals 0
    .param p1    # Ll/gyl;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/k610;->a:Ll/gyl;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    new-instance p1, Ll/nqd;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/nqd;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/k610;->a:Ll/gyl;

    .line 14
    .line 15
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Ll/p4c;)V
    .locals 0
    .param p1    # Ll/p4c;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/k610;->a:Ll/gyl;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/gyl;->a(Ll/p4c;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
