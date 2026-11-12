.class public final Lqlp;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lcom/android/installreferrer/api/InstallReferrerClient;

.field public synthetic u:Ljava/lang/Object;

.field public v:I


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lqlp;->u:Ljava/lang/Object;

    iget p1, p0, Lqlp;->v:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lqlp;->v:I

    const/4 p1, 0x0

    invoke-static {p1, p0}, Lzlp;->a(Landroid/content/Context;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
