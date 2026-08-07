.class public final synthetic Ll/hc00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/vap/mix/Src;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/vap/mix/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/vap/mix/Src;Lcom/p1/mobile/putong/live/base/vap/mix/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hc00;->a:Lcom/p1/mobile/putong/live/base/vap/mix/Src;

    iput-object p2, p0, Ll/hc00;->b:Lcom/p1/mobile/putong/live/base/vap/mix/a;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hc00;->a:Lcom/p1/mobile/putong/live/base/vap/mix/Src;

    iget-object p0, p0, Ll/hc00;->b:Lcom/p1/mobile/putong/live/base/vap/mix/a;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/base/vap/mix/a;->g(Lcom/p1/mobile/putong/live/base/vap/mix/Src;Lcom/p1/mobile/putong/live/base/vap/mix/a;Landroid/graphics/Bitmap;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
