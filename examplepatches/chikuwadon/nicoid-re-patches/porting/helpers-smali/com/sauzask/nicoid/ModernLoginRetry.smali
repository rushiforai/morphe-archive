.class public final Lcom/sauzask/nicoid/ModernLoginRetry;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private attempts:I

.field private final owner:Lcom/sauzask/nicoid/ModernLoginActivity;

.field private final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/ModernLoginActivity;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sauzask/nicoid/ModernLoginRetry;->owner:Lcom/sauzask/nicoid/ModernLoginActivity;

    iput-object p2, p0, Lcom/sauzask/nicoid/ModernLoginRetry;->url:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    iget-object v0, p0, Lcom/sauzask/nicoid/ModernLoginRetry;->owner:Lcom/sauzask/nicoid/ModernLoginActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_27

    iget-object v1, p0, Lcom/sauzask/nicoid/ModernLoginRetry;->url:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/sauzask/nicoid/ModernLoginActivity;->capture(Lcom/sauzask/nicoid/ModernLoginActivity;Ljava/lang/String;)V

    iget v1, p0, Lcom/sauzask/nicoid/ModernLoginRetry;->attempts:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/sauzask/nicoid/ModernLoginRetry;->attempts:I

    const/16 v2, 0x8

    if-ge v1, v2, :cond_27

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_27

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_27
    return-void
.end method
