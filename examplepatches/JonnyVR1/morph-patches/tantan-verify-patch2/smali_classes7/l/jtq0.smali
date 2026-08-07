.class public Ll/jtq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ltq0;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Ll/jtq0;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, p0, Ll/jtq0;->b:Ljava/lang/String;

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string p0, "Name may not be null"

    .line 12
    .line 13
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    throw p0
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jtq0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jtq0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
