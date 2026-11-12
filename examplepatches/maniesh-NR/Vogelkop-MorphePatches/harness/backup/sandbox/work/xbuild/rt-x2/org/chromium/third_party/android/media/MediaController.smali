.class public Lorg/chromium/third_party/android/media/MediaController;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final synthetic o:I


# instance fields
.field public a:Lwth;

.field public final b:Landroid/content/Context;

.field public final c:Landroid/view/ViewGroup;

.field public final d:Landroid/widget/SeekBar;

.field public final e:Landroid/widget/TextView;

.field public final f:Landroid/widget/TextView;

.field public g:Z

.field public final h:Ljava/lang/StringBuilder;

.field public final i:Ljava/util/Formatter;

.field public final j:Landroid/widget/ImageButton;

.field public final k:Landroid/widget/ImageButton;

.field public final l:Landroid/widget/ImageButton;

.field public final m:Landroid/widget/ImageButton;

.field public final n:Landroid/widget/ImageButton;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 9

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p2, Ldhd;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Ldhd;-><init>(Lorg/chromium/third_party/android/media/MediaController;B)V

    new-instance v1, Lehd;

    invoke-direct {v1, p0, v0}, Lehd;-><init>(Landroid/view/KeyEvent$Callback;B)V

    new-instance v2, Ldhd;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Ldhd;-><init>(Lorg/chromium/third_party/android/media/MediaController;B)V

    new-instance v4, Ldhd;

    const/4 v5, 0x2

    invoke-direct {v4, p0, v5}, Ldhd;-><init>(Lorg/chromium/third_party/android/media/MediaController;B)V

    iput-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->b:Landroid/content/Context;

    const-string v5, "layout_inflater"

    invoke-virtual {p1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/LayoutInflater;

    const v5, 0x7f0d0280

    invoke-virtual {p1, v5, p0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    const p1, 0x7f0a081c

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    iput-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->j:Landroid/widget/ImageButton;

    if-eqz p1, :cond_3f

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    iget-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->j:Landroid/widget/ImageButton;

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_3f
    const p1, 0x7f0a0484

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    iput-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->k:Landroid/widget/ImageButton;

    if-eqz p1, :cond_54

    invoke-virtual {p1, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->k:Landroid/widget/ImageButton;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_54
    const p1, 0x7f0a08f5

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    iput-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->l:Landroid/widget/ImageButton;

    if-eqz p1, :cond_69

    invoke-virtual {p1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->l:Landroid/widget/ImageButton;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_69
    const p1, 0x7f0a0768

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    iput-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->m:Landroid/widget/ImageButton;

    const/16 p2, 0x8

    if-eqz p1, :cond_7b

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    :cond_7b
    const p1, 0x7f0a085c

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    iput-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->n:Landroid/widget/ImageButton;

    if-eqz p1, :cond_8b

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    :cond_8b
    const p1, 0x7f0a0681

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->c:Landroid/view/ViewGroup;

    if-eqz p1, :cond_af

    const p2, 0x7f0a0680

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/SeekBar;

    iput-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->d:Landroid/widget/SeekBar;

    if-eqz p1, :cond_af

    invoke-virtual {p1, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iget-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->d:Landroid/widget/SeekBar;

    const/16 p2, 0x3e8

    invoke-virtual {p1, p2}, Landroid/widget/ProgressBar;->setMax(I)V

    :cond_af
    const p1, 0x7f0a0b93

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->e:Landroid/widget/TextView;

    const p1, 0x7f0a0b94

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->f:Landroid/widget/TextView;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iput-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->h:Ljava/lang/StringBuilder;

    new-instance p1, Ljava/util/Formatter;

    iget-object p2, p0, Lorg/chromium/third_party/android/media/MediaController;->h:Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-direct {p1, p2, v1}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;Ljava/util/Locale;)V

    iput-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->i:Ljava/util/Formatter;

    iget-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->m:Landroid/widget/ImageButton;

    const/4 p2, 0x0

    if-eqz p1, :cond_e6

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->m:Landroid/widget/ImageButton;

    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    :cond_e6
    iget-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->n:Landroid/widget/ImageButton;

    if-eqz p1, :cond_f2

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lorg/chromium/third_party/android/media/MediaController;->n:Landroid/widget/ImageButton;

    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    :cond_f2
    return-void
.end method


# virtual methods
.method public final a(I)Ljava/lang/String;
    .registers 6

    div-int/lit16 p1, p1, 0x3e8

    rem-int/lit8 v0, p1, 0x3c

    div-int/lit8 v1, p1, 0x3c

    rem-int/lit8 v1, v1, 0x3c

    div-int/lit16 p1, p1, 0xe10

    iget-object v2, p0, Lorg/chromium/third_party/android/media/MediaController;->h:Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    iget-object p0, p0, Lorg/chromium/third_party/android/media/MediaController;->i:Ljava/util/Formatter;

    if-lez p1, :cond_2f

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {p1, v1, v0}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "%d:%02d:%02d"

    invoke-virtual {p0, v0, p1}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2f
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {p1, v0}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "%02d:%02d"

    invoke-virtual {p0, v0, p1}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final b()V
    .registers 12

    iget-object v0, p0, Lorg/chromium/third_party/android/media/MediaController;->a:Lwth;

    if-eqz v0, :cond_60

    iget-object v0, v0, Lwth;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;

    iget-object v1, v0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    invoke-virtual {v1}, Lc93;->g()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-virtual {v0}, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->s()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_1d

    const-wide/16 v0, 0x4a

    goto :goto_1f

    :cond_1d
    const-wide/16 v0, 0x4c

    :goto_1f
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v2

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/chromium/third_party/android/media/MediaController;->j:Landroid/widget/ImageButton;

    if-eqz v4, :cond_44

    const-wide/16 v5, 0x4

    and-long/2addr v5, v0

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    const/4 v6, 0x1

    if-nez v5, :cond_3b

    const-wide/16 v9, 0x2

    and-long/2addr v0, v9

    cmp-long v0, v0, v7

    if-nez v0, :cond_3b

    move v0, v3

    goto :goto_3c

    :cond_3b
    move v0, v6

    :goto_3c
    if-eqz v2, :cond_40

    if-nez v0, :cond_41

    :cond_40
    move v6, v3

    :cond_41
    invoke-virtual {v4, v6}, Landroid/view/View;->setEnabled(Z)V

    :cond_44
    iget-object v0, p0, Lorg/chromium/third_party/android/media/MediaController;->l:Landroid/widget/ImageButton;

    if-eqz v0, :cond_4b

    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    :cond_4b
    iget-object v0, p0, Lorg/chromium/third_party/android/media/MediaController;->k:Landroid/widget/ImageButton;

    if-eqz v0, :cond_52

    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    :cond_52
    iget-object v0, p0, Lorg/chromium/third_party/android/media/MediaController;->n:Landroid/widget/ImageButton;

    if-eqz v0, :cond_59

    invoke-virtual {v0, v3}, Landroid/view/View;->setEnabled(Z)V

    :cond_59
    iget-object p0, p0, Lorg/chromium/third_party/android/media/MediaController;->m:Landroid/widget/ImageButton;

    if-eqz p0, :cond_60

    invoke-virtual {p0, v3}, Landroid/view/View;->setEnabled(Z)V

    :cond_60
    return-void
.end method

.method public final c()V
    .registers 3

    iget-object v0, p0, Lorg/chromium/third_party/android/media/MediaController;->a:Lwth;

    if-eqz v0, :cond_2d

    iget-object p0, p0, Lorg/chromium/third_party/android/media/MediaController;->j:Landroid/widget/ImageButton;

    if-eqz p0, :cond_2d

    iget-object v0, v0, Lwth;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;

    iget-object v1, v0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    invoke-virtual {v1}, Lc93;->g()Z

    move-result v1

    if-nez v1, :cond_16

    const/4 v0, 0x0

    goto :goto_1e

    :cond_16
    invoke-virtual {v0}, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->s()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->isPlaying()Z

    move-result v0

    :goto_1e
    if-eqz v0, :cond_27

    const v0, 0x1080023

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void

    :cond_27
    const v0, 0x1080024

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_2d
    return-void
.end method

.method public final d()V
    .registers 8

    iget-object v0, p0, Lorg/chromium/third_party/android/media/MediaController;->a:Lwth;

    if-eqz v0, :cond_60

    iget-boolean v1, p0, Lorg/chromium/third_party/android/media/MediaController;->g:Z

    if-nez v1, :cond_60

    invoke-virtual {v0}, Lwth;->H()J

    move-result-wide v0

    iget-object v2, p0, Lorg/chromium/third_party/android/media/MediaController;->a:Lwth;

    iget-object v2, v2, Lwth;->b:Ljava/lang/Object;

    check-cast v2, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;

    iget-object v3, v2, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    invoke-virtual {v3}, Lc93;->g()Z

    move-result v3

    const-wide/16 v4, 0x0

    if-nez v3, :cond_1e

    move-wide v2, v4

    goto :goto_26

    :cond_1e
    iget-object v2, v2, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    iget-object v2, v2, Lbuh;->f:Lm89;

    iget-object v2, v2, Lm89;->a:Lcgk;

    iget-wide v2, v2, Lcgk;->a:J

    :goto_26
    cmp-long v4, v2, v4

    iget-object v5, p0, Lorg/chromium/third_party/android/media/MediaController;->c:Landroid/view/ViewGroup;

    if-gtz v4, :cond_33

    if-eqz v5, :cond_48

    const/4 v4, 0x4

    invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_48

    :cond_33
    iget-object v4, p0, Lorg/chromium/third_party/android/media/MediaController;->d:Landroid/widget/SeekBar;

    if-eqz v4, :cond_48

    if-eqz v5, :cond_3d

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    :cond_3d
    const-wide/16 v5, 0x3e8

    mul-long/2addr v5, v0

    div-long/2addr v5, v2

    long-to-int v5, v5

    invoke-virtual {v4, v5}, Landroid/widget/ProgressBar;->setProgress(I)V

    invoke-virtual {v4, v5}, Landroid/widget/ProgressBar;->setSecondaryProgress(I)V

    :cond_48
    :goto_48
    iget-object v4, p0, Lorg/chromium/third_party/android/media/MediaController;->e:Landroid/widget/TextView;

    if-eqz v4, :cond_54

    long-to-int v2, v2

    invoke-virtual {p0, v2}, Lorg/chromium/third_party/android/media/MediaController;->a(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_54
    iget-object v2, p0, Lorg/chromium/third_party/android/media/MediaController;->f:Landroid/widget/TextView;

    if-eqz v2, :cond_60

    long-to-int v0, v0

    invoke-virtual {p0, v0}, Lorg/chromium/third_party/android/media/MediaController;->a(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_60
    return-void
.end method

.method public final onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    const-class p0, Lorg/chromium/third_party/android/media/MediaController;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityRecord;->setClassName(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    const-class p0, Lorg/chromium/third_party/android/media/MediaController;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final setEnabled(Z)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p0}, Lorg/chromium/third_party/android/media/MediaController;->b()V

    return-void
.end method
