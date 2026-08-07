.class public final Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMatchView$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMatchView;->g()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "com/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMatchView$a",
        "Lcom/tantan/library/svga/AnimListener;",
        "",
        "onFinished",
        "()V",
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


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMatchView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMatchView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMatchView$a;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMatchView;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 3

    .line 1
    sget-object v0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMatchView$a;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMatchView;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMatchView;->d(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMatchView;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "startBonusAnim onFinished"

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMatchView$a;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMatchView;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
