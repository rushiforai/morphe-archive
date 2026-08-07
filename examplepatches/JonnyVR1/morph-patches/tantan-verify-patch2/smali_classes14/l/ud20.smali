.class public final synthetic Ll/ud20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;

.field public final synthetic b:Lkotlin/jvm/internal/Ref$IntRef;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;Lkotlin/jvm/internal/Ref$IntRef;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ud20;->a:Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;

    iput-object p2, p0, Ll/ud20;->b:Lkotlin/jvm/internal/Ref$IntRef;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ud20;->a:Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;

    iget-object p0, p0, Ll/ud20;->b:Lkotlin/jvm/internal/Ref$IntRef;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;->g(Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;Lkotlin/jvm/internal/Ref$IntRef;)V

    return-void
.end method
