.class public final synthetic Lcom/quickjs/b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J

.field public final synthetic c:Lcom/quickjs/JSValue;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/b0;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/b0;->b:J

    iput-object p4, p0, Lcom/quickjs/b0;->c:Lcom/quickjs/JSValue;

    iput-object p5, p0, Lcom/quickjs/b0;->d:Ljava/lang/String;

    iput-object p6, p0, Lcom/quickjs/b0;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/quickjs/b0;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/b0;->b:J

    iget-object v3, p0, Lcom/quickjs/b0;->c:Lcom/quickjs/JSValue;

    iget-object v4, p0, Lcom/quickjs/b0;->d:Ljava/lang/String;

    iget-object v5, p0, Lcom/quickjs/b0;->e:Ljava/lang/Object;

    invoke-static/range {v0 .. v5}, Lcom/quickjs/EventQueue;->u(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
