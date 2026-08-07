.class public final synthetic Ll/ujr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/likers/a;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/likers/a;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ujr;->a:Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    iput-object p2, p0, Ll/ujr;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ujr;->a:Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    iget-object p0, p0, Ll/ujr;->b:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->H(Lcom/p1/mobile/putong/core/ui/vip/likers/a;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
