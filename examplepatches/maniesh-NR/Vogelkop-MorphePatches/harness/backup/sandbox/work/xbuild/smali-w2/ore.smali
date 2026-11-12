.class public final Lore;
.super Lt7j;
.source "SourceFile"


# instance fields
.field public final j:Lc15;


# direct methods
.method public constructor <init>(Ltm5;Lc15;)V
    .registers 3

    invoke-direct {p0, p1}, Lt7j;-><init>(Ltm5;)V

    iput-object p2, p0, Lore;->j:Lc15;

    return-void
.end method


# virtual methods
.method public final a(Lisd;)Lk7j;
    .registers 3

    new-instance v0, Lqu8;

    invoke-direct {v0, p0, p1}, Lqu8;-><init>(Lore;Lisd;)V

    return-object v0
.end method
