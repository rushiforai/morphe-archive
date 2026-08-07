.class public final synthetic Lcom/quickjs/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/EventQueue$Event;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/f;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/f;->b:J

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/quickjs/f;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/f;->b:J

    invoke-static {v0, v1, v2}, Lcom/quickjs/EventQueue;->i(Lcom/quickjs/EventQueue;J)Lcom/quickjs/JSValue;

    move-result-object p0

    return-object p0
.end method
