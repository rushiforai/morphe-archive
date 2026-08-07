.class public final synthetic Ll/zop;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/IntlVisitor;

.field public final synthetic c:Z

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsItemView;Lcom/p1/mobile/putong/core/data/IntlVisitor;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zop;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsItemView;

    iput-object p2, p0, Ll/zop;->b:Lcom/p1/mobile/putong/core/data/IntlVisitor;

    iput-boolean p3, p0, Ll/zop;->c:Z

    iput-boolean p4, p0, Ll/zop;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zop;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsItemView;

    iget-object v1, p0, Ll/zop;->b:Lcom/p1/mobile/putong/core/data/IntlVisitor;

    iget-boolean v2, p0, Ll/zop;->c:Z

    iget-boolean p0, p0, Ll/zop;->d:Z

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsItemView;->a(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsItemView;Lcom/p1/mobile/putong/core/data/IntlVisitor;ZZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method
