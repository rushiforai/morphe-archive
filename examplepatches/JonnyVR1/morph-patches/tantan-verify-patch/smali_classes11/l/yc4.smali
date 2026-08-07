.class public final Ll/yc4;
.super Ljava/lang/Object;


# instance fields
.field public final a:Ll/p1m;


# direct methods
.method public constructor <init>(Ll/p1m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ll/p1m;

    .line 9
    .line 10
    iput-object p1, p0, Ll/yc4;->a:Ll/p1m;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a()Ll/p1m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yc4;->a:Ll/p1m;

    .line 2
    .line 3
    return-object p0
.end method
