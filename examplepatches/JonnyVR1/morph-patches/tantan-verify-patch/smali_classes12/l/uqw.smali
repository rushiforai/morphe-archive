.class public final synthetic Ll/uqw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/immomo/mwc/sdk/MWCEngine;

.field public final synthetic b:Lcom/immomo/mwc/sdk/c;

.field public final synthetic c:Ll/ro5;


# direct methods
.method public synthetic constructor <init>(Lcom/immomo/mwc/sdk/MWCEngine;Lcom/immomo/mwc/sdk/c;Ll/ro5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uqw;->a:Lcom/immomo/mwc/sdk/MWCEngine;

    iput-object p2, p0, Ll/uqw;->b:Lcom/immomo/mwc/sdk/c;

    iput-object p3, p0, Ll/uqw;->c:Ll/ro5;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uqw;->a:Lcom/immomo/mwc/sdk/MWCEngine;

    iget-object v1, p0, Ll/uqw;->b:Lcom/immomo/mwc/sdk/c;

    iget-object p0, p0, Ll/uqw;->c:Ll/ro5;

    invoke-static {v0, v1, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->g(Lcom/immomo/mwc/sdk/MWCEngine;Lcom/immomo/mwc/sdk/c;Ll/ro5;)V

    return-void
.end method
