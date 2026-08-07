.class public final synthetic Ll/kk20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/network/b;

.field public final synthetic b:Ll/cpe0;

.field public final synthetic c:Lcom/clevertap/android/sdk/network/EndpointId;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/network/b;Ll/cpe0;Lcom/clevertap/android/sdk/network/EndpointId;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kk20;->a:Lcom/clevertap/android/sdk/network/b;

    iput-object p2, p0, Ll/kk20;->b:Ll/cpe0;

    iput-object p3, p0, Ll/kk20;->c:Lcom/clevertap/android/sdk/network/EndpointId;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kk20;->a:Lcom/clevertap/android/sdk/network/b;

    iget-object v1, p0, Ll/kk20;->b:Ll/cpe0;

    iget-object p0, p0, Ll/kk20;->c:Lcom/clevertap/android/sdk/network/EndpointId;

    invoke-static {v0, v1, p0}, Lcom/clevertap/android/sdk/network/b;->a(Lcom/clevertap/android/sdk/network/b;Ll/cpe0;Lcom/clevertap/android/sdk/network/EndpointId;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
