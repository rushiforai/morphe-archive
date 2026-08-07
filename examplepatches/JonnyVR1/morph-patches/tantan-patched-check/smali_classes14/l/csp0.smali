.class public Ll/csp0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:I

.field public d:Ljava/lang/String;

.field public e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/csp0;->c:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/csp0;->a:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p2, p0, Ll/csp0;->b:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p3, p0, Ll/csp0;->f:Ljava/io/InputStream;

    .line 12
    .line 13
    return-void
.end method
