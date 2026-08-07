.class public final synthetic Ll/n440;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n440;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/n440;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n440;->a:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/n440;->b:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/b;->j(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/User;

    move-result-object p0

    return-object p0
.end method
