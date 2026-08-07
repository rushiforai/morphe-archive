.class public final Ll/imt0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/jmt0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/jmt0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jmt0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/imt0;->a:Ll/jmt0;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a()Ll/jmt0;
    .locals 1

    .line 1
    sget-object v0, Ll/imt0;->a:Ll/jmt0;

    .line 2
    .line 3
    return-object v0
.end method
