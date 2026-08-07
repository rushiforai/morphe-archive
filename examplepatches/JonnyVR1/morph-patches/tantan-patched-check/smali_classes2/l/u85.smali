.class public final synthetic Ll/u85;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/CleverTapAPI;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/CleverTapAPI;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u85;->a:Lcom/clevertap/android/sdk/CleverTapAPI;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u85;->a:Lcom/clevertap/android/sdk/CleverTapAPI;

    invoke-static {p0}, Lcom/clevertap/android/sdk/CleverTapAPI;->g(Lcom/clevertap/android/sdk/CleverTapAPI;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method
