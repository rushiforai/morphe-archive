.class public final synthetic Ltk6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwjh;


# direct methods
.method public synthetic constructor <init>(Lwjh;B)V
    .registers 3

    iput-byte p2, p0, Ltk6;->a:B

    iput-object p1, p0, Ltk6;->b:Lwjh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Ltk6;->a:B

    const-class v1, Lcom/opera/android/aiassistant/appwidget/AiAssistantAppWidget;

    iget-object p0, p0, Ltk6;->b:Lwjh;

    packed-switch v0, :pswitch_data_80

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_14

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lwjh;->u(I)V

    :cond_14
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17
    check-cast p1, Lkotlin/Unit;

    sget p1, Lcom/opera/android/aiassistant/appwidget/AiAssistantAppWidget;->b:I

    iget-object p0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    sget p1, Leif;->a:I

    invoke-static {p0, v1}, Lkfo;->I(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_26
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Lwjh;->n()Z

    move-result p1

    iget-object v0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    new-instance v3, Landroid/content/ComponentName;

    invoke-direct {v3, v0, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v1, 0x1

    const/4 v4, 0x2

    if-eqz p1, :cond_3f

    move v5, v1

    goto :goto_40

    :cond_3f
    move v5, v4

    :goto_40
    invoke-virtual {v2, v3, v5, v1}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    new-instance v3, Landroid/content/ComponentName;

    const-class v5, Lcom/opera/android/shortcut/AriaShortcutWidgetActivity;

    invoke-direct {v3, v0, v5}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    if-eqz p1, :cond_52

    move v0, v1

    goto :goto_53

    :cond_52
    move v0, v4

    :goto_53
    invoke-virtual {v2, v3, v0, v1}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    if-eqz p1, :cond_79

    iget-object p1, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast p1, Lumi;

    new-instance v0, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v2, p1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p1, Ltk6;

    invoke-direct {p1, p0, v1}, Ltk6;-><init>(Lwjh;B)V

    invoke-virtual {v0, p1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    new-instance v0, Ltk6;

    invoke-direct {v0, p0, v4}, Ltk6;-><init>(Lwjh;B)V

    invoke-virtual {p1, v0}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    goto :goto_7d

    :cond_79
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lwjh;->u(I)V

    :goto_7d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_80
    .packed-switch 0x0
        :pswitch_26
        :pswitch_17
    .end packed-switch
.end method
