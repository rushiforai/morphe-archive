.class public final synthetic Ll/h18;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h18;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/h18;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/h18;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/h18;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/h18;->e:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/h18;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/h18;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/h18;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/h18;->d:Ljava/lang/String;

    iget-object p0, p0, Ll/h18;->e:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/api/g;->J6(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
