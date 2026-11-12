.class public final Lqk3;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic d:[Lxtb;


# instance fields
.field public final a:Lcom/opera/hype/image/editor/EditImage;

.field public final b:Lok3;

.field public final c:Lfz2;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lpee;

    const-class v1, Lqk3;

    const-string v2, "bitmap"

    const-string v3, "getBitmap()Landroid/graphics/Bitmap;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lqk3;->d:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lcom/opera/hype/image/editor/EditImage;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqk3;->a:Lcom/opera/hype/image/editor/EditImage;

    new-instance p1, Lok3;

    sget-object v0, Ll08;->a:Ll08;

    invoke-direct {p1, v0}, Lok3;-><init>(Ljava/util/List;)V

    iput-object p1, p0, Lqk3;->b:Lok3;

    new-instance p1, Lfz2;

    invoke-direct {p1, p0}, Lfz2;-><init>(Lqk3;)V

    iput-object p1, p0, Lqk3;->c:Lfz2;

    return-void
.end method
