.class public final Loje;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lndc;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Z

.field public final c:Z

.field public final d:Lqdc;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/String;Z)V
    .registers 4

    and-int/lit8 p1, p1, 0x4

    if-eqz p1, :cond_5

    const/4 p3, 0x0

    :cond_5
    const/4 p1, 0x1

    .line 18
    invoke-direct {p0, p2, p1, p3}, Loje;-><init>(Ljava/lang/String;ZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZZ)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loje;->a:Ljava/lang/String;

    iput-boolean p2, p0, Loje;->b:Z

    iput-boolean p3, p0, Loje;->c:Z

    new-instance p1, Lqdc;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lqdc;-><init>(Lndc;Z)V

    iput-object p1, p0, Loje;->d:Lqdc;

    return-void
.end method


# virtual methods
.method public final getLifecycle()Ltcc;
    .registers 1

    iget-object p0, p0, Loje;->d:Lqdc;

    return-object p0
.end method
