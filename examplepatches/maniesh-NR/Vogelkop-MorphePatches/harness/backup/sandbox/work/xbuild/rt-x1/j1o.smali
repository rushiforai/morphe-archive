.class public final Lj1o;
.super Lg1o;
.source "SourceFile"


# instance fields
.field public final g:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .registers 11

    const v4, 0x7f060cb9

    const/4 v6, 0x2

    const v2, 0x7f08068b

    const v3, 0x7f140470

    move-object v0, p0

    move v5, p1

    move-object v1, p2

    invoke-direct/range {v0 .. v6}, Lg1o;-><init>(Ljava/lang/String;IIIII)V

    iput-object p3, v0, Lj1o;->g:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lj1o;->g:Ljava/lang/String;

    return-object p0
.end method
