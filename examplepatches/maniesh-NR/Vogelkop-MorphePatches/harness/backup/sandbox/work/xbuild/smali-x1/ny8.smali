.class public final Lny8;
.super Lmy8;
.source "SourceFile"


# instance fields
.field public final h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorb;)V
    .registers 4

    const-string v0, "publisher_impression"

    invoke-direct {p0, p1, v0}, Lmy8;-><init>(Lorb;Ljava/lang/String;)V

    const-string v0, "following"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lny8;->h:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Lorb;)V
    .registers 3

    invoke-super {p0, p1}, Lmy8;->a(Lorb;)V

    iget-object p0, p0, Lny8;->h:Ljava/lang/String;

    if-eqz p0, :cond_c

    const-string v0, "following"

    invoke-virtual {p1, p0, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_c
    return-void
.end method
