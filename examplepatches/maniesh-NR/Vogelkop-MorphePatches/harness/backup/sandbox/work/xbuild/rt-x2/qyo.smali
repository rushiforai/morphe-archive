.class public final Lqyo;
.super Lejo;
.source "SourceFile"


# instance fields
.field public final synthetic b:Lbzo;


# direct methods
.method public constructor <init>(Lbzo;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqyo;->b:Lbzo;

    return-void
.end method


# virtual methods
.method public final h(Lpqo;Lg94;)V
    .registers 8

    iget-object v0, p0, Lqyo;->b:Lbzo;

    iget-object v1, v0, Lbzo;->i:Lmhk;

    iget-object v2, p1, Lpqo;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lmhk;->b(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Lmhk;->a(Lpqo;)I

    move-result v2

    const/4 v3, 0x1

    sget-object v4, Lbm;->d:Lbm;

    if-lt v2, v3, :cond_43

    invoke-virtual {v1, p1}, Lmhk;->a(Lpqo;)I

    move-result p0

    sget v2, Lg1p;->b:I

    if-gt p0, v2, :cond_27

    new-instance p0, Le1p;

    iget-object v0, v0, Lbzo;->a:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Le1p;-><init>(Landroid/content/Context;Lmhk;Ll0p;)V

    sget-object v0, Lg94;->Io:Lt14;

    invoke-virtual {p0, p1, v0}, Le1p;->h(Lpqo;Lg94;)V

    :cond_27
    invoke-virtual {v1, p1}, Lmhk;->c(Lpqo;)Lvho;

    move-result-object p0

    if-eqz p0, :cond_33

    new-instance p1, Lmio;

    invoke-direct {p1, p0}, Lmio;-><init>(Ljava/lang/Object;)V

    goto :goto_3d

    :cond_33
    new-instance p0, Lzno;

    invoke-direct {p0, v4}, Lzno;-><init>(Lbm;)V

    new-instance p1, Llio;

    invoke-direct {p1, p0}, Llio;-><init>(Ljava/lang/Exception;)V

    :goto_3d
    check-cast p2, Lroj;

    invoke-virtual {p2, p1}, Lroj;->l(Ljava/lang/Object;)V

    return-void

    :cond_43
    iget-object p0, p0, Lejo;->a:Ljava/lang/Object;

    check-cast p0, Le1p;

    if-eqz p0, :cond_4d

    invoke-virtual {p0, p1, p2}, Le1p;->h(Lpqo;Lg94;)V

    return-void

    :cond_4d
    new-instance p0, Lzno;

    invoke-direct {p0, v4}, Lzno;-><init>(Lbm;)V

    new-instance p1, Llio;

    invoke-direct {p1, p0}, Llio;-><init>(Ljava/lang/Exception;)V

    goto :goto_3d
.end method
