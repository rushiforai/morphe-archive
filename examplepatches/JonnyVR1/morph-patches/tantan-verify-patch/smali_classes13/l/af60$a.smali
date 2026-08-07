.class public Ll/af60$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/af60;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroidx/fragment/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field public b:J

.field public c:J


# direct methods
.method public constructor <init>(Ljava/lang/ref/WeakReference;J)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroidx/fragment/app/Fragment;",
            ">;J)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/af60$a;->c:J

    .line 7
    .line 8
    iput-object p1, p0, Ll/af60$a;->a:Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    iput-wide p2, p0, Ll/af60$a;->b:J

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic a(Ll/af60$a;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/af60$a;->a:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/af60$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/af60$a;->c:J

    return-wide v0
.end method

.method public static bridge synthetic c(Ll/af60$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/af60$a;->b:J

    return-wide v0
.end method

.method public static bridge synthetic d(Ll/af60$a;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/af60$a;->c:J

    return-void
.end method

.method public static bridge synthetic e(Ll/af60$a;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/af60$a;->b:J

    return-void
.end method
