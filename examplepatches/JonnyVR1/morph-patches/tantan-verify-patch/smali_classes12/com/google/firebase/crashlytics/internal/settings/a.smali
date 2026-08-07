.class public final synthetic Lcom/google/firebase/crashlytics/internal/settings/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/google/firebase/crashlytics/internal/settings/SettingsController$1;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/crashlytics/internal/settings/SettingsController$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/crashlytics/internal/settings/a;->a:Lcom/google/firebase/crashlytics/internal/settings/SettingsController$1;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/firebase/crashlytics/internal/settings/a;->a:Lcom/google/firebase/crashlytics/internal/settings/SettingsController$1;

    invoke-static {p0}, Lcom/google/firebase/crashlytics/internal/settings/SettingsController$1;->a(Lcom/google/firebase/crashlytics/internal/settings/SettingsController$1;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method
