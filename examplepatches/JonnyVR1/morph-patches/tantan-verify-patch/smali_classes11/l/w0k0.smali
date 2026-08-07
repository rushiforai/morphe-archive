.class public final synthetic Ll/w0k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/UpdateApiResult;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/UpdateApiResult;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w0k0;->a:Lcom/p1/mobile/putong/data/UpdateApiResult;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0k0;->a:Lcom/p1/mobile/putong/data/UpdateApiResult;

    invoke-static {p0}, Ll/d1k0;->e(Lcom/p1/mobile/putong/data/UpdateApiResult;)V

    return-void
.end method
