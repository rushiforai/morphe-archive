.class public final Ll/d4f0;
.super Ll/c4f0;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J!\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Ll/d4f0;",
        "Ll/c4f0;",
        "<init>",
        "()V",
        "",
        "min",
        "Ll/dyl;",
        "storageCheckCallback",
        "",
        "c",
        "(JLl/dyl;)V",
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


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c4f0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(JLl/dyl;)V
    .locals 1
    .param p3    # Ll/dyl;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/c4f0;->f()Ll/viq0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/u5g0;

    .line 6
    .line 7
    invoke-direct {v0, p1, p2}, Ll/u5g0;-><init>(J)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0, p3}, Ll/viq0;->a(Ll/u8;Ll/dyl;)Ll/viq0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/viq0;->b()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
