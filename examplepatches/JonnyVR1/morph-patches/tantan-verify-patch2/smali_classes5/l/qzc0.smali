.class public final synthetic Ll/qzc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/OrderInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/OrderInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qzc0;->a:Lcom/p1/mobile/putong/core/data/OrderInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzc0;->a:Lcom/p1/mobile/putong/core/data/OrderInfo;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/xzc0;->f(Lcom/p1/mobile/putong/core/data/OrderInfo;Ljava/util/List;)Ll/bkj0;

    move-result-object p0

    return-object p0
.end method
