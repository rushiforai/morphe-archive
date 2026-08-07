.class public final synthetic Ll/uwy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eow0;


# static fields
.field public static final synthetic a:Ll/uwy0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/uwy0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/uwy0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/uwy0;->a:Ll/uwy0;

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
    check-cast p1, Ljava/lang/Exception;

    .line 2
    .line 3
    sget-object p0, Ll/tar0;->H:Ljava/util/List;

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method
