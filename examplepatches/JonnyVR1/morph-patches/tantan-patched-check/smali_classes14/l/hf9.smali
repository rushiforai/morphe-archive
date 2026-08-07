.class public final synthetic Ll/hf9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:I

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;ILjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hf9;->a:Ljava/util/List;

    iput p2, p0, Ll/hf9;->b:I

    iput-object p3, p0, Ll/hf9;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hf9;->a:Ljava/util/List;

    iget v1, p0, Ll/hf9;->b:I

    iget-object p0, p0, Ll/hf9;->c:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LikedUser;

    invoke-static {v0, v1, p0, p1}, Ll/xf9;->p3(Ljava/util/List;ILjava/util/List;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    return-void
.end method
