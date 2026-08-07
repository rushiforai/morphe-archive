.class public final synthetic Ll/pu3;
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

    iput-object p1, p0, Ll/pu3;->a:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pu3;->a:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/ru3;->b(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ljava/lang/String;)Ll/su3;

    move-result-object p0

    return-object p0
.end method
