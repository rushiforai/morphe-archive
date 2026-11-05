.class public final synthetic Le/e/a/PlayerButtons192$Binding$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/PlayerButtons192$Binding;


# direct methods
.method public synthetic constructor <init>(Le/e/a/PlayerButtons192$Binding;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlayerButtons192$Binding$$ExternalSyntheticLambda0;->f$0:Le/e/a/PlayerButtons192$Binding;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/PlayerButtons192$Binding$$ExternalSyntheticLambda0;->f$0:Le/e/a/PlayerButtons192$Binding;

    invoke-virtual {v0}, Le/e/a/PlayerButtons192$Binding;->update()V

    return-void
.end method
