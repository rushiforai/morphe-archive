.class public final synthetic Lcom/quickjs/a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/EventQueue$Event;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J

.field public final synthetic c:Lcom/quickjs/JSValue;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/a0;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/a0;->b:J

    iput-object p4, p0, Lcom/quickjs/a0;->c:Lcom/quickjs/JSValue;

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/quickjs/a0;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/a0;->b:J

    iget-object p0, p0, Lcom/quickjs/a0;->c:Lcom/quickjs/JSValue;

    invoke-static {v0, v1, v2, p0}, Lcom/quickjs/EventQueue;->e(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
