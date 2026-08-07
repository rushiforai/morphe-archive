.class public final synthetic Ll/qh7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/e;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/e;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qh7;->a:Lcom/p1/mobile/putong/core/api/e;

    iput-object p2, p0, Ll/qh7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/qh7;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/qh7;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qh7;->a:Lcom/p1/mobile/putong/core/api/e;

    iget-object v1, p0, Ll/qh7;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/qh7;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/qh7;->d:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/api/e;->s5(Lcom/p1/mobile/putong/core/api/e;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
