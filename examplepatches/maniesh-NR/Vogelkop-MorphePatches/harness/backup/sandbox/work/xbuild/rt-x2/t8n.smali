.class public final Lt8n;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/ContextWrapper;

.field public final b:I

.field public final c:I


# direct methods
.method public constructor <init>(Landroid/content/ContextWrapper;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lt8n;->a:Landroid/content/ContextWrapper;

    iput p2, p0, Lt8n;->b:I

    instance-of p2, p1, Ls8n;

    if-eqz p2, :cond_10

    check-cast p1, Ls8n;

    iget p1, p1, Ls8n;->b:I

    goto :goto_11

    :cond_10
    const/4 p1, 0x0

    :goto_11
    iput p1, p0, Lt8n;->c:I

    return-void
.end method
