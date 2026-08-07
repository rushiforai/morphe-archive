.class public final synthetic Lcom/clevertap/android/sdk/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vo50;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/b$c;

.field public final synthetic b:Lcom/android/installreferrer/api/InstallReferrerClient;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/b$c;Lcom/android/installreferrer/api/InstallReferrerClient;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/clevertap/android/sdk/c;->a:Lcom/clevertap/android/sdk/b$c;

    iput-object p2, p0, Lcom/clevertap/android/sdk/c;->b:Lcom/android/installreferrer/api/InstallReferrerClient;

    return-void
.end method


# virtual methods
.method public final onSuccess(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/c;->a:Lcom/clevertap/android/sdk/b$c;

    iget-object p0, p0, Lcom/clevertap/android/sdk/c;->b:Lcom/android/installreferrer/api/InstallReferrerClient;

    check-cast p1, Lcom/android/installreferrer/api/ReferrerDetails;

    invoke-static {v0, p0, p1}, Lcom/clevertap/android/sdk/b$c;->b(Lcom/clevertap/android/sdk/b$c;Lcom/android/installreferrer/api/InstallReferrerClient;Lcom/android/installreferrer/api/ReferrerDetails;)V

    return-void
.end method
