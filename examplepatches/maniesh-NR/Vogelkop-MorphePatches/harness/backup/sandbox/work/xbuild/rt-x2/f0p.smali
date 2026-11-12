.class public final Lf0p;
.super Lejo;
.source "SourceFile"


# instance fields
.field public final synthetic b:Lpqo;

.field public final synthetic c:Lg94;

.field public final synthetic d:Le1p;


# direct methods
.method public constructor <init>(Le1p;Lkqo;Lpqo;Lg94;)V
    .registers 5

    iput-object p1, p0, Lf0p;->d:Le1p;

    iput-object p3, p0, Lf0p;->b:Lpqo;

    iput-object p4, p0, Lf0p;->c:Lg94;

    invoke-direct {p0, p2}, Lejo;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final d(Lqio;)V
    .registers 6

    new-instance v0, Lvdi;

    const/16 v1, 0x13

    iget-object v2, p0, Lf0p;->b:Lpqo;

    iget-object v3, p0, Lf0p;->c:Lg94;

    invoke-direct {v0, p0, v2, v3, v1}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lqio;->a(Lg94;)Lqio;

    instance-of p0, p1, Llio;

    if-eqz p0, :cond_21

    new-instance p0, Lzno;

    sget-object p1, Lbm;->h:Lbm;

    invoke-direct {p0, p1}, Lzno;-><init>(Lbm;)V

    new-instance p1, Llio;

    invoke-direct {p1, p0}, Llio;-><init>(Ljava/lang/Exception;)V

    invoke-interface {v3, p1}, Lg94;->l(Ljava/lang/Object;)V

    :cond_21
    return-void
.end method
