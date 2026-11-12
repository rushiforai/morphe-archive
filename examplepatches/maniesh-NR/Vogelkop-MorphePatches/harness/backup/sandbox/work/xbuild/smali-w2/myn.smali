.class public final Lmyn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lt0g;

.field public final b:Lt0g;

.field public final c:Lt0g;

.field public final d:Lt0g;

.field public final e:Lpuj;

.field public final f:Lt0g;

.field public final g:Lt0g;

.field public h:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Ljtn;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    invoke-static {v0}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object v1

    iput-object v1, p0, Lmyn;->a:Lt0g;

    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    iput-object p1, p0, Lmyn;->b:Lt0g;

    sget-object p1, Litc;->a:Litc;

    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    iput-object p1, p0, Lmyn;->c:Lt0g;

    invoke-static {v0}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    iput-object p1, p0, Lmyn;->d:Lt0g;

    new-instance p1, Lpuj;

    invoke-direct {p1}, Lpuj;-><init>()V

    iput-object p1, p0, Lmyn;->e:Lpuj;

    new-instance p1, Ljvn;

    invoke-direct {p1}, Ljvn;-><init>()V

    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    iput-object p1, p0, Lmyn;->f:Lt0g;

    invoke-static {v0}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    iput-object p1, p0, Lmyn;->g:Lt0g;

    sget-object p0, Ls41;->a:Ls41;

    invoke-static {p0}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    return-void
.end method


# virtual methods
.method public final a()Lktc;
    .registers 1

    iget-object p0, p0, Lmyn;->c:Lt0g;

    invoke-virtual {p0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lktc;

    return-object p0
.end method

.method public final b()Ljvn;
    .registers 1

    iget-object p0, p0, Lmyn;->f:Lt0g;

    invoke-virtual {p0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljvn;

    return-object p0
.end method
