.class public final Ll/mdw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vcw0;


# instance fields
.field public final a:Ll/jdw0;

.field public final b:Ll/hdw0;


# direct methods
.method public constructor <init>(Ll/jdw0;Ll/hdw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mdw0;->a:Ll/jdw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mdw0;->b:Ll/hdw0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ll/ucw0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final b(Ll/ucw0;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mdw0;->b:Ll/hdw0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/ucw0;->j()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {v0, p1}, Ll/hdw0;->a(Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/mdw0;->a:Ll/jdw0;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/jdw0;->a(Ljava/util/Map;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
