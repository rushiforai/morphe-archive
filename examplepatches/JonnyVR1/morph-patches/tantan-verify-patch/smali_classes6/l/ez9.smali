.class public final synthetic Ll/ez9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/api/b$a;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/api/b$a;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ez9;->a:Lcom/p1/mobile/putong/feed/api/b$a;

    iput-object p2, p0, Ll/ez9;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/ez9;->c:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ez9;->a:Lcom/p1/mobile/putong/feed/api/b$a;

    iget-object v1, p0, Ll/ez9;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/ez9;->c:Z

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/feed/api/b$a;->G(Lcom/p1/mobile/putong/feed/api/b$a;Ljava/lang/String;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method
