.class public final synthetic Lcom/quickjs/o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/EventQueue$Event;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J

.field public final synthetic c:Lcom/quickjs/JSValue;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:I

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;Ljava/lang/String;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/o;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/o;->b:J

    iput-object p4, p0, Lcom/quickjs/o;->c:Lcom/quickjs/JSValue;

    iput-object p5, p0, Lcom/quickjs/o;->d:Ljava/lang/String;

    iput p6, p0, Lcom/quickjs/o;->e:I

    iput-boolean p7, p0, Lcom/quickjs/o;->f:Z

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/quickjs/o;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/o;->b:J

    iget-object v3, p0, Lcom/quickjs/o;->c:Lcom/quickjs/JSValue;

    iget-object v4, p0, Lcom/quickjs/o;->d:Ljava/lang/String;

    iget v5, p0, Lcom/quickjs/o;->e:I

    iget-boolean v6, p0, Lcom/quickjs/o;->f:Z

    invoke-static/range {v0 .. v6}, Lcom/quickjs/EventQueue;->b(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;Ljava/lang/String;IZ)Lcom/quickjs/JSFunction;

    move-result-object p0

    return-object p0
.end method
