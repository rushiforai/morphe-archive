.class public Ll/b5k;
.super Ll/nwl;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nwl;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/mwl;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/mwl;->h(Lcom/p1/mobile/android/app/Act;)Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string p2, "voiceSquare"

    .line 12
    .line 13
    const/4 p3, 0x0

    .line 14
    invoke-virtual {p0, p1, p2, p3}, Ll/mwl;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1, p3}, Ll/iqn0;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public l(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "startVoiceLive"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
