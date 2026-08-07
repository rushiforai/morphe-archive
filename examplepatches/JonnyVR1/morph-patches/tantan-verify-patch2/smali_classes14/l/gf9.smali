.class public final synthetic Ll/gf9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xf9;


# direct methods
.method public synthetic constructor <init>(Ll/xf9;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gf9;->a:Ll/xf9;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gf9;->a:Ll/xf9;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LikedUser;

    invoke-static {p0, p1}, Ll/xf9;->v3(Ll/xf9;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    return-void
.end method
