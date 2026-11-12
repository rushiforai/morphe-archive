.class public final Lumk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lb59;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;B)V
    .registers 5

    const/4 v0, 0x0

    packed-switch p3, :pswitch_data_20

    const-string p3, "SubscriptionResubscribePrefs"

    new-array v0, v0, [Lbg1;

    invoke-static {p1, p2, p3, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lumk;->a:Lb59;

    return-void

    :pswitch_12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p3, "voice_input"

    new-array v0, v0, [Lbg1;

    invoke-static {p1, p2, p3, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lumk;->a:Lb59;

    return-void

    :pswitch_data_20
    .packed-switch 0x1
        :pswitch_12
    .end packed-switch
.end method


# virtual methods
.method public final a()Ljava/util/List;
    .registers 3

    iget-object p0, p0, Lumk;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "languages"

    const-string v1, ""

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, ","

    invoke-static {p0, v0}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
