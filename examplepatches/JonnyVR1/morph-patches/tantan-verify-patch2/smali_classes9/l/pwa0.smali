.class public final synthetic Ll/pwa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/UserTagData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/UserTagData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pwa0;->a:Lcom/p1/mobile/putong/core/data/UserTagData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pwa0;->a:Lcom/p1/mobile/putong/core/data/UserTagData;

    check-cast p1, Lcom/p1/mobile/putong/core/data/TagCategories;

    invoke-static {p0, p1}, Ll/rwa0;->R(Lcom/p1/mobile/putong/core/data/UserTagData;Lcom/p1/mobile/putong/core/data/TagCategories;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
