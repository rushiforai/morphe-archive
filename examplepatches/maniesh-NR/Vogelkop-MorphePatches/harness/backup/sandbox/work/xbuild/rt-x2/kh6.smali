.class public abstract Lkh6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lua1;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lua1;

    const/16 v1, 0x8

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lua1;-><init>(BI)V

    sput-object v0, Lkh6;->a:Lua1;

    return-void
.end method
