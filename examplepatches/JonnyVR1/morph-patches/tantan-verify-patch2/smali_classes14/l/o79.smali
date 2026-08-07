.class public final synthetic Ll/o79;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r79;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/r79;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o79;->a:Ll/r79;

    iput-object p2, p0, Ll/o79;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o79;->a:Ll/r79;

    iget-object p0, p0, Ll/o79;->b:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LikeUser;

    invoke-static {v0, p0, p1}, Ll/r79;->f(Ll/r79;Ljava/util/List;Lcom/p1/mobile/putong/core/data/LikeUser;)V

    return-void
.end method
