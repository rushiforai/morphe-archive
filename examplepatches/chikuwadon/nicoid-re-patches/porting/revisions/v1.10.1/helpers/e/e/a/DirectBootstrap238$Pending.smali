.class final Le/e/a/DirectBootstrap238$Pending;
.super Ljava/lang/Object;
.source "DirectBootstrap238.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/DirectBootstrap238;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Pending"
.end annotation


# instance fields
.field final destination:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field source:Landroid/app/Activity;

.field final timeout:Ljava/lang/Runnable;

.field final token:J


# direct methods
.method constructor <init>(JLandroid/app/Activity;)V
    .registers 5

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Le/e/a/DirectBootstrap238$Pending$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Le/e/a/DirectBootstrap238$Pending$$ExternalSyntheticLambda1;-><init>(Le/e/a/DirectBootstrap238$Pending;)V

    iput-object v0, p0, Le/e/a/DirectBootstrap238$Pending;->timeout:Ljava/lang/Runnable;

    iput-wide p1, p0, Le/e/a/DirectBootstrap238$Pending;->token:J

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Le/e/a/DirectBootstrap238$Pending;->destination:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method synthetic lambda$0$e-e-a-DirectBootstrap238$Pending()V
    .registers 2

    .line 6
    const/4 v0, 0x1

    invoke-static {p0, v0}, Le/e/a/DirectBootstrap238;->cancel(Le/e/a/DirectBootstrap238$Pending;Z)V

    return-void
.end method
