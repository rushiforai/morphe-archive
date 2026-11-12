.class public abstract Lll3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lal3;


# direct methods
.method public constructor <init>(Lal3;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lll3;->a:Lal3;

    return-void
.end method


# virtual methods
.method public a(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 2

    const-string p0, ""

    return-object p0
.end method

.method public b(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public c(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 2

    const-string p0, ""

    return-object p0
.end method

.method public d()I
    .registers 1

    const/4 p0, 0x3

    return p0
.end method
