.class public final synthetic Ll/jnf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/intloperation/interesting/SimilarInterestsItemView;

.field public final synthetic b:Ll/knf0;

.field public final synthetic c:I

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/intloperation/interesting/SimilarInterestsItemView;Ll/knf0;ILcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jnf0;->a:Lcom/p1/mobile/putong/core/ui/intloperation/interesting/SimilarInterestsItemView;

    iput-object p2, p0, Ll/jnf0;->b:Ll/knf0;

    iput p3, p0, Ll/jnf0;->c:I

    iput-object p4, p0, Ll/jnf0;->d:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jnf0;->a:Lcom/p1/mobile/putong/core/ui/intloperation/interesting/SimilarInterestsItemView;

    iget-object v1, p0, Ll/jnf0;->b:Ll/knf0;

    iget v2, p0, Ll/jnf0;->c:I

    iget-object p0, p0, Ll/jnf0;->d:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;

    invoke-static {v0, v1, v2, p0, p1}, Ll/knf0;->F(Lcom/p1/mobile/putong/core/ui/intloperation/interesting/SimilarInterestsItemView;Ll/knf0;ILcom/p1/mobile/putong/core/data/SimilarInterestsItemStatusData;Landroid/view/View;)V

    return-void
.end method
