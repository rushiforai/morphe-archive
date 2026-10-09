.class public final synthetic Le/e/a/ModernEnhancements$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/SpeedSlider$Selection;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Landroid/app/Service;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Landroid/app/Service;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda3;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda3;->f$1:Landroid/app/Service;

    return-void
.end method


# virtual methods
.method public final selected(F)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda3;->f$0:Ljava/lang/Object;

    iget-object v1, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda3;->f$1:Landroid/app/Service;

    invoke-static {v0, v1, p1}, Le/e/a/ModernEnhancements;->lambda$choose$5(Ljava/lang/Object;Landroid/app/Service;F)V

    return-void
.end method
