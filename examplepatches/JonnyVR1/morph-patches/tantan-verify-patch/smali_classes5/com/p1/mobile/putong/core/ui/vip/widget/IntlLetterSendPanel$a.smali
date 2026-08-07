.class public Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->k()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:J

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$a;->b:Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$a;->a:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x1f4

    .line 9
    .line 10
    cmp-long p1, v0, v2

    .line 11
    .line 12
    if-lez p1, :cond_2

    .line 13
    .line 14
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$a;->a:J

    .line 19
    .line 20
    const/4 p1, 0x4

    .line 21
    if-eq p2, p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x6

    .line 24
    if-eq p2, p1, :cond_0

    .line 25
    .line 26
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    const/16 p1, 0x42

    .line 33
    .line 34
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-ne p1, p2, :cond_1

    .line 39
    .line 40
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_1

    .line 45
    .line 46
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$a;->b:Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;

    .line 47
    .line 48
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->i(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    const/4 p0, 0x1

    .line 52
    return p0

    .line 53
    :cond_2
    const/4 p0, 0x0

    .line 54
    return p0
.end method
