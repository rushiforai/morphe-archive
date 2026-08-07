.class public final Ll/vqw0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ll/vqw0;

.field public static final c:Ll/vqw0;


# instance fields
.field public final a:Ljava/lang/Throwable;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    sget-boolean v0, Ll/uqy0;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    sput-object v1, Ll/vqw0;->c:Ll/vqw0;

    .line 7
    .line 8
    sput-object v1, Ll/vqw0;->b:Ll/vqw0;

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    new-instance v0, Ll/vqw0;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {v0, v2, v1}, Ll/vqw0;-><init>(ZLjava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/vqw0;->c:Ll/vqw0;

    .line 18
    .line 19
    new-instance v0, Ll/vqw0;

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    invoke-direct {v0, v2, v1}, Ll/vqw0;-><init>(ZLjava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Ll/vqw0;->b:Ll/vqw0;

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>(ZLjava/lang/Throwable;)V
    .locals 0
    .param p2    # Ljava/lang/Throwable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/vqw0;->a:Ljava/lang/Throwable;

    .line 5
    .line 6
    return-void
.end method
