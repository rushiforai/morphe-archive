.class public final synthetic Lcom/android/billingclient/api/v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/android/billingclient/api/e0;

.field public final synthetic b:Landroid/app/Activity;

.field public final synthetic c:Lcom/android/billingclient/api/c;


# direct methods
.method public synthetic constructor <init>(Lcom/android/billingclient/api/e0;Landroid/app/Activity;Lcom/android/billingclient/api/c;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/billingclient/api/v;->a:Lcom/android/billingclient/api/e0;

    iput-object p2, p0, Lcom/android/billingclient/api/v;->b:Landroid/app/Activity;

    iput-object p3, p0, Lcom/android/billingclient/api/v;->c:Lcom/android/billingclient/api/c;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lcom/android/billingclient/api/v;->a:Lcom/android/billingclient/api/e0;

    iget-object v1, p0, Lcom/android/billingclient/api/v;->b:Landroid/app/Activity;

    iget-object p0, p0, Lcom/android/billingclient/api/v;->c:Lcom/android/billingclient/api/c;

    invoke-virtual {v0, v1, p0}, Lcom/android/billingclient/api/e0;->h1(Landroid/app/Activity;Lcom/android/billingclient/api/c;)Lcom/android/billingclient/api/d;

    move-result-object p0

    return-object p0
.end method
