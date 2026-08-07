.class public final Ll/bf80;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/bf80$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final b:Ll/bf80;


# instance fields
.field public final a:Ll/bf80$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget v0, Ll/bmk0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x1f

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/bf80;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/bf80;-><init>()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance v0, Ll/bf80;

    .line 14
    .line 15
    sget-object v1, Ll/bf80$a;->b:Ll/bf80$a;

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ll/bf80;-><init>(Ll/bf80$a;)V

    .line 18
    .line 19
    .line 20
    :goto_0
    sput-object v0, Ll/bf80;->b:Ll/bf80;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/bf80;-><init>(Ll/bf80$a;)V

    .line 3
    .line 4
    .line 5
    sget p0, Ll/bmk0;->a:I

    .line 6
    .line 7
    const/16 v0, 0x1f

    .line 8
    .line 9
    if-ge p0, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ll/w11;->g(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/media/metrics/LogSessionId;)V
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1f
    .end annotation

    .line 18
    new-instance v0, Ll/bf80$a;

    invoke-direct {v0, p1}, Ll/bf80$a;-><init>(Landroid/media/metrics/LogSessionId;)V

    invoke-direct {p0, v0}, Ll/bf80;-><init>(Ll/bf80$a;)V

    return-void
.end method

.method public constructor <init>(Ll/bf80$a;)V
    .locals 0
    .param p1    # Ll/bf80$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Ll/bf80;->a:Ll/bf80$a;

    return-void
.end method


# virtual methods
.method public a()Landroid/media/metrics/LogSessionId;
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1f
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bf80;->a:Ll/bf80$a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/bf80$a;

    .line 8
    .line 9
    iget-object p0, p0, Ll/bf80$a;->a:Landroid/media/metrics/LogSessionId;

    .line 10
    .line 11
    return-object p0
.end method
