.class public final synthetic Ll/lzy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lzy;->a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lzy;->a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->o(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V

    return-void
.end method
