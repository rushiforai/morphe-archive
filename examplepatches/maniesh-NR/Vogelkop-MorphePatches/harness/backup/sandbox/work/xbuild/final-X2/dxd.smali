.class Ldxd;
.super Lagc;
.source "SourceFile"


# instance fields
.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    iput-object p2, p0, Ldxd;->e:Ljava/lang/String;

    invoke-direct {p0, p1}, Lagc;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    sget-object p1, Llqm;->w:Llqm;

    const/4 v0, 0x0

    iget-object p0, p0, Ldxd;->e:Ljava/lang/String;

    invoke-static {p0, p1, v0}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    const/4 p1, 0x3

    iput p1, p0, Lvx3;->b:I

    const/4 p1, 0x1

    invoke-static {p0, p1, p0}, Lo18;->t(Lvx3;ZLvx3;)V

    return-void
.end method
