.class public final Ll/c9y0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/app/Application;

.field public final b:Ll/tqr0;


# direct methods
.method public constructor <init>(Landroid/app/Application;Ll/tqr0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/c9y0;->a:Landroid/app/Application;

    .line 5
    .line 6
    iput-object p2, p0, Ll/c9y0;->b:Ll/tqr0;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Ll/c9y0;)Landroid/app/Application;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c9y0;->a:Landroid/app/Application;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic b(Ll/c9y0;)Ll/tqr0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c9y0;->b:Ll/tqr0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final c(Landroid/app/Activity;Ll/wx5;)Ll/cdt0;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/consent_sdk/zzg;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ll/wx5;->a()Ll/ux5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/c9y0;->a:Landroid/app/Application;

    .line 8
    .line 9
    new-instance v1, Ll/ux5$a;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Ll/ux5$a;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1}, Ll/ux5$a;->a()Ll/ux5;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :cond_0
    move-object v4, v0

    .line 19
    new-instance v1, Ll/wgy0;

    .line 20
    .line 21
    const/4 v6, 0x0

    .line 22
    move-object v2, p0

    .line 23
    move-object v3, p1

    .line 24
    move-object v5, p2

    .line 25
    invoke-direct/range {v1 .. v6}, Ll/wgy0;-><init>(Ll/c9y0;Landroid/app/Activity;Ll/ux5;Ll/wx5;Ll/mdy0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/wgy0;->a(Ll/wgy0;)Ll/cdt0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
