.class public final Ljkf;
.super Le63;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:J

.field public final b:Likf;

.field public final c:Lvdf;


# direct methods
.method public constructor <init>(JLikf;Lvdf;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ljkf;->a:J

    iput-object p3, p0, Ljkf;->b:Likf;

    iput-object p4, p0, Ljkf;->c:Lvdf;

    const-wide/16 p1, 0x3e8

    invoke-static {p0, p1, p2}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void
.end method


# virtual methods
.method public final f(Lre7;)V
    .registers 6

    iget-wide v0, p1, Lre7;->o:J

    iget-wide v2, p0, Ljkf;->a:J

    cmp-long p1, v0, v2

    if-nez p1, :cond_23

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    sget-object p1, Lt8;->a:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p1

    iget-object p1, p1, Lsf7;->a:Lrf7;

    invoke-virtual {p1, p0}, Lrf7;->u(Lqf7;)V

    iget-object p0, p0, Ljkf;->b:Likf;

    invoke-virtual {p0}, Likf;->run()V

    :cond_23
    return-void
.end method

.method public final run()V
    .registers 3

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v0

    iget-object v0, v0, Lsf7;->a:Lrf7;

    invoke-virtual {v0, p0}, Lrf7;->u(Lqf7;)V

    iget-object p0, p0, Ljkf;->c:Lvdf;

    invoke-virtual {p0}, Lvdf;->run()V

    return-void
.end method
