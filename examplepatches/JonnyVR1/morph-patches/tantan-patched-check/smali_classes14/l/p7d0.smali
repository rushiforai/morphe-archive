.class public final synthetic Ll/p7d0;
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

    iput-object p1, p0, Ll/p7d0;->a:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p7d0;->a:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/a8d0;->h0(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Ljava/lang/Boolean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
