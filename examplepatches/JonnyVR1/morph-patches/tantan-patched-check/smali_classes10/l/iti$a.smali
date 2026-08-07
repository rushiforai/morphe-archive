.class public final Ll/iti$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/iti;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field public static final a:Ll/iti;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/iti;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/iti;-><init>(Ll/jti;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/iti$a;->a:Ll/iti;

    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic a()Ll/iti;
    .locals 1

    .line 1
    sget-object v0, Ll/iti$a;->a:Ll/iti;

    return-object v0
.end method
