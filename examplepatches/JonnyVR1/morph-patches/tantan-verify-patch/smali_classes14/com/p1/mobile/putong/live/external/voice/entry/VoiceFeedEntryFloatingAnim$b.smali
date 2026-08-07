.class public Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$b;->a:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;Ll/cfn0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$b;-><init>(Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$b;->a:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->a(Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim$b;->a:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;

    .line 7
    .line 8
    const-wide/16 v1, 0x7d0

    .line 9
    .line 10
    invoke-virtual {v0, p0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method
