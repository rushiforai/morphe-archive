.class public final synthetic Ll/rov0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eow0;


# static fields
.field public static final synthetic a:Ll/rov0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/rov0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/rov0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/rov0;->a:Ll/rov0;

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
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance p0, Ll/qov0;

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ll/qov0;-><init>(Ljava/util/ArrayList;)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method
