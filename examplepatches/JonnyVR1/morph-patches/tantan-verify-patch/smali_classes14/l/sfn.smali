.class public final Ll/sfn;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/yfn;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0019\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\r\u0010\u000c\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000c\u0010\u000bJ\u000f\u0010\r\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000bJ\r\u0010\u000e\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000e\u0010\u000bJ\'\u0010\u0014\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u000f2\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0012\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J-\u0010\u001c\u001a\u00020\t2\u0006\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0018\u001a\u00020\u00162\u0006\u0010\u0019\u001a\u00020\u00162\u0006\u0010\u001b\u001a\u00020\u001a\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\r\u0010\u001e\u001a\u00020\t\u00a2\u0006\u0004\u0008\u001e\u0010\u000bJ\u000f\u0010\u001f\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u001f\u0010\u000bR\u0017\u0010\u0006\u001a\u00020\u00058\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0006\u0010 \u001a\u0004\u0008!\u0010\"R\u0014\u0010$\u001a\u00020#8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008$\u0010%\u00a8\u0006&"
    }
    d2 = {
        "Ll/sfn;",
        "Ll/ar2;",
        "Ll/yfn;",
        "Ll/ner;",
        "lifecycleProvider",
        "Lcom/p1/mobile/putong/app/PutongAct;",
        "act",
        "<init>",
        "(Ll/ner;Lcom/p1/mobile/putong/app/PutongAct;)V",
        "",
        "a0",
        "()V",
        "l0",
        "destroy",
        "k0",
        "",
        "requestCode",
        "resultCode",
        "Landroid/content/Intent;",
        "data",
        "m0",
        "(IILandroid/content/Intent;)V",
        "",
        "content",
        "contact",
        "picUrl",
        "",
        "selected",
        "h0",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V",
        "n0",
        "j0",
        "Lcom/p1/mobile/putong/app/PutongAct;",
        "i0",
        "()Lcom/p1/mobile/putong/app/PutongAct;",
        "Ll/ggn;",
        "mediaHelper",
        "Ll/ggn;",
        "external_intlGmsRelease"
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
.field private final act:Lcom/p1/mobile/putong/app/PutongAct;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final mediaHelper:Ll/ggn;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/app/PutongAct;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Ll/sfn;->act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    new-instance p1, Ll/ggn;

    .line 10
    .line 11
    invoke-direct {p1, p2}, Ll/ggn;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/sfn;->mediaHelper:Ll/ggn;

    .line 15
    .line 16
    return-void
.end method

.method public static e0(Ll/sfn;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sfn;->j0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static f0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/bf10;->j(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static g0(Ll/sfn;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yfn;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/yfn;->C(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/sfn;->mediaHelper:Ll/ggn;

    .line 5
    .line 6
    new-instance v1, Ll/pfn;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/pfn;-><init>(Ll/sfn;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/ggn;->r(Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final h0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/sfn;->act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "typeName"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    iget-object v0, p0, Ll/sfn;->act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "liveType"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    const-string v0, "live"

    .line 41
    .line 42
    :cond_0
    move-object v4, p1

    .line 43
    move-object v6, p2

    .line 44
    move-object v5, p3

    .line 45
    move v7, p4

    .line 46
    move-object v2, v0

    .line 47
    invoke-static/range {v2 .. v7}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveNormalApi;->submitFeedback(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance p2, Ll/qfn;

    .line 56
    .line 57
    invoke-direct {p2, p0}, Ll/qfn;-><init>(Ll/sfn;)V

    .line 58
    .line 59
    .line 60
    new-instance p0, Ll/rfn;

    .line 61
    .line 62
    invoke-direct {p0}, Ll/rfn;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {p2, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final i0()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sfn;->act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/sfn;->act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    new-instance v1, Landroid/content/Intent;

    .line 4
    .line 5
    iget-object v2, p0, Ll/sfn;->act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    const-class v3, Lcom/p1/mobile/putong/live/external/intl/feedback/upload/IntlFeedbackResultAct;

    .line 8
    .line 9
    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/sfn;->act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final k0()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/sfn;->act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    const/4 v4, 0x0

    .line 4
    const/16 v5, 0x315

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZI)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final l0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sfn;->act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final m0(IILandroid/content/Intent;)V
    .locals 0
    .param p3    # Landroid/content/Intent;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/sfn;->mediaHelper:Ll/ggn;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/ggn;->p(IILandroid/content/Intent;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final n0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sfn;->mediaHelper:Ll/ggn;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ggn;->s()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
