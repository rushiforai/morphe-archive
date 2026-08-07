.class public final Ll/wnt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s0w0;


# instance fields
.field public final a:Ll/ont0;

.field public b:Landroid/content/Context;

.field public c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ont0;Ll/vnt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wnt0;->a:Ll/ont0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final synthetic a(Landroid/content/Context;)Ll/s0w0;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wnt0;->b:Landroid/content/Context;

    .line 5
    .line 6
    return-object p0
.end method

.method public final synthetic zza(Ljava/lang/String;)Ll/s0w0;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wnt0;->c:Ljava/lang/String;

    .line 5
    .line 6
    return-object p0
.end method

.method public final zzc()Ll/t0w0;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wnt0;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-class v1, Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/wnt0;->c:Ljava/lang/String;

    .line 9
    .line 10
    const-class v1, Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/ynt0;

    .line 16
    .line 17
    iget-object v1, p0, Ll/wnt0;->a:Ll/ont0;

    .line 18
    .line 19
    iget-object v2, p0, Ll/wnt0;->b:Landroid/content/Context;

    .line 20
    .line 21
    iget-object p0, p0, Ll/wnt0;->c:Ljava/lang/String;

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-direct {v0, v1, v2, p0, v3}, Ll/ynt0;-><init>(Ll/ont0;Landroid/content/Context;Ljava/lang/String;Ll/xnt0;)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method
