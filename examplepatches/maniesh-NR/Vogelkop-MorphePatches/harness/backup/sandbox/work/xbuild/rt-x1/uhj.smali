.class public final Luhj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Z

.field public final c:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    const/16 v0, 0x18

    .line 13
    invoke-direct {p0, v0}, Luhj;-><init>(I)V

    return-void
.end method

.method public synthetic constructor <init>(I)V
    .registers 4

    and-int/lit8 p1, p1, 0x8

    const/4 v0, 0x0

    if-eqz p1, :cond_7

    move p1, v0

    goto :goto_8

    :cond_7
    const/4 p1, 0x1

    :goto_8
    const/4 v1, 0x0

    invoke-direct {p0, v1, p1, v0}, Luhj;-><init>(Ljava/lang/String;ZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZZ)V
    .registers 4

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Luhj;->a:Ljava/lang/String;

    .line 16
    iput-boolean p2, p0, Luhj;->b:Z

    .line 17
    iput-boolean p3, p0, Luhj;->c:Z

    return-void
.end method
