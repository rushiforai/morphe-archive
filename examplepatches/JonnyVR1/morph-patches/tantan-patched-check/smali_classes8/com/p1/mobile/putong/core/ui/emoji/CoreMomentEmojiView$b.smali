.class public Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->p()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$b;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$b;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->g(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$b;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->h(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$b;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->d(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)Ljava/lang/Runnable;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$b;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->c(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$b;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;

    .line 34
    .line 35
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->d(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)Ljava/lang/Runnable;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-wide/16 v1, 0x82

    .line 40
    .line 41
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method
