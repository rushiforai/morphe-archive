.class public LY/b;
.super LX/a;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, LX/a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lc0/a;
    .locals 2

    sget-object v0, LY/a;->a:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x22

    if-lt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lc0/c;

    invoke-direct {v0}, Lc0/c;-><init>()V

    return-object v0

    :cond_1
    :goto_0
    new-instance v0, Ld0/a;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0
.end method
