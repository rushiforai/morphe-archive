.class public final Ll/fae;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fyl;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u00002\u00020\u0001B\u0011\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0001\u00a2\u0006\u0004\u0008\u0003\u0010\u0004R$\u0010\u0002\u001a\u0004\u0018\u00010\u00018\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0005\u0010\u0006\u001a\u0004\u0008\u0007\u0010\u0008\"\u0004\u0008\t\u0010\u0004\u00a8\u0006\n"
    }
    d2 = {
        "Ll/fae;",
        "Ll/fyl;",
        "downloader",
        "<init>",
        "(Ll/fyl;)V",
        "a",
        "Ll/fyl;",
        "getDownloader",
        "()Ll/fyl;",
        "setDownloader",
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
.field public a:Ll/fyl;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/fyl;)V
    .locals 0
    .param p1    # Ll/fyl;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fae;->a:Ll/fyl;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    new-instance p1, Ll/ynd;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/ynd;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/fae;->a:Ll/fyl;

    .line 14
    .line 15
    :cond_0
    return-void
.end method
