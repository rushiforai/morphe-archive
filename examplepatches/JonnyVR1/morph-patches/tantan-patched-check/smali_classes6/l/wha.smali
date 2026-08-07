.class public final synthetic Ll/wha;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Followship;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wha;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/wha;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/wha;->c:Lcom/p1/mobile/putong/data/Followship;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wha;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/wha;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/wha;->c:Lcom/p1/mobile/putong/data/Followship;

    invoke-static {v0, v1, p0}, Ll/jka;->k6(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Followship;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
