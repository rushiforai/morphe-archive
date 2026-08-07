.class public final synthetic Ll/jz9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/api/b$a;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/api/b$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jz9;->a:Lcom/p1/mobile/putong/feed/api/b$a;

    iput-object p2, p0, Ll/jz9;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jz9;->a:Lcom/p1/mobile/putong/feed/api/b$a;

    iget-object p0, p0, Ll/jz9;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/api/b$a;->F(Lcom/p1/mobile/putong/feed/api/b$a;Ljava/lang/String;)V

    return-void
.end method
