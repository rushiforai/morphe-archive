.class public final Ll/l1j$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/l1j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ljava/nio/charset/Charset;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 21
    invoke-direct {p0, v0}, Ll/l1j$a;-><init>(Ljava/nio/charset/Charset;)V

    return-void
.end method

.method public constructor <init>(Ljava/nio/charset/Charset;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/l1j$a;->a:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/l1j$a;->b:Ljava/util/List;

    .line 17
    .line 18
    iput-object p1, p0, Ll/l1j$a;->c:Ljava/nio/charset/Charset;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;)Ll/l1j$a;
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/l1j$a;->a:Ljava/util/List;

    .line 7
    .line 8
    const/4 v6, 0x1

    .line 9
    iget-object v7, p0, Ll/l1j$a;->c:Ljava/nio/charset/Charset;

    .line 10
    .line 11
    const-string v2, " \"\':;<=>@[]^`{}|/\\?#&!$(),~"

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    const/4 v4, 0x0

    .line 15
    const/4 v5, 0x1

    .line 16
    move-object v1, p1

    .line 17
    invoke-static/range {v1 .. v7}, Ll/rnl;->c(Ljava/lang/String;Ljava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/l1j$a;->b:Ljava/util/List;

    .line 25
    .line 26
    iget-object v6, p0, Ll/l1j$a;->c:Ljava/nio/charset/Charset;

    .line 27
    .line 28
    const-string v1, " \"\':;<=>@[]^`{}|/\\?#&!$(),~"

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    const/4 v4, 0x1

    .line 32
    move-object v0, p2

    .line 33
    invoke-static/range {v0 .. v6}, Ll/rnl;->c(Ljava/lang/String;Ljava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_0
    const-string p0, "value == null"

    .line 42
    .line 43
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-object v0

    .line 47
    :cond_1
    const-string p0, "name == null"

    .line 48
    .line 49
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-object v0
.end method

.method public b()Ll/l1j;
    .locals 2

    .line 1
    new-instance v0, Ll/l1j;

    .line 2
    .line 3
    iget-object v1, p0, Ll/l1j$a;->a:Ljava/util/List;

    .line 4
    .line 5
    iget-object p0, p0, Ll/l1j$a;->b:Ljava/util/List;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Ll/l1j;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method
