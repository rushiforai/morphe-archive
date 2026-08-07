.class public final Ll/mum0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/pum0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\r\u0010\u0008\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\n\u0010\t\u00a8\u0006\u000b"
    }
    d2 = {
        "Ll/mum0;",
        "Ll/ar2;",
        "Ll/pum0;",
        "Ll/ner;",
        "lifecycleProvider",
        "<init>",
        "(Ll/ner;)V",
        "",
        "e0",
        "()V",
        "destroy",
        "buzz_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final e0()V
    .locals 2

    .line 1
    sget-object p0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 2
    .line 3
    const-string v0, "VoiceBuzzPresenter"

    .line 4
    .line 5
    const-string v1, "startFloatMgr"

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->j0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
