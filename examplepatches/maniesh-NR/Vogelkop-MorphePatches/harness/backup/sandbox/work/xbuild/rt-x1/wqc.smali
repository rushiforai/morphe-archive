.class public final Lwqc;
.super Lq59;
.source "SourceFile"


# instance fields
.field public final synthetic e:Lakc;


# direct methods
.method public constructor <init>(Lakc;Lhx5;Lve9;)V
    .registers 4

    iput-object p1, p0, Lwqc;->e:Lakc;

    invoke-direct {p0, p2, p3}, Lq59;-><init>(Lekc;Lcom/opera/api/Callback;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)Z
    .registers 2

    check-cast p1, Lakc;

    if-eqz p1, :cond_e

    iget-object p0, p0, Lwqc;->e:Lakc;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method
