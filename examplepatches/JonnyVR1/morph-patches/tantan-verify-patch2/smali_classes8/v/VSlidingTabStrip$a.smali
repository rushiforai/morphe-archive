.class public Lv/VSlidingTabStrip$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/VSlidingTabs$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/VSlidingTabStrip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:[I

.field public b:[I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/pzk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lv/VSlidingTabStrip$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(I)I
    .locals 1

    .line 1
    iget-object p0, p0, Lv/VSlidingTabStrip$a;->a:[I

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    rem-int/2addr p1, v0

    .line 5
    aget p0, p0, p1

    .line 6
    .line 7
    return p0
.end method

.method public final b(I)I
    .locals 1

    .line 1
    iget-object p0, p0, Lv/VSlidingTabStrip$a;->b:[I

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    rem-int/2addr p1, v0

    .line 5
    aget p0, p0, p1

    .line 6
    .line 7
    return p0
.end method

.method public varargs c([I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VSlidingTabStrip$a;->b:[I

    .line 2
    .line 3
    return-void
.end method

.method public varargs d([I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VSlidingTabStrip$a;->a:[I

    .line 2
    .line 3
    return-void
.end method
