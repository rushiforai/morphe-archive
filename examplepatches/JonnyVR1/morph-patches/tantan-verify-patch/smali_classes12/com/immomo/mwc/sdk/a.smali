.class public final synthetic Lcom/immomo/mwc/sdk/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/immomo/mwc/sdk/b;


# direct methods
.method public synthetic constructor <init>(Lcom/immomo/mwc/sdk/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/immomo/mwc/sdk/a;->a:Lcom/immomo/mwc/sdk/b;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mwc/sdk/a;->a:Lcom/immomo/mwc/sdk/b;

    invoke-static {p0}, Lcom/immomo/mwc/sdk/b;->b(Lcom/immomo/mwc/sdk/b;)V

    return-void
.end method
