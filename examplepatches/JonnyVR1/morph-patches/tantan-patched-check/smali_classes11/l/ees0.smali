.class public final Ll/ees0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zhx0;


# static fields
.field public static final a:Ll/zhx0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ees0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ees0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ees0;->a:Ll/zhx0;

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


# virtual methods
.method public final zza(I)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/fes0;->a(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method
