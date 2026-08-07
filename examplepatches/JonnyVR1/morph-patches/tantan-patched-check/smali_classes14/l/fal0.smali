.class public Ll/fal0;
.super Ll/lbl0;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Ll/xnu;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lbl0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/fal0;->a:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/fal0;->b:Ll/xnu;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(ZLl/xnu;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ll/lbl0;-><init>()V

    .line 12
    iput-boolean p1, p0, Ll/fal0;->a:Z

    .line 13
    iput-object p2, p0, Ll/fal0;->b:Ll/xnu;

    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/lbl0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/fal0;->a:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/cvk0;->a()Ll/cvk0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ll/fal0;->b:Ll/xnu;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/cvk0;->c(Ll/xnu;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 18
    .line 19
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;-><init>()V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->isFromWindow:Z

    .line 24
    .line 25
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->b2(Landroid/content/Context;Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->a2(Landroid/content/Context;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :goto_0
    const/high16 v1, 0x4000000

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 40
    .line 41
    .line 42
    sget v0, Ll/q7c0;->e:I

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 46
    .line 47
    .line 48
    iget-boolean p0, p0, Ll/fal0;->a:Z

    .line 49
    .line 50
    if-nez p0, :cond_1

    .line 51
    .line 52
    invoke-static {p1}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "VideoAnchorChatActChecker"

    .line 2
    .line 3
    return-object p0
.end method
