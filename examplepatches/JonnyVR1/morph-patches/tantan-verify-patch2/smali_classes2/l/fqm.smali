.class public final synthetic Ll/fqm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/InAppController;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Lcom/clevertap/android/sdk/inapp/InAppController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fqm;->a:Landroid/content/Context;

    iput-object p2, p0, Ll/fqm;->b:Lcom/clevertap/android/sdk/inapp/InAppController;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fqm;->a:Landroid/content/Context;

    iget-object p0, p0, Ll/fqm;->b:Lcom/clevertap/android/sdk/inapp/InAppController;

    invoke-static {v0, p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->k(Landroid/content/Context;Lcom/clevertap/android/sdk/inapp/InAppController;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
