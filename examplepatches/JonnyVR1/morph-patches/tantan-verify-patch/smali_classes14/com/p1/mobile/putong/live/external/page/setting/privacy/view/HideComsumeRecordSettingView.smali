.class public Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideComsumeRecordSettingView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VSwitch;

.field public f:Lv/VText;

.field public g:Ll/r3l;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideComsumeRecordSettingView;Ll/r3l;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideComsumeRecordSettingView;->j0(Ll/r3l;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public getCheckBoxIsOpen()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideComsumeRecordSettingView;->e:Lv/VSwitch;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/m3l;->a(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideComsumeRecordSettingView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic j0(Ll/r3l;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/yw80;->H()Ll/kv80;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p2, p1, p0}, Ll/kv80;->c(Ll/yw80;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public k0(Ll/r3l;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideComsumeRecordSettingView;->g:Ll/r3l;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideComsumeRecordSettingView;->d:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p1, v1}, Ll/r3l;->S(Landroid/content/Context;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideComsumeRecordSettingView;->f:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p1, v1}, Ll/r3l;->R(Landroid/content/Context;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    new-instance v0, Ll/l3l;

    .line 30
    .line 31
    invoke-direct {v0, p0, p1}, Ll/l3l;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideComsumeRecordSettingView;Ll/r3l;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideComsumeRecordSettingView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setCheckBoxIsOpen(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideComsumeRecordSettingView;->e:Lv/VSwitch;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
