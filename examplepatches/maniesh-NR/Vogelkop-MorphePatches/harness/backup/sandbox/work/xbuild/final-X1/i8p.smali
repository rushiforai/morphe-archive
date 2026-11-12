.class public final Li8p;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final synthetic b:Lt8p;


# direct methods
.method public constructor <init>(Lt8p;)V
    .registers 2

    iput-object p1, p0, Li8p;->b:Lt8p;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 7

    iget-object p1, p0, Li8p;->b:Lt8p;

    iget-object v0, p1, Laoo;->c:Lami;

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_50

    iget-object v1, p1, Lt8p;->u:Leuo;

    iget v1, v1, Leuo;->a:I

    if-eqz v1, :cond_50

    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_29

    iget-object v1, p1, Lt8p;->u:Leuo;

    iget v2, v1, Leuo;->a:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_29

    invoke-virtual {v1}, Leuo;->a()V

    invoke-virtual {v0, p1}, Lami;->a(Landroid/view/View;)V

    const/4 p1, 0x1

    :goto_26
    iput-boolean p1, p0, Li8p;->a:Z

    return-void

    :cond_29
    const-string v1, "android.intent.action.USER_PRESENT"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_50

    iget-boolean p2, p0, Li8p;->a:Z

    if-eqz p2, :cond_50

    iget-object p2, p1, Lt8p;->u:Leuo;

    iget v1, p2, Leuo;->a:I

    const/4 v2, 0x4

    if-eq v1, v2, :cond_3f

    const/4 v2, 0x7

    if-ne v1, v2, :cond_50

    :cond_3f
    invoke-virtual {p2}, Leuo;->b()V

    iget-object p2, p1, Lt8p;->I:Lg2p;

    invoke-virtual {v0, p1, p2}, Lami;->b(Landroid/view/View;Looo;)V

    iget-object p1, p1, Lt8p;->x:Lwtm;

    const/16 p2, 0x16

    invoke-virtual {p1, p2}, Lwtm;->a(I)V

    const/4 p1, 0x0

    goto :goto_26

    :cond_50
    return-void
.end method
