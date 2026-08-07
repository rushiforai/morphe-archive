.class public Ll/l30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;
.implements Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;
.implements Ll/ppl;
.implements Ll/suf;
.implements Ll/xtl;


# instance fields
.field private a:Lcom/momo/mcamera/mask/gesture/GestureDetector;

.field private b:Lcom/momo/mcamera/mask/express/ExpressDetector;

.field private c:Ll/a53;

.field private d:Ll/ool;

.field private e:Z

.field private f:Z

.field private g:Z

.field private h:Ll/xtl;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/l30;->e:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/l30;->f:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/l30;->g:Z

    .line 10
    .line 11
    new-instance v0, Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v0, v1}, Lcom/momo/mcamera/mask/gesture/GestureDetector;-><init>(Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/l30;->a:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->setGestureDetectorListener(Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/l30;->a:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->startDetect()V

    .line 25
    .line 26
    .line 27
    new-instance v0, Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 28
    .line 29
    invoke-direct {v0}, Lcom/momo/mcamera/mask/express/ExpressDetector;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/l30;->b:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Lcom/momo/mcamera/mask/express/ExpressDetector;->setExpressDetectListener(Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/l30;->b:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/express/ExpressDetector;->startDetect()V

    .line 40
    .line 41
    .line 42
    new-instance v0, Ll/a53;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/a53;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ll/l30;->c:Ll/a53;

    .line 48
    .line 49
    invoke-virtual {v0, p0}, Ll/a53;->i(Ll/ppl;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/l30;->c:Ll/a53;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/a53;->l()V

    .line 55
    .line 56
    .line 57
    new-instance v0, Ll/b40;

    .line 58
    .line 59
    invoke-direct {v0}, Ll/b40;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Ll/l30;->d:Ll/ool;

    .line 63
    .line 64
    invoke-interface {v0, p0}, Ll/ool;->d(Ll/xtl;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/l30;->g:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/l30;->e:Z

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/l30;->f:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/l30;->h:Ll/xtl;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p0}, Ll/xtl;->a()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public b(Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l30;->d:Ll/ool;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/ool;->a(Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/l30;->d:Ll/ool;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/ool;->e()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l30;->c:Ll/a53;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/a53;->k(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l30;->b:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/express/ExpressDetector;->setModelPath(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public e(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/c950;->b()Ll/c950;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/c950;->d(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f(Lcom/momo/mcamera/mask/ActionInfo;Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p2, p0, Ll/l30;->d:Ll/ool;

    .line 5
    .line 6
    if-eqz p2, :cond_1

    .line 7
    .line 8
    invoke-interface {p2, p1}, Ll/ool;->c(Lcom/momo/mcamera/mask/ActionInfo;)V

    .line 9
    .line 10
    .line 11
    :cond_1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/ActionInfo;->getHand()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    const/4 v0, 0x1

    .line 20
    xor-int/2addr p2, v0

    .line 21
    iput-boolean p2, p0, Ll/l30;->e:Z

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/ActionInfo;->getMouth()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    const/4 v1, 0x0

    .line 32
    if-eqz p2, :cond_3

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/ActionInfo;->getHead()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    if-eqz p2, :cond_3

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/ActionInfo;->getEye()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    if-eqz p2, :cond_2

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/ActionInfo;->getEye()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-nez p2, :cond_2

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    move p2, v1

    .line 62
    goto :goto_1

    .line 63
    :cond_3
    :goto_0
    move p2, v0

    .line 64
    :goto_1
    iput-boolean p2, p0, Ll/l30;->f:Z

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/ActionInfo;->getBody()Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    if-eqz p2, :cond_4

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/ActionInfo;->getBody()Ljava/util/List;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-nez p1, :cond_4

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_4
    move v0, v1

    .line 84
    :goto_2
    iput-boolean v0, p0, Ll/l30;->g:Z

    .line 85
    .line 86
    return-void
.end method

.method public gestureDetect(Lcom/core/glcore/cv/MMCVBoxes;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l30;->d:Ll/ool;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/ool;->f(Lcom/core/glcore/cv/MMCVBoxes;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/l30;->d:Ll/ool;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/ool;->e()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public onExpressDetect(Lcom/momocv/express/ExpressInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l30;->d:Ll/ool;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/ool;->b(Lcom/momocv/express/ExpressInfo;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/l30;->d:Ll/ool;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/ool;->e()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l30;->a:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Ll/l30;->e:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->setMMCVInfo(Ll/omw;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/l30;->b:Lcom/momo/mcamera/mask/express/ExpressDetector;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-boolean v1, p0, Ll/l30;->f:Z

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/express/ExpressDetector;->setMMCVInfo(Ll/omw;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Ll/l30;->c:Ll/a53;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget-boolean v1, p0, Ll/l30;->g:Z

    .line 28
    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ll/a53;->j(Ll/omw;)V

    .line 32
    .line 33
    .line 34
    :cond_2
    iget-object p0, p0, Ll/l30;->d:Ll/ool;

    .line 35
    .line 36
    if-eqz p0, :cond_3

    .line 37
    .line 38
    invoke-interface {p0, p1}, Ll/ool;->setMMCVInfo(Ll/omw;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    return-void
.end method
