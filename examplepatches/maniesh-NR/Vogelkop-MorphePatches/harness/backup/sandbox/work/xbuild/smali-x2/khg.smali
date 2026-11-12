.class public final Lkhg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lg9;

.field public final b:Lcom/android/installreferrer/api/InstallReferrerClient;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lg9;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lkhg;->a:Lg9;

    invoke-static {p1}, Lcom/android/installreferrer/api/InstallReferrerClient;->newBuilder(Landroid/content/Context;)Lcom/android/installreferrer/api/InstallReferrerClient$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/installreferrer/api/InstallReferrerClient$Builder;->build()Lcom/android/installreferrer/api/InstallReferrerClient;

    move-result-object p1

    iput-object p1, p0, Lkhg;->b:Lcom/android/installreferrer/api/InstallReferrerClient;

    new-instance p2, Lwub;

    invoke-direct {p2, p0}, Lwub;-><init>(Ljava/lang/Object;)V

    :try_start_14
    invoke-virtual {p1, p2}, Lcom/android/installreferrer/api/InstallReferrerClient;->startConnection(Lcom/android/installreferrer/api/InstallReferrerStateListener;)V
    :try_end_17
    .catch Ljava/lang/SecurityException; {:try_start_14 .. :try_end_17} :catch_18

    return-void

    :catch_18
    iget-object p0, p0, Lkhg;->a:Lg9;

    sget-object p1, Lhg0;->e:Lhg0;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lg9;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
