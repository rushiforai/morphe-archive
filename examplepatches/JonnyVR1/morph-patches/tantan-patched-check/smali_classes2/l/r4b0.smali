.class public final synthetic Ll/r4b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/facebook/e$a;

.field public final synthetic b:Lcom/facebook/h;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/e$a;Lcom/facebook/h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r4b0;->a:Lcom/facebook/e$a;

    iput-object p2, p0, Ll/r4b0;->b:Lcom/facebook/h;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r4b0;->a:Lcom/facebook/e$a;

    iget-object p0, p0, Ll/r4b0;->b:Lcom/facebook/h;

    invoke-static {v0, p0}, Lcom/facebook/h;->d(Lcom/facebook/e$a;Lcom/facebook/h;)V

    return-void
.end method
