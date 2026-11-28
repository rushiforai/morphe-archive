.class public final synthetic Landroidx/core/view/ViewConfigurationCompat$1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/core/util/Supplier;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroid/view/ViewConfiguration;"
    method = "getScaledMinimumFlingVelocity"
    proto = "()I"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/view/ViewConfiguration;


# direct methods
.method public synthetic constructor <init>(Landroid/view/ViewConfiguration;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/core/view/ViewConfigurationCompat$1;->f$0:Landroid/view/ViewConfiguration;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    .line 0
    iget-object v0, p0, Landroidx/core/view/ViewConfigurationCompat$1;->f$0:Landroid/view/ViewConfiguration;

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
