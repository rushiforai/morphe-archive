.class public final synthetic Ll/jsn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/nsn;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/LikeUser;


# direct methods
.method public synthetic constructor <init>(Ll/nsn;Lcom/p1/mobile/putong/core/data/LikeUser;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jsn;->a:Ll/nsn;

    iput-object p2, p0, Ll/jsn;->b:Lcom/p1/mobile/putong/core/data/LikeUser;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jsn;->a:Ll/nsn;

    iget-object p0, p0, Ll/jsn;->b:Lcom/p1/mobile/putong/core/data/LikeUser;

    invoke-static {v0, p0}, Ll/nsn;->H(Ll/nsn;Lcom/p1/mobile/putong/core/data/LikeUser;)V

    return-void
.end method
