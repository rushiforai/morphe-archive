.class public abstract Ll/jxl;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000e\u0008&\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J-\u0010\u000b\u001a\u00020\n2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010\t\u001a\u0004\u0018\u00010\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\u000e\u001a\u00020\r2\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u000e\u0010\u000fR\"\u0010\u0015\u001a\u00020\r8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u000e\u0010\u0010\u001a\u0004\u0008\u0011\u0010\u0012\"\u0004\u0008\u0013\u0010\u0014R$\u0010\t\u001a\u0004\u0018\u00010\u00088\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000b\u0010\u0016\u001a\u0004\u0008\u0017\u0010\u0018\"\u0004\u0008\u0019\u0010\u001a\u00a8\u0006\u001b"
    }
    d2 = {
        "Ll/jxl;",
        "",
        "<init>",
        "()V",
        "Landroid/content/Context;",
        "context",
        "Ll/ijw;",
        "request",
        "Ll/kxl;",
        "responseCallback",
        "",
        "b",
        "(Landroid/content/Context;Ll/ijw;Ll/kxl;)V",
        "Ll/jjw;",
        "a",
        "(Ll/ijw;)Ll/jjw;",
        "Ll/jjw;",
        "getMkResponse",
        "()Ll/jjw;",
        "setMkResponse",
        "(Ll/jjw;)V",
        "mkResponse",
        "Ll/kxl;",
        "getResponseCallback",
        "()Ll/kxl;",
        "setResponseCallback",
        "(Ll/kxl;)V",
        "MKBusiness_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field public a:Ll/jjw;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private b:Ll/kxl;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ll/ijw;)Ll/jjw;
    .locals 0
    .param p1    # Ll/ijw;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance p0, Ll/jjw;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/jjw;-><init>(Ll/ijw;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public b(Landroid/content/Context;Ll/ijw;Ll/kxl;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/ijw;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/kxl;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p2}, Ll/jxl;->a(Ll/ijw;)Ll/jjw;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/jxl;->a:Ll/jjw;

    .line 6
    .line 7
    iput-object p3, p0, Ll/jxl;->b:Ll/kxl;

    .line 8
    .line 9
    return-void
.end method
