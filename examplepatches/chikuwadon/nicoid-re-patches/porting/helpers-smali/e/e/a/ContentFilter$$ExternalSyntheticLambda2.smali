.class public final synthetic Le/e/a/ContentFilter$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:[I

.field public final synthetic f$1:I

.field public final synthetic f$2:Ljava/util/Set;

.field public final synthetic f$3:[Z

.field public final synthetic f$4:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>([IILjava/util/Set;[Z[Ljava/lang/Runnable;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda2;->f$0:[I

    iput p2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda2;->f$1:I

    iput-object p3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda2;->f$2:Ljava/util/Set;

    iput-object p4, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda2;->f$3:[Z

    iput-object p5, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda2;->f$4:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda2;->f$0:[I

    iget v1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda2;->f$1:I

    iget-object v2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda2;->f$2:Ljava/util/Set;

    iget-object v3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda2;->f$3:[Z

    iget-object v4, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda2;->f$4:[Ljava/lang/Runnable;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Le/e/a/ContentFilter;->lambda$6([IILjava/util/Set;[Z[Ljava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method
