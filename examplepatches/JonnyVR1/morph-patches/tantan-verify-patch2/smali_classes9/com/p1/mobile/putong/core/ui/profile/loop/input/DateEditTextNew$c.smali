.class public Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$c;
.super Ljava/util/TimerTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->g()Ljava/util/TimerTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$c;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$c;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->d(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$c;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->c(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    xor-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->e(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$c;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
