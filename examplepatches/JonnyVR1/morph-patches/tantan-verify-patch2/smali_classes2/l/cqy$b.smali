.class final Ll/cqy$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cqy$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cqy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field private final a:Landroid/util/DisplayMetrics;


# direct methods
.method public constructor <init>(Landroid/util/DisplayMetrics;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cqy$b;->a:Landroid/util/DisplayMetrics;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cqy$b;->a:Landroid/util/DisplayMetrics;

    .line 2
    .line 3
    iget p0, p0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 4
    .line 5
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cqy$b;->a:Landroid/util/DisplayMetrics;

    .line 2
    .line 3
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 4
    .line 5
    return p0
.end method
