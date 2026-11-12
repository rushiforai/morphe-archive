.class public final synthetic Ltm3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqzi;


# instance fields
.field public final synthetic a:Lgn3;


# direct methods
.method public synthetic constructor <init>(Lgn3;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltm3;->a:Lgn3;

    return-void
.end method


# virtual methods
.method public final W(Z)V
    .registers 2

    iget-object p0, p0, Ltm3;->a:Lgn3;

    if-eqz p1, :cond_b

    iget-object p0, p0, Lgn3;->A:Lum3;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    return-void

    :cond_b
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method
