.class public final synthetic Ll/e2b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e2b;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/e2b;->b:Lcom/p1/mobile/putong/data/User;

    iput p3, p0, Ll/e2b;->c:I

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e2b;->a:Lcom/p1/mobile/putong/data/User;

    iget-object v1, p0, Ll/e2b;->b:Lcom/p1/mobile/putong/data/User;

    iget p0, p0, Ll/e2b;->c:I

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->s3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;I)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
