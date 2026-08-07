.class public final Ll/qpt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j6w0;


# instance fields
.field public final a:Ll/ont0;

.field public b:Landroid/content/Context;

.field public c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ont0;Ll/ppt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qpt0;->a:Ll/ont0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final synthetic a(Landroid/content/Context;)Ll/j6w0;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qpt0;->b:Landroid/content/Context;

    .line 5
    .line 6
    return-object p0
.end method

.method public final synthetic zza(Ljava/lang/String;)Ll/j6w0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qpt0;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzc()Ll/k6w0;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/qpt0;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-class v1, Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/spt0;

    .line 9
    .line 10
    iget-object v1, p0, Ll/qpt0;->a:Ll/ont0;

    .line 11
    .line 12
    iget-object v2, p0, Ll/qpt0;->b:Landroid/content/Context;

    .line 13
    .line 14
    iget-object p0, p0, Ll/qpt0;->c:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-direct {v0, v1, v2, p0, v3}, Ll/spt0;-><init>(Ll/ont0;Landroid/content/Context;Ljava/lang/String;Ll/rpt0;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method
