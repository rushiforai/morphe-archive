.class public final synthetic Lcom/quickjs/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/EventQueue$Event;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J

.field public final synthetic c:J

.field public final synthetic d:I

.field public final synthetic e:D

.field public final synthetic f:J


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;JJIDJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/e;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/e;->b:J

    iput-wide p4, p0, Lcom/quickjs/e;->c:J

    iput p6, p0, Lcom/quickjs/e;->d:I

    iput-wide p7, p0, Lcom/quickjs/e;->e:D

    iput-wide p9, p0, Lcom/quickjs/e;->f:J

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/quickjs/e;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/e;->b:J

    iget-wide v3, p0, Lcom/quickjs/e;->c:J

    iget v5, p0, Lcom/quickjs/e;->d:I

    iget-wide v6, p0, Lcom/quickjs/e;->e:D

    iget-wide v8, p0, Lcom/quickjs/e;->f:J

    invoke-static/range {v0 .. v9}, Lcom/quickjs/EventQueue;->a(Lcom/quickjs/EventQueue;JJIDJ)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
