.class public final synthetic Ll/ff2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;

.field public final synthetic b:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ff2;->a:Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;

    iput-object p2, p0, Ll/ff2;->b:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ff2;->a:Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;

    iget-object p0, p0, Ll/ff2;->b:Lkotlin/jvm/functions/Function1;

    check-cast p1, Lcom/p1/mobile/putong/live/external/square/api/ModelData;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->a(Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/live/external/square/api/ModelData;)V

    return-void
.end method
