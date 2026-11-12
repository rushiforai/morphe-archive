.class public abstract Lex4;
.super Lv6j;
.source "SourceFile"


# instance fields
.field public final c:Ll08;

.field public d:Lekc;

.field public final e:Lk9;


# direct methods
.method public constructor <init>(I)V
    .registers 3

    invoke-direct {p0, p1}, Lv6j;-><init>(I)V

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lex4;->c:Ll08;

    new-instance p1, Lk9;

    const/16 v0, 0x19

    invoke-direct {p1, p0, v0}, Lk9;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lex4;->e:Lk9;

    return-void
.end method


# virtual methods
.method public d()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lex4;->c:Ll08;

    return-object p0
.end method

.method public abstract g(Lr6j;)V
.end method
