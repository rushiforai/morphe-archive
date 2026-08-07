.class public Ll/sfn0$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sfn0;->s(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)V
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
    iput-object p1, p0, Ll/sfn0$b;->b:Ll/sfn0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/sfn0$b;->a:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

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
    .locals 0

    .line 1
    iget-object p1, p0, Ll/sfn0$b;->b:Ll/sfn0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/sfn0;->b(Ll/sfn0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/sfn0$b;->b:Ll/sfn0;

    .line 7
    .line 8
    invoke-static {p0}, Ll/qfn0;->e(Ll/sfn0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/sfn0$b;->b:Ll/sfn0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sfn0$b;->a:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->endEffectIcon:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Ll/sfn0;->d(Ll/sfn0;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
