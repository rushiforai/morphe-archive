.class public Ll/z0j;
.super Ll/h11;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/z0j$a;
    }
.end annotation


# static fields
.field public static final d:I


# instance fields
.field public final a:Landroid/view/View;

.field public final b:Landroid/view/View;

.field public final c:Lv/VText;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/kec0;->S6:I

    .line 2
    .line 3
    sput v0, Ll/z0j;->d:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/h11;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->ee:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/z0j;->a:Landroid/view/View;

    .line 11
    .line 12
    sget v0, Ll/adc0;->xb:I

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/z0j;->b:Landroid/view/View;

    .line 19
    .line 20
    sget v0, Ll/adc0;->yb:I

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lv/VText;

    .line 27
    .line 28
    iput-object p1, p0, Ll/z0j;->c:Lv/VText;

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic c(Ll/z0j;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z0j;->d(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p2, p0, Ll/z0j;->a:Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    xor-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Ll/z0j;->b:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    xor-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Ll/z0j;->c:Lv/VText;

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Ll/z0j;->b:Landroid/view/View;

    .line 34
    .line 35
    new-instance v0, Ll/y0j;

    .line 36
    .line 37
    invoke-direct {v0, p0, p1}, Ll/y0j;-><init>(Ll/z0j;Lcom/p1/mobile/putong/data/User;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic d(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object p0, p0, Ll/z0j;->c:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    instance-of p0, v0, Landroid/app/Activity;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    new-instance p0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/zwk;->e()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    const-string p2, "http://m.staging2.p1staff.com"

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const-string p2, "https://m.tantanapp.com"

    .line 32
    .line 33
    :goto_0
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p2, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/dating-report/index.html?speed=true&_bid=1004397&hideNavigationBar=1&hideNotch=1&from=user&receive_report_user_id="

    .line 37
    .line 38
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    const/4 v6, 0x1

    .line 51
    const/4 v7, 0x0

    .line 52
    const-string v1, ""

    .line 53
    .line 54
    const/4 v3, 0x1

    .line 55
    const/4 v4, 0x1

    .line 56
    const/4 v5, 0x1

    .line 57
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->g2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method
