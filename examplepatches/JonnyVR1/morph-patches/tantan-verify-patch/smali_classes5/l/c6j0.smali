.class public final synthetic Ll/c6j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/d;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/toppicks/a;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/core/ui/toppicks/a;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c6j0;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iput-object p2, p0, Ll/c6j0;->b:Lcom/p1/mobile/putong/core/ui/toppicks/a;

    iput-boolean p3, p0, Ll/c6j0;->c:Z

    iput-object p4, p0, Ll/c6j0;->d:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c6j0;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iget-object v1, p0, Ll/c6j0;->b:Lcom/p1/mobile/putong/core/ui/toppicks/a;

    iget-boolean v2, p0, Ll/c6j0;->c:Z

    iget-object p0, p0, Ll/c6j0;->d:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/toppicks/a;->i0(Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/core/ui/toppicks/a;ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method
