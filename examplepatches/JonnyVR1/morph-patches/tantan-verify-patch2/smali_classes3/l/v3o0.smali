.class public final synthetic Ll/v3o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v3o0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v3o0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    check-cast p1, Ll/p5o0;

    invoke-static {p0, p1}, Ll/w3o0;->J3(Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;Ll/p5o0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
