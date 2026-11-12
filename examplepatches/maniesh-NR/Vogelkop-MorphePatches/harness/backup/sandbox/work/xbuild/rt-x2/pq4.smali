.class public final Lpq4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcum;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    iput-object p1, p0, Lpq4;->a:Ljava/lang/String;

    iput-object p2, p0, Lpq4;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lorb;
    .registers 4

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-object v1, p0, Lpq4;->a:Ljava/lang/String;

    const-string v2, "locationId"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lpq4;->b:Ljava/lang/String;

    const-string v1, "locationName"

    invoke-virtual {v0, p0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method
