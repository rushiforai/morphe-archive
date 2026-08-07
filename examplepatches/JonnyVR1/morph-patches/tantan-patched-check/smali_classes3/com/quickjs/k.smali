.class public final synthetic Lcom/quickjs/k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J

.field public final synthetic c:Lcom/quickjs/JSValue;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/k;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/k;->b:J

    iput-object p4, p0, Lcom/quickjs/k;->c:Lcom/quickjs/JSValue;

    iput-object p5, p0, Lcom/quickjs/k;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/quickjs/k;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/k;->b:J

    iget-object v3, p0, Lcom/quickjs/k;->c:Lcom/quickjs/JSValue;

    iget-object p0, p0, Lcom/quickjs/k;->d:Ljava/lang/Object;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/quickjs/EventQueue;->x(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;Ljava/lang/Object;)V

    return-void
.end method
