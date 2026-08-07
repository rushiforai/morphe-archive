.class public final synthetic Ll/re6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/re6;->a:Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/re6;->a:Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {p0, p1}, Ll/ue6;->B0(Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
