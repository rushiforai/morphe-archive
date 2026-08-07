.class public final synthetic Lcom/quickjs/x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:[Ljava/lang/Object;

.field public final synthetic b:Lcom/quickjs/EventQueue$Event;

.field public final synthetic c:[Ljava/lang/RuntimeException;


# direct methods
.method public synthetic constructor <init>([Ljava/lang/Object;Lcom/quickjs/EventQueue$Event;[Ljava/lang/RuntimeException;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/x;->a:[Ljava/lang/Object;

    iput-object p2, p0, Lcom/quickjs/x;->b:Lcom/quickjs/EventQueue$Event;

    iput-object p3, p0, Lcom/quickjs/x;->c:[Ljava/lang/RuntimeException;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/quickjs/x;->a:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/quickjs/x;->b:Lcom/quickjs/EventQueue$Event;

    iget-object p0, p0, Lcom/quickjs/x;->c:[Ljava/lang/RuntimeException;

    invoke-static {v0, v1, p0}, Lcom/quickjs/EventQueue;->c([Ljava/lang/Object;Lcom/quickjs/EventQueue$Event;[Ljava/lang/RuntimeException;)V

    return-void
.end method
