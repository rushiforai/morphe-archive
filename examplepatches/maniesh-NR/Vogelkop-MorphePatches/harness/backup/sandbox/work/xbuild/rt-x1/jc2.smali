.class public final synthetic Ljc2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkc2;


# direct methods
.method public synthetic constructor <init>(Lkc2;B)V
    .registers 3

    iput-byte p2, p0, Ljc2;->a:B

    iput-object p1, p0, Ljc2;->b:Lkc2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 11

    iget-byte p1, p0, Ljc2;->a:B

    iget-object v0, p0, Ljc2;->b:Lkc2;

    packed-switch p1, :pswitch_data_a8

    invoke-virtual {v0}, Lkc2;->I0()Lqc2;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_f
    invoke-virtual {v0}, Lkc2;->I0()Lqc2;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_17
    invoke-virtual {v0}, Lkc2;->I0()Lqc2;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_1f
    invoke-virtual {v0}, Lkc2;->I0()Lqc2;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_27
    invoke-virtual {v0}, Lkc2;->I0()Lqc2;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    check-cast p0, Lg8j;

    iget-object p0, p0, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    new-instance p1, Lrxh;

    const v0, 0x7f140fdc

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    const-string v0, "https://help.opera.com/en/browser-ai-faq/"

    invoke-static {p0, v0, p1}, Lcom/opera/android/FullscreenWebActivity;->A0(Landroid/content/Context;Ljava/lang/String;Lpxh;)V

    return-void

    :pswitch_3f
    iget-object v3, p0, Ljc2;->b:Lkc2;

    iget-object p0, v3, Lkc2;->t:Lg0c;

    new-instance v1, Lq2;

    const/4 v7, 0x0

    const/4 v8, 0x7

    const/4 v2, 0x0

    const-class v4, Lkc2;

    const-string v5, "onNavigateToSystemSpeechOutputSettingsError"

    const-string v6, "onNavigateToSystemSpeechOutputSettingsError()V"

    invoke-direct/range {v1 .. v8}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iget-object p0, p0, Lg0c;->a:Lcom/opera/android/BrowserActivity;

    :try_start_53
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v0, "com.android.settings.TTS_SETTINGS"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v0, 0x10000000

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_65
    .catch Landroid/content/ActivityNotFoundException; {:try_start_53 .. :try_end_65} :catch_66

    goto :goto_69

    :catch_66
    invoke-virtual {v1}, Lq2;->invoke()Ljava/lang/Object;

    :goto_69
    return-void

    :pswitch_6a
    iget-object p0, v0, Lkc2;->t:Lg0c;

    const p1, 0x7f0a0ca6

    filled-new-array {p1}, [I

    move-result-object p1

    invoke-virtual {p0, p1}, Lg0c;->a([I)V

    return-void

    :pswitch_77
    invoke-virtual {v0}, Lkc2;->I0()Lqc2;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_7f
    sget p0, Lcom/opera/android/aiassistant/appwidget/AiAssistantAppWidget;->b:I

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    sget p1, Leif;->a:I

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p0}, Lk1g;->t(Landroid/content/Context;)I

    move-result p0

    const v0, 0x7f0d0460

    const-class v1, Lcom/opera/android/aiassistant/appwidget/AiAssistantAppWidget;

    invoke-static {p1, v1, p0, v0}, Lkfo;->c0(Landroid/content/Context;Ljava/lang/Class;II)V

    return-void

    :pswitch_98
    invoke-virtual {v0}, Lkc2;->I0()Lqc2;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_a0
    invoke-virtual {v0}, Lkc2;->I0()Lqc2;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_data_a8
    .packed-switch 0x0
        :pswitch_a0
        :pswitch_98
        :pswitch_7f
        :pswitch_77
        :pswitch_6a
        :pswitch_3f
        :pswitch_27
        :pswitch_1f
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method
