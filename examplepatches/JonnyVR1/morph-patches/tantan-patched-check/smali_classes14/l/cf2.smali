.class public final synthetic Ll/cf2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lkotlin/jvm/functions/Function1;

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/square/api/ModelData;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/live/external/square/api/ModelData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cf2;->a:Lkotlin/jvm/functions/Function1;

    iput-object p2, p0, Ll/cf2;->b:Lcom/p1/mobile/putong/live/external/square/api/ModelData;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cf2;->a:Lkotlin/jvm/functions/Function1;

    iget-object p0, p0, Ll/cf2;->b:Lcom/p1/mobile/putong/live/external/square/api/ModelData;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->b(Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/live/external/square/api/ModelData;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
