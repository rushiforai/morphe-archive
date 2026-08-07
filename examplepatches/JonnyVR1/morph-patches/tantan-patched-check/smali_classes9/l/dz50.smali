.class public final synthetic Ll/dz50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ez50;

.field public final synthetic b:Lcom/p1/mobile/putong/data/IntlOperationArticles;


# direct methods
.method public synthetic constructor <init>(Ll/ez50;Lcom/p1/mobile/putong/data/IntlOperationArticles;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dz50;->a:Ll/ez50;

    iput-object p2, p0, Ll/dz50;->b:Lcom/p1/mobile/putong/data/IntlOperationArticles;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dz50;->a:Ll/ez50;

    iget-object p0, p0, Ll/dz50;->b:Lcom/p1/mobile/putong/data/IntlOperationArticles;

    invoke-static {v0, p0, p1}, Ll/ez50;->E(Ll/ez50;Lcom/p1/mobile/putong/data/IntlOperationArticles;Landroid/view/View;)V

    return-void
.end method
