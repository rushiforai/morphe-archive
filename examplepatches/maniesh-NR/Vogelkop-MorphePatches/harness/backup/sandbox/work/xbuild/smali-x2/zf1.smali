.class public final Lzf1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Litm;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzf1;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Lorb;
    .registers 3

    const-string v0, "anonymous"

    const-string v1, "type"

    invoke-static {v1, v0}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v0

    iget-object p0, p0, Lzf1;->a:Ljava/lang/String;

    const-string v1, "id"

    invoke-virtual {v0, p0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method
