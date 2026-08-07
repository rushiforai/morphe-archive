.class public final Ll/jst0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fst0;


# instance fields
.field public final a:Ll/grw0;


# direct methods
.method public constructor <init>(Ll/grw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jst0;->a:Ll/grw0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/util/Map;)V
    .locals 1

    .line 1
    const-string v0, "content_vertical_opted_out"

    .line 2
    .line 3
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget-object p0, p0, Ll/jst0;->a:Ll/grw0;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ll/grw0;->u(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
