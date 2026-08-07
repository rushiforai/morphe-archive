.class public final synthetic Ll/lvf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/api/FacebookApi;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/api/FacebookApi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lvf;->a:Lcom/p1/mobile/putong/api/api/FacebookApi;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lvf;->a:Lcom/p1/mobile/putong/api/api/FacebookApi;

    check-cast p1, Lcom/p1/mobile/putong/data/FBAlbums;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->k(Lcom/p1/mobile/putong/api/api/FacebookApi;Lcom/p1/mobile/putong/data/FBAlbums;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
