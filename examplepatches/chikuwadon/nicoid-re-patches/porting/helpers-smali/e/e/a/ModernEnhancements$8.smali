.class public final synthetic Le/e/a/ModernEnhancements$8;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/ModernEnhancements;"
    method = "lambda$attach$3"
    proto = "(Ljava/lang/Object;Landroid/app/Service;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Landroid/app/Service;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Landroid/app/Service;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernEnhancements$8;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/ModernEnhancements$8;->f$1:Landroid/app/Service;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/ModernEnhancements$8;->f$0:Ljava/lang/Object;

    iget-object v1, p0, Le/e/a/ModernEnhancements$8;->f$1:Landroid/app/Service;

    invoke-static {v0, v1}, Le/e/a/ModernEnhancements;->lambda$attach$3(Ljava/lang/Object;Landroid/app/Service;)V

    return-void
.end method
