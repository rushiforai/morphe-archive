.class public final Lhve;
.super Lr9i;
.source "SourceFile"


# instance fields
.field public final h:Luqe;


# direct methods
.method public constructor <init>(Luqe;Lvue;Lvue;Ldmg;)V
    .registers 11

    const/16 v5, 0x16

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lr9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, v0, Lhve;->h:Luqe;

    return-void
.end method


# virtual methods
.method public final J(Loqe;)Ljava/lang/String;
    .registers 2

    check-cast p1, Lfre;

    iget-object p0, p1, Lfre;->D:Ljb8;

    iget-object p0, p0, Ljb8;->a:Ljava/lang/String;

    return-object p0
.end method
