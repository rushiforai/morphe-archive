.class public Ll/uop0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ga1;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/uop0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/uop0;


# direct methods
.method public constructor <init>(Ll/uop0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uop0$a;->a:Ll/uop0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uop0$a;->a:Ll/uop0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->l:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/AudioRecordState;

    .line 6
    .line 7
    sget-object p2, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/AudioRecordState;->RECORDING:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/AudioRecordState;

    .line 8
    .line 9
    if-ne p1, p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->w()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public c(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ljava/lang/String;Ll/ga1;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V
    .locals 0

    .line 1
    invoke-virtual {p5}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->isHighLevelBusiness()Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-eqz p4, :cond_1

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->PHONE:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 8
    .line 9
    if-ne p5, p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 12
    .line 13
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->R1:I

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p5}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->getBusinessMsg()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 32
    .line 33
    .line 34
    move-result-object p4

    .line 35
    invoke-virtual {p4, p1, p2, p3}, Ll/pb1;->g(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/uop0$a;->a:Ll/uop0;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/uop0;->g()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public success()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uop0$a;->a:Ll/uop0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/uop0;->g()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
