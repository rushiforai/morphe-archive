.class public final Ll/n9l0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/n9l0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/n9l0$b;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/n9l0$b;->b:I

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(IILl/n9l0$a;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Ll/n9l0$b;-><init>(II)V

    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/n9l0$b;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/n9l0$b;->b:I

    .line 2
    .line 3
    return p0
.end method
