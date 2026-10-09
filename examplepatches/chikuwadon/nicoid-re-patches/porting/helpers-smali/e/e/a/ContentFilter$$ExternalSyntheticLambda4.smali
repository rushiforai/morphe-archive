.class public final synthetic Le/e/a/ContentFilter$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Ljava/util/Set;

.field public final synthetic f$1:[Z

.field public final synthetic f$2:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Set;[Z[Ljava/lang/Runnable;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda4;->f$0:Ljava/util/Set;

    iput-object p2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda4;->f$1:[Z

    iput-object p3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda4;->f$2:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda4;->f$0:Ljava/util/Set;

    iget-object v1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda4;->f$1:[Z

    iget-object v2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda4;->f$2:[Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, p1}, Le/e/a/ContentFilter;->lambda$8(Ljava/util/Set;[Z[Ljava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method
