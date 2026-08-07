.class public final Ll/o5c$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/o5c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field public static final a:Ll/o5c;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/o5c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/o5c;-><init>(Ll/p5c;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/o5c$a;->a:Ll/o5c;

    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic a()Ll/o5c;
    .locals 1

    .line 1
    sget-object v0, Ll/o5c$a;->a:Ll/o5c;

    return-object v0
.end method
