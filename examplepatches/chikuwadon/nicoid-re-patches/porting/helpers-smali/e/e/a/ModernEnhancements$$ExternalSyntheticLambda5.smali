.class public final synthetic Le/e/a/ModernEnhancements$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda5;->f$0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/ModernEnhancements$$ExternalSyntheticLambda5;->f$0:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/ModernEnhancements;->lambda$attach$1(Ljava/lang/Object;)V

    return-void
.end method
