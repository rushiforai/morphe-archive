.class public final synthetic Lw8f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(JJ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lw8f;->a:J

    iput-wide p3, p0, Lw8f;->b:J

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->H()Lglh;

    move-result-object v0

    new-instance v1, Lx8f;

    iget-wide v2, p0, Lw8f;->b:J

    iget-wide v4, p0, Lw8f;->a:J

    invoke-direct {v1, v2, v3, v4, v5}, Lx8f;-><init>(JJ)V

    invoke-virtual {v0, v1, v4, v5}, Lglh;->c(Lcom/opera/api/Callback;J)V

    return-void
.end method
