.class public interface abstract Ll/d0l;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/d0l;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final b:Ll/d0l;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/d0l$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/d0l$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/d0l;->a:Ll/d0l;

    .line 7
    .line 8
    new-instance v0, Ll/v9r$a;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/v9r$a;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ll/v9r$a;->a()Ll/v9r;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Ll/d0l;->b:Ll/d0l;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public abstract a()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method
