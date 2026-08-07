.class public final synthetic Lcom/quickjs/i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/EventQueue$Event;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J

.field public final synthetic c:Lcom/quickjs/JSArray;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;JLcom/quickjs/JSArray;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/i;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/i;->b:J

    iput-object p4, p0, Lcom/quickjs/i;->c:Lcom/quickjs/JSArray;

    iput p5, p0, Lcom/quickjs/i;->d:I

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/quickjs/i;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/i;->b:J

    iget-object v3, p0, Lcom/quickjs/i;->c:Lcom/quickjs/JSArray;

    iget p0, p0, Lcom/quickjs/i;->d:I

    invoke-static {v0, v1, v2, v3, p0}, Lcom/quickjs/EventQueue;->k(Lcom/quickjs/EventQueue;JLcom/quickjs/JSArray;I)Lcom/quickjs/JSValue;

    move-result-object p0

    return-object p0
.end method
