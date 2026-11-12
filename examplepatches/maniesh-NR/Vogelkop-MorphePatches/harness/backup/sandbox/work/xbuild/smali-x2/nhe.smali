.class public final Lnhe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Litm;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnhe;->a:Ljava/lang/String;

    iput-object p2, p0, Lnhe;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Lorb;
    .registers 4

    const-string v0, "named"

    const-string v1, "type"

    invoke-static {v1, v0}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v0

    iget-object v1, p0, Lnhe;->a:Ljava/lang/String;

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lnhe;->b:Ljava/lang/String;

    const-string v1, "email"

    invoke-virtual {v0, p0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method
