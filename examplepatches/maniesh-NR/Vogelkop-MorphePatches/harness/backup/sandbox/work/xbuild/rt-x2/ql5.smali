.class public final Lql5;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Lqrl;

.field public final e:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Lqrl;)V
    .registers 8

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lnz0;-><init>(ZZ)V

    iput-object p1, p0, Lql5;->a:Ljava/lang/String;

    iput-object p2, p0, Lql5;->b:Ljava/lang/String;

    iput-object p3, p0, Lql5;->c:Ljava/lang/String;

    iput-object p4, p0, Lql5;->e:Lcom/opera/android/settings/SettingsManager;

    iput-object p5, p0, Lql5;->d:Lqrl;

    return-void
.end method


# virtual methods
.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f140812

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 6

    iget-object v0, p0, Lql5;->a:Ljava/lang/String;

    invoke-virtual {p1, v0}, Laz0;->setTitle(Ljava/lang/CharSequence;)Laz0;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lql5;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lql5;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Laz0;->a:Lwy0;

    iput-object v1, v2, Lwy0;->f:Ljava/lang/CharSequence;

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lql5;->e:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "show_conflicting_settings_warning"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    new-instance v2, Ljl4;

    const/16 v3, 0x11

    invoke-direct {v2, p0, v3}, Ljl4;-><init>(Ljava/lang/Object;B)V

    const p0, 0x7f1407ff

    invoke-static {p1, p0, v1, v2}, Lphj;->I(Landroid/content/Context;IZLav4;)Landroid/widget/FrameLayout;

    move-result-object p0

    invoke-virtual {v0, p0}, Laz0;->setView(Landroid/view/View;)Laz0;

    return-void
.end method

.method public final onFinished(Lhjm;)V
    .registers 2

    iget-object p0, p0, Lql5;->d:Lqrl;

    invoke-virtual {p0}, Lqrl;->run()V

    return-void
.end method
