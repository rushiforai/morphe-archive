.class public abstract Lzn8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:La36;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, La36;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lzn8;->a:La36;

    return-void
.end method

.method public static a(ILwn8;)Lua7;
    .registers 8

    new-instance v1, Lwng;

    invoke-direct {v1, p0}, Lwng;-><init>(I)V

    new-instance v0, Lua7;

    const/16 v5, 0x9

    const/4 v4, 0x0

    sget-object v3, Lzn8;->a:La36;

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lua7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    return-object v0
.end method
