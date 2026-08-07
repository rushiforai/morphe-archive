.class public final synthetic Lcom/quickjs/w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/EventQueue$Event;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J

.field public final synthetic c:Lcom/quickjs/JSObject;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;JLcom/quickjs/JSObject;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/w;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/w;->b:J

    iput-object p4, p0, Lcom/quickjs/w;->c:Lcom/quickjs/JSObject;

    iput-object p5, p0, Lcom/quickjs/w;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/quickjs/w;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/w;->b:J

    iget-object v3, p0, Lcom/quickjs/w;->c:Lcom/quickjs/JSObject;

    iget-object p0, p0, Lcom/quickjs/w;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/quickjs/EventQueue;->v(Lcom/quickjs/EventQueue;JLcom/quickjs/JSObject;Ljava/lang/String;)Lcom/quickjs/JSValue;

    move-result-object p0

    return-object p0
.end method
