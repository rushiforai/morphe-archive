.class public abstract Ln14;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Landroid/content/Context;

.field public final c:Lua7;

.field public final d:Lcom/opera/api/Callback;

.field public e:Landroid/widget/RemoteViews;

.field public f:Landroid/widget/RemoteViews;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;IILcom/opera/api/Callback;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ln14;->b:Landroid/content/Context;

    iput-object p5, p0, Ln14;->d:Lcom/opera/api/Callback;

    iput p3, p0, Ln14;->a:I

    new-instance p1, Lcm;

    const/4 p5, 0x0

    const/4 v0, 0x5

    invoke-direct {p1, p5, p3, v0}, Lcm;-><init>(Ljava/lang/String;IB)V

    invoke-static {p2, p1}, Lzi4;->t(Ljava/lang/String;Lcm;)Lua7;

    move-result-object p1

    iput-object p1, p0, Ln14;->c:Lua7;

    invoke-virtual {p1, p4}, Lua7;->S(I)V

    iget-object p0, p1, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Ll1f;

    const/16 p1, 0x8

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2}, Ll1f;->h(IZ)V

    return-void
.end method

.method public static c(Landroid/widget/RemoteViews;Ljava/lang/String;I)V
    .registers 8

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    const v2, 0x7f0a0264

    const v3, 0x7f0a0322

    const v4, 0x7f0a0435

    if-lt v0, v1, :cond_1b

    const/16 p1, 0x8

    invoke-virtual {p0, v4, p1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    invoke-virtual {p0, v3, p1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    invoke-virtual {p0, v2, p1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    return-void

    :cond_1b
    invoke-virtual {p0, v4, p1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const p1, 0x7f0801bc

    invoke-virtual {p0, v3, p1}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    invoke-virtual {p0, v2, p2}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    return-void
.end method

.method public static d(Landroid/widget/RemoteViews;DLjava/lang/String;Ljava/lang/CharSequence;)V
    .registers 9

    const v0, 0x7f0a04f7

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    const v0, 0x7f0a0510

    invoke-virtual {p0, v0, p3}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const p3, 0x7f0a0518

    invoke-virtual {p0, p3, p4}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const-wide/high16 p3, 0x4059000000000000L    # 100.0

    mul-double/2addr p3, p1

    double-to-int p3, p3

    const-wide/16 v2, 0x0

    cmpg-double p1, p1, v2

    if-gez p1, :cond_1e

    const/4 v1, 0x1

    :cond_1e
    const p1, 0x7f0a04f5

    const/16 p2, 0x64

    invoke-virtual {p0, p1, p2, p3, v1}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)Landroid/app/Notification;
    .registers 8

    iget-object v0, p0, Ln14;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f1401b7

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/widget/RemoteViews;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f0d005d

    invoke-direct {v2, v3, v4}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    iput-object v2, p0, Ln14;->e:Landroid/widget/RemoteViews;

    const v3, 0x7f08051b

    invoke-static {v2, v1, v3}, Ln14;->c(Landroid/widget/RemoteViews;Ljava/lang/String;I)V

    iget-object v2, p0, Ln14;->e:Landroid/widget/RemoteViews;

    iget-object v3, p0, Ln14;->c:Lua7;

    iget-object v4, v3, Lua7;->b:Ljava/lang/Object;

    check-cast v4, Ll1f;

    iput-object v2, v4, Ll1f;->B:Landroid/widget/RemoteViews;

    new-instance v2, Landroid/widget/RemoteViews;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const v5, 0x7f0d005e

    invoke-direct {v2, v0, v5}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    iput-object v2, p0, Ln14;->f:Landroid/widget/RemoteViews;

    const v0, 0x7f080521

    invoke-static {v2, v1, v0}, Ln14;->c(Landroid/widget/RemoteViews;Ljava/lang/String;I)V

    invoke-virtual {p0, p1}, Ln14;->f(Ljava/util/List;)V

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_53

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lre7;

    iget-wide v0, p1, Lre7;->o:J

    goto :goto_55

    :cond_53
    const-wide/16 v0, -0x1

    :goto_55
    invoke-virtual {p0, v0, v1}, Ln14;->b(J)Lyhe;

    move-result-object p1

    invoke-virtual {v3, p1}, Lua7;->N(Lyhe;)V

    iget-object p0, p0, Ln14;->f:Landroid/widget/RemoteViews;

    iput-object p0, v4, Ll1f;->C:Landroid/widget/RemoteViews;

    invoke-virtual {v4}, Ll1f;->b()Landroid/app/Notification;

    move-result-object p0

    return-object p0
.end method

.method public b(J)Lyhe;
    .registers 5

    iget-object p0, p0, Ln14;->b:Landroid/content/Context;

    invoke-static {p0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "com.opera.android.action.SHOW_DOWNLOADS"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "download"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string p1, "com.opera.android.action.EXTRA_FORCE_SHOW_FRAGMENT_IMMEDIATELY"

    const-string p2, ""

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 p1, 0x0

    const/high16 p2, 0xc000000

    invoke-static {p0, p1, v0, p2, p1}, Lyhe;->f(Landroid/content/Context;ILandroid/content/Intent;IZ)Lyhe;

    move-result-object p0

    return-object p0
.end method

.method public final e(ILandroid/app/PendingIntent;)V
    .registers 6

    iget-object v0, p0, Ln14;->f:Landroid/widget/RemoteViews;

    const v1, 0x7f0a0108

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    iget-object v0, p0, Ln14;->f:Landroid/widget/RemoteViews;

    iget-object v1, p0, Ln14;->b:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    const v1, 0x7f0a0102

    invoke-virtual {v0, v1, p1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    iget-object p0, p0, Ln14;->f:Landroid/widget/RemoteViews;

    invoke-virtual {p0, v1, p2}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    return-void
.end method

.method public abstract f(Ljava/util/List;)V
.end method
