.class public final Ll/pal0$d;
.super Landroid/os/CountDownTimer;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pal0;->j0(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "l/pal0$d",
        "Landroid/os/CountDownTimer;",
        "",
        "it",
        "",
        "onTick",
        "(J)V",
        "onFinish",
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
.field public final synthetic a:Ll/pal0;


# direct methods
.method public constructor <init>(Ll/pal0;J)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/pal0$d;->a:Ll/pal0;

    .line 2
    .line 3
    const-wide/16 v0, 0x19

    .line 4
    .line 5
    invoke-direct {p0, p2, p3, v0, v1}, Landroid/os/CountDownTimer;-><init>(JJ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pal0$d;->a:Ll/pal0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/pal0;->I(Ll/pal0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onTick(J)V
    .locals 3

    .line 1
    const-wide/16 v0, 0x19

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-gez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    long-to-int v0, p1

    .line 10
    :goto_0
    sget-object v1, Ll/k8w;->INSTANCE:Ll/k8w;

    .line 11
    .line 12
    iget-object v2, p0, Ll/pal0$d;->a:Ll/pal0;

    .line 13
    .line 14
    invoke-virtual {v2}, Ll/up2;->c()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ll/k8w;->a(Landroid/content/Context;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    iget-object v2, p0, Ll/pal0$d;->a:Ll/pal0;

    .line 25
    .line 26
    invoke-virtual {v2}, Ll/pal0;->T()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/zebraprogress/ZebraProgress;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/zebraprogress/ZebraProgress;->setProgress(I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/pal0$d;->a:Ll/pal0;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/pal0;->L()Lv/VText;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v1, p1, p2}, Ll/k8w;->c(J)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method
