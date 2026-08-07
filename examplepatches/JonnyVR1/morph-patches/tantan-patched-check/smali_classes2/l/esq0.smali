.class public Ll/esq0;
.super Ljava/lang/Object;


# instance fields
.field public a:Ljava/lang/String;

.field public b:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/lang/String;)Ll/esq0;
    .locals 3

    .line 1
    new-instance v0, Ll/esq0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/esq0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p0, v0, Ll/esq0;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    iput-wide v1, v0, Ll/esq0;->b:J

    .line 13
    .line 14
    return-object v0
.end method
