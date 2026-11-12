.class Lcom/leanplum/Var$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/Var;->update()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/Var;


# direct methods
.method public constructor <init>(Lcom/leanplum/Var;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/Var$4;->this$0:Lcom/leanplum/Var;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 1

    iget-object p0, p0, Lcom/leanplum/Var$4;->this$0:Lcom/leanplum/Var;

    # invokes: Lcom/leanplum/Var;->triggerFileIsReady()V
    invoke-static {p0}, Lcom/leanplum/Var;->access$400(Lcom/leanplum/Var;)V

    return-void
.end method
