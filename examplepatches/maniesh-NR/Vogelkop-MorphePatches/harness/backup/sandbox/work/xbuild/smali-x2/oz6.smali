.class public final Loz6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lkz6;

.field public final b:Ljon;

.field public final c:Lf99;

.field public final d:Lf99;

.field public final e:Lf99;


# direct methods
.method public constructor <init>(Lkz6;Ljon;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loz6;->a:Lkz6;

    iput-object p2, p0, Loz6;->b:Ljon;

    iget-object p2, p1, Lkz6;->e:Lf99;

    new-instance v0, Lcw;

    const/4 v1, 0x3

    invoke-direct {v0, p2, p0, v1}, Lcw;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p2

    iput-object p2, p0, Loz6;->c:Lf99;

    iget-object p2, p1, Lkz6;->f:Lf99;

    iput-object p2, p0, Loz6;->d:Lf99;

    iget-object p1, p1, Lkz6;->g:Lf99;

    iput-object p1, p0, Loz6;->e:Lf99;

    return-void
.end method
