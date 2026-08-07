.class public final synthetic Ll/d3b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-boolean p2, p0, Ll/d3b;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-boolean p0, p0, Ll/d3b;->b:Z

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->L4(Lcom/p1/mobile/putong/core/api/CoreSuggested;Z)V

    return-void
.end method
