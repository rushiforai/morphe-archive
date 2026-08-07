.class public final synthetic Ll/m28;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m28;->a:Lcom/p1/mobile/putong/core/api/g;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m28;->a:Lcom/p1/mobile/putong/core/api/g;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/g;->S6(Lcom/p1/mobile/putong/core/api/g;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
