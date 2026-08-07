.class public Ll/w600$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/w600;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# static fields
.field public static final a:Ll/w600;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/w600;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/w600;-><init>(Ll/x600;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/w600$c;->a:Ll/w600;

    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic a()Ll/w600;
    .locals 1

    .line 1
    sget-object v0, Ll/w600$c;->a:Ll/w600;

    return-object v0
.end method
