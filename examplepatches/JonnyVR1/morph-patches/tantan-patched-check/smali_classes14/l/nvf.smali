.class public final synthetic Ll/nvf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/api/FacebookApi;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/api/FacebookApi;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nvf;->a:Lcom/p1/mobile/putong/api/api/FacebookApi;

    iput-boolean p2, p0, Ll/nvf;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nvf;->a:Lcom/p1/mobile/putong/api/api/FacebookApi;

    iget-boolean p0, p0, Ll/nvf;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/data/FBAlbums;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->i(Lcom/p1/mobile/putong/api/api/FacebookApi;ZLcom/p1/mobile/putong/data/FBAlbums;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
