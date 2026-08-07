.class public Ll/d5r0;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/d5r0$c;,
        Ll/d5r0$b;
    }
.end annotation


# static fields
.field static final a:Ll/d5r0$b;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/d5r0$c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/d5r0$c;-><init>(Ll/d5r0$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/d5r0;->a:Ll/d5r0$b;

    .line 8
    .line 9
    return-void
.end method

.method public static a(Landroid/app/ActivityManager$MemoryInfo;)J
    .locals 2

    .line 1
    sget-object v0, Ll/d5r0;->a:Ll/d5r0$b;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/d5r0$b;->a(Landroid/app/ActivityManager$MemoryInfo;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method
