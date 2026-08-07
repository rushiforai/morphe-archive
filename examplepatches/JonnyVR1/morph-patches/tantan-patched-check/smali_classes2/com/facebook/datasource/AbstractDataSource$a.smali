.class public Lcom/facebook/datasource/AbstractDataSource$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/datasource/AbstractDataSource;->k(Ll/s6c;Ljava/util/concurrent/Executor;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/s6c;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/facebook/datasource/AbstractDataSource;


# direct methods
.method public constructor <init>(Lcom/facebook/datasource/AbstractDataSource;ZLl/s6c;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/facebook/datasource/AbstractDataSource$a;->d:Lcom/facebook/datasource/AbstractDataSource;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/facebook/datasource/AbstractDataSource$a;->a:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/facebook/datasource/AbstractDataSource$a;->b:Ll/s6c;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/facebook/datasource/AbstractDataSource$a;->c:Z

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/facebook/datasource/AbstractDataSource$a;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/facebook/datasource/AbstractDataSource$a;->b:Ll/s6c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/facebook/datasource/AbstractDataSource$a;->d:Lcom/facebook/datasource/AbstractDataSource;

    .line 8
    .line 9
    invoke-interface {v0, p0}, Ll/s6c;->d(Ll/i6c;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-boolean v0, p0, Lcom/facebook/datasource/AbstractDataSource$a;->c:Z

    .line 14
    .line 15
    iget-object v1, p0, Lcom/facebook/datasource/AbstractDataSource$a;->b:Ll/s6c;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/facebook/datasource/AbstractDataSource$a;->d:Lcom/facebook/datasource/AbstractDataSource;

    .line 20
    .line 21
    invoke-interface {v1, p0}, Ll/s6c;->c(Ll/i6c;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-object p0, p0, Lcom/facebook/datasource/AbstractDataSource$a;->d:Lcom/facebook/datasource/AbstractDataSource;

    .line 26
    .line 27
    invoke-interface {v1, p0}, Ll/s6c;->b(Ll/i6c;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
