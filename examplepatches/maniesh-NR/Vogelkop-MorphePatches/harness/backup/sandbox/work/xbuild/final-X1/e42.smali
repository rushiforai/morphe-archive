.class public final Le42;
.super Lg42;
.source "SourceFile"


# static fields
.field public static final a:Le42;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Le42;

    const-string v1, "Token denied"

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    sput-object v0, Le42;->a:Le42;

    return-void
.end method
