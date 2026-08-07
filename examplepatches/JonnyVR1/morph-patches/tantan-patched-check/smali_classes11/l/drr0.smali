.class public final Ll/drr0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Ljava/util/Comparator;


# instance fields
.field public final a:Ll/err0;

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/brr0;->a:Ll/brr0;

    .line 2
    .line 3
    sput-object v0, Ll/drr0;->c:Ljava/util/Comparator;

    .line 4
    .line 5
    return-void
.end method

.method public synthetic constructor <init>(Ll/err0;ILl/crr0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/drr0;->a:Ll/err0;

    .line 5
    .line 6
    iput p2, p0, Ll/drr0;->b:I

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Ll/drr0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/drr0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/drr0;Ll/drr0;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/drr0;->a:Ll/err0;

    .line 2
    .line 3
    iget p0, p0, Ll/err0;->b:I

    .line 4
    .line 5
    iget-object p1, p1, Ll/drr0;->a:Ll/err0;

    .line 6
    .line 7
    iget p1, p1, Ll/err0;->b:I

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

.method public static bridge synthetic c(Ll/drr0;)Ll/err0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/drr0;->a:Ll/err0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic d()Ljava/util/Comparator;
    .locals 1

    .line 1
    sget-object v0, Ll/drr0;->c:Ljava/util/Comparator;

    .line 2
    .line 3
    return-object v0
.end method
