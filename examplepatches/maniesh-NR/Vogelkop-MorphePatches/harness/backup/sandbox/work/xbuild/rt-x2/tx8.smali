.class public final Ltx8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    .line 14
    invoke-direct/range {v0 .. v5}, Ltx8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltx8;->a:Ljava/lang/String;

    iput-object p2, p0, Ltx8;->b:Ljava/lang/String;

    iput-object p3, p0, Ltx8;->c:Ljava/lang/String;

    iput-object p4, p0, Ltx8;->d:Ljava/lang/String;

    iput-object p5, p0, Ltx8;->e:Ljava/lang/String;

    return-void
.end method

.method public static a(Lorb;)Ltx8;
    .registers 8

    const-string v0, "id"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v0, "value"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "content"

    invoke-virtual {p0, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "text"

    invoke-virtual {p0, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v0, "description"

    invoke-virtual {p0, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    new-instance v1, Ltx8;

    invoke-direct/range {v1 .. v6}, Ltx8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method
