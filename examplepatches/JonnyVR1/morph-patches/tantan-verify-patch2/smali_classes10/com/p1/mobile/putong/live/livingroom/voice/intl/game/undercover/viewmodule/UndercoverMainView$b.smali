.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView$b;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView$b;->b()V

    return-void
.end method


# virtual methods
.method public final synthetic b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView$b;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;->p(Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;)Ll/jvj0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView$b;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;->p(Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;)Ll/jvj0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/jvj0;->b4()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView$b;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->xi:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ke:I

    .line 24
    .line 25
    new-instance v1, Ll/kvj0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/kvj0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/undercover/viewmodule/UndercoverMainView$b;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 39
    .line 40
    .line 41
    return-void
.end method
