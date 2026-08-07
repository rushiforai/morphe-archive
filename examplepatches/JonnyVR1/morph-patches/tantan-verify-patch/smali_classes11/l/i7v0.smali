.class public final synthetic Ll/i7v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kbw0;


# static fields
.field public static final synthetic a:Ll/i7v0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/i7v0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/i7v0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/i7v0;->a:Ll/i7v0;

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
.method public final zza(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lorg/json/JSONObject;

    .line 2
    .line 3
    const-string p0, "Ad request signals:"

    .line 4
    .line 5
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x2

    .line 9
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-object p1
.end method
