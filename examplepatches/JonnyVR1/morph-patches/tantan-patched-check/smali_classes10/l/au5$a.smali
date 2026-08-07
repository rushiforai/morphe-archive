.class public final Ll/au5$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nu5$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/au5;->f(Ll/y8s;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u000f\u0010\u0005\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0004\u00a8\u0006\u0006"
    }
    d2 = {
        "l/au5$a",
        "Ll/nu5$a;",
        "",
        "b",
        "()V",
        "a",
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


# instance fields
.field public final synthetic a:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ll/stj;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;


# direct methods
.method public constructor <init>(Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ll/stj;",
            "Lkotlin/Unit;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/au5$a;->a:Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    iput-object p2, p0, Ll/au5$a;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/au5$a;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    const-string v0, "ConfirmDialog user not click send again button."

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/muj;->b0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/au5$a;->a:Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    return-void
.end method
