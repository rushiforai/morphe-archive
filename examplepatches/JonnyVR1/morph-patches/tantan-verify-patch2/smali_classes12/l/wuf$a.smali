.class public final Ll/wuf$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dul;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wuf;-><init>(Ll/voq;Ll/esl;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0005*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001f\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0019\u0010\u000b\u001a\u00020\u00062\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0019\u0010\r\u001a\u00020\u00062\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000c\u00a8\u0006\u000e"
    }
    d2 = {
        "l/wuf$a",
        "Ll/dul;",
        "",
        "stickerNumber",
        "Lcom/momo/mcamera/mask/Sticker;",
        "removeSticker",
        "",
        "a",
        "(ILcom/momo/mcamera/mask/Sticker;)V",
        "",
        "gestureType",
        "gestureDetected",
        "(Ljava/lang/String;)V",
        "onPreGestureAdded",
        "momomediaext_release"
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
.field final synthetic a:Ll/wuf;


# direct methods
.method public constructor <init>(Ll/wuf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wuf$a;->a:Ll/wuf;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(ILcom/momo/mcamera/mask/Sticker;)V
    .locals 0
    .param p2    # Lcom/momo/mcamera/mask/Sticker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/wuf$a;->a:Ll/wuf;

    .line 5
    .line 6
    invoke-static {p0}, Ll/wuf;->h(Ll/wuf;)Ll/tsl;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0, p2}, Ll/tsl;->f(Lcom/momo/mcamera/mask/Sticker;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public gestureDetected(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/wuf$a;->a:Ll/wuf;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wuf;->k(Ll/wuf;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/momo/mcamera/mask/MaskModel;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/wuf$a;->a:Ll/wuf;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/MaskModel;->setTriggerType(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/wuf;->c(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onPreGestureAdded(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/wuf$a;->a:Ll/wuf;

    .line 2
    .line 3
    invoke-static {p0}, Ll/wuf;->r(Ll/wuf;)Ll/cul;

    .line 4
    .line 5
    .line 6
    return-void
.end method
