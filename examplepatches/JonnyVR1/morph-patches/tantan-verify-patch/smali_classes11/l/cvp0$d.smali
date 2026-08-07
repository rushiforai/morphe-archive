.class public final Ll/cvp0$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cvp0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Ll/cvp0$d;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:I

.field public final b:Ll/avp0;


# direct methods
.method public constructor <init>(ILl/avp0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/cvp0$d;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/cvp0$d;->b:Ll/avp0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/cvp0$d;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/cvp0$d;->a:I

    .line 2
    .line 3
    iget p1, p1, Ll/cvp0$d;->a:I

    .line 4
    .line 5
    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/cvp0$d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cvp0$d;->a(Ll/cvp0$d;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
