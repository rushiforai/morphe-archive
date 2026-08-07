.class public final synthetic Ll/u5a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/g6a0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Relationship;


# direct methods
.method public synthetic constructor <init>(Ll/g6a0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u5a0;->a:Ll/g6a0;

    iput-object p2, p0, Ll/u5a0;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/u5a0;->c:Lcom/p1/mobile/putong/data/Relationship;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u5a0;->a:Ll/g6a0;

    iget-object v1, p0, Ll/u5a0;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/u5a0;->c:Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, v1, p0}, Ll/g6a0;->l1(Ll/g6a0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
