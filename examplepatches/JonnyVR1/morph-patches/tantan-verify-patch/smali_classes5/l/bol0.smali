.class public final synthetic Ll/bol0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/DoublePair;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/DoublePair;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bol0;->a:Lcom/p1/mobile/putong/data/DoublePair;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bol0;->a:Lcom/p1/mobile/putong/data/DoublePair;

    check-cast p1, Lcom/p1/mobile/putong/data/MessageLocation;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->a2(Lcom/p1/mobile/putong/data/DoublePair;Lcom/p1/mobile/putong/data/MessageLocation;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
