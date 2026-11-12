.class public final Lssd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final a:Lekc;

.field public final b:Lf7f;

.field public c:I


# direct methods
.method public constructor <init>(Lekc;Lf7f;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lssd;->c:I

    iput-object p1, p0, Lssd;->a:Lekc;

    iput-object p2, p0, Lssd;->b:Lf7f;

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 4

    iget v0, p0, Lssd;->c:I

    iget-object v1, p0, Lssd;->a:Lekc;

    iget v1, v1, Lekc;->g:I

    if-eq v0, v1, :cond_f

    iput v1, p0, Lssd;->c:I

    iget-object p0, p0, Lssd;->b:Lf7f;

    invoke-interface {p0, p1}, Lf7f;->d0(Ljava/lang/Object;)V

    :cond_f
    return-void
.end method
