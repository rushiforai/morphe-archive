.class public final Lbg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lbg;->a:B

    iput-object p1, p0, Lbg;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final b(JJ)V
    .registers 12

    iget-byte v0, p0, Lbg;->a:B

    packed-switch v0, :pswitch_data_56

    const-wide/16 v0, 0x0

    cmp-long v2, p3, v0

    if-lez v2, :cond_15

    cmp-long v0, p1, v0

    if-lez v0, :cond_15

    const/4 v0, 0x1

    :goto_10
    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move v6, v0

    goto :goto_17

    :cond_15
    const/4 v0, 0x0

    goto :goto_10

    :goto_17
    invoke-virtual/range {v1 .. v6}, Lbg;->c(JJZ)V

    return-void

    :pswitch_1b
    move-object v1, p0

    move-wide v4, p3

    iget-object p0, v1, Lbg;->b:Ljava/lang/Object;

    check-cast p0, Lcg;

    iput-wide v4, p0, Lcg;->j:J

    iget-object p1, p0, Ln14;->b:Landroid/content/Context;

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p2

    iget-object p2, p2, Lsf7;->a:Lrf7;

    invoke-virtual {p2}, Lrf7;->l()Ljava/util/List;

    move-result-object p2

    iget-object p3, p0, Ln14;->d:Lcom/opera/api/Callback;

    if-nez p3, :cond_4d

    const-string p3, "notification"

    invoke-virtual {p1, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/NotificationManager;

    iget p3, p0, Ln14;->a:I

    invoke-virtual {p0, p2}, Ln14;->a(Ljava/util/List;)Landroid/app/Notification;

    move-result-object p0

    invoke-virtual {p1, p3, p0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_54

    :cond_4d
    invoke-virtual {p0, p2}, Ln14;->a(Ljava/util/List;)Landroid/app/Notification;

    move-result-object p0

    invoke-interface {p3, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :goto_54
    return-void

    nop

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method

.method public final c(JJZ)V
    .registers 7

    iget-object p0, p0, Lbg;->b:Ljava/lang/Object;

    check-cast p0, Lwg7;

    iget-object p0, p0, Lwg7;->z:Lze7;

    new-instance v0, Lvg7;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-boolean p5, v0, Lvg7;->c:Z

    iput-wide p1, v0, Lvg7;->a:J

    iput-wide p3, v0, Lvg7;->b:J

    iput-object v0, p0, Lze7;->n:Lvg7;

    iget-object p1, p0, Lze7;->m:Ljava/lang/ref/WeakReference;

    const/4 p2, 0x0

    if-eqz p1, :cond_24

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, La9a;

    if-nez p1, :cond_23

    iput-object p2, p0, Lze7;->m:Ljava/lang/ref/WeakReference;

    goto :goto_24

    :cond_23
    move-object p2, p1

    :cond_24
    :goto_24
    if-nez p2, :cond_27

    return-void

    :cond_27
    iget-object p0, p0, Lze7;->n:Lvg7;

    invoke-virtual {p2, p0}, La9a;->U(Lvg7;)V

    return-void
.end method
