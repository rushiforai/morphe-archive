.class public final synthetic Ll/vd20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lkotlin/jvm/internal/Ref$IntRef;

.field public final synthetic b:Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/internal/Ref$IntRef;Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vd20;->a:Lkotlin/jvm/internal/Ref$IntRef;

    iput-object p2, p0, Ll/vd20;->b:Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vd20;->a:Lkotlin/jvm/internal/Ref$IntRef;

    iget-object p0, p0, Ll/vd20;->b:Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;->d(Lkotlin/jvm/internal/Ref$IntRef;Lcom/p1/mobile/putong/core/admob/NativeAdViewCard;)V

    return-void
.end method
