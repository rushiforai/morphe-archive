.class public final synthetic Luw9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxq9;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Luw9;->a:B

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    check-cast p1, Le15;

    new-instance v0, Lbre;

    iget-object v2, p1, Le15;->a:Ljava/lang/String;

    iget-object v3, p1, Le15;->b:Ljava/lang/String;

    iget-object v4, p1, Le15;->c:Ljava/lang/String;

    iget-object v5, p1, Le15;->d:Ljava/lang/String;

    iget-byte v1, p0, Luw9;->a:B

    invoke-direct/range {v0 .. v5}, Lbre;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
