.class public final synthetic Ll/wnb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wnb0;->a:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wnb0;->a:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    check-cast p1, Landroid/content/Context;

    invoke-static {p0, p1}, Lcom/clevertap/android/sdk/i$a;->a(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Landroid/content/Context;)Lcom/clevertap/android/sdk/f;

    move-result-object p0

    return-object p0
.end method
