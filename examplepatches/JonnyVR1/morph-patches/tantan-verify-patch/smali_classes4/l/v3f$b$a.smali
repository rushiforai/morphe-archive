.class Ll/v3f$b$a;
.super Ljava/lang/ThreadLocal;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/v3f$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal<",
        "Ll/v3f$e<",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field final synthetic a:Ll/v3f$b;


# direct methods
.method public constructor <init>(Ll/v3f$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v3f$b$a;->a:Ll/v3f$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ll/v3f$e;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$e<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/v3f$e;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/v3f$e;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic initialValue()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v3f$b$a;->a()Ll/v3f$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
