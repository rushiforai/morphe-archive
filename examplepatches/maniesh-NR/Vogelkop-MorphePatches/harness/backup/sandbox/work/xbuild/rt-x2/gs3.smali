.class public final Lgs3;
.super Lhs3;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 3

    const-string v0, "MOCKED"

    const/4 v1, 0x2

    invoke-direct {p0, v0, v1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    invoke-static {p1}, Ls6e;->b(Landroid/content/Context;)Ls6e;

    move-result-object p0

    iget-object p0, p0, Ls6e;->b:Lvq8;

    if-eqz p0, :cond_d

    iget-object p0, p0, Lvq8;->g:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_d
    const-string p0, ""

    return-object p0
.end method
