.class public final Ll/n9l0$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/n9l0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field public final a:I

.field public final b:[Ll/n9l0$b;


# direct methods
.method public constructor <init>(ILl/n9l0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/n9l0$c;->a:I

    .line 5
    .line 6
    filled-new-array {p2}, [Ll/n9l0$b;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/n9l0$c;->b:[Ll/n9l0$b;

    .line 11
    .line 12
    return-void
.end method

.method public synthetic constructor <init>(ILl/n9l0$b;Ll/n9l0$a;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2}, Ll/n9l0$c;-><init>(ILl/n9l0$b;)V

    return-void
.end method

.method public constructor <init>(ILl/n9l0$b;Ll/n9l0$b;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput p1, p0, Ll/n9l0$c;->a:I

    .line 17
    filled-new-array {p2, p3}, [Ll/n9l0$b;

    move-result-object p1

    iput-object p1, p0, Ll/n9l0$c;->b:[Ll/n9l0$b;

    return-void
.end method

.method public synthetic constructor <init>(ILl/n9l0$b;Ll/n9l0$b;Ll/n9l0$a;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2, p3}, Ll/n9l0$c;-><init>(ILl/n9l0$b;Ll/n9l0$b;)V

    return-void
.end method


# virtual methods
.method public a()[Ll/n9l0$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n9l0$c;->b:[Ll/n9l0$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/n9l0$c;->a:I

    .line 2
    .line 3
    return p0
.end method
