.class public final synthetic Ll/ao9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/r;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/r;Ljava/lang/String;ZLcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ao9;->a:Lcom/p1/mobile/putong/core/api/r;

    iput-object p2, p0, Ll/ao9;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/ao9;->c:Z

    iput-object p4, p0, Ll/ao9;->d:Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ao9;->a:Lcom/p1/mobile/putong/core/api/r;

    iget-object v1, p0, Ll/ao9;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/ao9;->c:Z

    iget-object p0, p0, Ll/ao9;->d:Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/r;->V3(Lcom/p1/mobile/putong/core/api/r;Ljava/lang/String;ZLcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
