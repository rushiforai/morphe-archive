.class public final synthetic Ll/qox0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/uow0;


# static fields
.field public static final synthetic a:Ll/qox0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/qox0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qox0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/qox0;->a:Ll/qox0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
