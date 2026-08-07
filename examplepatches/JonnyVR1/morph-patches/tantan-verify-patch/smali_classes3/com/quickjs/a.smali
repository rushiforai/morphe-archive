.class public final synthetic Lcom/quickjs/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/EventQueue$Event;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J

.field public final synthetic c:I

.field public final synthetic d:Lcom/quickjs/JSValue;

.field public final synthetic e:Lcom/quickjs/JSValue;

.field public final synthetic f:Lcom/quickjs/JSValue;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;JILcom/quickjs/JSValue;Lcom/quickjs/JSValue;Lcom/quickjs/JSValue;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/a;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/a;->b:J

    iput p4, p0, Lcom/quickjs/a;->c:I

    iput-object p5, p0, Lcom/quickjs/a;->d:Lcom/quickjs/JSValue;

    iput-object p6, p0, Lcom/quickjs/a;->e:Lcom/quickjs/JSValue;

    iput-object p7, p0, Lcom/quickjs/a;->f:Lcom/quickjs/JSValue;

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/quickjs/a;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/a;->b:J

    iget v3, p0, Lcom/quickjs/a;->c:I

    iget-object v4, p0, Lcom/quickjs/a;->d:Lcom/quickjs/JSValue;

    iget-object v5, p0, Lcom/quickjs/a;->e:Lcom/quickjs/JSValue;

    iget-object v6, p0, Lcom/quickjs/a;->f:Lcom/quickjs/JSValue;

    invoke-static/range {v0 .. v6}, Lcom/quickjs/EventQueue;->j(Lcom/quickjs/EventQueue;JILcom/quickjs/JSValue;Lcom/quickjs/JSValue;Lcom/quickjs/JSValue;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
