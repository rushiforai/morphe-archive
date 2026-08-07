.class public final synthetic Lcom/clevertap/android/sdk/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/b$c;

.field public final synthetic b:Lcom/android/installreferrer/api/InstallReferrerClient;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/b$c;Lcom/android/installreferrer/api/InstallReferrerClient;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/clevertap/android/sdk/d;->a:Lcom/clevertap/android/sdk/b$c;

    iput-object p2, p0, Lcom/clevertap/android/sdk/d;->b:Lcom/android/installreferrer/api/InstallReferrerClient;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/d;->a:Lcom/clevertap/android/sdk/b$c;

    iget-object p0, p0, Lcom/clevertap/android/sdk/d;->b:Lcom/android/installreferrer/api/InstallReferrerClient;

    invoke-static {v0, p0}, Lcom/clevertap/android/sdk/b$c;->a(Lcom/clevertap/android/sdk/b$c;Lcom/android/installreferrer/api/InstallReferrerClient;)Lcom/android/installreferrer/api/ReferrerDetails;

    move-result-object p0

    return-object p0
.end method
