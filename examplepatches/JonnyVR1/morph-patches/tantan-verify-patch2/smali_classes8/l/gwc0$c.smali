.class public final Ll/gwc0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xvc0$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/gwc0;->x(Lcom/p1/mobile/putong/core/data/IntlMarketStickerData;Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "l/gwc0$c",
        "Ll/xvc0$b;",
        "",
        "optionId",
        "",
        "a",
        "(I)V",
        "b_core_intlGmsRelease"
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
.field public final synthetic a:Ll/gwc0;


# direct methods
.method public constructor <init>(Ll/gwc0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gwc0$c;->a:Ll/gwc0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gwc0$c;->a:Ll/gwc0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gwc0;->t()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundButton;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/gwc0$c;->a:Ll/gwc0;

    .line 13
    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {v0, p1}, Ll/gwc0;->n(Ll/gwc0;Ljava/lang/Integer;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/gwc0$c;->a:Ll/gwc0;

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    invoke-static {p0, p1}, Ll/gwc0;->o(Ll/gwc0;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
