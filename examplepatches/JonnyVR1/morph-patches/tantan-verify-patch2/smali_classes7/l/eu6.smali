.class public interface abstract Ll/eu6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/eu6;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/eu6$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/eu6$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/eu6;->a:Ll/eu6;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public abstract a(Ll/rnl;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rnl;",
            ")",
            "Ljava/util/List<",
            "Ll/du6;",
            ">;"
        }
    .end annotation
.end method

.method public abstract b(Ll/rnl;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rnl;",
            "Ljava/util/List<",
            "Ll/du6;",
            ">;)V"
        }
    .end annotation
.end method
