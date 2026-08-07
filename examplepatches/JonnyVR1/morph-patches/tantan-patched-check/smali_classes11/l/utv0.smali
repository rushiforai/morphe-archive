.class public final synthetic Ll/utv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eow0;


# static fields
.field public static final synthetic a:Ll/utv0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/utv0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/utv0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/utv0;->a:Ll/utv0;

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
    check-cast p1, Ll/rqr0;

    .line 2
    .line 3
    new-instance p0, Ll/ytv0;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Ll/rqr0;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Ll/ytv0;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    invoke-direct {p0, p1}, Ll/ytv0;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method
