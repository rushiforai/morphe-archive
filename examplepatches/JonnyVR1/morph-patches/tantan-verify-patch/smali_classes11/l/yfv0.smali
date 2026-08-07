.class public final synthetic Ll/yfv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eow0;


# static fields
.field public static final synthetic a:Ll/yfv0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/yfv0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/yfv0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/yfv0;->a:Ll/yfv0;

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
    check-cast p1, Ll/ilu0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
