.class public final Lh2p;
.super Lf2p;
.source "SourceFile"


# instance fields
.field public final synthetic b:Lpqh;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lpqh;)V
    .registers 3

    iput-object p2, p0, Lh2p;->b:Lpqh;

    invoke-direct {p0, p1}, Lf2p;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final e()V
    .registers 2

    iget-object p0, p0, Lh2p;->b:Lpqh;

    const/4 v0, 0x0

    iput-object v0, p0, Lpqh;->a:Ljava/lang/Object;

    return-void
.end method
