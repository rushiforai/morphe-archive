.class public Ll/hrk0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/hrk0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Ll/hrk0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic a(Ll/hrk0$b;Ll/hrk0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hrk0$b;->a:Ll/hrk0;

    return-void
.end method


# virtual methods
.method public b(Ll/ezm0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hrk0$b;->a:Ll/hrk0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/hrk0;->a(Ll/hrk0;Ll/ezm0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hrk0$b;->a:Ll/hrk0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/hrk0;->i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hrk0$b;->a:Ll/hrk0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/hrk0;->b(Ll/hrk0;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public e(Ll/ado0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hrk0$b;->a:Ll/hrk0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/hrk0;->c(Ll/hrk0;Ll/ado0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hrk0$b;->a:Ll/hrk0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/hrk0;->B(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
