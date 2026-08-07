.class public final Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->v(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
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
        "com/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer$a",
        "Lcom/tantan/library/svga/AnimListener;",
        "",
        "onFinished",
        "()V",
        "onStart",
        "message_intlGmsRelease"
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
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;


# direct methods
.method public constructor <init>(Ll/x20;Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer$a;->a:Ll/x20;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer$a;->b:Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer$a;->a:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer$a;->b:Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->get_say_hi_anim_rl()Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer$a;->b:Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/sayHi/view/SayHiDialogContainer;->get_dialog_rl()Landroid/widget/RelativeLayout;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/16 v0, 0x8

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
