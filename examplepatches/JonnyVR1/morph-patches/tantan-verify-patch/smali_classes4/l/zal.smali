.class public final synthetic Ll/zal;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zal;->a:Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zal;->a:Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;

    check-cast p1, Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->r5(Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
