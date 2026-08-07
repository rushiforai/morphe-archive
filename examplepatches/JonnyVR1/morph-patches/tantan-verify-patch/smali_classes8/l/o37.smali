.class public final synthetic Ll/o37;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/aqq;


# direct methods
.method public synthetic constructor <init>(Ll/aqq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o37;->a:Ll/aqq;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o37;->a:Ll/aqq;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->C0(Ll/aqq;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method
