.class public Ll/ht0;
.super Ll/gt0;
.source "SourceFile"


# static fields
.field public static final m:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final n:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/ht0$a;

    .line 2
    .line 3
    const-string v1, "viewHeight"

    .line 4
    .line 5
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 6
    .line 7
    invoke-direct {v0, v2, v1}, Ll/ht0$a;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/ht0;->m:Landroid/util/Property;

    .line 11
    .line 12
    new-instance v0, Ll/ht0$b;

    .line 13
    .line 14
    const-string v1, "viewWidth"

    .line 15
    .line 16
    invoke-direct {v0, v2, v1}, Ll/ht0$b;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Ll/ht0;->n:Landroid/util/Property;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gt0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
