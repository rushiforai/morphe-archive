.class public final synthetic Ll/fsv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/isv0;


# static fields
.field public static final synthetic a:Ll/fsv0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/fsv0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fsv0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/fsv0;->a:Ll/fsv0;

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
.method public final a(Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Landroid/os/Bundle;

    .line 2
    .line 3
    const-string p0, "native_version"

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, p0, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
