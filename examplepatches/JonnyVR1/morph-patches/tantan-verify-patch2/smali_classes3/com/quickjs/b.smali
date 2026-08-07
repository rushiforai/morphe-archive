.class public final synthetic Lcom/quickjs/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/EventQueue$Event;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J

.field public final synthetic c:I

.field public final synthetic d:Lcom/quickjs/JSValue;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;JILcom/quickjs/JSValue;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/b;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/b;->b:J

    iput p4, p0, Lcom/quickjs/b;->c:I

    iput-object p5, p0, Lcom/quickjs/b;->d:Lcom/quickjs/JSValue;

    iput-object p6, p0, Lcom/quickjs/b;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/quickjs/b;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/b;->b:J

    iget v3, p0, Lcom/quickjs/b;->c:I

    iget-object v4, p0, Lcom/quickjs/b;->d:Lcom/quickjs/JSValue;

    iget-object v5, p0, Lcom/quickjs/b;->e:Ljava/lang/String;

    invoke-static/range {v0 .. v5}, Lcom/quickjs/EventQueue;->p(Lcom/quickjs/EventQueue;JILcom/quickjs/JSValue;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
