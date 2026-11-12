.class public final Lozh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lfr6;

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lfr6;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lozh;->a:Lfr6;

    iput-object p2, p0, Lozh;->b:Ljava/lang/Object;

    iput-object p3, p0, Lozh;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    iget-object p0, p0, Lozh;->a:Lfr6;

    invoke-virtual {p0}, Lfr6;->e()Lzqa;

    move-result-object p0

    invoke-static {p0}, Lalo;->X(Lzqa;)Z

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lozh;->a:Lfr6;

    invoke-virtual {p0}, Lfr6;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
