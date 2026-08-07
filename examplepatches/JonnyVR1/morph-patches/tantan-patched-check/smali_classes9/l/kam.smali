.class public abstract Ll/kam;
.super Ll/lam;
.source "SourceFile"


# instance fields
.field public i:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lam;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/kam;->l()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private l()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/kam;->i:Landroid/graphics/RectF;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public m(FFFF)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kam;->i:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
