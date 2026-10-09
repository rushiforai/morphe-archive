.class public final synthetic Le/e/a/ModernEnhancements$6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/ModernEnhancements;"
    method = "lambda$attach$1"
    proto = "(Ljava/lang/Object;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernEnhancements$6;->f$0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/ModernEnhancements$6;->f$0:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/ModernEnhancements;->lambda$attach$1(Ljava/lang/Object;)V

    return-void
.end method
