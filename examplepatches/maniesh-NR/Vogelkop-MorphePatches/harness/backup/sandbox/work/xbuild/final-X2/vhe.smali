.class public final Lvhe;
.super Lejo;
.source "SourceFile"


# instance fields
.field public final synthetic b:Lpqo;


# direct methods
.method public constructor <init>(Lcie;Lkqo;Lpqo;)V
    .registers 4

    iput-object p3, p0, Lvhe;->b:Lpqo;

    invoke-direct {p0, p2}, Lejo;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final d(Lqio;)V
    .registers 4

    new-instance v0, Lkqd;

    iget-object v1, p0, Lvhe;->b:Lpqo;

    invoke-direct {v0, p0, v1}, Lkqd;-><init>(Lvhe;Lpqo;)V

    invoke-virtual {p1, v0}, Lqio;->a(Lg94;)Lqio;

    return-void
.end method
