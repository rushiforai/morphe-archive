.class public Lcom/facebook/datasource/AbstractDataSource$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/datasource/AbstractDataSource;->m()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/s6c;

.field public final synthetic b:Lcom/facebook/datasource/AbstractDataSource;


# direct methods
.method public constructor <init>(Lcom/facebook/datasource/AbstractDataSource;Ll/s6c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/facebook/datasource/AbstractDataSource$b;->b:Lcom/facebook/datasource/AbstractDataSource;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/facebook/datasource/AbstractDataSource$b;->a:Ll/s6c;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/facebook/datasource/AbstractDataSource$b;->a:Ll/s6c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/facebook/datasource/AbstractDataSource$b;->b:Lcom/facebook/datasource/AbstractDataSource;

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ll/s6c;->a(Ll/i6c;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
