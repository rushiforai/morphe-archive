.class public final synthetic Le/e/a/ModernEnhancements$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/ModernEnhancements$State;

.field public final synthetic f$1:I

.field public final synthetic f$2:Ljava/lang/Object;

.field public final synthetic f$3:I

.field public final synthetic f$4:Landroid/app/Service;

.field public final synthetic f$5:Ljava/lang/Exception;


# direct methods
.method public synthetic constructor <init>(Le/e/a/ModernEnhancements$State;ILjava/lang/Object;ILandroid/app/Service;Ljava/lang/Exception;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda9;->f$0:Le/e/a/ModernEnhancements$State;

    iput p2, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda9;->f$1:I

    iput-object p3, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda9;->f$2:Ljava/lang/Object;

    iput p4, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda9;->f$3:I

    iput-object p5, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda9;->f$4:Landroid/app/Service;

    iput-object p6, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda9;->f$5:Ljava/lang/Exception;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    .line 0
    iget-object v0, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda9;->f$0:Le/e/a/ModernEnhancements$State;

    iget v1, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda9;->f$1:I

    iget-object v2, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda9;->f$2:Ljava/lang/Object;

    iget v3, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda9;->f$3:I

    iget-object v4, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda9;->f$4:Landroid/app/Service;

    iget-object v5, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda9;->f$5:Ljava/lang/Exception;

    invoke-static/range {v0 .. v5}, Le/e/a/ModernEnhancements;->lambda$quality$8(Le/e/a/ModernEnhancements$State;ILjava/lang/Object;ILandroid/app/Service;Ljava/lang/Exception;)V

    return-void
.end method
