.class public final synthetic Ll/k0u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k0u;->a:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k0u;->a:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    check-cast p1, Lcom/p1/mobile/putong/live/base/util/IntSet;

    invoke-static {p0, p1}, Ll/r0u;->t0(Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;Lcom/p1/mobile/putong/live/base/util/IntSet;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
