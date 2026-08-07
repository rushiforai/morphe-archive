.class public Ll/hxj0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hxj0$b;,
        Ll/hxj0$a;
    }
.end annotation


# static fields
.field public static final a:Ll/hxj0$b;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/jze;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jze;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/hxj0;->a:Ll/hxj0$b;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic a()Ll/hxj0$b;
    .locals 1

    .line 1
    sget-object v0, Ll/hxj0;->a:Ll/hxj0$b;

    return-object v0
.end method

.method public static b()V
    .locals 2

    .line 1
    sget-object v0, Ll/hxj0;->a:Ll/hxj0$b;

    .line 2
    .line 3
    new-instance v1, Ll/dxj0;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/dxj0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ll/hxj0$b;->c(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    sget-object v0, Ll/hxj0;->a:Ll/hxj0$b;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ll/hxj0$b;->a(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
