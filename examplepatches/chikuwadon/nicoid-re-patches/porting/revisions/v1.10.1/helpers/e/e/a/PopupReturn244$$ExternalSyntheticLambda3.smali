.class public final synthetic Le/e/a/PopupReturn244$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/PopupReturn244$Pending;


# direct methods
.method public synthetic constructor <init>(Le/e/a/PopupReturn244$Pending;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PopupReturn244$$ExternalSyntheticLambda3;->f$0:Le/e/a/PopupReturn244$Pending;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/PopupReturn244$$ExternalSyntheticLambda3;->f$0:Le/e/a/PopupReturn244$Pending;

    invoke-static {v0}, Le/e/a/PopupReturn244;->lambda$0(Le/e/a/PopupReturn244$Pending;)V

    return-void
.end method
