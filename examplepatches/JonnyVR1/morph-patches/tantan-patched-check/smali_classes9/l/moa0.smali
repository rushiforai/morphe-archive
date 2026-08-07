.class public final synthetic Ll/moa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/poa0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/poa0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/moa0;->a:Ll/poa0;

    iput-object p2, p0, Ll/moa0;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/moa0;->c:Lcom/p1/mobile/putong/data/User;

    iput-object p4, p0, Ll/moa0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/moa0;->a:Ll/poa0;

    iget-object v1, p0, Ll/moa0;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/moa0;->c:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/moa0;->d:Ljava/lang/String;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, v2, p0, p1}, Ll/poa0;->e0(Ll/poa0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method
