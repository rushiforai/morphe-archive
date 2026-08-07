.class Lcom/immomo/ijkConferenceStreamer$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fb1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/ijkConferenceStreamer;->setRecordDateCallback(Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/ijkConferenceStreamer;


# direct methods
.method public constructor <init>(Lcom/immomo/ijkConferenceStreamer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/ijkConferenceStreamer$i;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C(Ll/oxd0;)Ll/oxd0;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/ijkConferenceStreamer$i;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/ijkConferenceStreamer;->access$1000(Lcom/immomo/ijkConferenceStreamer;)Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/immomo/ijkConferenceStreamer$i;->a:Lcom/immomo/ijkConferenceStreamer;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/immomo/ijkConferenceStreamer;->access$1000(Lcom/immomo/ijkConferenceStreamer;)Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object v0, p1, Ll/oxd0;->a:[B

    .line 16
    .line 17
    const v1, 0xac44

    .line 18
    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-interface {p0, v0, v1, v2}, Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;->onRecordFrame([BIZ)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-object p1
.end method
