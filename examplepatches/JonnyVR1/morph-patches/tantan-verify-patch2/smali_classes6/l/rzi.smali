.class public Ll/rzi;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/w30;

.field public static b:Ll/w30;

.field public static c:Ll/th0;

.field public static d:Ll/l4g0;

.field public static e:Ll/l4g0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Landroid/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_explore_feed_more"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/rzi;->H(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/rzi;->d:Ll/l4g0;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ll/wf70;->l0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic B(Ll/x20;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "dynamic"

    .line 6
    .line 7
    invoke-static {p0, v1, v0, p1}, Ll/rzi;->W(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic E(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/rzi;->I()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static F(Lcom/p1/mobile/putong/data/Media;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/cmg;->v0()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Picture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_1
    if-nez v1, :cond_2

    .line 23
    .line 24
    return v0

    .line 25
    :cond_2
    const/4 p0, 0x1

    .line 26
    return p0
.end method

.method public static G(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "\u4fdd\u5b58\u5230\u672c\u5730"

    .line 10
    .line 11
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/w30$b;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ll/w30$b;->H(I)Ll/w30$b;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    new-instance v3, Ll/myi;

    .line 26
    .line 27
    invoke-direct {v3}, Ll/myi;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    new-instance v3, Ll/xyi;

    .line 35
    .line 36
    invoke-direct {v3}, Ll/xyi;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, v3}, Ll/w30$b;->S(Landroid/content/DialogInterface$OnCancelListener;)Ll/w30$b;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v2, Ll/izi;

    .line 48
    .line 49
    invoke-direct {v2, p1, p0}, Ll/izi;-><init>(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/android/app/Act;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 53
    .line 54
    .line 55
    const-string p0, "e_save_picture"

    .line 56
    .line 57
    const-string p1, "p_comment_picture_preview"

    .line 58
    .line 59
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Ll/w30$b;->F()Ll/w30;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    sput-object p0, Ll/rzi;->b:Ll/w30;

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public static H(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;
    .locals 2

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    new-instance v1, Ll/rzi$b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/rzi$b;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1, p1}, Ll/l4g0;-><init>(Ll/ur2;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static I()V
    .locals 1

    .line 1
    sget-object v0, Ll/rzi;->a:Ll/w30;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Ll/rzi;->a:Ll/w30;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/w30;->b()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    sput-object v0, Ll/rzi;->a:Ll/w30;

    .line 16
    .line 17
    invoke-static {}, Ll/cmg;->s()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget-object v0, Ll/rzi;->d:Ll/l4g0;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 28
    .line 29
    .line 30
    sget-object v0, Ll/rzi;->d:Ll/l4g0;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 33
    .line 34
    .line 35
    :cond_0
    sget-object v0, Ll/rzi;->e:Ll/l4g0;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 40
    .line 41
    .line 42
    sget-object v0, Ll/rzi;->e:Ll/l4g0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public static J()V
    .locals 1

    .line 1
    sget-object v0, Ll/rzi;->c:Ll/th0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Ll/th0;->c()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    sput-object v0, Ll/rzi;->c:Ll/th0;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {v0}, Ll/wf70;->l0(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static K()V
    .locals 1

    .line 1
    sget-object v0, Ll/rzi;->b:Ll/w30;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/rzi;->b:Ll/w30;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/w30;->b()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    sput-object v0, Ll/rzi;->b:Ll/w30;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    const-string v1, "m"

    .line 4
    .line 5
    invoke-static {v1}, Ll/qv5;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/new-report/index.html?speed=true&_bid=1004033&from="

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p0, "&moment_id="

    .line 23
    .line 24
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p0, "&comment_id="

    .line 31
    .line 32
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p0, "&receive_report_user_id="

    .line 39
    .line 40
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p0, "&hideNavigationBar=1&hideNotch=1&_offline=1"

    .line 47
    .line 48
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public static M(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Ljava/lang/CharSequence;",
            ">;)I"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/yyi;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/yyi;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public static N(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Ljava/lang/CharSequence;",
            ">;)I"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/zyi;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zyi;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public static O(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    const-string v1, "m"

    .line 4
    .line 5
    invoke-static {v1}, Ll/qv5;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/new-report/index.html?speed=true&_bid=1004033&from="

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p0, "&moment_id="

    .line 23
    .line 24
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p0, "&receive_report_user_id="

    .line 31
    .line 32
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p0, "&hideNavigationBar=1&hideNotch=1&_offline=1"

    .line 39
    .line 40
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public static P(Lcom/p1/mobile/putong/feed/data/Moment;Ll/qcj;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Lrx/c;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 1
    const/4 v8, 0x0

    .line 2
    const/4 v9, 0x0

    .line 3
    const/4 v6, 0x0

    .line 4
    const/4 v7, 0x0

    .line 5
    move-object v0, p0

    .line 6
    move-object v1, p1

    .line 7
    move-object v2, p2

    .line 8
    move-object v3, p3

    .line 9
    move-object v4, p4

    .line 10
    move v5, p5

    .line 11
    invoke-static/range {v0 .. v9}, Ll/rzi;->R(Lcom/p1/mobile/putong/feed/data/Moment;Ll/qcj;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/Media;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static Q(Lcom/p1/mobile/putong/feed/data/Moment;Ll/qcj;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLcom/p1/mobile/putong/data/Media;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Lrx/c;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Z",
            "Lcom/p1/mobile/putong/data/Media;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v7, 0x0

    .line 2
    const/4 v8, 0x0

    .line 3
    const/4 v6, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move-object v3, p3

    .line 8
    move-object v4, p4

    .line 9
    move v5, p5

    .line 10
    move-object/from16 v9, p6

    .line 11
    .line 12
    invoke-static/range {v0 .. v9}, Ll/rzi;->R(Lcom/p1/mobile/putong/feed/data/Moment;Ll/qcj;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/Media;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static R(Lcom/p1/mobile/putong/feed/data/Moment;Ll/qcj;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/Media;)V
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Lrx/c;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "Ll/x20;",
            "Ll/x20;",
            "Lcom/p1/mobile/putong/data/Media;",
            ")V"
        }
    .end annotation

    move-object/from16 v4, p0

    move-object/from16 v7, p4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    invoke-static {}, Ll/cmg;->K()Z

    move-result v1

    const-string v2, "\u559c\u6b22"

    const-string v3, "\u53d6\u6d88\u5173\u6ce8"

    const-string v5, "\u53d6\u6d88\u559c\u6b22"

    if-eqz v1, :cond_5

    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    move-result v1

    if-nez v1, :cond_5

    .line 3
    invoke-static/range {p2 .. p2}, Ll/hyh;->l(Lcom/p1/mobile/putong/data/User;)Z

    move-result v1

    if-eqz v1, :cond_2

    if-eqz p5, :cond_0

    .line 4
    invoke-static {}, Ll/cmg;->q()Z

    move-result v1

    if-nez v1, :cond_2

    .line 5
    :cond_0
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    :goto_0
    move-object/from16 v6, p6

    goto :goto_1

    .line 6
    :cond_2
    invoke-static/range {p2 .. p2}, Ll/hyh;->h(Lcom/p1/mobile/putong/data/User;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 7
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 8
    :cond_3
    invoke-static/range {p6 .. p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    if-eqz p5, :cond_1

    .line 9
    invoke-static {}, Ll/cmg;->q()Z

    move-result v1

    if-nez v1, :cond_1

    .line 10
    :cond_4
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 11
    :cond_5
    invoke-static/range {p6 .. p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    move-object/from16 v6, p6

    .line 12
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    :goto_1
    invoke-static {v4}, Ll/ksg;->V(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    move-result v1

    if-eqz v1, :cond_6

    return-void

    .line 14
    :cond_6
    invoke-static {}, Ll/j4h;->f()Z

    move-result v1

    const-string v9, "from_nearby_falls_feed"

    const-string v10, "from_moment_detail_album"

    const-string v8, ""

    const/4 v12, 0x1

    const/4 v11, 0x0

    const/4 v13, 0x0

    if-eqz v1, :cond_1b

    .line 15
    invoke-static/range {p2 .. p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 16
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 17
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    move-result v1

    if-nez v1, :cond_1b

    iget-object v1, v4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v14

    invoke-interface {v14}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v1, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1b

    .line 19
    invoke-static {}, Ll/cmg;->K()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    move-result v0

    if-nez v0, :cond_b

    .line 20
    invoke-static/range {p2 .. p2}, Ll/hyh;->l(Lcom/p1/mobile/putong/data/User;)Z

    move-result v0

    if-eqz v0, :cond_8

    if-eqz p5, :cond_7

    .line 21
    invoke-static {}, Ll/cmg;->q()Z

    move-result v0

    if-nez v0, :cond_8

    :cond_7
    move-object v14, v5

    goto :goto_2

    .line 22
    :cond_8
    invoke-static/range {p2 .. p2}, Ll/hyh;->h(Lcom/p1/mobile/putong/data/User;)Z

    move-result v0

    if-eqz v0, :cond_9

    move-object v14, v3

    goto :goto_2

    .line 23
    :cond_9
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_a

    if-eqz p5, :cond_c

    .line 24
    invoke-static {}, Ll/cmg;->q()Z

    move-result v0

    if-nez v0, :cond_c

    :cond_a
    move-object v14, v2

    goto :goto_2

    .line 25
    :cond_b
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c

    move-object v14, v6

    goto :goto_2

    :cond_c
    move-object v14, v11

    .line 26
    :goto_2
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    iget-object v0, v0, Lcom/p1/mobile/putong/feed/api/b;->M:Lcom/p1/mobile/putong/feed/api/b$a;

    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    iget-object v1, v4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    move v15, v12

    goto :goto_3

    :cond_d
    move v15, v13

    .line 28
    :goto_3
    invoke-static {v4}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    move-result v0

    if-nez v0, :cond_10

    if-nez v15, :cond_f

    .line 29
    invoke-static {}, Ll/cmg;->K()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 30
    const-string v0, "\u52a0\u5165\u9ed1\u540d\u5355"

    goto :goto_4

    .line 31
    :cond_e
    invoke-static/range {p3 .. p3}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    move-result-object v0

    invoke-virtual {v0}, Ll/j1i;->l()Ljava/lang/String;

    move-result-object v0

    :goto_4
    move-object/from16 v16, v0

    goto :goto_5

    .line 32
    :cond_f
    invoke-static/range {p3 .. p3}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    move-result-object v0

    invoke-virtual {v0}, Ll/j1i;->a()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :cond_10
    move-object/from16 v16, v8

    .line 33
    :goto_5
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_11

    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 34
    invoke-interface {v0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 35
    invoke-interface {v0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v0

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 36
    invoke-interface {v0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v0

    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v0

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 37
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    invoke-interface {v0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v0

    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v0

    :goto_6
    move-object v5, v0

    goto :goto_7

    .line 38
    :cond_11
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v0

    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v0

    goto :goto_6

    .line 39
    :goto_7
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_12

    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    invoke-interface {v0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 40
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    invoke-interface {v0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    const-string v1, "audio/mp4"

    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_12

    move v1, v13

    goto :goto_8

    :cond_12
    move v1, v12

    .line 41
    :goto_8
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    move-result-object v12

    .line 42
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object v8, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    :cond_13
    move-object v13, v8

    if-eqz p5, :cond_14

    .line 43
    const-string v0, "p_moment_preview"

    invoke-static {v7, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_14

    .line 44
    const-string v0, "moment_detail"

    move-object/from16 v17, v0

    goto :goto_9

    :cond_14
    move-object/from16 v17, v7

    .line 45
    :goto_9
    new-instance v0, Ll/kzi;

    move-object/from16 v3, p2

    move-object/from16 v2, p3

    invoke-direct/range {v0 .. v5}, Ll/kzi;-><init>(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    move-object/from16 v18, v0

    new-instance v8, Ll/lzi;

    move-object/from16 v4, p0

    move-object v0, v8

    invoke-direct/range {v0 .. v5}, Ll/lzi;-><init>(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    move-object/from16 v19, v0

    .line 46
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 47
    new-instance v0, Ll/mzi;

    move-object/from16 v5, p2

    move-object/from16 v4, p3

    move-object/from16 v3, p7

    move-object v1, v6

    move-object v8, v7

    move-object v2, v14

    move-object/from16 v6, p0

    move/from16 v7, p5

    invoke-direct/range {v0 .. v8}, Ll/mzi;-><init>(Ljava/lang/String;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;ZLjava/lang/String;)V

    move-object v5, v2

    move-object v2, v4

    move-object v4, v6

    move-object v7, v8

    goto :goto_a

    :cond_15
    move-object/from16 v4, p0

    move-object/from16 v2, p3

    move-object v5, v14

    move-object v0, v11

    .line 48
    :goto_a
    invoke-static {v7}, Ll/pu20;->C(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_16

    iget-object v1, v4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v3

    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_16

    .line 50
    new-instance v1, Ll/nzi;

    move-object/from16 v3, p8

    invoke-direct {v1, v3, v4}, Ll/nzi;-><init>(Ll/x20;Lcom/p1/mobile/putong/feed/data/Moment;)V

    move-object v6, v11

    goto :goto_b

    :cond_16
    move-object v1, v11

    move-object v6, v1

    .line 51
    :goto_b
    new-instance v11, Ll/ozi;

    invoke-direct {v11, v2, v4}, Ll/ozi;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 52
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_17

    .line 53
    invoke-static {v7}, Ll/pu20;->C(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_18

    :cond_17
    if-eqz p5, :cond_19

    .line 54
    :cond_18
    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_19

    .line 55
    invoke-static {v4}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    move-result v3

    if-nez v3, :cond_19

    .line 56
    new-instance v3, Ll/pzi;

    move-object/from16 v7, p2

    invoke-direct {v3, v2, v4, v15, v7}, Ll/pzi;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;ZLcom/p1/mobile/putong/data/User;)V

    :goto_c
    move-object v10, v1

    move-object v1, v13

    goto :goto_d

    :cond_19
    move-object/from16 v7, p2

    move-object v3, v6

    goto :goto_c

    .line 57
    :goto_d
    new-instance v13, Ll/qzi;

    invoke-direct {v13}, Ll/qzi;-><init>()V

    .line 58
    invoke-static/range {p9 .. p9}, Ll/rzi;->F(Lcom/p1/mobile/putong/data/Media;)Z

    move-result v4

    if-nez v4, :cond_1a

    move-object v14, v6

    goto :goto_e

    .line 59
    :cond_1a
    new-instance v4, Ll/nyi;

    move-object/from16 v14, p9

    invoke-direct {v4, v14, v2}, Ll/nyi;-><init>(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/android/app/Act;)V

    move-object v14, v4

    .line 60
    :goto_e
    const-string v4, "discover_discussion"

    move-object v9, v0

    move-object v15, v7

    move-object v0, v12

    move-object/from16 v6, v16

    move-object/from16 v7, v18

    move-object/from16 v8, v19

    move-object v12, v3

    move-object/from16 v3, v17

    invoke-interface/range {v0 .. v15}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Q9(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;)Ll/pej0;

    return-void

    :cond_1b
    move-object/from16 v2, p3

    move-object/from16 v3, p8

    move-object/from16 v14, p9

    move-object v6, v11

    .line 61
    iget-object v1, v4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v5

    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 62
    instance-of v1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    if-eqz v1, :cond_1c

    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1d

    :cond_1c
    instance-of v1, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    if-nez v1, :cond_1d

    .line 63
    invoke-static {}, Ll/cmg;->i0()Z

    move-result v1

    if-nez v1, :cond_1e

    const-string v1, "from_mine_tab_album"

    .line 64
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1d

    const-string v1, "p_navigation_view"

    .line 65
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 66
    :cond_1d
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->f1:I

    invoke-virtual {v2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    invoke-static {}, Ll/cmg;->R()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 68
    invoke-static {v4}, Ll/xn00;->i(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 69
    sget-object v1, Ll/xn00;->d:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    :cond_1e
    instance-of v1, v2, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;

    if-eqz v1, :cond_1f

    invoke-static {v14}, Ll/rzi;->F(Lcom/p1/mobile/putong/data/Media;)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 71
    const-string v1, "\u4fdd\u5b58\u5230\u672c\u5730"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    :cond_1f
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->t4:I

    invoke-virtual {v2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_12

    .line 73
    :cond_20
    invoke-static/range {p2 .. p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_29

    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    move-result v1

    if-nez v1, :cond_29

    .line 74
    invoke-static {v7}, Ll/pu20;->C(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 75
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_22

    iget-object v1, v4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v5

    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_22

    .line 77
    const-string v1, "\u4e0d\u611f\u5174\u8da3"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21

    const-string v1, "moment_id"

    iget-object v5, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-static {v1, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v11

    goto :goto_f

    :cond_21
    move-object v11, v6

    :goto_f
    filled-new-array {v11}, [Ll/pf60;

    move-result-object v1

    .line 79
    const-string v5, "e_feed_not_interested"

    const-string v6, "p_explore_feed_more"

    invoke-static {v5, v6, v1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 80
    :cond_22
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 81
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->S3:I

    invoke-virtual {v2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    :cond_23
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_24

    .line 83
    invoke-static {v7}, Ll/pu20;->C(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_25

    :cond_24
    if-eqz p5, :cond_29

    .line 84
    :cond_25
    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_29

    .line 85
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    iget-object v1, v1, Lcom/p1/mobile/putong/feed/api/b;->M:Lcom/p1/mobile/putong/feed/api/b$a;

    invoke-virtual {v1}, Ll/mof0;->n()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_26

    .line 86
    iget-object v5, v4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    invoke-interface {v1, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_26

    move v13, v12

    .line 87
    :cond_26
    invoke-static {v4}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    move-result v1

    if-nez v1, :cond_29

    if-nez v13, :cond_28

    .line 88
    invoke-static {}, Ll/cmg;->K()Z

    move-result v1

    if-eqz v1, :cond_27

    .line 89
    const-string v1, "\u5c4f\u853d\u52a8\u6001\u5e76\u52a0\u5165\u9ed1\u540d\u5355"

    goto :goto_10

    .line 90
    :cond_27
    invoke-static {v2}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    move-result-object v1

    invoke-virtual {v1}, Ll/j1i;->l()Ljava/lang/String;

    move-result-object v1

    :goto_10
    move-object v8, v1

    goto :goto_11

    .line 91
    :cond_28
    invoke-static {v2}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    move-result-object v1

    invoke-virtual {v1}, Ll/j1i;->a()Ljava/lang/String;

    move-result-object v1

    goto :goto_10

    .line 92
    :goto_11
    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_29
    :goto_12
    move-object v9, v8

    .line 93
    new-instance v13, Ll/w30$b;

    invoke-direct {v13, v2}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 94
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 95
    invoke-virtual {v13, v1}, Ll/w30$b;->H(I)Ll/w30$b;

    move-result-object v1

    new-instance v5, Ll/oyi;

    invoke-direct {v5}, Ll/oyi;-><init>()V

    .line 96
    invoke-virtual {v1, v5}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    move-result-object v1

    new-instance v5, Ll/rzi$a;

    invoke-direct {v5}, Ll/rzi$a;-><init>()V

    .line 97
    invoke-virtual {v1, v5}, Ll/w30$b;->S(Landroid/content/DialogInterface$OnCancelListener;)Ll/w30$b;

    move-result-object v1

    .line 98
    invoke-virtual {v1, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    move-result-object v1

    .line 99
    invoke-static {v2, v0}, Ll/rzi;->N(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)I

    move-result v5

    invoke-static {v2, v0}, Ll/rzi;->M(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)I

    move-result v0

    filled-new-array {v5, v0}, [I

    move-result-object v0

    sget v5, Ll/k9c0;->b:I

    filled-new-array {v5, v5}, [I

    move-result-object v5

    .line 100
    invoke-virtual {v1, v0, v5}, Ll/w30$b;->R([I[I)Ll/w30$b;

    move-result-object v15

    new-instance v0, Ll/pyi;

    move-object/from16 v8, p1

    move/from16 v6, p5

    move-object/from16 v1, p6

    move-object v10, v3

    move-object v5, v4

    move-object v11, v14

    move-object/from16 v4, p2

    move-object v3, v2

    move-object/from16 v2, p7

    invoke-direct/range {v0 .. v11}, Ll/pyi;-><init>(Ljava/lang/String;Ll/x20;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;ZLjava/lang/String;Ll/qcj;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/Media;)V

    .line 101
    invoke-virtual {v15, v0}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 102
    invoke-virtual {v13}, Ll/w30$b;->F()Ll/w30;

    move-result-object v0

    sput-object v0, Ll/rzi;->a:Ll/w30;

    .line 103
    invoke-virtual {v0}, Ll/w30;->f()V

    .line 104
    invoke-static {}, Ll/cmg;->s()Z

    move-result v0

    if-eqz v0, :cond_2a

    sget-object v0, Ll/rzi;->d:Ll/l4g0;

    if-eqz v0, :cond_2a

    .line 105
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 106
    sget-object v0, Ll/rzi;->d:Ll/l4g0;

    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 107
    :cond_2a
    sget-object v0, Ll/rzi;->e:Ll/l4g0;

    if-nez v0, :cond_2b

    .line 108
    const-class v0, Landroid/app/Dialog;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Ll/rzi;->H(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    move-result-object v0

    sput-object v0, Ll/rzi;->e:Ll/l4g0;

    .line 109
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 110
    sget-object v0, Ll/rzi;->e:Ll/l4g0;

    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 111
    :cond_2b
    invoke-static {v12}, Ll/wf70;->l0(Z)V

    return-void
.end method

.method public static S(Lcom/p1/mobile/putong/feed/data/Moment;Ll/pcj;Ll/pcj;Ll/x20;Ll/qcj;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLl/x20;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/x20;",
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Lrx/c;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Z",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v4, p7

    .line 2
    .line 3
    invoke-static {p0, p2, v4}, Ll/rzi;->U(Lcom/p1/mobile/putong/feed/data/Moment;Ll/pcj;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/cmg;->c0()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/cmg;->d0()Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Ljava/lang/String;

    .line 26
    .line 27
    :goto_0
    move-object v6, p1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    const/4 p1, 0x0

    .line 30
    goto :goto_0

    .line 31
    :goto_1
    const/4 v9, 0x0

    .line 32
    move-object v0, p0

    .line 33
    move-object v7, p3

    .line 34
    move-object v1, p4

    .line 35
    move-object v2, p5

    .line 36
    move-object/from16 v3, p6

    .line 37
    .line 38
    move/from16 v5, p8

    .line 39
    .line 40
    move-object/from16 v8, p9

    .line 41
    .line 42
    invoke-static/range {v0 .. v9}, Ll/rzi;->R(Lcom/p1/mobile/putong/feed/data/Moment;Ll/qcj;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/Media;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static T(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p3}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->r:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    :cond_0
    invoke-virtual {p3, p1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance p1, Ll/gzi;

    .line 27
    .line 28
    invoke-direct {p1, p4}, Ll/gzi;-><init>(Ll/x20;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    new-instance p1, Ll/hzi;

    .line 42
    .line 43
    invoke-direct {p1}, Ll/hzi;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    new-instance p1, Ll/jzi;

    .line 51
    .line 52
    invoke-direct {p1}, Ll/jzi;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 56
    .line 57
    .line 58
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-nez p0, :cond_1

    .line 63
    .line 64
    invoke-virtual {v0, p2}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 65
    .line 66
    .line 67
    :cond_1
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    sput-object p0, Ll/rzi;->c:Ll/th0;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public static U(Lcom/p1/mobile/putong/feed/data/Moment;Ll/pcj;Ljava/lang/String;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-static {p0}, Ll/ksg;->V(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    invoke-static {p0}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const-string p0, "from_nearby_focus"

    .line 30
    .line 31
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Ljava/lang/Boolean;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_0

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_0
    const/4 p0, 0x0

    .line 52
    return p0
.end method

.method public static V(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {p1, p2, p3, p4}, Ll/rzi;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, v0, p1}, Ll/ryh;->a(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static W(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {p1, p2, p3}, Ll/rzi;->O(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, v0, p1}, Ll/ryh;->a(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Ljava/lang/CharSequence;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->t4:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/wf70;->l0(Z)V

    .line 3
    .line 4
    .line 5
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/api/b;->M:Lcom/p1/mobile/putong/feed/api/b$a;

    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 16
    .line 17
    xor-int/lit8 v2, p2, 0x1

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/api/b$a;->M(Ljava/lang/String;Z)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/azi;

    .line 24
    .line 25
    invoke-direct {v1, p0, p2, p1}, Ll/azi;-><init>(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/feed/data/Moment;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Ll/bzi;

    .line 29
    .line 30
    invoke-direct {p1, p0}, Ll/bzi;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic c(Ljava/lang/String;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;ZLjava/lang/String;)V
    .locals 9

    .line 1
    move-object/from16 v0, p7

    .line 2
    .line 3
    invoke-static/range {p0 .. p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-interface {p2}, Ll/x20;->call()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string p0, "\u559c\u6b22"

    .line 20
    .line 21
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string p0, "moment"

    .line 32
    .line 33
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    iget-object v6, p5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    const/4 v7, 0x0

    .line 40
    const/4 v8, 0x0

    .line 41
    const/4 v3, 0x1

    .line 42
    const/4 v4, 0x0

    .line 43
    move-object v1, p3

    .line 44
    move-object v2, p4

    .line 45
    invoke-interface/range {v0 .. v8}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->kn(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ljava/lang/String;Ll/y20;Ll/y20;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    const-string p0, "\u53d6\u6d88\u559c\u6b22"

    .line 50
    .line 51
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_4

    .line 56
    .line 57
    if-eqz p6, :cond_2

    .line 58
    .line 59
    const-string p0, "moment_detail"

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    const-string p0, "moment_feed"

    .line 63
    .line 64
    :goto_0
    const-string p1, "unlike_from"

    .line 65
    .line 66
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_3

    .line 75
    .line 76
    iget-object p1, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_3
    const-string p1, ""

    .line 80
    .line 81
    :goto_1
    const-string p2, "other_user_id"

    .line 82
    .line 83
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const-string p1, "e_unlike"

    .line 92
    .line 93
    const-string p2, "p_share_pop"

    .line 94
    .line 95
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 96
    .line 97
    .line 98
    const/4 p0, 0x0

    .line 99
    invoke-static {p3, p4, v0, p0}, Ll/hyh;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/y20;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_4
    const-string p0, "\u53d6\u6d88\u5173\u6ce8"

    .line 104
    .line 105
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-eqz p0, :cond_5

    .line 110
    .line 111
    invoke-static {p3, p4, v0, p6}, Ll/hyh;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Z)V

    .line 112
    .line 113
    .line 114
    :cond_5
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/rzi;->J()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p0}, Ll/x20;->call()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;ZLcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    new-instance v0, Ll/qyi;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/qyi;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_1

    .line 7
    .line 8
    invoke-static {p0}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ll/j1i;->d()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->s3:I

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p0}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2}, Ll/j1i;->i()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-static {p0}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    invoke-virtual {v1, p3}, Ll/j1i;->k(Z)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    new-instance v1, Ll/ryi;

    .line 45
    .line 46
    invoke-direct {v1, v0}, Ll/ryi;-><init>(Ll/x20;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p0, p1, p2, p3, v1}, Ll/rzi;->T(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    invoke-interface {v0}, Ll/x20;->call()V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    invoke-static {p0}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Ll/j1i;->h()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_2

    .line 66
    .line 67
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->s3:I

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {p0}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-virtual {p2}, Ll/j1i;->c()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-static {p0}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 82
    .line 83
    .line 84
    move-result-object p3

    .line 85
    invoke-virtual {p3}, Ll/j1i;->b()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    new-instance v1, Ll/syi;

    .line 90
    .line 91
    invoke-direct {v1, v0}, Ll/syi;-><init>(Ll/x20;)V

    .line 92
    .line 93
    .line 94
    invoke-static {p0, p1, p2, p3, v1}, Ll/rzi;->T(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_2
    invoke-interface {v0}, Ll/x20;->call()V

    .line 99
    .line 100
    .line 101
    :goto_0
    const/4 p0, 0x1

    .line 102
    invoke-static {p0}, Ll/wf70;->l0(Z)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/feed/data/Moment;Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->supportInvalidateOptionsMenu()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-virtual {p3}, Ll/j1i;->j()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {p0}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    invoke-virtual {p3}, Ll/j1i;->g()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    :goto_0
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget v0, Ll/lbc0;->Z1:I

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p3, p0}, Ll/o1j0;->q(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 37
    .line 38
    .line 39
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 40
    .line 41
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 42
    .line 43
    xor-int/lit8 p1, p1, 0x1

    .line 44
    .line 45
    invoke-virtual {p0, p2, p1}, Ll/jka;->cc(Ljava/lang/String;Z)Lrx/c;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/rzi;->J()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ll/x20;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    const-string p0, "moment_id"

    .line 17
    .line 18
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    :goto_0
    filled-new-array {p0}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, "e_feed_not_interested"

    .line 31
    .line 32
    const-string v0, "p_explore_feed_more"

    .line 33
    .line 34
    invoke-static {p1, v0, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/wf70;->l0(Z)V

    .line 3
    .line 4
    .line 5
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/api/b;->M:Lcom/p1/mobile/putong/feed/api/b$a;

    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 16
    .line 17
    xor-int/lit8 v2, p2, 0x1

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/api/b$a;->M(Ljava/lang/String;Z)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/ezi;

    .line 24
    .line 25
    invoke-direct {v1, p0, p2, p1}, Ll/ezi;-><init>(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/feed/data/Moment;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Ll/fzi;

    .line 29
    .line 30
    invoke-direct {p1, p0}, Ll/fzi;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/feed/data/Moment;Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->supportInvalidateOptionsMenu()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-virtual {p3}, Ll/j1i;->j()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {p0}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    invoke-virtual {p3}, Ll/j1i;->g()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    :goto_0
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget v0, Ll/lbc0;->Z1:I

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p3, p0}, Ll/o1j0;->q(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 37
    .line 38
    .line 39
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 40
    .line 41
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 42
    .line 43
    xor-int/lit8 p1, p1, 0x1

    .line 44
    .line 45
    invoke-virtual {p0, p2, p1}, Ll/jka;->cc(Ljava/lang/String;Z)Lrx/c;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic l(Ll/x20;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/android/app/Act;Ljava/lang/CharSequence;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->u3:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->S3:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static synthetic n(Ll/x20;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/rzi;->K()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/android/app/Act;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    const-string p2, "e_save_picture"

    .line 2
    .line 3
    const-string p4, "p_comment_picture_preview"

    .line 4
    .line 5
    invoke-static {p2, p4}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p3, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 9
    .line 10
    const-string p3, "\u4fdd\u5b58\u5230\u672c\u5730"

    .line 11
    .line 12
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    invoke-static {}, Ll/rzi;->K()V

    .line 19
    .line 20
    .line 21
    move-object p2, p0

    .line 22
    check-cast p2, Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    if-eqz p2, :cond_1

    .line 25
    .line 26
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 27
    .line 28
    iget p3, p2, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 29
    .line 30
    if-lez p3, :cond_1

    .line 31
    .line 32
    iget p2, p2, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 33
    .line 34
    if-gtz p2, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-static {}, Ll/snh;->k()Ll/snh;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    const/4 p3, 0x1

    .line 42
    invoke-virtual {p2, p1, p0, p3}, Ll/snh;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Z)V

    .line 43
    .line 44
    .line 45
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic q(Ljava/lang/String;Ll/x20;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;ZLjava/lang/String;Ll/qcj;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/Media;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 7

    move-object/from16 v1, p10

    move-object/from16 v2, p12

    .line 1
    iget-object v3, v2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    invoke-static {v3, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 2
    invoke-static {}, Ll/rzi;->I()V

    .line 3
    invoke-interface {p1}, Ll/x20;->call()V

    return-void

    .line 4
    :cond_0
    iget-object p0, v2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    const-string p1, "\u559c\u6b22"

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 5
    invoke-static {}, Ll/rzi;->I()V

    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    move-result-object p0

    const-string p1, "moment"

    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    move-result-object p1

    iget-object p4, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    const/4 p5, 0x0

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    move-object/from16 p9, p1

    move-object p6, p3

    move-object/from16 p10, p4

    move-object/from16 p11, p5

    move-object/from16 p12, v0

    move p7, v1

    move-object p8, v2

    move-object p4, p0

    move-object p5, p2

    .line 8
    invoke-interface/range {p4 .. p12}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->kn(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ljava/lang/String;Ll/y20;Ll/y20;)V

    return-void

    .line 9
    :cond_1
    iget-object v3, v2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    const-string v4, "\u53d6\u6d88\u559c\u6b22"

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_4

    .line 10
    invoke-static {}, Ll/rzi;->I()V

    if-eqz p5, :cond_2

    .line 11
    const-string p4, "moment_detail"

    goto :goto_0

    :cond_2
    move-object p4, p6

    :goto_0
    const-string p5, "unlike_from"

    invoke-static {p5, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p4

    .line 12
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_3

    iget-object p5, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    goto :goto_1

    :cond_3
    const-string p5, ""

    :goto_1
    const-string v1, "other_user_id"

    invoke-static {v1, p5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p5

    filled-new-array {p4, p5}, [Ll/pf60;

    move-result-object p4

    .line 13
    const-string p5, "e_unlike"

    const-string v1, "p_share_pop"

    invoke-static {p5, v1, p4}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 14
    invoke-static {p2, p3, p6, v4}, Ll/hyh;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/y20;)V

    return-void

    .line 15
    :cond_4
    iget-object v3, v2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    const-string v5, "\u53d6\u6d88\u5173\u6ce8"

    invoke-static {v3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v5, 0x0

    if-eqz v3, :cond_5

    .line 16
    invoke-static {}, Ll/rzi;->I()V

    .line 17
    invoke-static {p2, p3, p6, v5}, Ll/hyh;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Z)V

    return-void

    .line 18
    :cond_5
    iget-object v3, v2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    sget v6, Lcom/p1/mobile/putong/feed/R$string;->t4:I

    .line 19
    invoke-virtual {p2, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 20
    invoke-static {v3, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v6, 0x1

    if-eqz v3, :cond_6

    .line 21
    invoke-static {}, Ll/rzi;->I()V

    .line 22
    invoke-static {v6}, Ll/wf70;->l0(Z)V

    .line 23
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->u4:I

    .line 24
    invoke-virtual {p2, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance p3, Ll/tyi;

    move-object/from16 p9, p2

    move-object p8, p3

    move-object/from16 p11, p4

    move/from16 p13, p5

    move-object/from16 p12, p6

    move-object/from16 p10, p7

    invoke-direct/range {p8 .. p13}, Ll/tyi;-><init>(Lcom/p1/mobile/android/app/Act;Ll/qcj;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    .line 25
    invoke-static {p2, v4, v4, p1, p3}, Ll/rzi;->T(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    return-void

    .line 26
    :cond_6
    iget-object v0, v2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    sget v3, Lcom/p1/mobile/putong/feed/R$string;->S3:I

    .line 27
    invoke-virtual {p2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 28
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 29
    invoke-static {}, Ll/rzi;->I()V

    .line 30
    iget-object p1, p4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    iget-object p3, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    invoke-static {p2, p1, v5, v4, p3}, Ll/orb0;->a(Landroid/content/Context;Ljava/lang/String;ZLandroid/os/ResultReceiver;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 32
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 33
    iget-object p1, p4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    iget-object p3, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-static {p2, p1, p3}, Ll/k3h;->L0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 34
    :cond_7
    iget-object v0, v2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    invoke-static {v0, p8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 35
    invoke-static {}, Ll/rzi;->I()V

    .line 36
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    iget-object v0, v0, Lcom/p1/mobile/putong/feed/api/b;->M:Lcom/p1/mobile/putong/feed/api/b$a;

    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_8

    .line 37
    iget-object v1, p4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    move v5, v6

    .line 38
    :cond_8
    new-instance v0, Ll/uyi;

    invoke-direct {v0, p2, p4, v5}, Ll/uyi;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    if-eqz v5, :cond_a

    .line 39
    invoke-static {p2}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    move-result-object p4

    invoke-virtual {p4}, Ll/j1i;->d()Z

    move-result p4

    if-eqz p4, :cond_9

    .line 40
    sget p4, Lcom/p1/mobile/putong/feed/R$string;->s3:I

    .line 41
    invoke-virtual {p2, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p4

    .line 42
    invoke-static {p2}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    move-result-object p5

    invoke-virtual {p5}, Ll/j1i;->i()Ljava/lang/String;

    move-result-object p5

    .line 43
    invoke-static {p2}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    move-result-object v1

    .line 44
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    move-result p1

    invoke-virtual {v1, p1}, Ll/j1i;->k(Z)Ljava/lang/String;

    move-result-object p1

    new-instance p3, Ll/vyi;

    invoke-direct {p3, v0}, Ll/vyi;-><init>(Ll/x20;)V

    .line 45
    invoke-static {p2, p4, p5, p1, p3}, Ll/rzi;->T(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    return-void

    .line 46
    :cond_9
    invoke-interface {v0}, Ll/x20;->call()V

    return-void

    .line 47
    :cond_a
    invoke-static {p2}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    move-result-object p1

    invoke-virtual {p1}, Ll/j1i;->h()Z

    move-result p1

    if-eqz p1, :cond_b

    .line 48
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->s3:I

    .line 49
    invoke-virtual {p2, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 50
    invoke-static {p2}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    move-result-object p3

    invoke-virtual {p3}, Ll/j1i;->c()Ljava/lang/String;

    move-result-object p3

    .line 51
    invoke-static {p2}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    move-result-object p4

    invoke-virtual {p4}, Ll/j1i;->b()Ljava/lang/String;

    move-result-object p4

    new-instance p5, Ll/wyi;

    invoke-direct {p5, v0}, Ll/wyi;-><init>(Ll/x20;)V

    .line 52
    invoke-static {p2, p1, p3, p4, p5}, Ll/rzi;->T(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    goto :goto_2

    .line 53
    :cond_b
    invoke-interface {v0}, Ll/x20;->call()V

    .line 54
    :goto_2
    invoke-static {v6}, Ll/wf70;->l0(Z)V

    return-void

    .line 55
    :cond_c
    iget-object p1, v2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    sget p3, Lcom/p1/mobile/putong/feed/R$string;->f1:I

    .line 56
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    .line 57
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_d

    .line 58
    invoke-static {}, Ll/rzi;->I()V

    .line 59
    invoke-static {}, Ll/nt00;->k()Ll/nt00;

    move-result-object p1

    invoke-virtual {p1, p4}, Ll/nt00;->i(Lcom/p1/mobile/putong/feed/data/Moment;)I

    move-result p1

    .line 60
    invoke-static {}, Ll/nt00;->k()Ll/nt00;

    move-result-object p3

    .line 61
    invoke-virtual {p3, p2, p4, p1, v4}, Ll/nt00;->u(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;ILl/nt00$b;)V

    return-void

    .line 62
    :cond_d
    iget-object p1, v2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    const-string p3, "\u4e0d\u611f\u5174\u8da3"

    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_f

    .line 63
    invoke-static {}, Ll/rzi;->I()V

    .line 64
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_e

    const-string p0, "moment_id"

    iget-object p1, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v4

    :cond_e
    filled-new-array {v4}, [Ll/pf60;

    move-result-object p0

    .line 65
    const-string p1, "e_feed_not_interested"

    const-string p2, "p_explore_feed_more"

    invoke-static {p1, p2, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 66
    invoke-static/range {p9 .. p9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_13

    .line 67
    invoke-interface/range {p9 .. p9}, Ll/x20;->call()V

    return-void

    .line 68
    :cond_f
    sget-object p1, Ll/xn00;->d:Ljava/lang/String;

    iget-object p3, v2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10

    .line 69
    invoke-static {}, Ll/xn00;->f()Ll/xn00;

    move-result-object p1

    invoke-virtual {p1, p2, p4}, Ll/xn00;->k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 70
    invoke-static {}, Ll/rzi;->I()V

    return-void

    .line 71
    :cond_10
    iget-object p1, v2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    const-string p3, "\u4fdd\u5b58\u5230\u672c\u5730"

    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_13

    .line 72
    invoke-static {}, Ll/rzi;->I()V

    if-nez v1, :cond_11

    goto :goto_3

    .line 73
    :cond_11
    move-object p1, v1

    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    iget p3, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    if-lez p3, :cond_13

    iget p1, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    if-gtz p1, :cond_12

    goto :goto_3

    .line 75
    :cond_12
    invoke-static {}, Ll/snh;->k()Ll/snh;

    move-result-object p1

    invoke-virtual {p1, p2, v1, v6}, Ll/snh;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Z)V

    :cond_13
    :goto_3
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/android/app/Act;Ll/qcj;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/wf70;->l0(Z)V

    .line 3
    .line 4
    .line 5
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 9
    .line 10
    .line 11
    invoke-interface {p1, p2}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lrx/c;

    .line 16
    .line 17
    new-instance p2, Ll/czi;

    .line 18
    .line 19
    invoke-direct {p2, p0}, Ll/czi;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 20
    .line 21
    .line 22
    new-instance v0, Ll/dzi;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/dzi;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    const-string p1, "from_activities_moment"

    .line 35
    .line 36
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    if-eqz p4, :cond_0

    .line 43
    .line 44
    instance-of p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 45
    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    return-void

    .line 50
    :cond_1
    :goto_0
    const/4 p1, -0x1

    .line 51
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setResult(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finishWithoutCustomAnimation()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    move-object v0, p0

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 3
    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 7
    .line 8
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 9
    .line 10
    if-lez v1, :cond_1

    .line 11
    .line 12
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 13
    .line 14
    if-gtz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {}, Ll/snh;->k()Ll/snh;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {v0, p1, p0, v1}, Ll/snh;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Z)V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic t(Ll/x20;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/android/app/Act;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 7

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, "\u97f3\u9891\u6682\u4e0d\u652f\u6301\u5206\u4eab"

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const-string p2, ""

    .line 22
    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    iget-object p0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    move-object v4, p0

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    move-object v4, p2

    .line 30
    :goto_0
    iget-object p0, p3, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    :goto_1
    move-object v6, p2

    .line 39
    goto :goto_2

    .line 40
    :cond_2
    iget-object p2, p3, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :goto_2
    const/4 v2, 0x0

    .line 44
    move-object v1, p1

    .line 45
    move-object v5, p4

    .line 46
    invoke-interface/range {v0 .. v6}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->yf(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ll/wf70;->l0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic y(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 7

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, "\u97f3\u9891\u6682\u4e0d\u652f\u6301\u5206\u4eab"

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const-string p2, ""

    .line 22
    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    iget-object p0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    move-object v4, p0

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    move-object v4, p2

    .line 30
    :goto_0
    iget-object p0, p3, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    :goto_1
    move-object v6, p2

    .line 39
    goto :goto_2

    .line 40
    :cond_2
    iget-object p2, p3, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :goto_2
    const/4 v2, 0x1

    .line 44
    move-object v1, p1

    .line 45
    move-object v5, p4

    .line 46
    invoke-interface/range {v0 .. v6}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->yf(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic z()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/wf70;->l0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
