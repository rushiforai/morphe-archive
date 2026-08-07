.class public final synthetic Ll/f690;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Privilege;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f690;->a:Ljava/util/List;

    iput-object p2, p0, Ll/f690;->b:Lcom/p1/mobile/putong/core/data/Privilege;

    iput-object p3, p0, Ll/f690;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f690;->a:Ljava/util/List;

    iget-object v1, p0, Ll/f690;->b:Lcom/p1/mobile/putong/core/data/Privilege;

    iget-object p0, p0, Ll/f690;->c:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Privilege;

    invoke-static {v0, v1, p0, p1}, Ll/j690;->d(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V

    return-void
.end method
