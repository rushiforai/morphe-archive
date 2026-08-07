.class Ll/tc0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tc0;->Z7(ILandroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Landroid/view/View;

.field final synthetic c:Ll/tc0;


# direct methods
.method public constructor <init>(Ll/tc0;ILandroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tc0$a;->c:Ll/tc0;

    .line 2
    .line 3
    iput p2, p0, Ll/tc0$a;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Ll/tc0$a;->b:Landroid/view/View;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tc0$a;->c:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->C3(Ll/tc0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    iget v2, p0, Ll/tc0$a;->a:I

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, ",view is "

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Ll/tc0$a;->b:Landroid/view/View;

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "clear_view setupRemoteVideo"

    .line 32
    .line 33
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/tc0$a;->c:Ll/tc0;

    .line 41
    .line 42
    invoke-static {v0}, Ll/tc0;->X3(Ll/tc0;)Lio/agora/rtc2/RtcEngine;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    iget-object v0, p0, Ll/tc0$a;->c:Ll/tc0;

    .line 49
    .line 50
    invoke-static {v0}, Ll/tc0;->X3(Ll/tc0;)Lio/agora/rtc2/RtcEngine;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Lio/agora/rtc2/video/VideoCanvas;

    .line 55
    .line 56
    iget-object v2, p0, Ll/tc0$a;->b:Landroid/view/View;

    .line 57
    .line 58
    const/4 v3, 0x1

    .line 59
    iget p0, p0, Ll/tc0$a;->a:I

    .line 60
    .line 61
    invoke-direct {v1, v2, v3, p0}, Lio/agora/rtc2/video/VideoCanvas;-><init>(Landroid/view/View;II)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->setupRemoteVideo(Lio/agora/rtc2/video/VideoCanvas;)I

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method
