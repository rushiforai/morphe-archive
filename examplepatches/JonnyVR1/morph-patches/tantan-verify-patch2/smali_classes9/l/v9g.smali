.class public Ll/v9g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/a8g;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Ll/cm0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/cm0;->a()Ll/cm0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/v9g;->b:Ll/cm0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Ll/cm0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v9g;->b:Ll/cm0;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ll/a8g;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/v9g;->a:Ll/a8g;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ll/cm0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v9g;->b:Ll/cm0;

    .line 2
    .line 3
    return-void
.end method

.method public d(Ll/a8g;)V
    .locals 0
    .param p1    # Ll/a8g;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/v9g;->a:Ll/a8g;

    .line 2
    .line 3
    return-void
.end method
