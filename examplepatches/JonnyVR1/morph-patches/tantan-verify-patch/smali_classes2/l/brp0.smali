.class public final synthetic Ll/brp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/GraphRequest$b;


# instance fields
.field public final synthetic a:[Ljava/lang/String;

.field public final synthetic b:I

.field public final synthetic c:Lcom/facebook/internal/WebDialog$e;

.field public final synthetic d:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public synthetic constructor <init>([Ljava/lang/String;ILcom/facebook/internal/WebDialog$e;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/brp0;->a:[Ljava/lang/String;

    iput p2, p0, Ll/brp0;->b:I

    iput-object p3, p0, Ll/brp0;->c:Lcom/facebook/internal/WebDialog$e;

    iput-object p4, p0, Ll/brp0;->d:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method


# virtual methods
.method public final a(Lcom/facebook/GraphResponse;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/brp0;->a:[Ljava/lang/String;

    iget v1, p0, Ll/brp0;->b:I

    iget-object v2, p0, Ll/brp0;->c:Lcom/facebook/internal/WebDialog$e;

    iget-object p0, p0, Ll/brp0;->d:Ljava/util/concurrent/CountDownLatch;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/facebook/internal/WebDialog$e;->a([Ljava/lang/String;ILcom/facebook/internal/WebDialog$e;Ljava/util/concurrent/CountDownLatch;Lcom/facebook/GraphResponse;)V

    return-void
.end method
