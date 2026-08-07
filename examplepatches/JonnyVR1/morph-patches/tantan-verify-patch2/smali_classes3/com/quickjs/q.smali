.class public final synthetic Lcom/quickjs/q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/EventQueue$Event;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J

.field public final synthetic c:I

.field public final synthetic d:Lcom/quickjs/JSValue;

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;JILcom/quickjs/JSValue;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/q;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/q;->b:J

    iput p4, p0, Lcom/quickjs/q;->c:I

    iput-object p5, p0, Lcom/quickjs/q;->d:Lcom/quickjs/JSValue;

    iput p6, p0, Lcom/quickjs/q;->e:I

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/quickjs/q;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/q;->b:J

    iget v3, p0, Lcom/quickjs/q;->c:I

    iget-object v4, p0, Lcom/quickjs/q;->d:Lcom/quickjs/JSValue;

    iget v5, p0, Lcom/quickjs/q;->e:I

    invoke-static/range {v0 .. v5}, Lcom/quickjs/EventQueue;->z(Lcom/quickjs/EventQueue;JILcom/quickjs/JSValue;I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
