.class public final synthetic Ll/xc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/pcj;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VerifyData;


# direct methods
.method public synthetic constructor <init>(Ll/pcj;Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xc;->a:Ll/pcj;

    iput-object p2, p0, Ll/xc;->b:Lcom/p1/mobile/putong/data/VerifyData;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xc;->a:Ll/pcj;

    iget-object p0, p0, Ll/xc;->b:Lcom/p1/mobile/putong/data/VerifyData;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/account/api/a;->z0(Ll/pcj;Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
