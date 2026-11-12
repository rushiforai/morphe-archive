.class Lcom/leanplum/annotations/Parser$1;
.super Lcom/leanplum/callbacks/VariableCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/annotations/Parser;->defineVariable(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/reflect/Field;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/leanplum/callbacks/VariableCallback<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic val$field:Ljava/lang/reflect/Field;

.field final synthetic val$hasInstance:Z

.field final synthetic val$var:Lcom/leanplum/Var;

.field final synthetic val$weakInstance:Ljava/lang/ref/WeakReference;


# direct methods
.method public constructor <init>(Ljava/lang/ref/WeakReference;ZLjava/lang/reflect/Field;Lcom/leanplum/Var;)V
    .registers 5

    iput-object p1, p0, Lcom/leanplum/annotations/Parser$1;->val$weakInstance:Ljava/lang/ref/WeakReference;

    iput-boolean p2, p0, Lcom/leanplum/annotations/Parser$1;->val$hasInstance:Z

    iput-object p3, p0, Lcom/leanplum/annotations/Parser$1;->val$field:Ljava/lang/reflect/Field;

    iput-object p4, p0, Lcom/leanplum/annotations/Parser$1;->val$var:Lcom/leanplum/Var;

    invoke-direct {p0}, Lcom/leanplum/callbacks/VariableCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Lcom/leanplum/Var;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/Var<",
            "TT;>;)V"
        }
    .end annotation

    iget-object p1, p0, Lcom/leanplum/annotations/Parser$1;->val$weakInstance:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    iget-boolean v0, p0, Lcom/leanplum/annotations/Parser$1;->val$hasInstance:Z

    if-eqz v0, :cond_c

    if-eqz p1, :cond_10

    :cond_c
    iget-object v0, p0, Lcom/leanplum/annotations/Parser$1;->val$field:Ljava/lang/reflect/Field;

    if-nez v0, :cond_16

    :cond_10
    iget-object p1, p0, Lcom/leanplum/annotations/Parser$1;->val$var:Lcom/leanplum/Var;

    invoke-virtual {p1, p0}, Lcom/leanplum/Var;->removeValueChangedHandler(Lcom/leanplum/callbacks/VariableCallback;)V

    return-void

    :cond_16
    :try_start_16
    invoke-virtual {v0}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    move-result v0

    if-nez v0, :cond_22

    iget-object v1, p0, Lcom/leanplum/annotations/Parser$1;->val$field:Ljava/lang/reflect/Field;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    :cond_22
    iget-object v1, p0, Lcom/leanplum/annotations/Parser$1;->val$field:Ljava/lang/reflect/Field;

    iget-object v2, p0, Lcom/leanplum/annotations/Parser$1;->val$var:Lcom/leanplum/Var;

    invoke-virtual {v2}, Lcom/leanplum/Var;->value()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    if-nez v0, :cond_75

    iget-object p1, p0, Lcom/leanplum/annotations/Parser$1;->val$field:Ljava/lang/reflect/Field;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_35
    .catch Ljava/lang/IllegalArgumentException; {:try_start_16 .. :try_end_35} :catch_4f
    .catch Ljava/lang/IllegalAccessException; {:try_start_16 .. :try_end_35} :catch_36

    return-void

    :catch_36
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Error setting value for field "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/leanplum/annotations/Parser$1;->val$var:Lcom/leanplum/Var;

    invoke-virtual {p0}, Lcom/leanplum/Var;->name()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_75

    :catch_4f
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Invalid value "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/leanplum/annotations/Parser$1;->val$var:Lcom/leanplum/Var;

    invoke-virtual {v1}, Lcom/leanplum/Var;->value()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " for field "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/leanplum/annotations/Parser$1;->val$var:Lcom/leanplum/Var;

    invoke-virtual {p0}, Lcom/leanplum/Var;->name()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_75
    :goto_75
    return-void
.end method
