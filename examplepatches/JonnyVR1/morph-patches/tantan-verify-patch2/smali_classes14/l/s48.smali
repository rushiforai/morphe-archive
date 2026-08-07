.class public final synthetic Ll/s48;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s48;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/s48;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-boolean p3, p0, Ll/s48;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s48;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/s48;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-boolean p0, p0, Ll/s48;->c:Z

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Z5(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;ZLl/uxj0;)V

    return-void
.end method
