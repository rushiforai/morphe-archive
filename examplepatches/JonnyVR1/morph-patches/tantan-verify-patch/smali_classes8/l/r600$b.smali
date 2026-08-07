.class public Ll/r600$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/r600;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public final synthetic d:Ll/r600;


# direct methods
.method public constructor <init>(Ll/r600;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/r600$b;->d:Ll/r600;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/r600$b;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/r600$b;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput p4, p0, Ll/r600$b;->c:I

    .line 11
    .line 12
    return-void
.end method
