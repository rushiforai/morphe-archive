.class public final synthetic Ll/tw9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/api/b;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/api/b;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tw9;->a:Lcom/p1/mobile/putong/feed/api/b;

    iput-boolean p2, p0, Ll/tw9;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tw9;->a:Lcom/p1/mobile/putong/feed/api/b;

    iget-boolean p0, p0, Ll/tw9;->b:Z

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->F1(Lcom/p1/mobile/putong/feed/api/b;ZLjava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
