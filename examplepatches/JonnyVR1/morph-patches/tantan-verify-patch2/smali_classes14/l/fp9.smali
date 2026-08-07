.class public final synthetic Ll/fp9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fp9;->a:Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fp9;->a:Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/r;->M3(Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
