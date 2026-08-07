.class public final synthetic Ll/ucn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ucn0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;

    iput p2, p0, Ll/ucn0;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ucn0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;

    iget p0, p0, Ll/ucn0;->b:I

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;->Q(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/VoiceDressCallTouchView;I)V

    return-void
.end method
