.class public Ll/cvk0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/cvk0$a;
    }
.end annotation


# instance fields
.field public a:Ll/xnu;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/dvk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cvk0;-><init>()V

    return-void
.end method

.method public static a()Ll/cvk0;
    .locals 1

    .line 1
    invoke-static {}, Ll/cvk0$a;->a()Ll/cvk0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public b()Ll/xnu;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cvk0;->a:Ll/xnu;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, p0, Ll/cvk0;->a:Ll/xnu;

    .line 5
    .line 6
    return-object v0
.end method

.method public c(Ll/xnu;)V
    .locals 0
    .param p1    # Ll/xnu;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/cvk0;->a:Ll/xnu;

    .line 2
    .line 3
    return-void
.end method
