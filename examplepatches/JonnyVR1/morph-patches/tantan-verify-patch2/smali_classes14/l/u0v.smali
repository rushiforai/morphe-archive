.class public final synthetic Ll/u0v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;

.field public final synthetic b:Ll/h2v;

.field public final synthetic c:Z

.field public final synthetic d:I

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;Ll/h2v;ZII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u0v;->a:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;

    iput-object p2, p0, Ll/u0v;->b:Ll/h2v;

    iput-boolean p3, p0, Ll/u0v;->c:Z

    iput p4, p0, Ll/u0v;->d:I

    iput p5, p0, Ll/u0v;->e:I

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/u0v;->a:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;

    iget-object v1, p0, Ll/u0v;->b:Ll/h2v;

    iget-boolean v2, p0, Ll/u0v;->c:Z

    iget v3, p0, Ll/u0v;->d:I

    iget v4, p0, Ll/u0v;->e:I

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;->H(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryOriginStyleTwo;Ll/h2v;ZIILandroid/animation/ValueAnimator;)V

    return-void
.end method
