.class public final synthetic Ll/je;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/VerifyData;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/VerifyData;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/je;->a:Lcom/p1/mobile/putong/data/VerifyData;

    iput-boolean p2, p0, Ll/je;->b:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/je;->a:Lcom/p1/mobile/putong/data/VerifyData;

    iget-boolean p0, p0, Ll/je;->b:Z

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/account/api/a;->o(Lcom/p1/mobile/putong/data/VerifyData;Z)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
