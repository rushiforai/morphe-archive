.class public Ll/r230$f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/r230;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "f"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Lcom/p1/mobile/putong/data/Picture$ImageUri;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/r230$f;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Ll/r230$f;->c:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    iput-object p1, p0, Ll/r230$f;->a:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Ll/r230$f;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r230$f;->c:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ljava/lang/String;)Ll/r230$f;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r230$f;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
