.class public final synthetic Ll/jvs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gvs0;


# static fields
.field public static final synthetic a:Ll/jvs0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/jvs0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jvs0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/jvs0;->a:Ll/jvs0;

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
.method public final a(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/lvs0;->a(Lorg/json/JSONObject;)Ljava/io/InputStream;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
