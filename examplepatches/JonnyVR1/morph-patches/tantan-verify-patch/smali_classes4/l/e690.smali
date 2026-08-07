.class public final synthetic Ll/e690;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Privilege;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/PurchaseType;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;ZLcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e690;->a:Lcom/p1/mobile/putong/core/data/Privilege;

    iput-object p2, p0, Ll/e690;->b:Ljava/util/List;

    iput-boolean p3, p0, Ll/e690;->c:Z

    iput-object p4, p0, Ll/e690;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e690;->a:Lcom/p1/mobile/putong/core/data/Privilege;

    iget-object v1, p0, Ll/e690;->b:Ljava/util/List;

    iget-boolean v2, p0, Ll/e690;->c:Z

    iget-object p0, p0, Ll/e690;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Privilege;

    invoke-static {v0, v1, v2, p0, p1}, Ll/j690;->e(Lcom/p1/mobile/putong/core/data/Privilege;Ljava/util/List;ZLcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    return-void
.end method
