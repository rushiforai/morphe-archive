.class public final Lob2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ly5i;

.field public final b:Lnb2;

.field public final c:Lnb2;


# direct methods
.method public constructor <init>(Ly5i;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lob2;->a:Ly5i;

    new-instance p1, Lnb2;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lnb2;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lob2;->b:Lnb2;

    new-instance p1, Lnb2;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lob2;->c:Lnb2;

    return-void
.end method
