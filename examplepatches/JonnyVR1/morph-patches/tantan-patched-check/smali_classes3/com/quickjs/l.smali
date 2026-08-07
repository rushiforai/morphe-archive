.class public final synthetic Lcom/quickjs/l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/EventQueue$Event;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J

.field public final synthetic c:Lcom/quickjs/JSValue;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/l;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/l;->b:J

    iput-object p4, p0, Lcom/quickjs/l;->c:Lcom/quickjs/JSValue;

    iput-object p5, p0, Lcom/quickjs/l;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/quickjs/l;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/l;->b:J

    iget-object v3, p0, Lcom/quickjs/l;->c:Lcom/quickjs/JSValue;

    iget-object p0, p0, Lcom/quickjs/l;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/quickjs/EventQueue;->q(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
