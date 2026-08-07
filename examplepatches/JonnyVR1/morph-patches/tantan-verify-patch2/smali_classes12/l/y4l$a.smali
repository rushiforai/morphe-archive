.class public Ll/y4l$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y4l;->a()Ll/b13;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ll/k3g0;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/y4l;


# direct methods
.method public constructor <init>(Ll/y4l;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y4l$a;->a:Ll/y4l;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/k3g0;Ll/k3g0;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/k3g0;->d()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p2}, Ll/k3g0;->d()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    sub-int/2addr p0, p1

    .line 10
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/k3g0;

    .line 2
    .line 3
    check-cast p2, Ll/k3g0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/y4l$a;->a(Ll/k3g0;Ll/k3g0;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
