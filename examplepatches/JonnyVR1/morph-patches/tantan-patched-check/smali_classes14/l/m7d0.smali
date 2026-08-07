.class public final synthetic Ll/m7d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m7d0;->a:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m7d0;->a:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    check-cast p1, Lcom/p1/mobile/putong/core/data/QuickChatOneside;

    invoke-static {p0, p1}, Ll/a8d0;->p0(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Lcom/p1/mobile/putong/core/data/QuickChatOneside;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
