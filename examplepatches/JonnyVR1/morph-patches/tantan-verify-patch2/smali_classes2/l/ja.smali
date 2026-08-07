.class public final synthetic Ll/ja;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/e$a;


# instance fields
.field public final synthetic a:Lcom/facebook/b$d;

.field public final synthetic b:Lcom/facebook/AccessToken;

.field public final synthetic c:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic d:Ljava/util/Set;

.field public final synthetic e:Ljava/util/Set;

.field public final synthetic f:Ljava/util/Set;

.field public final synthetic g:Lcom/facebook/b;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/b$d;Lcom/facebook/AccessToken;Lcom/facebook/AccessToken$a;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Lcom/facebook/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ja;->a:Lcom/facebook/b$d;

    iput-object p2, p0, Ll/ja;->b:Lcom/facebook/AccessToken;

    iput-object p4, p0, Ll/ja;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p5, p0, Ll/ja;->d:Ljava/util/Set;

    iput-object p6, p0, Ll/ja;->e:Ljava/util/Set;

    iput-object p7, p0, Ll/ja;->f:Ljava/util/Set;

    iput-object p8, p0, Ll/ja;->g:Lcom/facebook/b;

    return-void
.end method


# virtual methods
.method public final a(Lcom/facebook/e;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/ja;->a:Lcom/facebook/b$d;

    iget-object v1, p0, Ll/ja;->b:Lcom/facebook/AccessToken;

    iget-object v3, p0, Ll/ja;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v4, p0, Ll/ja;->d:Ljava/util/Set;

    iget-object v5, p0, Ll/ja;->e:Ljava/util/Set;

    iget-object v6, p0, Ll/ja;->f:Ljava/util/Set;

    iget-object v7, p0, Ll/ja;->g:Lcom/facebook/b;

    const/4 v2, 0x0

    move-object v8, p1

    invoke-static/range {v0 .. v8}, Lcom/facebook/b;->a(Lcom/facebook/b$d;Lcom/facebook/AccessToken;Lcom/facebook/AccessToken$a;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Lcom/facebook/b;Lcom/facebook/e;)V

    return-void
.end method
