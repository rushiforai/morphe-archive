.class public Ll/kt5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jt5;


# instance fields
.field private final a:Ll/lt5;

.field private b:Ljava/lang/String;

.field private c:Ll/jt5$a;


# direct methods
.method private constructor <init>(Landroid/content/Context;Lcom/idv/identity/ocr/compress/CompressConfig;Ljava/lang/String;Ll/jt5$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/lt5;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2}, Ll/lt5;-><init>(Landroid/content/Context;Lcom/idv/identity/ocr/compress/CompressConfig;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/kt5;->a:Ll/lt5;

    .line 10
    .line 11
    iput-object p3, p0, Ll/kt5;->b:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p4, p0, Ll/kt5;->c:Ll/jt5$a;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic b(Ll/kt5;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kt5;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/kt5;)Ll/jt5$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kt5;->c:Ll/jt5$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static e(Landroid/content/Context;Lcom/idv/identity/ocr/compress/CompressConfig;Ljava/lang/String;Ll/jt5$a;)Ll/jt5;
    .locals 1

    .line 1
    new-instance v0, Ll/kt5;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/kt5;-><init>(Landroid/content/Context;Lcom/idv/identity/ocr/compress/CompressConfig;Ljava/lang/String;Ll/jt5$a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kt5;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kt5;->a:Ll/lt5;

    .line 2
    .line 3
    iget-object v1, p0, Ll/kt5;->b:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v2, Ll/kt5$a;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Ll/kt5$a;-><init>(Ll/kt5;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ll/lt5;->d(Ljava/lang/String;Ll/lt5$c;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
