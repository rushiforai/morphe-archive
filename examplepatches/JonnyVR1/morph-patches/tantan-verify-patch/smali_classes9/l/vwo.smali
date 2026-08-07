.class public final synthetic Ll/vwo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Z

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(ZZLjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/vwo;->a:Z

    iput-boolean p2, p0, Ll/vwo;->b:Z

    iput-object p3, p0, Ll/vwo;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/vwo;->a:Z

    iget-boolean v1, p0, Ll/vwo;->b:Z

    iget-object p0, p0, Ll/vwo;->c:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Merchandise;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/intlpage/IntlPremiumDiscountPurchaseContentView;->D(ZZLjava/util/List;Lcom/p1/mobile/putong/core/data/Merchandise;)V

    return-void
.end method
