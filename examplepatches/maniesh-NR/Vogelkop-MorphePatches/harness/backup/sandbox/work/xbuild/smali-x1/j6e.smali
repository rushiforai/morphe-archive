.class public final Lj6e;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll6e;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILk6e;)V
    .registers 15

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v2, 0x5

    if-eq p5, v2, :cond_4f

    invoke-static {p2}, Ll6e;->p(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_26

    new-instance v2, Lf1a;

    new-instance v6, Li6e;

    invoke-direct {v6, p6, v4}, Li6e;-><init>(Lk6e;B)V

    new-instance v7, Li6e;

    const/4 v3, 0x1

    invoke-direct {v7, p6, v3}, Li6e;-><init>(Lk6e;B)V

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move-object v0, v2

    move-object v2, p2

    invoke-direct/range {v0 .. v7}, Lf1a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILi6e;Li6e;)V

    iput-object v0, p0, Lj6e;->a:Ll6e;

    return-void

    :cond_26
    sget-object v0, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p2}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\."

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    :goto_33
    if-ge v4, v1, :cond_4f

    aget-object v3, v0, v4

    const-string v5, "yandex"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4c

    new-instance v0, Lfco;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move v1, p5

    invoke-direct/range {v0 .. v5}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lj6e;->a:Ll6e;

    return-void

    :cond_4c
    add-int/lit8 v4, v4, 0x1

    goto :goto_33

    :cond_4f
    if-eq p5, v2, :cond_7d

    sget-object v0, Ll6e;->k:Lhr5;

    const-string v0, "opera-aria://ui/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_68

    new-instance v0, Ll42;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move v1, p5

    invoke-direct/range {v0 .. v5}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lj6e;->a:Ll6e;

    return-void

    :cond_68
    const-string v0, "https://chatgpt.com/?q"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7d

    new-instance v0, Liu4;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move v1, p5

    invoke-direct/range {v0 .. v5}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lj6e;->a:Ll6e;

    return-void

    :cond_7d
    new-instance v0, Ll6e;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move v1, p5

    invoke-direct/range {v0 .. v5}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lj6e;->a:Ll6e;

    return-void
.end method
