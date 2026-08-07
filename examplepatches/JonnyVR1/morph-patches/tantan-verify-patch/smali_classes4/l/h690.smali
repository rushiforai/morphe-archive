.class public final synthetic Ll/h690;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Privilege;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h690;->a:Lcom/p1/mobile/putong/core/data/Privilege;

    iput-object p2, p0, Ll/h690;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h690;->a:Lcom/p1/mobile/putong/core/data/Privilege;

    iget-object p0, p0, Ll/h690;->b:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Privilege;

    invoke-static {v0, p0, p1}, Ll/j690;->b(Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V

    return-void
.end method
