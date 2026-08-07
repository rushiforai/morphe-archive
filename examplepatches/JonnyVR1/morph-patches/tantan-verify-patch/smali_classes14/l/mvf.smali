.class public final synthetic Ll/mvf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/api/FacebookApi;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/api/FacebookApi;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mvf;->a:Lcom/p1/mobile/putong/api/api/FacebookApi;

    iput-boolean p2, p0, Ll/mvf;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mvf;->a:Lcom/p1/mobile/putong/api/api/FacebookApi;

    iget-boolean p0, p0, Ll/mvf;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/data/FBAlbums;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->f(Lcom/p1/mobile/putong/api/api/FacebookApi;ZLcom/p1/mobile/putong/data/FBAlbums;)V

    return-void
.end method
