.class public final synthetic Ll/wrk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/oms/OmsBaseRender;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wrk;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wrk;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    check-cast p1, Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    invoke-static {p0, p1}, Ll/qtk;->j0(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    return-void
.end method
