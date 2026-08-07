.class public final synthetic Ll/swa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/api/Network;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/api/Network;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/swa;->a:Lcom/p1/mobile/putong/api/api/Network;

    iput-object p2, p0, Ll/swa;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/swa;->a:Lcom/p1/mobile/putong/api/api/Network;

    iget-object p0, p0, Ll/swa;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/uwa$a;->B(Lcom/p1/mobile/putong/api/api/Network;Ljava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
