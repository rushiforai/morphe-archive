.class public final synthetic Lcom/quickjs/n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/EventQueue$Event;


# instance fields
.field public final synthetic a:Lcom/quickjs/EventQueue;

.field public final synthetic b:J

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:I


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/EventQueue;JILjava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/quickjs/n;->a:Lcom/quickjs/EventQueue;

    iput-wide p2, p0, Lcom/quickjs/n;->b:J

    iput p4, p0, Lcom/quickjs/n;->c:I

    iput-object p5, p0, Lcom/quickjs/n;->d:Ljava/lang/String;

    iput-object p6, p0, Lcom/quickjs/n;->e:Ljava/lang/String;

    iput p7, p0, Lcom/quickjs/n;->f:I

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/quickjs/n;->a:Lcom/quickjs/EventQueue;

    iget-wide v1, p0, Lcom/quickjs/n;->b:J

    iget v3, p0, Lcom/quickjs/n;->c:I

    iget-object v4, p0, Lcom/quickjs/n;->d:Ljava/lang/String;

    iget-object v5, p0, Lcom/quickjs/n;->e:Ljava/lang/String;

    iget v6, p0, Lcom/quickjs/n;->f:I

    invoke-static/range {v0 .. v6}, Lcom/quickjs/EventQueue;->t(Lcom/quickjs/EventQueue;JILjava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
