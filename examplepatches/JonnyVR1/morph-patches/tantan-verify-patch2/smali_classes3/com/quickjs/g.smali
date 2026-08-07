.class public final synthetic Lcom/quickjs/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/EventQueue$Event;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J

.field public final synthetic c:I

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;JIZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/g;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/g;->b:J

    iput p4, p0, Lcom/quickjs/g;->c:I

    iput-boolean p5, p0, Lcom/quickjs/g;->d:Z

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/quickjs/g;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/g;->b:J

    iget v3, p0, Lcom/quickjs/g;->c:I

    iget-boolean p0, p0, Lcom/quickjs/g;->d:Z

    invoke-static {v0, v1, v2, v3, p0}, Lcom/quickjs/EventQueue;->A(Lcom/quickjs/EventQueue;JIZ)Lcom/quickjs/JSFunction;

    move-result-object p0

    return-object p0
.end method
