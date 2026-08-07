.class public Ll/abe0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/abe0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Landroid/content/Context;

.field public b:Ljava/lang/String;

.field public c:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/abe0$a;->c:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/abe0$a;->a:Landroid/content/Context;

    .line 8
    .line 9
    iput-object p2, p0, Ll/abe0$a;->b:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic a(Ll/abe0$a;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/abe0$a;->a:Landroid/content/Context;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/abe0$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/abe0$a;->c:Z

    return p0
.end method

.method public static bridge synthetic c(Ll/abe0$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/abe0$a;->b:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public d()Ll/abe0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/abe0$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iput-boolean v1, p0, Ll/abe0$a;->c:Z

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/abe0$a;->b:Ljava/lang/String;

    .line 13
    .line 14
    const-string v2, "tantan"

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iput-boolean v1, p0, Ll/abe0$a;->c:Z

    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Ll/abe0$a;->a:Landroid/content/Context;

    .line 25
    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    iput-boolean v1, p0, Ll/abe0$a;->c:Z

    .line 29
    .line 30
    :cond_2
    new-instance v0, Ll/abe0;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-direct {v0, p0, v1}, Ll/abe0;-><init>(Ll/abe0$a;Ll/bbe0;)V

    .line 34
    .line 35
    .line 36
    return-object v0
.end method
