.class public final Ll/gcy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/grx0;


# static fields
.field public static final a:Ll/grx0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/gcy0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gcy0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/gcy0;->a:Ll/grx0;

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
    const/4 p0, 0x1

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    if-eq p1, p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    :cond_0
    return p0
.end method
