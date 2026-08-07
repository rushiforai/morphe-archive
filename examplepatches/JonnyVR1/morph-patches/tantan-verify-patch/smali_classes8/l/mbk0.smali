.class public final synthetic Ll/mbk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mbk0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/mbk0;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mbk0;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/mbk0;->b:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->q(Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    move-result-object p0

    return-object p0
.end method
