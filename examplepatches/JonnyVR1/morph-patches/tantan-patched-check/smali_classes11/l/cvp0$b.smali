.class public Ll/cvp0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cvp0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field public static final c:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Ll/cvp0$b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Ll/cvp0$c;

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/dvp0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/dvp0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/cvp0$b;->c:Ljava/util/Comparator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ll/cvp0$c;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cvp0$b;->a:Ll/cvp0$c;

    .line 5
    .line 6
    iput p2, p0, Ll/cvp0$b;->b:I

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/cvp0$c;ILl/cvp0$a;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Ll/cvp0$b;-><init>(Ll/cvp0$c;I)V

    return-void
.end method

.method public static synthetic a(Ll/cvp0$b;Ll/cvp0$b;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cvp0$b;->a:Ll/cvp0$c;

    .line 2
    .line 3
    iget p0, p0, Ll/cvp0$c;->b:I

    .line 4
    .line 5
    iget-object p1, p1, Ll/cvp0$b;->a:Ll/cvp0$c;

    .line 6
    .line 7
    iget p1, p1, Ll/cvp0$c;->b:I

    .line 8
    .line 9
    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static synthetic b()Ljava/util/Comparator;
    .locals 1

    .line 1
    sget-object v0, Ll/cvp0$b;->c:Ljava/util/Comparator;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic c(Ll/cvp0$b;)Ll/cvp0$c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cvp0$b;->a:Ll/cvp0$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/cvp0$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/cvp0$b;->b:I

    .line 2
    .line 3
    return p0
.end method
