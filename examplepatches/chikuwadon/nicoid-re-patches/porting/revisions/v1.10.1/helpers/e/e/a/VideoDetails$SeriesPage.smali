.class final Le/e/a/VideoDetails$SeriesPage;
.super Ljava/lang/Object;
.source "VideoDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/VideoDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SeriesPage"
.end annotation


# instance fields
.field active:Le/e/a/NetworkTask;

.field final box:Landroid/widget/LinearLayout;

.field busy:Z

.field final collapse:Landroid/widget/Button;

.field collapsed:Z

.field final continuous:Landroid/widget/CheckBox;

.field final id:Ljava/lang/String;

.field loaded:I

.field final more:Landroid/widget/Button;

.field page:I

.field final random:Landroid/widget/CheckBox;

.field final rows:Landroid/widget/LinearLayout;

.field total:I


# direct methods
.method constructor <init>(Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .registers 9

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const/4 v0, 0x1

    iput v0, p0, Le/e/a/VideoDetails$SeriesPage;->page:I

    const v1, 0x7fffffff

    iput v1, p0, Le/e/a/VideoDetails$SeriesPage;->total:I

    .line 63
    iput-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->box:Landroid/widget/LinearLayout;

    iput-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->id:Ljava/lang/String;

    new-instance p2, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p2, v1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->continuous:Landroid/widget/CheckBox;

    iget-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->continuous:Landroid/widget/CheckBox;

    const-string v1, "Continuous playback"

    const-string v2, "\u9023\u7e8c\u64ad\u653e"

    const-string v3, "\u9023\u7d9a\u518d\u751f"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v3, v1, v2}, Le/e/a/VideoDetails;->access$1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->continuous:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {p2, v1}, Landroid/widget/CheckBox;->setTextColor(I)V

    iget-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->continuous:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    new-instance p2, Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p2, v1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->random:Landroid/widget/CheckBox;

    iget-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->random:Landroid/widget/CheckBox;

    const-string v1, "Shuffle playback"

    const-string v2, "\u96a8\u6a5f\u64ad\u653e"

    const-string v3, "\u30b7\u30e3\u30c3\u30d5\u30eb\u518d\u751f"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v3, v1, v2}, Le/e/a/VideoDetails;->access$1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->random:Landroid/widget/CheckBox;

    invoke-static {p2}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    iget-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->continuous:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Le/e/a/VideoDetails$SeriesPage;->id:Ljava/lang/String;

    invoke-static {v1, v2}, Le/e/a/SeriesPlayback;->enabled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_83

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Le/e/a/VideoDetails$SeriesPage;->id:Ljava/lang/String;

    invoke-static {v1, v3}, Le/e/a/SeriesPlayback;->shuffled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_83

    const/4 v1, 0x1

    goto :goto_84

    :cond_83
    const/4 v1, 0x0

    :goto_84
    invoke-virtual {p2, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    iget-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->random:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Le/e/a/VideoDetails$SeriesPage;->id:Ljava/lang/String;

    invoke-static {v1, v3}, Le/e/a/SeriesPlayback;->shuffled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {p2, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    new-instance p2, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p2, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Le/e/a/VideoDetails$SeriesPage;->continuous:Landroid/widget/CheckBox;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v3, v2, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p2, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Le/e/a/VideoDetails$SeriesPage;->random:Landroid/widget/CheckBox;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v2, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p2, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Le/e/a/VideoDetails$SeriesPage;->box:Landroid/widget/LinearLayout;

    invoke-virtual {v1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-array p2, v0, [Z

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->continuous:Landroid/widget/CheckBox;

    new-instance v1, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p2, p1}, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda4;-><init>(Le/e/a/VideoDetails$SeriesPage;[ZLandroid/widget/LinearLayout;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->random:Landroid/widget/CheckBox;

    new-instance v1, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p2, p1}, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda5;-><init>(Le/e/a/VideoDetails$SeriesPage;[ZLandroid/widget/LinearLayout;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->id:Ljava/lang/String;

    invoke-static {p2, v0}, Le/e/a/SeriesPlayback;->ensure(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object p2

    iput-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->rows:Landroid/widget/LinearLayout;

    iget-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->box:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    const-string v0, "View more"

    const-string v1, "\u67e5\u770b\u66f4\u591a"

    const-string v2, "\u3082\u3063\u3068\u898b\u308b"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v0, v1}, Le/e/a/VideoDetails;->access$1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    # invokes: Le/e/a/VideoDetails;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    invoke-static {p2, v0}, Le/e/a/VideoDetails;->access$3(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p2

    iput-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    iget-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->box:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "Show less"

    const-string v0, "\u6536\u5408"

    const-string v1, "\u6298\u308a\u305f\u305f\u3080"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, p2, v0}, Le/e/a/VideoDetails;->access$1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    # invokes: Le/e/a/VideoDetails;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    invoke-static {p1, p2}, Le/e/a/VideoDetails;->access$3(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p1

    iput-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->collapse:Landroid/widget/Button;

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->collapse:Landroid/widget/Button;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->box:Landroid/widget/LinearLayout;

    iget-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->collapse:Landroid/widget/Button;

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    new-instance p2, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda6;

    invoke-direct {p2, p0}, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda6;-><init>(Le/e/a/VideoDetails$SeriesPage;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->collapse:Landroid/widget/Button;

    new-instance p2, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda7;

    invoke-direct {p2, p0}, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda7;-><init>(Le/e/a/VideoDetails$SeriesPage;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->box:Landroid/widget/LinearLayout;

    new-instance p2, Le/e/a/VideoDetails$SeriesPage$1;

    invoke-direct {p2, p0}, Le/e/a/VideoDetails$SeriesPage$1;-><init>(Le/e/a/VideoDetails$SeriesPage;)V

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method


# virtual methods
.method buttons()V
    .registers 7

    .line 64
    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/VideoDetails$SeriesPage;->collapsed:Z

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-nez v1, :cond_13

    iget v1, p0, Le/e/a/VideoDetails$SeriesPage;->loaded:I

    iget v4, p0, Le/e/a/VideoDetails$SeriesPage;->total:I

    if-ge v1, v4, :cond_10

    goto :goto_13

    :cond_10
    const/16 v1, 0x8

    goto :goto_14

    :cond_13
    :goto_13
    const/4 v1, 0x0

    :goto_14
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/VideoDetails$SeriesPage;->busy:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    const-string v1, "View more"

    const-string v4, "\u67e5\u770b\u66f4\u591a"

    const-string v5, "\u3082\u3063\u3068\u898b\u308b"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v5, v1, v4}, Le/e/a/VideoDetails;->access$1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->collapse:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/VideoDetails$SeriesPage;->collapsed:Z

    if-nez v1, :cond_3e

    iget-object v1, p0, Le/e/a/VideoDetails$SeriesPage;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lez v1, :cond_3e

    const/4 v2, 0x0

    :cond_3e
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->collapse:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/VideoDetails$SeriesPage;->busy:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method

.method synthetic lambda$0$e-e-a-VideoDetails$SeriesPage([ZLandroid/widget/LinearLayout;Landroid/widget/CompoundButton;Z)V
    .registers 8

    .line 63
    const/4 p3, 0x0

    aget-boolean v0, p1, p3

    if-eqz v0, :cond_6

    return-void

    :cond_6
    const/4 v0, 0x1

    aput-boolean v0, p1, p3

    if-eqz p4, :cond_10

    iget-object v1, p0, Le/e/a/VideoDetails$SeriesPage;->random:Landroid/widget/CheckBox;

    invoke-virtual {v1, p3}, Landroid/widget/CheckBox;->setChecked(Z)V

    :cond_10
    aput-boolean p3, p1, p3

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "series_shuffle_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Le/e/a/VideoDetails$SeriesPage;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Le/e/a/VideoDetails$SeriesPage;->random:Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->id:Ljava/lang/String;

    if-nez p4, :cond_4d

    iget-object p4, p0, Le/e/a/VideoDetails$SeriesPage;->random:Landroid/widget/CheckBox;

    invoke-virtual {p4}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p4

    if-nez p4, :cond_4d

    goto :goto_4e

    :cond_4d
    const/4 p3, 0x1

    :goto_4e
    invoke-static {p1, p2, p3}, Le/e/a/SeriesPlayback;->toggle(Landroid/content/Context;Ljava/lang/String;Z)V

    return-void
.end method

.method synthetic lambda$1$e-e-a-VideoDetails$SeriesPage([ZLandroid/widget/LinearLayout;Landroid/widget/CompoundButton;Z)V
    .registers 8

    .line 63
    const/4 p3, 0x0

    aget-boolean v0, p1, p3

    if-eqz v0, :cond_6

    return-void

    :cond_6
    const/4 v0, 0x1

    aput-boolean v0, p1, p3

    if-eqz p4, :cond_10

    iget-object v1, p0, Le/e/a/VideoDetails$SeriesPage;->continuous:Landroid/widget/CheckBox;

    invoke-virtual {v1, p3}, Landroid/widget/CheckBox;->setChecked(Z)V

    :cond_10
    aput-boolean p3, p1, p3

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "series_shuffle_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Le/e/a/VideoDetails$SeriesPage;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1, p4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Le/e/a/VideoDetails$SeriesPage;->id:Ljava/lang/String;

    if-nez p4, :cond_47

    iget-object p4, p0, Le/e/a/VideoDetails$SeriesPage;->continuous:Landroid/widget/CheckBox;

    invoke-virtual {p4}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p4

    if-nez p4, :cond_47

    goto :goto_48

    :cond_47
    const/4 p3, 0x1

    :goto_48
    invoke-static {p1, p2, p3}, Le/e/a/SeriesPlayback;->toggle(Landroid/content/Context;Ljava/lang/String;Z)V

    return-void
.end method

.method synthetic lambda$2$e-e-a-VideoDetails$SeriesPage(Landroid/view/View;)V
    .registers 3

    .line 63
    iget-boolean p1, p0, Le/e/a/VideoDetails$SeriesPage;->collapsed:Z

    if-eqz p1, :cond_10

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/VideoDetails$SeriesPage;->collapsed:Z

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    invoke-virtual {p0}, Le/e/a/VideoDetails$SeriesPage;->buttons()V

    goto :goto_13

    :cond_10
    invoke-virtual {p0}, Le/e/a/VideoDetails$SeriesPage;->load()V

    :goto_13
    return-void
.end method

.method synthetic lambda$3$e-e-a-VideoDetails$SeriesPage(Landroid/view/View;)V
    .registers 3

    .line 63
    const/4 p1, 0x1

    iput-boolean p1, p0, Le/e/a/VideoDetails$SeriesPage;->collapsed:Z

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->rows:Landroid/widget/LinearLayout;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    invoke-virtual {p0}, Le/e/a/VideoDetails$SeriesPage;->buttons()V

    return-void
.end method

.method synthetic lambda$4$e-e-a-VideoDetails$SeriesPage(Le/e/a/NetworkTask;)V
    .registers 6

    .line 65
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://nvapi.nicovideo.jp/v1/playlist/series/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Le/e/a/VideoDetails$SeriesPage;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "?page="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Le/e/a/VideoDetails$SeriesPage;->page:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&pageSize=20"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "GET"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2, p1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "data"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_4b

    const-string v1, "items"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    const-string v2, "totalCount"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    # getter for: Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/VideoDetails;->access$5()Landroid/os/Handler;

    move-result-object v2

    new-instance v3, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda2;

    invoke-direct {v3, p0, p1, v0, v1}, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda2;-><init>(Le/e/a/VideoDetails$SeriesPage;Le/e/a/NetworkTask;ILorg/json/JSONArray;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_5e

    :cond_4b
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_51} :catch_51

    :catch_51
    move-exception v0

    # getter for: Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/VideoDetails;->access$5()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda3;-><init>(Le/e/a/VideoDetails$SeriesPage;Le/e/a/NetworkTask;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_5e
    return-void
.end method

.method synthetic lambda$5$e-e-a-VideoDetails$SeriesPage(Le/e/a/NetworkTask;ILorg/json/JSONArray;)V
    .registers 8

    .line 65
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p1

    if-eqz p1, :cond_7

    return-void

    :cond_7
    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/VideoDetails$SeriesPage;->busy:Z

    iput p2, p0, Le/e/a/VideoDetails$SeriesPage;->total:I

    if-nez p3, :cond_10

    const/4 p2, 0x0

    goto :goto_14

    :cond_10
    invoke-virtual {p3}, Lorg/json/JSONArray;->length()I

    move-result p2

    :goto_14
    if-lt p1, p2, :cond_2b

    iget p1, p0, Le/e/a/VideoDetails$SeriesPage;->loaded:I

    add-int/2addr p1, p2

    iput p1, p0, Le/e/a/VideoDetails$SeriesPage;->loaded:I

    iget p1, p0, Le/e/a/VideoDetails$SeriesPage;->page:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Le/e/a/VideoDetails$SeriesPage;->page:I

    if-nez p2, :cond_27

    iget p1, p0, Le/e/a/VideoDetails$SeriesPage;->loaded:I

    iput p1, p0, Le/e/a/VideoDetails$SeriesPage;->total:I

    :cond_27
    invoke-virtual {p0}, Le/e/a/VideoDetails$SeriesPage;->buttons()V

    return-void

    :cond_2b
    invoke-virtual {p3, p1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CreatorData;->video(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_41

    iget-object v1, p0, Le/e/a/VideoDetails$SeriesPage;->rows:Landroid/widget/LinearLayout;

    new-instance v2, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, v0}, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda1;-><init>(Le/e/a/VideoDetails$SeriesPage;Lorg/json/JSONObject;)V

    const-string v3, ""

    invoke-static {v1, v0, v3, v2}, Le/e/a/VideoDetails;->videoRow(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Runnable;)V

    :cond_41
    add-int/lit8 p1, p1, 0x1

    goto :goto_14
.end method

.method synthetic lambda$6$e-e-a-VideoDetails$SeriesPage(Lorg/json/JSONObject;)V
    .registers 5

    .line 65
    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->box:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Le/e/a/VideoDetails$SeriesPage;->id:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/VideoDetails$SeriesPage;->continuous:Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    if-nez v2, :cond_1a

    iget-object v2, p0, Le/e/a/VideoDetails$SeriesPage;->random:Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    if-nez v2, :cond_1a

    const/4 v2, 0x0

    goto :goto_1b

    :cond_1a
    const/4 v2, 0x1

    :goto_1b
    invoke-static {v0, v1, p1, v2}, Le/e/a/SeriesPlayback;->open(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;Z)V

    return-void
.end method

.method synthetic lambda$7$e-e-a-VideoDetails$SeriesPage(Le/e/a/NetworkTask;)V
    .registers 5

    .line 65
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p1

    if-eqz p1, :cond_7

    return-void

    :cond_7
    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/VideoDetails$SeriesPage;->busy:Z

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->collapse:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p1, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    const-string v0, "Retry"

    const-string v1, "\u91cd\u8a66"

    const-string v2, "\u518d\u8a66\u884c"

    # invokes: Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v0, v1}, Le/e/a/VideoDetails;->access$1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method load()V
    .registers 4

    .line 65
    iget-boolean v0, p0, Le/e/a/VideoDetails$SeriesPage;->busy:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/VideoDetails$SeriesPage;->busy:Z

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->more:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->collapse:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    iput-object v0, p0, Le/e/a/VideoDetails$SeriesPage;->active:Le/e/a/NetworkTask;

    # getter for: Le/e/a/VideoDetails;->WORK:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Le/e/a/VideoDetails;->access$4()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v0}, Le/e/a/VideoDetails$SeriesPage$$ExternalSyntheticLambda0;-><init>(Le/e/a/VideoDetails$SeriesPage;Le/e/a/NetworkTask;)V

    invoke-virtual {v0, v1, v2}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    return-void
.end method
