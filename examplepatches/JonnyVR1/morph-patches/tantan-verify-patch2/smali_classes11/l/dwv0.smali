.class public final Ll/dwv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ljava/util/concurrent/Executor;

.field public final b:Ljava/lang/String;

.field public final c:Landroid/content/pm/PackageInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final d:Ll/vat0;


# direct methods
.method public constructor <init>(Ll/vat0;Ljava/util/concurrent/Executor;Ljava/lang/String;Landroid/content/pm/PackageInfo;I)V
    .locals 0
    .param p4    # Landroid/content/pm/PackageInfo;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dwv0;->d:Ll/vat0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/dwv0;->a:Ljava/util/concurrent/Executor;

    .line 7
    .line 8
    iput-object p3, p0, Ll/dwv0;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ll/dwv0;->c:Landroid/content/pm/PackageInfo;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/Throwable;)Ll/hpr;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance p1, Ll/ewv0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dwv0;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Ll/ewv0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x29

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dwv0;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/bwv0;->a:Ll/bwv0;

    .line 8
    .line 9
    iget-object v2, p0, Ll/dwv0;->a:Ljava/util/concurrent/Executor;

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Ll/pvw0;->m(Ll/hpr;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/cwv0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/cwv0;-><init>(Ll/dwv0;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/dwv0;->a:Ljava/util/concurrent/Executor;

    .line 21
    .line 22
    const-class v2, Ljava/lang/Throwable;

    .line 23
    .line 24
    invoke-static {v0, v2, v1, p0}, Ll/pvw0;->f(Ll/hpr;Ljava/lang/Class;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method
