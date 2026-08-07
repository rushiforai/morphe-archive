.class public final Ll/g6c0$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g6c0;->y()V
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
        "l/g6c0$a",
        "Lcom/tantan/library/svga/AnimListener;",
        "",
        "onStart",
        "()V",
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
.field public final synthetic a:Ll/g6c0;


# direct methods
.method public constructor <init>(Ll/g6c0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g6c0$a;->a:Ll/g6c0;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static a(Ll/g6c0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g6c0;->x()Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onStart()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/g6c0$a;->a:Ll/g6c0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/g6c0;->f(Ll/g6c0;)Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Ll/g6c0$a;->a:Ll/g6c0;

    .line 11
    .line 12
    new-instance v1, Ll/f6c0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/f6c0;-><init>(Ll/g6c0;)V

    .line 15
    .line 16
    .line 17
    const-wide/16 v2, 0x1770

    .line 18
    .line 19
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
