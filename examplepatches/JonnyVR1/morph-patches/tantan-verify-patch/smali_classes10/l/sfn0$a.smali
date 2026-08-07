.class public Ll/sfn0$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sfn0;->v(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;ILcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

.field public final synthetic b:Ll/sfn0;


# direct methods
.method public constructor <init>(Ll/sfn0;Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sfn0$a;->b:Ll/sfn0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/sfn0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/sfn0$a;->b:Ll/sfn0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/sfn0;->c(Ll/sfn0;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Ll/sfn0$a;->b:Ll/sfn0;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Ll/sfn0;->b(Ll/sfn0;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/sfn0$a;->b:Ll/sfn0;

    .line 15
    .line 16
    invoke-static {p0}, Ll/qfn0;->e(Ll/sfn0;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p0, p0, Ll/sfn0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 21
    .line 22
    invoke-static {v0, p0}, Ll/sfn0;->e(Ll/sfn0;Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
