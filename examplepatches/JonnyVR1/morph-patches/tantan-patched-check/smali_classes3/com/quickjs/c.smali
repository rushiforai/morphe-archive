.class public final synthetic Lcom/quickjs/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:[Ljava/lang/RuntimeException;

.field public final synthetic d:Z

.field public final synthetic e:[Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;Ljava/lang/Runnable;[Ljava/lang/RuntimeException;Z[Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/c;->a:Lcom/quickjs/EventQueue;

    iput-object p2, p0, Lcom/quickjs/c;->b:Ljava/lang/Runnable;

    iput-object p3, p0, Lcom/quickjs/c;->c:[Ljava/lang/RuntimeException;

    iput-boolean p4, p0, Lcom/quickjs/c;->d:Z

    iput-object p5, p0, Lcom/quickjs/c;->e:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/quickjs/c;->a:Lcom/quickjs/EventQueue;

    iget-object v1, p0, Lcom/quickjs/c;->b:Ljava/lang/Runnable;

    iget-object v2, p0, Lcom/quickjs/c;->c:[Ljava/lang/RuntimeException;

    iget-boolean v3, p0, Lcom/quickjs/c;->d:Z

    iget-object p0, p0, Lcom/quickjs/c;->e:[Ljava/lang/Object;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/quickjs/EventQueue;->h(Lcom/quickjs/EventQueue;Ljava/lang/Runnable;[Ljava/lang/RuntimeException;Z[Ljava/lang/Object;)V

    return-void
.end method
