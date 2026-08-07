.class public Ll/qsw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qsw;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qsw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private final a:Landroid/os/Looper;


# direct methods
.method public constructor <init>(Landroid/os/Looper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qsw$a;->a:Landroid/os/Looper;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qsw$a;->a:Landroid/os/Looper;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public b(Ll/v3f$b;)Ll/dm80;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/v3f$b<",
            "TT;*>;)",
            "Ll/dm80<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/pxk;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qsw$a;->a:Landroid/os/Looper;

    .line 4
    .line 5
    const/16 v1, 0xa

    .line 6
    .line 7
    invoke-direct {v0, p1, p0, v1}, Ll/pxk;-><init>(Ll/v3f$b;Landroid/os/Looper;I)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method
