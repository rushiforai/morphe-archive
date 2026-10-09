.class public final synthetic Le/e/a/ContentFilter$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:[I

.field public final synthetic f$2:Landroid/widget/Button;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;[ILandroid/widget/Button;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda7;->f$0:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda7;->f$1:[I

    iput-object p3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda7;->f$2:Landroid/widget/Button;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda7;->f$0:Landroid/content/Context;

    iget-object v1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda7;->f$1:[I

    iget-object v2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda7;->f$2:Landroid/widget/Button;

    invoke-static {v0, v1, v2, p1}, Le/e/a/ContentFilter;->lambda$12(Landroid/content/Context;[ILandroid/widget/Button;Landroid/view/View;)V

    return-void
.end method
