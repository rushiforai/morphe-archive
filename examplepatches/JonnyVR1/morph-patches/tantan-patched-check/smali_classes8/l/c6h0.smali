.class public final synthetic Ll/c6h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/d6h0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/VirtualCardType;


# direct methods
.method public synthetic constructor <init>(Ll/d6h0;Lcom/p1/mobile/putong/core/data/VirtualCardType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c6h0;->a:Ll/d6h0;

    iput-object p2, p0, Ll/c6h0;->b:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c6h0;->a:Ll/d6h0;

    iget-object p0, p0, Ll/c6h0;->b:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    invoke-static {v0, p0}, Ll/d6h0;->i(Ll/d6h0;Lcom/p1/mobile/putong/core/data/VirtualCardType;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
