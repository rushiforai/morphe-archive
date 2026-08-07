.class public final synthetic Ll/ouy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eow0;


# static fields
.field public static final synthetic a:Ll/ouy0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ouy0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ouy0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ouy0;->a:Ll/ouy0;

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
    check-cast p1, Lorg/json/JSONObject;

    .line 2
    .line 3
    sget-object p0, Ll/tar0;->H:Ljava/util/List;

    .line 4
    .line 5
    const-string p0, "nas"

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
