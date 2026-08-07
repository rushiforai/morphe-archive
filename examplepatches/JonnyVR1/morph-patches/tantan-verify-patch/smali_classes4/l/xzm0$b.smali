.class public Ll/xzm0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xzm0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field public static a:Ll/xzm0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/xzm0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xzm0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/xzm0$b;->a:Ll/xzm0;

    .line 7
    .line 8
    return-void
.end method
