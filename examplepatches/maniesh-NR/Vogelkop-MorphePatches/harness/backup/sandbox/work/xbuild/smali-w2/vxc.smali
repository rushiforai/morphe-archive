.class public final Lvxc;
.super Lxxc;
.source "SourceFile"


# instance fields
.field public final d:Lfdn;


# direct methods
.method public constructor <init>(Lrcd;Lrcd;Lfdn;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lxxc;-><init>(Lrcd;Lrcd;)V

    iput-object p3, p0, Lvxc;->d:Lfdn;

    return-void
.end method


# virtual methods
.method public final e()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lvxc;->d:Lfdn;

    iget-object p0, p0, Lfdn;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final f()Lfdn;
    .registers 1

    iget-object p0, p0, Lvxc;->d:Lfdn;

    return-object p0
.end method
