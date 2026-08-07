.class public final synthetic Ll/lk20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/network/b;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/network/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lk20;->a:Lcom/clevertap/android/sdk/network/b;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lk20;->a:Lcom/clevertap/android/sdk/network/b;

    invoke-static {p0}, Lcom/clevertap/android/sdk/network/b;->b(Lcom/clevertap/android/sdk/network/b;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
