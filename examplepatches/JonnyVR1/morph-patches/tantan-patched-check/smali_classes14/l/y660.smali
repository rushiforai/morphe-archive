.class public final synthetic Ll/y660;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/SliderVerifyData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/SliderVerifyData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y660;->a:Lcom/p1/mobile/putong/data/SliderVerifyData;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y660;->a:Lcom/p1/mobile/putong/data/SliderVerifyData;

    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/OtherApi;->c(Lcom/p1/mobile/putong/data/SliderVerifyData;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
