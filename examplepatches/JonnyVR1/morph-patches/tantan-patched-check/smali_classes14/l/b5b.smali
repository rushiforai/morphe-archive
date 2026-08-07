.class public final synthetic Ll/b5b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b5b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b5b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->I3(Lcom/p1/mobile/putong/core/api/CoreSuggested;)V

    return-void
.end method
