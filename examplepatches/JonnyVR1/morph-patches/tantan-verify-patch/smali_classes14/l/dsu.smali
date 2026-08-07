.class public final synthetic Ll/dsu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/isu;

.field public final synthetic b:D


# direct methods
.method public synthetic constructor <init>(Ll/isu;D)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dsu;->a:Ll/isu;

    iput-wide p2, p0, Ll/dsu;->b:D

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dsu;->a:Ll/isu;

    iget-wide v1, p0, Ll/dsu;->b:D

    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;

    invoke-static {v0, v1, v2, p1}, Ll/isu;->q(Ll/isu;DLcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
