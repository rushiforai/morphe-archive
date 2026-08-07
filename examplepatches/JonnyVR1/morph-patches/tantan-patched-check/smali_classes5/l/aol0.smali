.class public final synthetic Ll/aol0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/VipAct;

.field public final synthetic b:Lcom/p1/mobile/putong/data/DoublePair;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/VipAct;Lcom/p1/mobile/putong/data/DoublePair;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aol0;->a:Lcom/p1/mobile/putong/core/ui/vip/VipAct;

    iput-object p2, p0, Ll/aol0;->b:Lcom/p1/mobile/putong/data/DoublePair;

    iput-object p3, p0, Ll/aol0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/aol0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/aol0;->a:Lcom/p1/mobile/putong/core/ui/vip/VipAct;

    iget-object v1, p0, Ll/aol0;->b:Lcom/p1/mobile/putong/data/DoublePair;

    iget-object v2, p0, Ll/aol0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/aol0;->d:Ljava/lang/String;

    check-cast p1, Ll/bkj0;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->Z1(Lcom/p1/mobile/putong/core/ui/vip/VipAct;Lcom/p1/mobile/putong/data/DoublePair;Ljava/lang/String;Ljava/lang/String;Ll/bkj0;)V

    return-void
.end method
