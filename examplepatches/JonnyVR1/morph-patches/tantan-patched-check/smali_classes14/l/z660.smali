.class public final synthetic Ll/z660;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/api/OtherApi;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/api/OtherApi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z660;->a:Lcom/p1/mobile/putong/api/api/OtherApi;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z660;->a:Lcom/p1/mobile/putong/api/api/OtherApi;

    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/OtherApi;->a(Lcom/p1/mobile/putong/api/api/OtherApi;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
