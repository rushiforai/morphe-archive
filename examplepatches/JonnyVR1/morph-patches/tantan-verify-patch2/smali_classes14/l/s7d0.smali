.class public final synthetic Ll/s7d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s7d0;->a:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    iput-boolean p2, p0, Ll/s7d0;->b:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s7d0;->a:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    iget-boolean p0, p0, Ll/s7d0;->b:Z

    invoke-static {v0, p0}, Ll/a8d0;->d0(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method
