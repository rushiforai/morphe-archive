.class public final Ll/vd60$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xke$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/vd60;->n(Ll/y8s;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lkotlin/jvm/functions/Function1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\r\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "l/vd60$a",
        "Ll/xke$c;",
        "",
        "inputText",
        "",
        "a",
        "(Ljava/lang/CharSequence;)V",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

.field public final synthetic b:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ll/stj;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lkotlin/jvm/functions/Function1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ll/stj;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/vd60$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    iput-object p2, p0, Ll/vd60$a;->b:Lkotlin/jvm/functions/Function1;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/vd60$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 5
    .line 6
    invoke-static {v0}, Ll/muj;->c0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/vd60$a;->b:Lkotlin/jvm/functions/Function1;

    .line 10
    .line 11
    new-instance v0, Ll/stj;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/stj;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;->namingText:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/stj;->b(Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {p0, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    return-void
.end method
