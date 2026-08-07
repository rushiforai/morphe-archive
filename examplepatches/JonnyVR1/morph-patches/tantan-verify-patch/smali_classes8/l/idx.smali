.class public final synthetic Ll/idx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ydx;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/ydx;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/idx;->a:Ll/ydx;

    iput-object p2, p0, Ll/idx;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-object p3, p0, Ll/idx;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/idx;->d:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/idx;->a:Ll/ydx;

    iget-object v1, p0, Ll/idx;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-object v2, p0, Ll/idx;->c:Ljava/lang/String;

    iget-boolean p0, p0, Ll/idx;->d:Z

    invoke-static {v0, v1, v2, p0}, Ll/ydx;->E0(Ll/ydx;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Z)V

    return-void
.end method
