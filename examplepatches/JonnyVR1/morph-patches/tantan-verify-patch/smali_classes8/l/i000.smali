.class public final synthetic Ll/i000;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i000;->a:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i000;->a:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    invoke-static {p0}, Ll/j000;->c(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
