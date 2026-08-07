.class public final Ll/n6t$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/n6t;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field public static final a:Ll/n6t;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/n6t;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/n6t;-><init>(Ll/o6t;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/n6t$a;->a:Ll/n6t;

    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic a()Ll/n6t;
    .locals 1

    .line 1
    sget-object v0, Ll/n6t$a;->a:Ll/n6t;

    return-object v0
.end method
