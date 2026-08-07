.class public final synthetic Lcom/quickjs/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/EventQueue$Event;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;JILjava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/d;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/d;->b:J

    iput p4, p0, Lcom/quickjs/d;->c:I

    iput-object p5, p0, Lcom/quickjs/d;->d:Ljava/lang/String;

    iput p6, p0, Lcom/quickjs/d;->e:I

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/quickjs/d;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/d;->b:J

    iget v3, p0, Lcom/quickjs/d;->c:I

    iget-object v4, p0, Lcom/quickjs/d;->d:Ljava/lang/String;

    iget v5, p0, Lcom/quickjs/d;->e:I

    invoke-static/range {v0 .. v5}, Lcom/quickjs/EventQueue;->w(Lcom/quickjs/EventQueue;JILjava/lang/String;I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
