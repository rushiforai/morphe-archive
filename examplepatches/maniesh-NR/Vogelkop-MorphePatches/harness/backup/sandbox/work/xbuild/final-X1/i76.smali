.class public final Li76;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic d:[Lxtb;


# instance fields
.field public final a:Lcom/opera/hype/image/editor/EditImage;

.field public final b:Lfz2;

.field public final c:Lf76;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lpee;

    const-class v1, Li76;

    const-string v2, "color"

    const-string v3, "getColor()I"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Li76;->d:[Lxtb;

    return-void
.end method

.method public constructor <init>(Lcom/opera/hype/image/editor/EditImage;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li76;->a:Lcom/opera/hype/image/editor/EditImage;

    new-instance p1, Lfz2;

    invoke-direct {p1, p0}, Lfz2;-><init>(Li76;)V

    iput-object p1, p0, Li76;->b:Lfz2;

    new-instance v0, Lf76;

    sget-object v1, Ll08;->a:Ll08;

    sget-object v2, Li76;->d:[Lxtb;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    iget-object p1, p1, La7f;->b:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-direct {v0, v1, p1}, Lf76;-><init>(Ljava/util/List;I)V

    iput-object v0, p0, Li76;->c:Lf76;

    return-void
.end method
