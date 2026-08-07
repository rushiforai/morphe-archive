.class public final synthetic Lcom/quickjs/u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/u;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/u;->b:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/quickjs/u;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/u;->b:J

    invoke-static {v0, v1, v2}, Lcom/quickjs/EventQueue;->g(Lcom/quickjs/EventQueue;J)V

    return-void
.end method
