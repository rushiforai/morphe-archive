.class public final Ll6m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmo7;


# instance fields
.field public a:Z

.field public final b:Lno7;

.field public final synthetic c:Lm6m;


# direct methods
.method public constructor <init>(Lm6m;Lno7;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll6m;->c:Lm6m;

    iput-object p2, p0, Ll6m;->b:Lno7;

    return-void
.end method


# virtual methods
.method public final o(Z)V
    .registers 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Ll6m;->a:Z

    iget-object p0, p0, Ll6m;->c:Lm6m;

    xor-int/2addr p1, v0

    invoke-virtual {p0, p1}, Lm6m;->a(Z)V

    return-void
.end method
