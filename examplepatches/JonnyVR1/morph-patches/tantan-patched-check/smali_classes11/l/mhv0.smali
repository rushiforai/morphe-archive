.class public final Ll/mhv0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/ehv0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ll/ehv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mhv0;->a:Ll/ehv0;

    .line 5
    .line 6
    return-void
.end method

.method public static b(Ll/ehv0;)Ll/mhv0;
    .locals 1

    .line 1
    new-instance v0, Ll/mhv0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mhv0;-><init>(Ll/ehv0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/common/util/Clock;Ll/ghv0;Ll/tcv0;Ll/yew0;)Ll/ehv0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mhv0;->a:Ll/ehv0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance p0, Ll/ehv0;

    .line 7
    .line 8
    invoke-direct {p0, p1, p2, p3, p4}, Ll/ehv0;-><init>(Lcom/google/android/gms/common/util/Clock;Ll/ghv0;Ll/tcv0;Ll/yew0;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
