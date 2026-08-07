.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/aiv$a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->d(Ll/xup;Ll/mvp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseTask;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/xup;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;Ll/xup;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem$a;->b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem$a;->a:Ll/xup;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic d(Ll/xup;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xup;->f4()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, v0, v1}, Ll/xup;->m4(Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem$a;->b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->c(Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;)Landroid/widget/TextView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Eg:I

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem$a;->b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->c(Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;)Landroid/widget/TextView;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setSelected(Z)V

    .line 20
    .line 21
    .line 22
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Lg:I

    .line 23
    .line 24
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem$a;->b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;->c(Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem;)Landroid/widget/TextView;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem$a;->a:Ll/xup;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem$a;->a:Ll/xup;

    .line 44
    .line 45
    new-instance v0, Ll/pvp;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Ll/pvp;-><init>(Ll/xup;)V

    .line 48
    .line 49
    .line 50
    const-wide/16 v1, 0x7d0

    .line 51
    .line 52
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
