.class public final synthetic Ll/i1v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;

.field public final synthetic b:Z

.field public final synthetic c:Ll/h2v;

.field public final synthetic d:I

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;ZLl/h2v;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i1v;->a:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;

    iput-boolean p2, p0, Ll/i1v;->b:Z

    iput-object p3, p0, Ll/i1v;->c:Ll/h2v;

    iput p4, p0, Ll/i1v;->d:I

    iput p5, p0, Ll/i1v;->e:I

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/i1v;->a:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;

    iget-boolean v1, p0, Ll/i1v;->b:Z

    iget-object v2, p0, Ll/i1v;->c:Ll/h2v;

    iget v3, p0, Ll/i1v;->d:I

    iget v4, p0, Ll/i1v;->e:I

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;->B(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceActivitiesEntryUnRead;ZLl/h2v;IILandroid/animation/ValueAnimator;)V

    return-void
.end method
