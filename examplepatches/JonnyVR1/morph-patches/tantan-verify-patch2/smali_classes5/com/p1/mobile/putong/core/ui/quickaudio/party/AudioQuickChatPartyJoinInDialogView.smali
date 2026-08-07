.class public Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Landroid/view/View;

.field public f:Landroid/widget/RelativeLayout;

.field public g:Lv/VText;

.field public h:Landroid/widget/RelativeLayout;

.field public i:Lv/VText;

.field public j:Landroid/widget/RelativeLayout;

.field public k:Lv/VText;

.field public l:Landroid/widget/RelativeLayout;

.field public m:Lv/VText;

.field public n:J

.field public o:Lcom/p1/mobile/android/app/Act;

.field public p:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->n:J

    .line 7
    .line 8
    new-instance p1, Ll/gc1;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Ll/gc1;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->p:Ljava/lang/Runnable;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 16
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-wide/16 p1, 0x0

    .line 17
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->n:J

    .line 18
    new-instance p1, Ll/gc1;

    invoke-direct {p1, p0}, Ll/gc1;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->p:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const-wide/16 p1, 0x0

    .line 20
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->n:J

    .line 21
    new-instance p1, Ll/gc1;

    invoke-direct {p1, p0}, Ll/gc1;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->p:Ljava/lang/Runnable;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->f()V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hc1;->a(Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c(Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;)V
    .locals 4

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x7

    .line 13
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    add-int/lit8 v2, v2, -0x1

    .line 18
    .line 19
    if-nez v2, :cond_0

    .line 20
    .line 21
    move v2, v1

    .line 22
    :cond_0
    iget v3, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->weekDay:I

    .line 23
    .line 24
    if-nez v3, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    move v1, v3

    .line 28
    :goto_0
    sub-int/2addr v1, v2

    .line 29
    if-gez v1, :cond_2

    .line 30
    .line 31
    add-int/lit8 v1, v1, 0x7

    .line 32
    .line 33
    :cond_2
    iget v2, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->beginHour:I

    .line 34
    .line 35
    const/16 v3, 0x18

    .line 36
    .line 37
    if-ne v2, v3, :cond_3

    .line 38
    .line 39
    add-int/lit8 v1, v1, 0x1

    .line 40
    .line 41
    :cond_3
    const/4 v2, 0x5

    .line 42
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->add(II)V

    .line 43
    .line 44
    .line 45
    iget p1, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->beginHour:I

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    if-ne p1, v3, :cond_4

    .line 49
    .line 50
    move p1, v1

    .line 51
    :cond_4
    const/16 v2, 0xb

    .line 52
    .line 53
    invoke-virtual {v0, v2, p1}, Ljava/util/Calendar;->set(II)V

    .line 54
    .line 55
    .line 56
    const/16 p1, 0xc

    .line 57
    .line 58
    invoke-virtual {v0, p1, v1}, Ljava/util/Calendar;->set(II)V

    .line 59
    .line 60
    .line 61
    const/16 p1, 0xd

    .line 62
    .line 63
    invoke-virtual {v0, p1, v1}, Ljava/util/Calendar;->set(II)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 67
    .line 68
    .line 69
    move-result-wide v0

    .line 70
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->n:J

    .line 71
    .line 72
    return-void
.end method

.method public final d(Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->weekDay:I

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->e(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    iget p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->beginHour:I

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    const/16 v2, 0x9

    .line 19
    .line 20
    if-le p0, v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->beginHour:I

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    :goto_0
    const-string p0, ":00-"

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->endHour:I

    .line 40
    .line 41
    if-le p0, v2, :cond_1

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->endHour:I

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    :goto_1
    const-string p0, ":00\uff0c\u6765\u63a2\u63a2\u4e00\u8d77\u72c2\u6b22"

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0
.end method

.method public final e(I)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u661f\u671f\u65e5"

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const-string p0, "\u672c\u5468"

    .line 7
    .line 8
    :pswitch_0
    return-object p0

    .line 9
    :pswitch_1
    const-string p0, "\u661f\u671f\u516d"

    .line 10
    .line 11
    return-object p0

    .line 12
    :pswitch_2
    const-string p0, "\u661f\u671f\u4e94"

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_3
    const-string p0, "\u661f\u671f\u56db"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_4
    const-string p0, "\u661f\u671f\u4e09"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_5
    const-string p0, "\u661f\u671f\u4e8c"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_6
    const-string p0, "\u661f\u671f\u4e00"

    .line 25
    .line 26
    :pswitch_7
    return-object p0

    .line 27
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final synthetic f()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/16 p0, 0x9

    .line 2
    .line 3
    if-le p1, p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v0, "0"

    .line 21
    .line 22
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->o:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->isValueAvailable()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->c(Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->d:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->d(Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->i()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->d:Lv/VText;

    .line 29
    .line 30
    const-string p2, "\u6765\u63a2\u63a2\u4e00\u8d77\u72c2\u6b22"

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->g:Lv/VText;

    .line 36
    .line 37
    const-string p2, "00"

    .line 38
    .line 39
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->i:Lv/VText;

    .line 43
    .line 44
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->k:Lv/VText;

    .line 48
    .line 49
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->m:Lv/VText;

    .line 53
    .line 54
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final i()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->o:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->j()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->p:Ljava/lang/Runnable;

    .line 11
    .line 12
    invoke-static {v1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->o:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->p:Ljava/lang/Runnable;

    .line 20
    .line 21
    const-wide/16 v1, 0x3e8

    .line 22
    .line 23
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method public j()Z
    .locals 9

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->n:J

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v2, v0, v2

    .line 11
    .line 12
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->g:Lv/VText;

    .line 13
    .line 14
    if-gtz v2, :cond_0

    .line 15
    .line 16
    const-string v0, "00"

    .line 17
    .line 18
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->i:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->k:Lv/VText;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->m:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    return p0

    .line 38
    :cond_0
    const-wide/32 v4, 0x5265c00

    .line 39
    .line 40
    .line 41
    div-long v6, v0, v4

    .line 42
    .line 43
    long-to-int v2, v6

    .line 44
    rem-long/2addr v0, v4

    .line 45
    const-wide/32 v4, 0x36ee80

    .line 46
    .line 47
    .line 48
    div-long v6, v0, v4

    .line 49
    .line 50
    long-to-int v6, v6

    .line 51
    rem-long/2addr v0, v4

    .line 52
    const-wide/32 v4, 0xea60

    .line 53
    .line 54
    .line 55
    div-long v7, v0, v4

    .line 56
    .line 57
    long-to-int v7, v7

    .line 58
    rem-long/2addr v0, v4

    .line 59
    const-wide/16 v4, 0x3e8

    .line 60
    .line 61
    div-long/2addr v0, v4

    .line 62
    long-to-int v0, v0

    .line 63
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->g(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->i:Lv/VText;

    .line 71
    .line 72
    invoke-virtual {p0, v6}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->g(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->k:Lv/VText;

    .line 80
    .line 81
    invoke-virtual {p0, v7}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->g(I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->m:Lv/VText;

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->g(I)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    const/4 p0, 0x1

    .line 98
    return p0
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->p:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->c:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->b:Lv/VDraweeView;

    .line 20
    .line 21
    const/high16 v1, 0x432f0000    # 175.0f

    .line 22
    .line 23
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const-string v3, "https://static.tancdn.com/pe-webplatform/wH-BsXNh8BlNE72fbttvnoh-.webp"

    .line 32
    .line 33
    invoke-virtual {v0, p0, v3, v2, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 34
    .line 35
    .line 36
    return-void
.end method
