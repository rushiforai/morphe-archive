.class public final synthetic Le/e/a/ModernEnhancements$9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/ModernEnhancements;"
    method = "lambda$quality$7"
    proto = "(Le/e/a/ModernEnhancements$State;ILjava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;IJZLandroid/app/Service;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/ModernEnhancements$State;

.field public final synthetic f$1:I

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Ljava/lang/Object;

.field public final synthetic f$4:Ljava/lang/String;

.field public final synthetic f$5:Ljava/lang/Object;

.field public final synthetic f$6:I

.field public final synthetic f$7:J

.field public final synthetic f$8:Z

.field public final synthetic f$9:Landroid/app/Service;


# direct methods
.method public synthetic constructor <init>(Le/e/a/ModernEnhancements$State;ILjava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;IJZLandroid/app/Service;)V
    .registers 12

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernEnhancements$9;->f$0:Le/e/a/ModernEnhancements$State;

    iput p2, p0, Le/e/a/ModernEnhancements$9;->f$1:I

    iput-object p3, p0, Le/e/a/ModernEnhancements$9;->f$2:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/ModernEnhancements$9;->f$3:Ljava/lang/Object;

    iput-object p5, p0, Le/e/a/ModernEnhancements$9;->f$4:Ljava/lang/String;

    iput-object p6, p0, Le/e/a/ModernEnhancements$9;->f$5:Ljava/lang/Object;

    iput p7, p0, Le/e/a/ModernEnhancements$9;->f$6:I

    iput-wide p8, p0, Le/e/a/ModernEnhancements$9;->f$7:J

    iput-boolean p10, p0, Le/e/a/ModernEnhancements$9;->f$8:Z

    iput-object p11, p0, Le/e/a/ModernEnhancements$9;->f$9:Landroid/app/Service;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 12

    .line 0
    iget-object v0, p0, Le/e/a/ModernEnhancements$9;->f$0:Le/e/a/ModernEnhancements$State;

    iget v1, p0, Le/e/a/ModernEnhancements$9;->f$1:I

    iget-object v2, p0, Le/e/a/ModernEnhancements$9;->f$2:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/ModernEnhancements$9;->f$3:Ljava/lang/Object;

    iget-object v4, p0, Le/e/a/ModernEnhancements$9;->f$4:Ljava/lang/String;

    iget-object v5, p0, Le/e/a/ModernEnhancements$9;->f$5:Ljava/lang/Object;

    iget v6, p0, Le/e/a/ModernEnhancements$9;->f$6:I

    iget-wide v7, p0, Le/e/a/ModernEnhancements$9;->f$7:J

    iget-boolean v9, p0, Le/e/a/ModernEnhancements$9;->f$8:Z

    iget-object v10, p0, Le/e/a/ModernEnhancements$9;->f$9:Landroid/app/Service;

    invoke-static/range {v0 .. v10}, Le/e/a/ModernEnhancements;->lambda$quality$7(Le/e/a/ModernEnhancements$State;ILjava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;IJZLandroid/app/Service;)V

    return-void
.end method
