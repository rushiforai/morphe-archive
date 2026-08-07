.class public final synthetic Ll/lck0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xc00;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/xc00;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lck0;->a:Ll/xc00;

    iput-boolean p2, p0, Ll/lck0;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lck0;->a:Ll/xc00;

    iget-boolean p0, p0, Ll/lck0;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->a0(Ll/xc00;ZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/UserTagsData;

    move-result-object p0

    return-object p0
.end method
