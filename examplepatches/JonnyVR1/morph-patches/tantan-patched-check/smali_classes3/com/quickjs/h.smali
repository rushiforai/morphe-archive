.class public final synthetic Lcom/quickjs/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/EventQueue$Event;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;JI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/h;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/h;->b:J

    iput p4, p0, Lcom/quickjs/h;->c:I

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/quickjs/h;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/h;->b:J

    iget p0, p0, Lcom/quickjs/h;->c:I

    invoke-static {v0, v1, v2, p0}, Lcom/quickjs/EventQueue;->y(Lcom/quickjs/EventQueue;JI)Lcom/quickjs/JSFunction;

    move-result-object p0

    return-object p0
.end method
