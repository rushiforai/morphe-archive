.class public Ll/ori0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ori0$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ori0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field static final INSTANCE:Ll/ori0$b;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ori0$b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ori0$b;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ori0$b;->INSTANCE:Ll/ori0$b;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/CharSequence;II)I
    .locals 1

    .line 1
    add-int/2addr p3, p2

    .line 2
    const/4 p0, 0x2

    .line 3
    move v0, p0

    .line 4
    :goto_0
    if-ge p2, p3, :cond_0

    .line 5
    .line 6
    if-ne v0, p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-static {v0}, Ljava/lang/Character;->getDirectionality(C)B

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-static {v0}, Ll/ori0;->b(I)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    add-int/lit8 p2, p2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return v0
.end method
