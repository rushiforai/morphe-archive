.class public Ll/vo5$b;
.super Ll/opg;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/vo5;->j()Ll/opg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/vo5;


# direct methods
.method public constructor <init>(Ll/vo5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vo5$b;->a:Ll/vo5;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/opg;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public i(Z)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/vo5$b;->a:Ll/vo5;

    .line 2
    .line 3
    iget-object p1, p1, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->g:Lv/VText;

    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->u:I

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/vo5$b;->a:Ll/vo5;

    .line 17
    .line 18
    invoke-static {p1}, Ll/vo5;->g(Ll/vo5;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/vo5$b;->a:Ll/vo5;

    .line 22
    .line 23
    iget-object p0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->f:Lv/VText;

    .line 26
    .line 27
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->D1:I

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public j(F)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/vo5$b;->a:Ll/vo5;

    .line 2
    .line 3
    iget-object p0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->g:Lv/VText;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->u:I

    .line 8
    .line 9
    int-to-float p0, p0

    .line 10
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 11
    .line 12
    div-float/2addr p1, v1

    .line 13
    sub-float/2addr p0, p1

    .line 14
    float-to-int p0, p0

    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onComplete()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vo5$b;->a:Ll/vo5;

    .line 2
    .line 3
    iget-object v0, v0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 4
    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->g:Lv/VText;

    .line 6
    .line 7
    iget v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->u:I

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/vo5$b;->a:Ll/vo5;

    .line 17
    .line 18
    invoke-static {v0}, Ll/vo5;->g(Ll/vo5;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/vo5$b;->a:Ll/vo5;

    .line 22
    .line 23
    iget-object p0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->f:Lv/VText;

    .line 26
    .line 27
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->D1:I

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/opg;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/vo5$b;->a:Ll/vo5;

    .line 5
    .line 6
    invoke-static {v0}, Ll/vo5;->e(Ll/vo5;)Landroid/graphics/drawable/AnimationDrawable;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/vo5$b;->a:Ll/vo5;

    .line 14
    .line 15
    iget-object p0, p0, Ll/oc1;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->f:Lv/VText;

    .line 18
    .line 19
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->A2:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
