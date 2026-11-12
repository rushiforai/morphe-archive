.class public final Lfnd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:B


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfnd;->a:Ljava/lang/Object;

    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_d

    const/4 p1, 0x1

    iput-byte p1, p0, Lfnd;->b:B

    return-void

    :cond_d
    instance-of p1, p1, Lcod;

    if-eqz p1, :cond_15

    const/4 p1, 0x2

    iput-byte p1, p0, Lfnd;->b:B

    return-void

    :cond_15
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    throw p0
.end method
