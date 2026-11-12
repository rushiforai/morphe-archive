.class public final Lpag;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/net/URI;

.field public final b:Ljava/net/HttpCookie;


# direct methods
.method public constructor <init>(Ljava/net/URI;Ljava/net/HttpCookie;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpag;->a:Ljava/net/URI;

    iput-object p2, p0, Lpag;->b:Ljava/net/HttpCookie;

    return-void
.end method
