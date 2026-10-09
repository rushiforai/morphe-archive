.class public final synthetic Le/e/a/ContentFilter$$ExternalSyntheticLambda14;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:[I

.field public final synthetic f$1:Landroid/widget/Button;

.field public final synthetic f$2:[Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>([ILandroid/widget/Button;[Ljava/lang/String;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda14;->f$0:[I

    iput-object p2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda14;->f$1:Landroid/widget/Button;

    iput-object p3, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda14;->f$2:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda14;->f$0:[I

    iget-object v1, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda14;->f$1:Landroid/widget/Button;

    iget-object v2, p0, Le/e/a/ContentFilter$$ExternalSyntheticLambda14;->f$2:[Ljava/lang/String;

    invoke-static {v0, v1, v2, p1, p2}, Le/e/a/ContentFilter;->lambda$13([ILandroid/widget/Button;[Ljava/lang/String;Landroid/content/DialogInterface;I)V

    return-void
.end method
