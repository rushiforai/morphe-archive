.class public final synthetic Ll/ddg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/edg0;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Contract;


# direct methods
.method public synthetic constructor <init>(Ll/edg0;Ll/x20;Lcom/p1/mobile/putong/data/Contract;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ddg0;->a:Ll/edg0;

    iput-object p2, p0, Ll/ddg0;->b:Ll/x20;

    iput-object p3, p0, Ll/ddg0;->c:Lcom/p1/mobile/putong/data/Contract;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ddg0;->a:Ll/edg0;

    iget-object v1, p0, Ll/ddg0;->b:Ll/x20;

    iget-object p0, p0, Ll/ddg0;->c:Lcom/p1/mobile/putong/data/Contract;

    invoke-static {v0, v1, p0}, Ll/edg0;->n0(Ll/edg0;Ll/x20;Lcom/p1/mobile/putong/data/Contract;)V

    return-void
.end method
