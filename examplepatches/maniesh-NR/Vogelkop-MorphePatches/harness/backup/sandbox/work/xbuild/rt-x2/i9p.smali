.class public final Li9p;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Landroid/app/Application;

.field public u:Ljava/lang/String;

.field public synthetic v:Ljava/lang/Object;

.field public w:I


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Li9p;->v:Ljava/lang/Object;

    iget p1, p0, Li9p;->w:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Li9p;->w:I

    const/4 p1, 0x0

    invoke-static {p1, p0}, Laap;->a(Landroid/app/Application;Lnt5;)Ljava/io/Serializable;

    move-result-object p0

    return-object p0
.end method
