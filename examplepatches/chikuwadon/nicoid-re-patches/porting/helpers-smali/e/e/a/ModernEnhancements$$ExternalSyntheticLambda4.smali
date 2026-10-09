.class public final synthetic Le/e/a/ModernEnhancements$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:Ljava/lang/Object;

.field public final synthetic f$2:Landroid/app/Service;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Landroid/app/Service;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda4;->f$0:I

    iput-object p2, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda4;->f$1:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda4;->f$2:Landroid/app/Service;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 0
    iget v0, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda4;->f$0:I

    iget-object v1, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda4;->f$1:Ljava/lang/Object;

    iget-object v2, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda4;->f$2:Landroid/app/Service;

    invoke-static {v0, v1, v2, p1, p2}, Le/e/a/ModernEnhancements;->lambda$choose$6(ILjava/lang/Object;Landroid/app/Service;Landroid/content/DialogInterface;I)V

    return-void
.end method
