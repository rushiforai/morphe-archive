.class public final synthetic Ll/gck0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/EditTagsData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/EditTagsData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gck0;->a:Lcom/p1/mobile/putong/core/data/EditTagsData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gck0;->a:Lcom/p1/mobile/putong/core/data/EditTagsData;

    check-cast p1, Lcom/p1/mobile/putong/core/data/UserTagData;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/UserCenterBridgeImplementation;->C(Lcom/p1/mobile/putong/core/data/EditTagsData;Lcom/p1/mobile/putong/core/data/UserTagData;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
