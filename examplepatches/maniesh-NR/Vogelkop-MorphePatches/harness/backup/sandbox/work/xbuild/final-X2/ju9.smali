.class public final Lju9;
.super Lo5o;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Lfif;

.field public final c:Lfif;


# direct methods
.method public constructor <init>(Lumi;Lfif;Lfif;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lju9;->a:Lumi;

    iput-object p2, p0, Lju9;->b:Lfif;

    iput-object p3, p0, Lju9;->c:Lfif;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Ljava/lang/String;Landroidx/work/WorkerParameters;)Lajc;
    .registers 8

    const-class v0, Lcom/opera/android/gcm/NewPushNotificationWorker;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2f

    new-instance p2, Lcom/opera/android/gcm/NewPushNotificationWorker;

    new-instance v0, Lnbh;

    iget-object v1, p0, Lju9;->b:Lfif;

    invoke-virtual {v1}, Lfif;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorm;

    iget-object v3, p0, Lju9;->c:Lfif;

    invoke-virtual {v3}, Lfif;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lskm;

    iget-object p0, p0, Lju9;->a:Lumi;

    invoke-direct {v0, p1, p0, v2, v3}, Lnbh;-><init>(Landroid/content/Context;Lumi;Lorm;Lskm;)V

    invoke-virtual {v1}, Lfif;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorm;

    invoke-direct {p2, p1, p3, v0, p0}, Lcom/opera/android/gcm/NewPushNotificationWorker;-><init>(Landroid/content/Context;Landroidx/work/WorkerParameters;Lnbh;Lorm;)V

    return-object p2

    :cond_2f
    const/4 p0, 0x0

    return-object p0
.end method
