.class public final synthetic Ll/plg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic a:Ll/qlg;


# direct methods
.method public synthetic constructor <init>(Ll/qlg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/plg;->a:Ll/qlg;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/plg;->a:Ll/qlg;

    invoke-static {p0, p1}, Ll/qlg;->l(Ll/qlg;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
