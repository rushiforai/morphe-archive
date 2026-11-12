.class public final Leaa;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lorm;

.field public final c:Lg8j;

.field public final d:Lrlh;


# direct methods
.method public constructor <init>(Lorm;Lg8j;)V
    .registers 3

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, Leaa;->b:Lorm;

    iput-object p2, p0, Leaa;->c:Lg8j;

    new-instance p1, Ldaa;

    sget-object p2, Lcof;->e:Lh58;

    invoke-direct {p1, p2}, Ldaa;-><init>(Lh58;)V

    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p1

    invoke-static {p1}, La26;->j(Lnak;)Lrlh;

    move-result-object p1

    iput-object p1, p0, Leaa;->d:Lrlh;

    return-void
.end method
