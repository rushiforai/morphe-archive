.class public final synthetic Ll/ga;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/facebook/b;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/b;Lcom/facebook/AccessToken$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ga;->a:Lcom/facebook/b;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ga;->a:Lcom/facebook/b;

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/facebook/b;->c(Lcom/facebook/b;Lcom/facebook/AccessToken$a;)V

    return-void
.end method
