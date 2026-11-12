.class public final Lbyg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/HashMap;

.field public final b:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Lyqa;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p1, Lyqa;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lbyg;->a:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    iget-object p1, p1, Lyqa;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lbyg;->b:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final a(Loup;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5

    new-instance v0, Layg;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Layg;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    iget-object p0, p0, Lbyg;->a:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1e

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvxg;

    iget-object p0, p0, Lvxg;->c:Lwxg;

    invoke-interface {p0, p1}, Lwxg;->a(Loup;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_1e
    const-string p0, "No PrimitiveConstructor for "

    const-string p1, " available, see https://developers.google.com/tink/faq/registration_errors"

    invoke-static {v0, p1, p0}, Lsjn;->h(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method
